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
	
	//īī����
	@Autowired
	private KaKaoAPI kakao;
	
	//mail ������ ���� ����
	@Autowired
	private Mail mail;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	//���̹�
//	private NaverLoginBO naverLoginBO;
//	private String apiResult = null;

	String id="";
	String name="";
	String email="";
	String nickName="";
	String sns="";
	
	//Ȩȭ��
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
//		model.addAttribute("sns",sns);
		
		/* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
//		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
//		System.out.println("���̹�:" + naverAuthUrl);
		//���̹�
//		model.addAttribute("url", naverAuthUrl);

		
		return "home";
	}
	
	
	//�Ϲ� �α���
	@RequestMapping (value = "**/loginUser")
	public void loginResult(@RequestParam("id") String id , @RequestParam("pw") String pw, HttpSession session, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);
		
		LoginVo bean=new LoginVo();
		
		if((loginService.login(map))==null) {
			res.getWriter().write("logFail");
			logger.debug("����");
		}else {
			logger.debug("����");
			bean = loginService.login(map);
			session.setAttribute("id", bean.getUser_id());
			System.out.println("�������� : "+bean.getUser_mem_lev());
			session.setAttribute("userMemLvl", bean.getUser_mem_lev());
			try{
				if(!(bean.getProfile_root().isEmpty())) {
					try{
						if(bean.getProfile_file().equals("null")) {}else {
							System.out.println("�̹����� ��ϵǾ� ������");
							session.setAttribute("profile", bean.getProfile_root()+bean.getProfile_file());
						}
					}catch(NullPointerException e) {
						System.out.println("�̹����� ��ϵǾ� ���� ��");
						session.setAttribute("profile", bean.getProfile_root());
					}
				}
			}catch(Exception e) {
				System.out.println("�����϶�");
				session.setAttribute("profile", "/tsigner/imgs/noProfile.png");
			}
		}
	}
	
	//�α׾ƿ�
	@RequestMapping (value = {"**/logoutUser","community_togetherDetail/logoutUser"})
	public void logoutUser(HttpSession session,HttpServletResponse res) {
		//kakao �α׾ƿ�
		if(kakao.kakaoLogout((String)session.getAttribute("access_Token"))) {
			session.removeAttribute("access_Token");
			session.removeAttribute("id");
//			session.removeAttribute("nickName");
			try {
				res.getWriter().write("kakaoLogout");
			} catch (IOException e) {
			}
		}
		//�Ϲ�, Naver �α׾ƿ�
		else {
			session.invalidate();
			try {
				res.getWriter().write("logoutSuccess");
			} catch (IOException e) {
			}
		}
	}
	
	//�Ϲ� ȸ������
	@RequestMapping(value = "**/joinUser")
	public void joinUser(@RequestParam("id") String id,@RequestParam("pw") String pw,@RequestParam("userName") String userName,
			@RequestParam("nickName") String nickName,@RequestParam("email") String email,@RequestParam("tel") String tel,
			@RequestParam("birth") String birth,@RequestParam("gender") String gender, HttpServletResponse res) throws Exception {
		logger.debug("ȸ������ ����");
		
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
	
	//���̵� �ߺ��˻�
	@RequestMapping (value = "**/idCheck")
	public void idCheck(@RequestParam("id") String id, HttpServletResponse res) throws Exception {
		logger.debug("�ߺ��˻�");
		if(!(loginService.idCheck(id)==null)) {
			res.getWriter().write("fail");
		}else {
			res.getWriter().write("success");
		}
		
	}
	
	//�̸��� ������ ���� �������� ����
	Map<String, Object> res= new HashMap<String, Object>(); 
	int checkNum =0;
	
	//���� ���� ���� �� ���� �ߺ� �˻�
	@RequestMapping(value = "**/mailCheck")
	public void mailCheck(@RequestParam("email") String email,HttpServletResponse res) throws Exception {
		
		if(loginService.emailCheck(email)==null) {
			logger.debug(loginService.emailCheck(email));
			double ran = Math.random();
			this.checkNum=(int)(ran*100000);
			this.res.put("check"+email, checkNum);
			try {
				res.getWriter().write("success");;
				mail.sendMail(email, "T-signer ���������Դϴ�.", "������ȣ�Դϴ�\r\n"+checkNum);
			}catch(Exception e) {
				res.getWriter().write("fail");
			}
		}else {
			res.getWriter().write("mailDupli");
		}
		
	}
	
	//���� ���� Ȯ��
	@RequestMapping(value = "**/mailResult")
	public void mailResult(@RequestParam("checkEmail") String check, @RequestParam("email") String email, HttpServletResponse res) throws IOException {
		if(this.res.get("check"+email)!=null) {
			//�׽�Ʈ���Դϴ�.
			logger.debug("������ȣ"+(this.res.get("check"+email).toString()));
			if(check.equals(this.res.get("check"+email).toString())) {
				res.getWriter().write("success");
			}else {
				res.getWriter().write("fail");
			}
		}
	}
	
	////////
	

	
	
	//id�˻�
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
	
	//��й�ȣ ã��
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
	
	//��й�ȣ ����
	@RequestMapping(value = "**/editPw")
	public void editPw(@RequestParam("id") String id, @RequestParam("email") String email, @RequestParam("editPw") String pw, HttpServletResponse res) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		map.put("editPw", pw);
		
		res.getWriter().write("success");
		loginService.editPw(map);
	}
