package com.bit.tsigner;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.tsigner.model.entity.CommunityVo;
//import com.bit.naver.NaverLoginBO;
import com.bit.tsigner.model.entity.LoginVo;
import com.bit.tsigner.model.entity.PayVo;
import com.bit.tsigner.model.entity.SupportVo;
import com.bit.tsigner.service.CommunityService;
import com.bit.tsigner.service.KaKaoAPI;
import com.bit.tsigner.service.LoginService;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Controller
public class HomeController {

	@Inject
	LoginService loginService;
	
	//카카오톡
	@Autowired
	private KaKaoAPI kakao;
	
	//mail 전송을 위한 세팅
	@Autowired
	private Mail mail;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	//네이버
//	private NaverLoginBO naverLoginBO;
//	private String apiResult = null;

	String id="";
	String name="";
	String email="";
	String nickName="";
	String sns="";
	
	//홈화면
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
//		model.addAttribute("sns",sns);
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("네이버:" + naverAuthUrl);
		//네이버
//		model.addAttribute("url", naverAuthUrl);

		
		return "home";
	}
	
	
	//일반 로그인
	@RequestMapping (value = "**/loginUser")
	public void loginResult(@RequestParam("id") String id , @RequestParam("pw") String pw, HttpSession session, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		LoginVo bean=new LoginVo();
		
		if((loginService.login(map))==null) {
			res.getWriter().write("logFail");
			logger.debug("실패");
		}else {
			logger.debug("성공");
			bean = loginService.login(map);
			session.setAttribute("id", bean.getUser_id());
			System.out.println("유저레벨 : "+bean.getUser_mem_lev());
			session.setAttribute("userMemLvl", bean.getUser_mem_lev());
			try{
				if(!(bean.getProfile_root().isEmpty())) {
					try{
						if(bean.getProfile_file().equals("null")) {}else {
							System.out.println("이미지가 등록되어 있을때");
							session.setAttribute("profile", bean.getProfile_root()+bean.getProfile_file());
						}
					}catch(NullPointerException e) {
						System.out.println("이미지가 등록되어 없을 때");
						session.setAttribute("profile", bean.getProfile_root());
					}
				}
			}catch(Exception e) {
				System.out.println("에러일때");
				session.setAttribute("profile", "/tsigner/imgs/noProfile.png");
			}
		}
	}
	
	//로그아웃
	@RequestMapping (value = {"**/logoutUser","community_togetherDetail/logoutUser"})
	public void logoutUser(HttpSession session,HttpServletResponse res) {
		//kakao 로그아웃
		if(kakao.kakaoLogout((String)session.getAttribute("access_Token"))) {
			session.removeAttribute("access_Token");
			session.removeAttribute("id");
//			session.removeAttribute("nickName");
			try {
				res.getWriter().write("kakaoLogout");
			} catch (IOException e) {
			}
		}
		//일반, Naver 로그아웃
		else {
			session.invalidate();
			try {
				res.getWriter().write("logoutSuccess");
			} catch (IOException e) {
			}
		}
	}
	
	//일반 회원가입
	@RequestMapping(value = "**/joinUser")
	public void joinUser(@RequestParam("id") String id,@RequestParam("pw") String pw,@RequestParam("userName") String userName,
			@RequestParam("nickName") String nickName,@RequestParam("email") String email,@RequestParam("tel") String tel,
			@RequestParam("birth") String birth,@RequestParam("gender") String gender, HttpServletResponse res) throws Exception {
		logger.debug("회원가입 실행");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("userName", userName);
		map.put("nickName", nickName);
		map.put("email", email);
		map.put("tel", tel);
		map.put("birth", birth);
		map.put("gender", gender);
		
		loginService.join(map);
		loginService.join_level_mgt(map);
	}
	
	//아이디 중복검사
	@RequestMapping (value = "**/idCheck")
	public void idCheck(@RequestParam("id") String id, HttpServletResponse res) throws Exception {
		logger.debug("중복검사");
		if(!(loginService.idCheck(id)==null)) {
			res.getWriter().write("fail");
		}else {
			res.getWriter().write("success");
		}
		
	}
	
	//이메일 인증을 위한 전역변수 선언
	Map<String, Object> res= new HashMap<String, Object>(); 
	int checkNum =0;
	
	//인증 메일 전송 및 메일 중복 검사
	@RequestMapping(value = "**/mailCheck")
	public void mailCheck(@RequestParam("email") String email,HttpServletResponse res) throws Exception {
		
		if(loginService.emailCheck(email)==null) {
			logger.debug(loginService.emailCheck(email));
			double ran = Math.random();
			this.checkNum=(int)(ran*100000);
			this.res.put("check"+email, checkNum);
			try {
				res.getWriter().write("success");;
				mail.sendMail(email, "T-signer 인증메일입니다.", "인증번호입니다\r\n"+checkNum);
			}catch(Exception e) {
				res.getWriter().write("fail");
			}
		}else {
			res.getWriter().write("mailDupli");
		}
		
	}
	
	//인증 메일 확인
	@RequestMapping(value = "**/mailResult")
	public void mailResult(@RequestParam("checkEmail") String check, @RequestParam("email") String email, HttpServletResponse res) throws IOException {
		if(this.res.get("check"+email)!=null) {
			//테스트용입니다.
			logger.debug("인증번호"+(this.res.get("check"+email).toString()));
			if(check.equals(this.res.get("check"+email).toString())) {
				res.getWriter().write("success");
			}else {
				res.getWriter().write("fail");
			}
		}
	}
	
	////////
	

	
	
	//id검색
	@RequestMapping(value = "**/searchId")
	public void serachId(@RequestParam("name") String name, @RequestParam("email") String email, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("name", name);
		map.put("email", email);
		//logger.debug(loginService.searchId(map));
		String result=""; 
		if(!(loginService.searchId(map).isEmpty())) {
			result=loginService.searchId(map);
			res.getWriter().write(result);
		}else {
			res.getWriter().write("fail");
		}
		
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "**/searchPw")
	public void serachPw(@RequestParam("id") String id, @RequestParam("email") String email, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
	
		if(loginService.searchPw(map)) {
			res.getWriter().write("success");
		}else {
			res.getWriter().write("fail");
		}
		//logger.debug((loginService.searchPw(map).toString()));
	}
	
	//비밀번호 변경
	@RequestMapping(value = "**/editPw")
	public void editPw(@RequestParam("id") String id, @RequestParam("email") String email, @RequestParam("editPw") String pw, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		map.put("editPw", pw);
		
		res.getWriter().write("success");
		loginService.editPw(map);
	}
