package com.bit.tsigner.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.tsigner.BoardPager;
import com.bit.tsigner.MediaUtils;
import com.bit.tsigner.UploadFileUtils;
import com.bit.tsigner.model.entity.EventVo;
import com.bit.tsigner.model.entity.NoticeVo;
import com.bit.tsigner.model.entity.UpdateVo;
import com.bit.tsigner.service.LoginService;
import com.bit.tsigner.service.NoticeService;

@Controller
public class NoticeController {

	@Inject
	NoticeService noticeService;
	LoginService loginService;

	String uploadDir = "C:\\tsigner\\upload\\"; // upload 파일 저장되는 주소

	@Resource(name = "uploadPath")
	String uploadPath;

	Logger logger = LoggerFactory.getLogger(getClass());

	// 게시글 리스트
//   @RequestMapping(value = "/notice" )
//   public String notice(Model model) throws SQLException {
//      
//      logger.debug("공지사항");
//
//      noticeService.getList(model);
//      
//      return "notice/notice";
//   }

	@RequestMapping(value = "/notice")
	// defaultValue = "1" -> 기본 값 할당 : 현재페이지를 1로 초기화
	public ModelAndView notice(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws SQLException {
		String sub = "";

		// 레코드의 갯수 계산
		int count = noticeService.countArticle(searchOption, keyword);

		// 페이지 나누기
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println(start);
		int end = boardPager.getPageEnd();

		List<NoticeVo> list = noticeService.selectAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // 레코드의 갯수
		map.put("searchOption", searchOption); // 검색 옵션
		map.put("keyword", keyword); // 검색 키워드
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("notice/notice"); // 뷰를 notice.jsp로 설정
		

		return mav; // notice.jsp로 List 전달된다

	}

	@RequestMapping(value = "/notice/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute NoticeVo bean, HttpSession session) throws SQLException {

		// session에 저장된 id를 noti_writer_id 에 저장
		String noti_writer_id = (String) session.getAttribute("id");

		String newName = null;

		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // 파일명 중복 막기 위해 파일명 = 이름+시간
			
			bean.setNoti_file_path1(origin); 	// 파일패스1에 원래 파일명 넣어주기
			bean.setNoti_file_path2(newName);	// 파일패스2에 중복방지 파일명 넣어주기
			
			System.out.println("origin" + bean.getNoti_file_path1());
			File file = new File(uploadDir + newName);
			model.addAttribute("filename", newName);
			model.addAttribute("origin", origin);

			try {
				file1.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		// bean에 writer 세팅
		bean.setNoti_writer_id(noti_writer_id);
		noticeService.add(bean);

		return "redirect:/notice";
	}

	/******************************
	 * # ajax 방식의 업로드 처리
	 *********************************/

	// 4. Ajax업로드 페이지 매핑
	@RequestMapping(value = "/notice/upload", method = RequestMethod.GET)
	public void upload() {
		// uploadAjax.jsp로 포워딩
	}

	// 5. Ajax업로드 처리 매핑
	// 파일의 한글처리 : produces="text/plain;charset=utf-8"
	@ResponseBody // view가 아닌 data리턴
	@RequestMapping(value = "/notice/upload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> upload(MultipartFile file) throws Exception {
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}

//   // 6. 이미지 표시 매핑
	@ResponseBody // view가 아닌 data리턴
	@RequestMapping(value = "/notice/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		// 서버의 파일을 다운로드하기 위한 스트림
		InputStream in = null; // java.io
		ResponseEntity<byte[]> entity = null;
		try {
			// 확장자를 추출하여 formatName에 저장
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			// 추출한 확장자를 MediaUtils클래스에서 이미지파일여부를 검사하고 리턴받아 mType에 저장
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
			HttpHeaders headers = new HttpHeaders();
			// InputStream 생성
			in = new FileInputStream(uploadPath + fileName);
			// 이미지 파일이면
			if (mType != null) {
				headers.setContentType(mType);
				// 이미지가 아니면
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				// 다운로드용 컨텐트 타입
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				//
				// 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") *
				// iso-8859-1 서유럽언어, 큰 따옴표 내부에 " \" 내용 \" "
				// 파일의 한글 깨짐 방지
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("utf-8"), "iso-8859-1") + "\"");
				// headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
			}
			// 바이트배열, 헤더, HTTP상태코드
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// HTTP상태 코드()
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close(); // 스트림 닫기
		}
		return entity;
	}

//   
//   // 7. 파일 삭제 매핑
//	@ResponseBody // view가 아닌 데이터 리턴
//	@RequestMapping(value = "/notice/upload/deleteFile", method = RequestMethod.POST)
//	public ResponseEntity<String> deleteFile(String fileName) throws Exception {
//		// 파일의 확장자 추출
//		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
//		// 이미지 파일 여부 검사
//		MediaType mType = MediaUtils.getMediaType(formatName);
//		// 이미지의 경우(썸네일 + 원본파일 삭제), 이미지가 아니면 원본파일만 삭제
//		// 이미지 파일이면
//		if (mType != null) {
//			// 썸네일 이미지 파일 추출
//			String front = fileName.substring(0, 12);
//			String end = fileName.substring(14);
//			// 썸네일 이미지 삭제
//			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
//		}
//		// 원본 파일 삭제
//		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
//
//		// 데이터와 http 상태 코드 전송
//		return new ResponseEntity<String>("deleted", HttpStatus.OK);
//	}
	
	
	// 7. 파일 삭제 매핑
		@ResponseBody // view가 아닌 데이터 리턴
		@RequestMapping(value = "/notice/upload/deleteFile", method = RequestMethod.POST)
		public ResponseEntity<String> deleteFile(@RequestParam("newName") String fileName,@RequestParam("idx") int idx) throws Exception {
			System.out.println("가져옴?"+fileName);
			// 원본 파일 삭제
			new File(uploadDir + fileName).delete();

			noticeService.fileDelete(idx);
			// 데이터와 http 상태 코드 전송
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

	/******************************
	 * # ajax 방식의 업로드 처리 끝
	 *********************************/

	@RequestMapping("notice/download/{filename:.+}/{origin:.+}")
	public void download(@PathVariable String origin, HttpServletResponse resp, @PathVariable String filename) {
		System.out.println("실행");
		logger.debug("down:" + filename);
		logger.debug("down:" + origin);
		// target="_blank"
		// 파일을 브라우저가 직접 처리하지 못하도록 모르는 형식으로 전달
		 resp.setContentType("application/octet-stream;charset=\"utf-8\"");
		//

		// 파일의 오리지날 이름으로 돌려놓기
		// resp.setHeader("Content-Disposition", "attachment; filename=\""+origin+"\"");
		

		File file = new File(uploadDir + filename);
		OutputStream os = null;
		InputStream is = null;

		try {
			os = resp.getOutputStream();
			is = new FileInputStream(file);
			int temp = 0;
			while ((temp = is.read()) != -1) {
				os.write(temp);
			}
			os.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	// 게시글 상세보기
	@RequestMapping(value = "/notice/detail")
	public String detail(Model model, @RequestParam("idx") int idx) throws SQLException {

		noticeService.detail(model, idx);
		noticeService.viewcnt(idx);
		String id = noticeService.getWriter(idx);
		try {
			noticeService.getImg(model, id);
		} catch (Exception e) {
			model.addAttribute("writer", "imgs/noProfile.png");
		}

		return "notice/noticeDetail";
	}

	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	   public String update(Model model,@ModelAttribute NoticeVo bean, @RequestParam("idx") int idx, @RequestParam("sub") String

	   sub, @RequestParam("content") String content, @RequestParam("writer") String writer, @RequestParam(value = "noti_fix",defaultValue = "0") int noti_fix) throws SQLException {
	      
		
		String newName = null;
		
		System.out.println("업로드 파일즈"+bean.getUpload_files());
		
		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // 파일명 중복 막기 위해 파일명 = 이름+시간
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			bean.setNoti_file_path1(origin); 	// 파일패스1에 원래 파일명 넣어주기
			bean.setNoti_file_path2(newName);	// 파일패스2에 중복방지 파일명 넣어주기
			
			
			System.out.println("origin" + bean.getNoti_file_path1());
			File file = new File(uploadDir + newName);
					
			model.addAttribute("filename", newName);
			model.addAttribute("origin", origin);

			try {
				file1.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	      
	      
	      noticeService.update(idx, sub, content, writer, noti_fix,bean);
	      
	      
	      
	      return "redirect:/notice";
	   }

	@RequestMapping(value = "/notice/delete", method = RequestMethod.POST)
	@ResponseBody
	public String delete(@RequestParam("idx") int idx) {
//      System.out.println(idx);
		try {
			noticeService.delete(idx);
		} catch (SQLException e) {
			return "fail";

		}
		return "success";
	}

////////////////////////////////////////////////////////////////////////////////////////

	// event
	@RequestMapping(value = "/event")
	// defaultValue = "1" -> 기본 값 할당 : 현재페이지를 1로 초기화
	public ModelAndView event(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws SQLException {

		// 레코드의 갯수 계산
		int count = noticeService.eventCountArticle(searchOption, keyword);

		// 페이지 나누기
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println(start);
		int end = boardPager.getPageEnd();

		List<EventVo> list = noticeService.eventSelectAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // 레코드의 갯수
		map.put("searchOption", searchOption); // 검색 옵션
		map.put("keyword", keyword); // 검색 키워드
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("notice/event"); // 뷰를 event.jsp로 설정

		return mav; // event.jsp로 List 전달된다

	}

	@RequestMapping(value = "/event/add", method = RequestMethod.POST)
	public String eventAdd(Model model,@ModelAttribute EventVo bean, HttpSession session) throws SQLException {

		// session에 저장된 id를 event_writer_id 에 저장
		String event_writer_id = (String) session.getAttribute("id");
		
		String newName = null;
		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // 파일명 중복 막기 위해 파일명 = 이름+시간

			bean.setEvent_file_path1(origin); // 파일패스1에 파일명 넣어주기
			bean.setEvent_file_path2(newName); // 파일패스2에 파일명 넣어주기

			System.out.println("newName" + bean.getEvent_file_path1());
			File file = new File(uploadDir + newName);

			model.addAttribute("filename", newName);
			model.addAttribute("origin", origin);
			
			try {
				file1.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		bean.setEvent_writer_id(event_writer_id);
		noticeService.eventAdd(bean);
		return "redirect:/event";
	}
	
	@RequestMapping("event/download/{filename:.+}/{origin:.+}")
	public void eventDownload(@PathVariable String origin, HttpServletResponse resp, @PathVariable String filename) {
		System.out.println("실행");
		logger.debug("down:" + filename);
		logger.debug("down:" + origin);
		// target="_blank"
		// 파일을 브라우저가 직접 처리하지 못하도록 모르는 형식으로 전달
		 resp.setContentType("application/octet-stream;charset=\"utf-8\"");
		//

		// 파일의 오리지날 이름으로 돌려놓기
		// resp.setHeader("Content-Disposition" , "attachment; filename=\""+origin+"\"");
		 
		

		File file = new File(uploadDir + filename);
		OutputStream os = null;
		InputStream is = null;

		try {
			os = resp.getOutputStream();
			is = new FileInputStream(file);
			int temp = 0;
			while ((temp = is.read()) != -1) {
				os.write(temp);
			}
			os.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}
	
	// 7. 파일 삭제 매핑
			@ResponseBody // view가 아닌 데이터 리턴
			@RequestMapping(value = "/event/upload/deleteFile", method = RequestMethod.POST)
			public ResponseEntity<String> eventDeleteFile(@RequestParam("newName") String fileName,@RequestParam("idx") int idx) throws Exception {
				System.out.println("이벤트 파일삭제:"+fileName);
				// 원본 파일 삭제
				new File(uploadDir + fileName).delete();

				noticeService.eventFileDelete(idx);
				// 데이터와 http 상태 코드 전송
				return new ResponseEntity<String>("deleted", HttpStatus.OK);
			}

	// 게시글 상세보기
	@RequestMapping(value = "/event/detail")
	public String eventDetail(Model model, @RequestParam("idx") int idx) throws SQLException {

		noticeService.eventDetail(model, idx);
		noticeService.eventViewcnt(idx);
		String id = noticeService.getEventWriter(idx);
		try {
			noticeService.eventWriter(model, id);
		} catch (Exception e) {
			model.addAttribute("writer", "imgs/noProfile.png");
		}

		return "notice/eventDetail";
	}

	@RequestMapping(value = "/event/update", method = RequestMethod.POST)
	public String eventUpdate(Model model,@ModelAttribute EventVo bean, @RequestParam("idx") int idx, @RequestParam("sub")

	String sub, @RequestParam("content") String content,@RequestParam(value = "event_fix" ,defaultValue = "0") int event_fix) throws SQLException {
		
		String newName = null;
		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // 파일명 중복 막기 위해 파일명 = 이름+시간

			bean.setEvent_file_path1(origin); // 파일패스1에 파일명 넣어주기
			bean.setEvent_file_path2(newName); // 파일패스1에 파일명 넣어주기

			System.out.println("newName" + bean.getEvent_file_path1());
			File file = new File(uploadDir + newName);

			model.addAttribute("filename", newName);
			model.addAttribute("origin", origin);
			
			try {
				file1.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		
		noticeService.eventUpdate(idx, sub, content, event_fix,bean);

		return "redirect:/event";
	}

	@RequestMapping(value = "/event/delete", method = RequestMethod.POST)
	@ResponseBody
	public String eventDelete(@RequestParam("idx") int idx) {

		// 이벤트 글 삭제 할 때 댓글 먼저 삭제 하기
		try {
			noticeService.replyDelete(idx);
			noticeService.eventDelete(idx);
		} catch (SQLException e) {
			return "fail";
		}

		return "success";

//     noticeService.eventDeleteUpdate(idx);
//     noticeService.replyDeleteUpdate(idx);

	}

	///////// 답글 등록시

	@RequestMapping(value = "/event/reply", method = RequestMethod.POST)
	public String eventReplyAdd(@ModelAttribute EventVo bean, HttpSession session) throws SQLException {
		// session에 저장된 id를 event_writer_id 에 저장
		String event_writer_id = (String) session.getAttribute("id");
		String newName = null;

		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // 파일명 중복 막기 위해 파일명 = 이름+시간

			bean.setEvent_file_path1(origin); // 파일패스1에 파일명 넣어주기
			bean.setEvent_file_path2(newName); // 파일패스2에 파일명 넣어주기

			System.out.println("newName" + bean.getEvent_file_path1());
			File file = new File(uploadDir + newName);

			try {
				file1.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		// noticeService.eventUpdateGroupLayer(bean);
		bean.setEvent_writer_id(event_writer_id);
		noticeService.eventUpdateGroupOrd(bean); // 답글 추가 보다 이게 먼저 실행 돼야함
		noticeService.eventReplyAdd(bean);
		

		return "redirect:/event";
	}

	@RequestMapping(value = "/event/getReplyWriter")
	@ResponseBody
	public String getReplyWriter(@RequestParam("id") String id) {
		String result = "res";
		try {
			result = noticeService.getReplyWriter(id);
			result = URLEncoder.encode(result, "utf-8");
			System.out.println("결과 " + result);
		} catch (Exception e) {

		}
		return result;
	}

// 업데이트---------------------------------------------------------

	@RequestMapping(value = "/update")
	// defaultValue = "1" -> 기본 값 할당 : 현재페이지를 1로 초기화
	public ModelAndView update(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws SQLException {
		String sub = "";

		// 레코드의 갯수 계산
		int count = noticeService.updateCountArticle(searchOption, keyword);

		// 페이지 나누기
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println(start);
		int end = boardPager.getPageEnd();

		List<UpdateVo> list = noticeService.updateSelectAll(start, end, searchOption, keyword);

		// 데이터를 맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // 레코드의 갯수
		map.put("searchOption", searchOption); // 검색 옵션
		map.put("keyword", keyword); // 검색 키워드
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // 맵에 저장된 데이터를 mav에 저장
		mav.setViewName("notice/update"); // 뷰를 update.jsp로 설정

		return mav; // update.jsp로 List 전달된다

	}

	@RequestMapping(value = "/update/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute UpdateVo bean, HttpSession session) throws SQLException {

		// session에 저장된 id를 noti_writer_id 에 저장
		String update_writer_id = (String) session.getAttribute("id");

		String newName = null;

		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // 파일명 중복 막기 위해 파일명 = 이름+시간
			
			bean.setUpdate_file_path1(origin); 	// 파일패스1에 원래 파일명 넣어주기
			bean.setUpdate_file_path2(newName);	// 파일패스2에 중복방지 파일명 넣어주기
			
			
			System.out.println("origin" + bean.getUpdate_file_path1());
			File file = new File(uploadDir + newName);
			model.addAttribute("filename", newName);
			model.addAttribute("origin", origin);

			try {
				file1.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		// bean에 writer 세팅
		bean.setUpdate_writer_id(update_writer_id);
		noticeService.updateAdd(bean);

		return "redirect:/update";
	}
	
	// 7. 파일 삭제 매핑
		@ResponseBody // view가 아닌 데이터 리턴
		@RequestMapping(value = "/update/upload/deleteFile", method = RequestMethod.POST)
		public ResponseEntity<String> updateDeleteFile(@RequestParam("newName") String fileName,@RequestParam("idx") int idx) throws Exception {
			System.out.println("가져옴?"+fileName);
			// 원본 파일 삭제
			new File(uploadDir + fileName).delete();

			noticeService.updateFileDelete(idx);
			// 데이터와 http 상태 코드 전송
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

	@RequestMapping("update/download/{filename:.+}/{origin:.+}")
	public void updateDownload(@PathVariable String origin, HttpServletResponse resp, @PathVariable String filename) {
		System.out.println("실행");
		logger.debug("down:" + filename);
		logger.debug("down:" + origin);
		// target="_blank"
		// 파일을 브라우저가 직접 처리하지 못하도록 모르는 형식으로 전달
		 resp.setContentType("application/octet-stream;charset=\"utf-8\"");
		//

		// 파일의 오리지날 이름으로 돌려놓기
		// resp.setHeader("Content-Disposition", "attachment; filename=\""+origin+"\"");
		

		File file = new File(uploadDir + filename);
		OutputStream os = null;
		InputStream is = null;

		try {
			os = resp.getOutputStream();
			is = new FileInputStream(file);
			int temp = 0;
			while ((temp = is.read()) != -1) {
				os.write(temp);
			}
			os.flush();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (os != null)
					os.close();
				if (is != null)
					is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	// 게시글 상세보기
	@RequestMapping(value = "/update/detail")
	public String updateDetail(Model model, @RequestParam("idx") int idx) throws SQLException {

		noticeService.updateDetail(model, idx);
		noticeService.updateViewcnt(idx);
		String id = noticeService.getUpdateWriter(idx);
		try {
			noticeService.getImg(model, id);
		} catch (Exception e) {
			model.addAttribute("writer", "imgs/noProfile.png");
		}

		return "notice/updateDetail";
	}

	@RequestMapping(value = "/update/update", method = RequestMethod.POST)
	   public String update(Model model,@ModelAttribute UpdateVo bean, @RequestParam("idx") int idx, @RequestParam("sub") String

	   sub, @RequestParam("content") String content, @RequestParam("writer") String writer) throws SQLException {
	      
		String newName = null;
		
	//	System.out.println("업로드 파일즈"+bean.getUpload_files());
		
		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // 파일명 중복 막기 위해 파일명 = 이름+시간
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			bean.setUpdate_file_path1(origin); 	// 파일패스1에 원래 파일명 넣어주기
			bean.setUpdate_file_path2(newName);	// 파일패스2에 중복방지 파일명 넣어주기
			
			
			System.out.println("origin" + bean.getUpdate_file_path1());
			File file = new File(uploadDir + newName);
					
			model.addAttribute("filename", newName);
			model.addAttribute("origin", origin);

			try {
				file1.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	      
	      
	      noticeService.updateEdit(idx, sub, content, writer,bean);
	      
	      
	      
	      return "redirect:/update";
	   }

	@RequestMapping(value = "/update/delete", method = RequestMethod.POST)
	@ResponseBody
	public String updateDelete(@RequestParam("idx") int idx) {
//      System.out.println(idx);
		try {
			noticeService.updateDelete(idx);
		} catch (SQLException e) {
			return "fail";

		}
		return "success";
	}
	
	////////////////////////////how to use /////////////////////////////////////////////////
	
	@RequestMapping(value = "/howtouse")
	// defaultValue = "1" -> 기본 값 할당 : 현재페이지를 1로 초기화
	public String howtouse(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage) throws SQLException {
		

		return "notice/howtouse";// howtouse.jsp로 List 전달된다

	}

}