//	//��ū�̾ƿ���
//	//���̹� �α��� ������ callbackȣ�� �޼ҵ�
//	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
//	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
//		OAuth2AccessToken oauthToken;
//		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//		System.out.println(oauthToken);
//		//1. �α��� ����� ������ �о�´�.
//		apiResult = naverLoginBO.getUserProfile(oauthToken); //String������ json������
//		/** apiResult json ����
//		{"resultcode":"00",
//		"message":"success",
//		"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
//		**/
//		//2. String������ apiResult�� json���·� �ٲ�
//		JSONParser parser = new JSONParser();
//		Object obj = parser.parse(apiResult);
//		JSONObject jsonObj = (JSONObject) obj;
//		//3. ������ �Ľ�
//		//Top���� �ܰ� _response �Ľ�
//		JSONObject response_obj = (JSONObject)jsonObj.get("response");
//		//response�� nickname�� �Ľ�
//		String nickname = (String)response_obj.get("nickname");
//		String email = (String)response_obj.get("email");
//		String name = (String)response_obj.get("name");
//		System.out.println(email);
//		System.out.println(name);
//		//4.�Ľ� �г��� �������� ����
////		session.setAttribute("sessionId",nickname); //���� ����
////		model.addAttribute("result", apiResult);
//		return "redirect:/";
//	}
	
	//īī�� �α���
	@RequestMapping(value = "kakao")
	public String kakao(@RequestParam("code") String code, HttpSession session) throws Exception {
		logger.debug("īī�� ���� : "+code);
		String access_Token = kakao.getAccessToken(code);	//īī�� api�� �ҷ��� access��ū�� ����
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
			System.out.println("������ �̹���"+profileImg);
			LoginVo bean = new LoginVo();
			
			if(loginService.emailCheck((userInfo.get("email").toString()))!=null) {	// �̸����� �ߺ��ɶ��� ȸ������ ���� �α���
				bean = loginService.emailLogin(email);
				session.setAttribute("id", bean.getUser_id());
				System.out.println("�������� : "+bean.getUser_mem_lev());
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
				
			}else{																	// �̸����� �ߺ��Ǿ����� �������� ������ ������ DB�� ������ �� �α���
				logger.debug("sns ���� �޾ƿ���");									// ������ ������ �ʿ��� ������ ���� �α��� �� ȸ���� �÷����� ������ ������ ����
				Map<String, Object> map = new HashMap<String, Object>();			// �������� ������ kakao�� ��� �г���, �̸���, kakao ������ȣ
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
	
	//���̹� �α���
	public String getAccessToken(String res) {
		String access_Token ="";
//		String refresh_Token ="";
		JsonParser parser = new JsonParser();
		JsonElement ele = parser.parse(res);
		access_Token = ele.getAsJsonObject().get("access_token").getAsString();	//access ��ū �޾ƿ���
//		refresh_Token = ele.getAsJsonObject().get("refresh_token").getAsString();	//refresh ��ū �޾ƿ���
		
//		logger.debug(access_Token);
		return access_Token;
	}
	
	
	@RequestMapping(value = "naverLogin")
	public String naver(Model model,HttpServletRequest request, HttpSession session, HttpServletResponse resp) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String clientId = "S1ExXuozTffAz6EJ7ZL2";//���ø����̼� Ŭ���̾�Ʈ ���̵�";
	    String clientSecret = "9xUGJUdIZa";//���ø����̼� Ŭ���̾�Ʈ ��ũ����";
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
	    LoginVo bean = new LoginVo();		// �α��� ����� ��Ƴ��� Vo
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      System.out.println("responseCode="+responseCode);
	      if(responseCode==200) { // ���� ȣ��
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // ���� �߻�
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
	    	//���̹� �α��� ������ ������ �޾ƿ���
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
	        	if(resCode==200) {	//����ȣ��
	        		brN = new BufferedReader(new InputStreamReader(connN.getInputStream(),"utf-8"));
	        		String input;
		        	StringBuffer response = new StringBuffer();
		        	while((input=brN.readLine())!=null){
		        		response.append(input);
		        		//System.out.println("���ۿ�����?"+response);
		        	}
		        	brN.close();
		        	//System.out.println("ȸ������ ������ ���"+response.toString());
		        	
		        	JsonParser jParser = new JsonParser();
		        	JsonElement ele1 = jParser.parse(response.toString());
		        	
		        	JsonObject naverRes = ele1.getAsJsonObject().get("response").getAsJsonObject();
					
		        	//���̹� ��ū���� ���� ������ �� �ִ� ����
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
					//���⼭ �̸��� üũ�ϰ� �Ѿ
					if(loginService.emailCheck(email)!=null) {	//�ߺ��̸����� ���� ��� �ٷ� �α���
						logger.debug("���̹� ���� �Ľ�");
						bean = loginService.emailLogin(email);
						session.setAttribute("id", bean.getUser_id());
						System.out.println("�������� : "+bean.getUser_mem_lev());
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
					}else{									//�ߺ� �̸����� ���� ��� ȸ������ �� �α���
						logger.debug("sns ���� �޾ƿ���");									// ������ ������ �ʿ��� ������ ���� �α��� �� ȸ���� �÷����� ������ ������ ����
						Map<String, Object> map = new HashMap<String, Object>();			// �������� ������ naver�� ��� �̸�, �г���, �̸���, naver ������ȣ
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
					
	        	}else {	// ����
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

	
	
	//���� ȸ������
//		@RequestMapping(value = "easyJoin")
//		public void easyJoin(@RequestParam("id") String id,@RequestParam("pw") String pw,@RequestParam("userName") String userName, HttpSession session,
//				@RequestParam("nickName") String nickName,@RequestParam("email") String email,@RequestParam("snsId") String snsId,@RequestParam("snsType") String type, HttpServletResponse res) throws Exception {
//			logger.debug("ȸ������ ����");
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
		
		//ȸ�� �������� ������
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
		
//		//ȸ�� �������� ������
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
		

	//ȸ������ ����
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
		resMap.put("message", "���������� ����Ǿ����ϴ�.");
		return resMap;
	}
	
	//��й�ȣ �����ϱ� ���� ȸ�� �����ϱ�
	@RequestMapping(value = "checkUser")
	@ResponseBody
	public String checkUser (@RequestBody Map<String,Object> map) {
		try {
			//System.out.println(loginService.checkUser(map));
			if(!(loginService.checkUser(map).isEmpty())) {
				logger.debug("�������� ����");
				return "success";
			}
		} catch (Exception e) {
			logger.debug("�������� ����");
			return "fail";
		}
		logger.debug("�������� ����");
		return "fail";
	}
	
	//Ż���ϴ� ������ ���� ��������
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
	
	//Ż��ó��
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
	
	//myPage ���� �� �� �ҷ�����
	
	//plannerList�ҷ�����
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
				//System.out.println("���� �ȉ�");
			}
			return result;
		}
	
	//togetherList�ҷ�����
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
			//System.out.println("���� �ȉ�");
		}
		return result;
	}
	
	//�����Խ��� �ҷ�����
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
			//System.out.println("���� �ȉ�");
		}
		return result;
	}
	
	//�÷��ʰԽ��� �ҷ�����
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
			//System.out.println("���� �ȉ�");
		}
		return result;
	}
	
	//�ı�Խ��� �ҷ�����
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
			//System.out.println("���� �ȉ�");
		}
		return result;
	}
	//question�Խ��� �ҷ�����
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
			//System.out.println("���� �ȉ�");
		}
		return result;
	}
	
	//question�Խ��� �ҷ�����
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
			//System.out.println("���� �ȉ�");
		}
		return result;
	}
	
	//�����Ϸ� �� ��� �������� ����
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
	
	//�������� ����ϱ�
	@RequestMapping(value = "payList")
	@ResponseBody
	public List<PayVo> payList(@RequestParam("id") String id) throws Exception {
		List<PayVo> bean = new ArrayList<PayVo>();
		bean = loginService.payList(id);
		return bean;
	}
	
	