//	//토큰뽑아오기
//	//네이버 로그인 성공시 callback호출 메소드
//	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
//	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
//		OAuth2AccessToken oauthToken;
//		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//		System.out.println(oauthToken);
//		//1. 로그인 사용자 정보를 읽어온다.
//		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
//		/** apiResult json 구조
//		{"resultcode":"00",
//		"message":"success",
//		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
//		**/
//		//2. String형식인 apiResult를 json형태로 바꿈
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse(apiResult);
//		JSONObject jsonObj = (JSONObject) obj;
//		//3. 데이터 파싱
//		//Top레벨 단계 _response 파싱
//		JSONObject response_obj = (JSONObject)jsonObj.get("response");
//		//response의 nickname값 파싱
//		String nickname = (String)response_obj.get("nickname");
//		String email = (String)response_obj.get("email");
//		String name = (String)response_obj.get("name");
//		System.out.println(email);
//		System.out.println(name);
//		//4.파싱 닉네임 세션으로 저장
////		session.setAttribute("sessionId",nickname); //세션 생성
////		model.addAttribute("result", apiResult);
//		return "redirect:/";
//	}
	
	//카카오 로그인
	@RequestMapping(value = "kakao")
	public String kakao(@RequestParam("code") String code, HttpSession session) throws Exception {
		logger.debug("카카오 접속 : "+code);
		String access_Token = kakao.getAccessToken(code);	//카카오 api를 불러와 access토큰을 받음
		HashMap<String, Object> userInfo = kakao.getKakaoInfo(access_Token);
		System.out.println("login Controller : "+userInfo);
		
		if(userInfo.get("email")!=null) {
		
//			session.setAttribute("access_Token", access_Token);
			String nickName = (userInfo.get("nickName")).toString();
			String id = (userInfo.get("id")).toString();
			String email = (userInfo.get("email")).toString();
			String profileImg="";
			if(userInfo.get("profileImg")==null || userInfo.get("profileImg")=="null") {
				profileImg="default.jpg";
			}else {
				profileImg = (userInfo.get("profileImg").toString());
			}
			
			profileImg=profileImg.replace("\"", "");
			System.out.println("프로필 이미지"+profileImg);
			LoginVo bean = new LoginVo();
			
			if(loginService.emailCheck((userInfo.get("email").toString()))!=null) {	// 이메일이 중복될때는 회원가입 없이 로그인
				bean = loginService.emailLogin(email);
				session.setAttribute("id", bean.getUser_id());
				System.out.println("유저레벨 : "+bean.getUser_mem_lev());
				session.setAttribute("userMemLvl", bean.getUser_mem_lev());
				try{
					if(bean.getProfile_file().equals("null")) {
					}else {
						session.setAttribute("profile", bean.getProfile_root()+bean.getProfile_file());
					}
				}catch(NullPointerException e) {
					session.setAttribute("profile", bean.getProfile_root());
				}
				session.setAttribute("sns", bean.getSns_type());
				
			}else{																	// 이메일이 중복되어지지 않을때는 간단한 정보를 DB에 저장한 후 로그인
				logger.debug("sns 정보 받아오기");									// 간단한 정보가 필요한 이유는 다음 로그인 시 회원의 플래너의 정보를 얻어오기 위함
				Map<String, Object> map = new HashMap<String, Object>();			// 가져오는 정보는 kakao의 경우 닉네임, 이메일, kakao 고유번호
				map.put("id", email);
				map.put("pw", id);
				map.put("userName", nickName);
				map.put("nickName", nickName);
				map.put("email", email);
				map.put("snsId", id);
				map.put("type", "kakao");
				if(profileImg.equals("")) {
					profileImg="imgs";
				}
				map.put("root", profileImg);
				map.put("file", "");
				loginService.easyJoin(map);
				loginService.join_level_mgt(map);
				
				session.setAttribute("profile", map.get("root"));
				session.setAttribute("id", map.get("id"));
				session.setAttribute("sns", map.get("type"));
			}
			
		}
		return "redirect:/";
	}
	
	//네이버 로그인
	public String getAccessToken(String res) {
		String access_Token ="";
//		String refresh_Token ="";
		JsonParser parser = new JsonParser();
		JsonElement ele = parser.parse(res);
		access_Token = ele.getAsJsonObject().get("access_token").getAsString();	//access 토큰 받아오기
//		refresh_Token = ele.getAsJsonObject().get("refresh_token").getAsString();	//refresh 토큰 받아오기
		
//		logger.debug(access_Token);
		return access_Token;
	}
	
	
	@RequestMapping(value = "naverLogin")
	public String naver(Model model,HttpServletRequest request, HttpSession session, HttpServletResponse resp) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String clientId = "S1ExXuozTffAz6EJ7ZL2";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "9xUGJUdIZa";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://192.168.1.8:8080/tsigner/naverLogin", "UTF-8");
	    String apiURL;
	    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	    apiURL += "client_id=" + clientId;
	    apiURL += "&client_secret=" + clientSecret;
	    apiURL += "&redirect_uri=" + redirectURI;
	    apiURL += "&code=" + code;
	    apiURL += "&state=" + state;
//	    Map<String, Object> map = new HashMap<String, Object>();
//	    System.out.println("apiURL="+apiURL);
	    LoginVo bean = new LoginVo();		// 로그인 결과를 담아놓을 Vo
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.println("responseCode="+responseCode);
	      if(responseCode==200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuffer res = new StringBuffer();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if(responseCode==200) {
	        System.out.println(res.toString());
	    	//네이버 로그인 계정의 정보를 받아오기
	        String access_Token=getAccessToken(res.toString());
	        String header = "Bearer "+ access_Token;
	        
	        try {
	        	String apiNURL = "https://openapi.naver.com/v1/nid/me";
	        	URL urlN = new URL(apiNURL);
	        	HttpURLConnection connN = (HttpURLConnection) urlN.openConnection();
	        	connN.setRequestMethod("GET");
	        	connN.setRequestProperty("Authorization", header);
	        	int resCode = connN.getResponseCode();
	        	BufferedReader brN;
	        	if(resCode==200) {	//정상호출
	        		brN = new BufferedReader(new InputStreamReader(connN.getInputStream(),"utf-8"));
	        		String input;
		        	StringBuffer response = new StringBuffer();
		        	while((input=brN.readLine())!=null){
		        		response.append(input);
		        		//System.out.println("버퍼에서도?"+response);
		        	}
		        	brN.close();
		        	//System.out.println("회원정보 가져온 결과"+response.toString());
		        	
		        	JsonParser jParser = new JsonParser();
		        	JsonElement ele1 = jParser.parse(response.toString());
		        	
		        	JsonObject naverRes = ele1.getAsJsonObject().get("response").getAsJsonObject();
					
		        	//네이버 토큰에서 내가 가져올 수 있는 정보
					String nickName = naverRes.getAsJsonObject().get("nickname").getAsString();
					String email = naverRes.getAsJsonObject().get("email").getAsString();
					String id = naverRes.getAsJsonObject().get("id").getAsString();
					String name = naverRes.getAsJsonObject().get("name").getAsString();
					
					resp.getWriter().write(ele1.toString());
//					session.setAttribute("nickNameN", nickName);
//					session.setAttribute("idN", id);
//					session.setAttribute("emailN", email);
//					session.setAttribute("nameN", name);
//					System.out.println(loginService.emailCheck(email));
					//여기서 이메일 체크하고 넘어감
					if(loginService.emailCheck(email)!=null) {	//중복이메일이 있을 경우 바로 로그인
						logger.debug("네이버 정보 파싱");
						bean = loginService.emailLogin(email);
						session.setAttribute("id", bean.getUser_id());
						System.out.println("유저레벨 : "+bean.getUser_mem_lev());
						session.setAttribute("userMemLvl", bean.getUser_mem_lev());
						try{
							if(bean.getProfile_file().equals("null")) {}else {
								session.setAttribute("profile", bean.getProfile_root()+bean.getProfile_file());
							}
						}catch(NullPointerException e) {
							session.setAttribute("profile", bean.getProfile_root());
						}
						//System.out.println(bean.getProfile_root()+bean.getProfile_file());
						session.setAttribute("sns", bean.getSns_type());
					}else{									//중복 이메일이 없을 경우 회원가입 후 로그인
						logger.debug("sns 정보 받아오기");									// 간단한 정보가 필요한 이유는 다음 로그인 시 회원의 플래너의 정보를 얻어오기 위함
						Map<String, Object> map = new HashMap<String, Object>();			// 가져오는 정보는 naver의 경우 이름, 닉네임, 이메일, naver 고유번호
						map.put("id", email);
						map.put("pw", id);
						map.put("userName", name);
						map.put("nickName", nickName);
						map.put("email", email);
						map.put("snsId", id);
						map.put("type", "naver");
						map.put("root", "imgs");
						loginService.easyJoin(map);
						loginService.join_level_mgt(map);
						
						session.setAttribute("profile", map.get("root"));
						session.setAttribute("id", map.get("id"));
						session.setAttribute("sns", map.get("type"));
						
					}
					
	        	}else {	// 에러
	        		brN= new BufferedReader(new InputStreamReader(connN.getErrorStream(),"utf-8"));
	        	}
	        }catch(Exception e) {
	        }
	      }
	    } catch (Exception e) {
	      System.out.println(e);
	    }
	    return "redirect:/";
	}

	
	
	//간편 회원가입