//	//�̹��� popupâ
//	@RequestMapping(value = "imgPopup")
//	public String test() {
//		return "imgPopup";
//	}
	
//	//�̹��� �̸�����
//	@RequestMapping(value = "profileUp")
//	@ResponseBody
//	public String profileUp(MultipartHttpServletRequest multi,HttpSession session) {
//		//���� ��� ����
//		String user = (String)session.getAttribute("id");
////		String root = multi.getSession().getServletContext().getRealPath("/");
////		String path = root+"\\resources\\profileTmp\\";
//		String root = "c:\\tsigner\\";
//		String path = root+"profileTmp\\";
//		//System.out.println("path1 = "+path);
//		//���ε� �� ���� �̸�
//		String newFileName = "";
//		
//		//���� ��� ���� �� ���� ��� ����
//		File dir = new File(path);
//		if(!dir.isDirectory()) {
//			dir.mkdir();
//		}
//		//���� �б�
//		Iterator<String> files = multi.getFileNames();
//		while(files.hasNext()) {
//			String uploadFile = files.next();
//			
//			MultipartFile mFile = multi.getFile(uploadFile);
//			String fileName = mFile.getOriginalFilename();
////			System.out.println("���� ���� �̸�"+fileName);
////			newFileName = System.currentTimeMillis()+fileName+"."+fileName.substring(fileName.lastIndexOf(".")+1);
//			newFileName = user+fileName;
////			System.out.println("�ö� ���� �̸�"+newFileName);
//			
//			try {
//				mFile.transferTo(new File(path+newFileName));
//			} catch (Exception e) {
//				e.printStackTrace();
//			} 
//		}
//		return "success";
//	}
	
	//������ ���� �����ϴ� �޼���
	@RequestMapping(value = "imgChange")
	@ResponseBody
	public String imgChange(MultipartHttpServletRequest multi,HttpSession session) {
		//���� ��� ����
			String user = (String)session.getAttribute("id");
			String root = "c:\\tsigner\\";
//			String root = multi.getSession().getServletContext().getRealPath("/");
//			root=root.substring(0,root.indexOf(".metadata"));
//			String path = root+"tsigner\\src\\main\\webapp\\profile\\";
			String path = root+"profile\\"+user+"\\";
//			System.out.println(path);
			//���ε� �� ���� �̸�
			String newFileName = "";
			
			//���� ��� ���� �� ���� ��� ����
			File dir = new File(path);
			if(!dir.isDirectory()) {
					dir.mkdir();
			}else {
				
				//����� ��ΰ� �����Ҷ� ���� �� ���ϵ� ��� ���� ��Ű��
				//���� ���� ���ϵ��� ����Ʈ�� ����
				File[] folder = dir.listFiles();
				//���� ����Ʈ�� ���̸�ŭ ���ϵ� ��� ����
				for(int i=0; i<folder.length; i++) {
					folder[i].delete();
				}
			}
			
//			System.out.println(multi.getFileNames());
			//���� �б�
			Iterator<String> files = multi.getFileNames();
			while(files.hasNext()) {
				String uploadFile = files.next();
				MultipartFile mFile = multi.getFile(uploadFile);
//				System.out.println(mFile);
				String fileName = mFile.getOriginalFilename();
//				System.out.println("���� ���� �̸�"+fileName);
				newFileName = fileName;
//				String n = fileName.substring(fileName.indexOf("."));
//				System.out.println("Ȯ���� : "+n);
//				newFileName = "profile"+n;
//				System.out.println("�ö� ���� �̸�"+newFileName);
				try {
					mFile.transferTo(new File(path+newFileName));
				} catch (Exception e) {
					//���ʷ� ������ ���������ʰ� ���������� �������� �� ������ ����� �������� �ʴ� ���� ����
					
					dir.delete();
					imgChange(multi,session);
				} 
			}
			return "success";
	}
	
}