//		@RequestMapping(value = "easyJoin")
//		public void easyJoin(@RequestParam("id") String id,@RequestParam("pw") String pw,@RequestParam("userName") String userName, HttpSession session,
//				@RequestParam("nickName") String nickName,@RequestParam("email") String email,@RequestParam("snsId") String snsId,@RequestParam("snsType") String type, HttpServletResponse res) throws Exception {
//			logger.debug("회원가입 실행");
//			
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("id", id);
//			map.put("pw", pw);
//			map.put("userName", userName);
//			map.put("nickName", nickName);
//			map.put("email", email);
//			map.put("snsId", snsId);
//			map.put("type", type);
//			
//			loginService.easyJoin(map);
//			loginService.join_level_mgt(map);
//			session.invalidate();
//		}
		
		//회원 개인정보 페이지
		@RequestMapping(value = "myPage")
		public String myInfo(@RequestParam(value = "id", defaultValue ="null") String id , @RequestParam(value = "type",defaultValue = "info") String type, Model model) {
			LoginVo bean;
			try {
				bean = loginService.getUser(id);
				
				String memLevelNm="";
				if(Integer.parseInt(bean.getUser_mem_lev())==0){
					memLevelNm="T baby";
				}else if(Integer.parseInt(bean.getUser_mem_lev())==1){
					memLevelNm="T beignner";
				}else if(Integer.parseInt(bean.getUser_mem_lev())==2){
					memLevelNm="T Expert";
				}else if(Integer.parseInt(bean.getUser_mem_lev())==3){
					memLevelNm="T Guide";
				}else if(Integer.parseInt(bean.getUser_mem_lev())==4){
					memLevelNm="T Signer";
				}else if(Integer.parseInt(bean.getUser_mem_lev())==5){
					memLevelNm="T Master";
				}
				
				model.addAttribute("id", bean.getUser_id());
				model.addAttribute("name", bean.getUser_name());
				model.addAttribute("nick", bean.getUser_nick_name());
				model.addAttribute("tel", bean.getUser_tel());
				model.addAttribute("birth", bean.getUser_birth());
				model.addAttribute("pw", bean.getPassword());
				model.addAttribute("email", bean.getUser_email());
				model.addAttribute("type",type);
				model.addAttribute("lev",memLevelNm);
				model.addAttribute("point",bean.getPoint());
			} catch (Exception e) {
				return "home";
			}
			return "myPage";
		}
		
//		//회원 개인정보 페이지
//		@RequestMapping(value = "myPage2")
//		public String myEditPw(@RequestParam(value = "id", defaultValue ="null") String id , @RequestParam(value = "type",defaultValue = "info") String type, Model model) {
//			LoginVo bean;
//			try {
//				bean = loginService.getUser(id);
//				model.addAttribute("id", bean.getUser_id());
//				model.addAttribute("name", bean.getUser_name());
//				model.addAttribute("nick", bean.getUser_nick_name());
//				model.addAttribute("tel", bean.getUser_tel());
//				model.addAttribute("birth", bean.getUser_birth());
//				model.addAttribute("type",type);
//				
//			} catch (Exception e) {
//				return "home";
//			}
//			return "myPage";
//		}
		

	//회원정보 변경
	@RequestMapping(value = "editUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> editUser(@RequestBody Map<String,Object> map,HttpSession session) {
		Map<String,Object> resMap = new HashMap<String, Object>();
		try {
			loginService.updateUser(map);
		}catch(Exception e) {
			resMap.put("message", e.getMessage());
			return resMap;
		}
		String path=(String)map.get("path");
		String file=(String)map.get("file");
//		String no = (String)map.get("no");
		String profile= path+file;
		session.setAttribute("profile", profile);
		System.out.println("profile = "+path+file);
		resMap.put("message", "정상적으로 변경되었습니다.");
		return resMap;
	}
	
	//비밀번호 변경하기 전에 회원 인증하기
	@RequestMapping(value = "checkUser")
	@ResponseBody
	public String checkUser (@RequestBody Map<String,Object> map) {
		try {
			//System.out.println(loginService.checkUser(map));
			if(!(loginService.checkUser(map).isEmpty())) {
				logger.debug("유저인증 성공");
				return "success";
			}
		} catch (Exception e) {
			logger.debug("유저인증 에러");
			return "fail";
		}
		logger.debug("유저인증 실패");
		return "fail";
	}
	
	//탈퇴하는 계정에 대한 계정인증
	@RequestMapping(value = "leaveCheck")
	@ResponseBody
	public String leaveCheck(@RequestBody Map<String,String> map) {
		try {
			if(!(loginService.login(map).getUser_id().isEmpty())) {
				return"success";
			}
		} catch (Exception e) {
			return "fail";
		}
		return "fail";
	}
	
	//탈퇴처리
	@RequestMapping(value = "leaveUser")
	@ResponseBody
	public String leaveUser(@RequestParam("id") String id, HttpSession session) {
			try {
				loginService.leaveUser3(id);
				loginService.leaveUser(id);
				loginService.leaveUser2(id);
				loginService.leaveTogether(id);
				loginService.leaveBbs(id);
				loginService.leaveInquiry(id);
				loginService.leavePlaner(id);
				session.invalidate();
				return "success";
			} catch (Exception e) {
				return "fail";
			}
	}	
	
	//myPage 내가 쓴 글 불러오기
	
	//plannerList불러오기
		@RequestMapping(value = "plannerList")
		@ResponseBody
		public Map<String,Object> plannerList(Model model,@RequestParam("id") String id) throws SQLException{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("type", 1);
			Map<String, Object> result = new HashMap<String, Object>();
			
			List<CommunityVo> list=new ArrayList<CommunityVo>();
			List<Integer> list2=new ArrayList<Integer>();
			try {
				list = loginService.getComnList(map);
				result.put("list", list);
				for(int i=0; i<list.size(); i++) {
					int num = list.get(i).getCmnt_seq();
					map.put("num", num);
					int res = loginService.getListTotal(map);
					list2.add(res);
					result.put("total", list2);
				}
			} catch (Exception e) {
				//System.out.println("실행 안됌");
			}
			return result;
		}
	
	//togetherList불러오기
	CommunityService communityService;
	@RequestMapping(value = "togetherList")
	@ResponseBody
	public Map<String,Object> togetherList(Model model,@RequestParam("id") String id) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", 3);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<CommunityVo> list=new ArrayList<CommunityVo>();
		List<Integer> list2=new ArrayList<Integer>();
		try {
			list = loginService.getComnList(map);
			result.put("list", list);
			for(int i=0; i<list.size(); i++) {
				int num = list.get(i).getCmnt_seq();
				map.put("num", num);
				int res = loginService.getListTotal(map);
				list2.add(res);
				result.put("total", list2);
			}
		} catch (Exception e) {
			//System.out.println("실행 안됌");
		}
		return result;
	}
	
	//자유게시판 불러오기
	@RequestMapping(value = "bbsList")
	@ResponseBody
	public Map<String,Object> bbsList(Model model,@RequestParam("id") String id) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", 2);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<CommunityVo> list=new ArrayList<CommunityVo>();
		List<Integer> list2=new ArrayList<Integer>();
		try {
			list = loginService.getComnList(map);
			result.put("list", list);
			for(int i=0; i<list.size(); i++) {
				int num = list.get(i).getCmnt_seq();
				map.put("num", num);
				int res = loginService.getListTotal(map);
				list2.add(res);
				result.put("total", list2);
			}
		} catch (Exception e) {
			//System.out.println("실행 안됌");
		}
		return result;
	}
	
	//플래너게시판 불러오기
	@RequestMapping(value = "palnerList")
	@ResponseBody
	public Map<String,Object> palnerList(Model model,@RequestParam("id") String id) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", 1);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<CommunityVo> list=new ArrayList<CommunityVo>();
		List<Integer> list2=new ArrayList<Integer>();
		try {
			list = loginService.getComnList(map);
			result.put("list", list);
			for(int i=0; i<list.size(); i++) {
				int num = list.get(i).getCmnt_seq();
				map.put("num", num);
				int res = loginService.getListTotal(map);
				list2.add(res);
				result.put("total", list2);
			}
		} catch (Exception e) {
			//System.out.println("실행 안됌");
		}
		return result;
	}
	
	//후기게시판 불러오기
	@RequestMapping(value = "comList")
	@ResponseBody
	public Map<String,Object> comList(Model model,@RequestParam("id") String id) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", 4);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<CommunityVo> list=new ArrayList<CommunityVo>();
		List<Integer> list2=new ArrayList<Integer>();
		try {
			list = loginService.getComnList(map);
			result.put("list", list);
			for(int i=0; i<list.size(); i++) {
				int num = list.get(i).getCmnt_seq();
				map.put("num", num);
				int res = loginService.getListTotal(map);
				list2.add(res);
				result.put("total", list2);
			}
		} catch (Exception e) {
			//System.out.println("실행 안됌");
		}
		return result;
	}
	//question게시판 불러오기
	@RequestMapping(value = "questionList")
	@ResponseBody
	public Map<String,Object> questionList(Model model,@RequestParam("id") String id) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", 5);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<CommunityVo> list=new ArrayList<CommunityVo>();
		List<Integer> list2=new ArrayList<Integer>();
		try {
			list = loginService.getComnList(map);
			result.put("list", list);
			for(int i=0; i<list.size(); i++) {
				int num = list.get(i).getCmnt_seq();
				map.put("num", num);
				int res = loginService.getListTotal(map);
				list2.add(res);
				result.put("total", list2);
			}
		} catch (Exception e) {
			//System.out.println("실행 안됌");
		}
		return result;
	}
	
	//question게시판 불러오기
	@RequestMapping(value = "inquiryList")
	@ResponseBody
	public Map<String,Object> inquiryList(Model model,@RequestParam("id") String id) throws SQLException{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		Map<String, Object> result = new HashMap<String, Object>();
		
		List<SupportVo> list=new ArrayList<SupportVo>();
		List<Integer> list2=new ArrayList<Integer>();
		try {
			list = loginService.inquiryList(map);
			result.put("list", list);
			for(int i=0; i<list.size(); i++) {
				int num = list.get(i).getInq_seq();
				map.put("num", num);
				int res = loginService.getInqResult(map);
				System.out.println(res);
				list2.add(res);
				result.put("total", list2);
			}
		} catch (Exception e) {
			//System.out.println("실행 안됌");
		}
		return result;
	}
	
	//결제완료 후 디비에 결제내역 저장
	@RequestMapping(value = "payDb")
	@ResponseBody
	public String payDb(@RequestBody Map<String,Object> map) {
		try {
			loginService.payDb(map);
			return "success";
		} catch (Exception e) {
			return "fail";
		}
	}
	
	//결제내역 출력하기
	@RequestMapping(value = "payList")
	@ResponseBody
	public List<PayVo> payList(@RequestParam("id") String id) throws Exception {
		List<PayVo> bean = new ArrayList<PayVo>();
		bean = loginService.payList(id);
		return bean;
	}
	
	
//	//이미지 popup창
//	@RequestMapping(value = "imgPopup")
//	public String test() {
//		return "imgPopup";
//	}
	
//	//이미지 미리보기
//	@RequestMapping(value = "profileUp")
//	@ResponseBody
//	public String profileUp(MultipartHttpServletRequest multi,HttpSession session) {
//		//저장 경로 설정
//		String user = (String)session.getAttribute("id");
////		String root = multi.getSession().getServletContext().getRealPath("/");
////		String path = root+"\\resources\\profileTmp\\";
//		String root = "c:\\tsigner\\";
//		String path = root+"profileTmp\\";
//		//System.out.println("path1 = "+path);
//		//업로드 될 파일 이름
//		String newFileName = "";
//		
//		//저장 경로 없을 때 저장 경로 생성
//		File dir = new File(path);
//		if(!dir.isDirectory()) {
//			dir.mkdir();
//		}
//		//파일 읽기
//		Iterator<String> files = multi.getFileNames();
//		while(files.hasNext()) {
//			String uploadFile = files.next();
//			
//			MultipartFile mFile = multi.getFile(uploadFile);
//			String fileName = mFile.getOriginalFilename();
////			System.out.println("실제 파일 이름"+fileName);
////			newFileName = System.currentTimeMillis()+fileName+"."+fileName.substring(fileName.lastIndexOf(".")+1);
//			newFileName = user+fileName;
////			System.out.println("올라갈 파일 이름"+newFileName);
//			
//			try {
//				mFile.transferTo(new File(path+newFileName));
//			} catch (Exception e) {
//				e.printStackTrace();
//			} 
//		}
//		return "success";
//	}
	
	//프로필 사진 저장하는 메서드
	@RequestMapping(value = "imgChange")
	@ResponseBody
	public String imgChange(MultipartHttpServletRequest multi,HttpSession session) {
		//저장 경로 설정
			String user = (String)session.getAttribute("id");
			String root = "c:\\tsigner\\";
//			String root = multi.getSession().getServletContext().getRealPath("/");
//			root=root.substring(0,root.indexOf(".metadata"));
//			String path = root+"tsigner\\src\\main\\webapp\\profile\\";
			String path = root+"profile\\"+user+"\\";
//			System.out.println(path);
			//업로드 될 파일 이름
			String newFileName = "";
			
			//저장 경로 없을 때 저장 경로 생성
			File dir = new File(path);
			if(!dir.isDirectory()) {
					dir.mkdir();
			}else {
				
				//저장된 경로가 존재할때 폴더 내 파일들 모두 삭제 시키기
				//폴더 내에 파일들의 리스트를 얻어옴
				File[] folder = dir.listFiles();
				//폴더 리스트의 길이만큼 파일들 모두 삭제
				for(int i=0; i<folder.length; i++) {
					folder[i].delete();
				}
			}
			
//			System.out.println(multi.getFileNames());
			//파일 읽기
			Iterator<String> files = multi.getFileNames();
			while(files.hasNext()) {
				String uploadFile = files.next();
				MultipartFile mFile = multi.getFile(uploadFile);
//				System.out.println(mFile);
				String fileName = mFile.getOriginalFilename();
//				System.out.println("실제 파일 이름"+fileName);
				newFileName = fileName;
//				String n = fileName.substring(fileName.indexOf("."));
//				System.out.println("확장자 : "+n);
//				newFileName = "profile"+n;
//				System.out.println("올라갈 파일 이름"+newFileName);
				try {
					mFile.transferTo(new File(path+newFileName));
				} catch (Exception e) {
					//최초로 사진을 변경하지않고 개인정보를 수정했을 때 폴더가 제대로 생성되지 않는 오류 수정
					
					dir.delete();
					imgChange(multi,session);
				} 
			}
			return "success";
	}
	
}
