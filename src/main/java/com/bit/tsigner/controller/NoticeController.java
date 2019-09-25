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

	String uploadDir = "C:\\tsigner\\upload\\"; // upload ���� ����Ǵ� �ּ�

	@Resource(name = "uploadPath")
	String uploadPath;

	Logger logger = LoggerFactory.getLogger(getClass());

	// �Խñ� ����Ʈ
//   @RequestMapping(value = "/notice" )
//   public String notice(Model model) throws SQLException {
//      
//      logger.debug("��������");
//
//      noticeService.getList(model);
//      
//      return "notice/notice";
//   }

	@RequestMapping(value = "/notice")
	// defaultValue = "1" -> �⺻ �� �Ҵ� : ������������ 1�� �ʱ�ȭ
	public ModelAndView notice(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws SQLException {
		String sub = "";

		// ���ڵ��� ���� ���
		int count = noticeService.countArticle(searchOption, keyword);

		// ������ ������
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println(start);
		int end = boardPager.getPageEnd();

		List<NoticeVo> list = noticeService.selectAll(start, end, searchOption, keyword);

		// �����͸� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // ���ڵ��� ����
		map.put("searchOption", searchOption); // �˻� �ɼ�
		map.put("keyword", keyword); // �˻� Ű����
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // �ʿ� ����� �����͸� mav�� ����
		mav.setViewName("notice/notice"); // �並 notice.jsp�� ����
		

		return mav; // notice.jsp�� List ���޵ȴ�

	}

	@RequestMapping(value = "/notice/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute NoticeVo bean, HttpSession session) throws SQLException {

		// session�� ����� id�� noti_writer_id �� ����
		String noti_writer_id = (String) session.getAttribute("id");

		String newName = null;

		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // ���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�
			
			bean.setNoti_file_path1(origin); 	// �����н�1�� ���� ���ϸ� �־��ֱ�
			bean.setNoti_file_path2(newName);	// �����н�2�� �ߺ����� ���ϸ� �־��ֱ�
			
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

		// bean�� writer ����
		bean.setNoti_writer_id(noti_writer_id);
		noticeService.add(bean);

		return "redirect:/notice";
	}

	/******************************
	 * # ajax ����� ���ε� ó��
	 *********************************/

	// 4. Ajax���ε� ������ ����
	@RequestMapping(value = "/notice/upload", method = RequestMethod.GET)
	public void upload() {
		// uploadAjax.jsp�� ������
	}

	// 5. Ajax���ε� ó�� ����
	// ������ �ѱ�ó�� : produces="text/plain;charset=utf-8"
	@ResponseBody // view�� �ƴ� data����
	@RequestMapping(value = "/notice/upload", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	public ResponseEntity<String> upload(MultipartFile file) throws Exception {
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : " + file.getSize());
		logger.info("contentType : " + file.getContentType());
		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}

//   // 6. �̹��� ǥ�� ����
	@ResponseBody // view�� �ƴ� data����
	@RequestMapping(value = "/notice/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		// ������ ������ �ٿ�ε��ϱ� ���� ��Ʈ��
		InputStream in = null; // java.io
		ResponseEntity<byte[]> entity = null;
		try {
			// Ȯ���ڸ� �����Ͽ� formatName�� ����
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			// ������ Ȯ���ڸ� MediaUtilsŬ�������� �̹������Ͽ��θ� �˻��ϰ� ���Ϲ޾� mType�� ����
			MediaType mType = MediaUtils.getMediaType(formatName);
			// ��� ���� ��ü(�ܺο��� �����͸� �ְ���� ������ header�� body�� �����ؾ��ϱ� ������)
			HttpHeaders headers = new HttpHeaders();
			// InputStream ����
			in = new FileInputStream(uploadPath + fileName);
			// �̹��� �����̸�
			if (mType != null) {
				headers.setContentType(mType);
				// �̹����� �ƴϸ�
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				// �ٿ�ε�� ����Ʈ Ÿ��
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				//
				// ����Ʈ�迭�� ��Ʈ������ : new String(fileName.getBytes("utf-8"),"iso-8859-1") *
				// iso-8859-1 ���������, ū ����ǥ ���ο� " \" ���� \" "
				// ������ �ѱ� ���� ����
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("utf-8"), "iso-8859-1") + "\"");
				// headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
			}
			// ����Ʈ�迭, ���, HTTP�����ڵ�
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			// HTTP���� �ڵ�()
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close(); // ��Ʈ�� �ݱ�
		}
		return entity;
	}

//   
//   // 7. ���� ���� ����
//	@ResponseBody // view�� �ƴ� ������ ����
//	@RequestMapping(value = "/notice/upload/deleteFile", method = RequestMethod.POST)
//	public ResponseEntity<String> deleteFile(String fileName) throws Exception {
//		// ������ Ȯ���� ����
//		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
//		// �̹��� ���� ���� �˻�
//		MediaType mType = MediaUtils.getMediaType(formatName);
//		// �̹����� ���(����� + �������� ����), �̹����� �ƴϸ� �������ϸ� ����
//		// �̹��� �����̸�
//		if (mType != null) {
//			// ����� �̹��� ���� ����
//			String front = fileName.substring(0, 12);
//			String end = fileName.substring(14);
//			// ����� �̹��� ����
//			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
//		}
//		// ���� ���� ����
//		new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
//
//		// �����Ϳ� http ���� �ڵ� ����
//		return new ResponseEntity<String>("deleted", HttpStatus.OK);
//	}
	
	
	// 7. ���� ���� ����
		@ResponseBody // view�� �ƴ� ������ ����
		@RequestMapping(value = "/notice/upload/deleteFile", method = RequestMethod.POST)
		public ResponseEntity<String> deleteFile(@RequestParam("newName") String fileName,@RequestParam("idx") int idx) throws Exception {
			System.out.println("������?"+fileName);
			// ���� ���� ����
			new File(uploadDir + fileName).delete();

			noticeService.fileDelete(idx);
			// �����Ϳ� http ���� �ڵ� ����
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

	/******************************
	 * # ajax ����� ���ε� ó�� ��
	 *********************************/

	@RequestMapping("notice/download/{filename:.+}/{origin:.+}")
	public void download(@PathVariable String origin, HttpServletResponse resp, @PathVariable String filename) {
		System.out.println("����");
		logger.debug("down:" + filename);
		logger.debug("down:" + origin);
		// target="_blank"
		// ������ �������� ���� ó������ ���ϵ��� �𸣴� �������� ����
		 resp.setContentType("application/octet-stream;charset=\"utf-8\"");
		//

		// ������ �������� �̸����� ��������
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

	// �Խñ� �󼼺���
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
		
		System.out.println("���ε� ������"+bean.getUpload_files());
		
		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // ���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			bean.setNoti_file_path1(origin); 	// �����н�1�� ���� ���ϸ� �־��ֱ�
			bean.setNoti_file_path2(newName);	// �����н�2�� �ߺ����� ���ϸ� �־��ֱ�
			
			
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
	// defaultValue = "1" -> �⺻ �� �Ҵ� : ������������ 1�� �ʱ�ȭ
	public ModelAndView event(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws SQLException {

		// ���ڵ��� ���� ���
		int count = noticeService.eventCountArticle(searchOption, keyword);

		// ������ ������
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println(start);
		int end = boardPager.getPageEnd();

		List<EventVo> list = noticeService.eventSelectAll(start, end, searchOption, keyword);

		// �����͸� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // ���ڵ��� ����
		map.put("searchOption", searchOption); // �˻� �ɼ�
		map.put("keyword", keyword); // �˻� Ű����
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // �ʿ� ����� �����͸� mav�� ����
		mav.setViewName("notice/event"); // �並 event.jsp�� ����

		return mav; // event.jsp�� List ���޵ȴ�

	}

	@RequestMapping(value = "/event/add", method = RequestMethod.POST)
	public String eventAdd(Model model,@ModelAttribute EventVo bean, HttpSession session) throws SQLException {

		// session�� ����� id�� event_writer_id �� ����
		String event_writer_id = (String) session.getAttribute("id");
		
		String newName = null;
		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // ���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�

			bean.setEvent_file_path1(origin); // �����н�1�� ���ϸ� �־��ֱ�
			bean.setEvent_file_path2(newName); // �����н�2�� ���ϸ� �־��ֱ�

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
		System.out.println("����");
		logger.debug("down:" + filename);
		logger.debug("down:" + origin);
		// target="_blank"
		// ������ �������� ���� ó������ ���ϵ��� �𸣴� �������� ����
		 resp.setContentType("application/octet-stream;charset=\"utf-8\"");
		//

		// ������ �������� �̸����� ��������
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
	
	// 7. ���� ���� ����
			@ResponseBody // view�� �ƴ� ������ ����
			@RequestMapping(value = "/event/upload/deleteFile", method = RequestMethod.POST)
			public ResponseEntity<String> eventDeleteFile(@RequestParam("newName") String fileName,@RequestParam("idx") int idx) throws Exception {
				System.out.println("�̺�Ʈ ���ϻ���:"+fileName);
				// ���� ���� ����
				new File(uploadDir + fileName).delete();

				noticeService.eventFileDelete(idx);
				// �����Ϳ� http ���� �ڵ� ����
				return new ResponseEntity<String>("deleted", HttpStatus.OK);
			}

	// �Խñ� �󼼺���
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
			newName = time + origin; // ���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�

			bean.setEvent_file_path1(origin); // �����н�1�� ���ϸ� �־��ֱ�
			bean.setEvent_file_path2(newName); // �����н�1�� ���ϸ� �־��ֱ�

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

		// �̺�Ʈ �� ���� �� �� ��� ���� ���� �ϱ�
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

	///////// ��� ��Ͻ�

	@RequestMapping(value = "/event/reply", method = RequestMethod.POST)
	public String eventReplyAdd(@ModelAttribute EventVo bean, HttpSession session) throws SQLException {
		// session�� ����� id�� event_writer_id �� ����
		String event_writer_id = (String) session.getAttribute("id");
		String newName = null;

		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // ���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�

			bean.setEvent_file_path1(origin); // �����н�1�� ���ϸ� �־��ֱ�
			bean.setEvent_file_path2(newName); // �����н�2�� ���ϸ� �־��ֱ�

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
		noticeService.eventUpdateGroupOrd(bean); // ��� �߰� ���� �̰� ���� ���� �ž���
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
			System.out.println("��� " + result);
		} catch (Exception e) {

		}
		return result;
	}

// ������Ʈ---------------------------------------------------------

	@RequestMapping(value = "/update")
	// defaultValue = "1" -> �⺻ �� �Ҵ� : ������������ 1�� �ʱ�ȭ
	public ModelAndView update(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage)
			throws SQLException {
		String sub = "";

		// ���ڵ��� ���� ���
		int count = noticeService.updateCountArticle(searchOption, keyword);

		// ������ ������
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		System.out.println(start);
		int end = boardPager.getPageEnd();

		List<UpdateVo> list = noticeService.updateSelectAll(start, end, searchOption, keyword);

		// �����͸� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // ���ڵ��� ����
		map.put("searchOption", searchOption); // �˻� �ɼ�
		map.put("keyword", keyword); // �˻� Ű����
		map.put("boardPager", boardPager);

		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map); // �ʿ� ����� �����͸� mav�� ����
		mav.setViewName("notice/update"); // �並 update.jsp�� ����

		return mav; // update.jsp�� List ���޵ȴ�

	}

	@RequestMapping(value = "/update/add", method = RequestMethod.POST)
	public String add(Model model, @ModelAttribute UpdateVo bean, HttpSession session) throws SQLException {

		// session�� ����� id�� noti_writer_id �� ����
		String update_writer_id = (String) session.getAttribute("id");

		String newName = null;

		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // ���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�
			
			bean.setUpdate_file_path1(origin); 	// �����н�1�� ���� ���ϸ� �־��ֱ�
			bean.setUpdate_file_path2(newName);	// �����н�2�� �ߺ����� ���ϸ� �־��ֱ�
			
			
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

		// bean�� writer ����
		bean.setUpdate_writer_id(update_writer_id);
		noticeService.updateAdd(bean);

		return "redirect:/update";
	}
	
	// 7. ���� ���� ����
		@ResponseBody // view�� �ƴ� ������ ����
		@RequestMapping(value = "/update/upload/deleteFile", method = RequestMethod.POST)
		public ResponseEntity<String> updateDeleteFile(@RequestParam("newName") String fileName,@RequestParam("idx") int idx) throws Exception {
			System.out.println("������?"+fileName);
			// ���� ���� ����
			new File(uploadDir + fileName).delete();

			noticeService.updateFileDelete(idx);
			// �����Ϳ� http ���� �ڵ� ����
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}

	@RequestMapping("update/download/{filename:.+}/{origin:.+}")
	public void updateDownload(@PathVariable String origin, HttpServletResponse resp, @PathVariable String filename) {
		System.out.println("����");
		logger.debug("down:" + filename);
		logger.debug("down:" + origin);
		// target="_blank"
		// ������ �������� ���� ó������ ���ϵ��� �𸣴� �������� ����
		 resp.setContentType("application/octet-stream;charset=\"utf-8\"");
		//

		// ������ �������� �̸����� ��������
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

	// �Խñ� �󼼺���
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
		
	//	System.out.println("���ε� ������"+bean.getUpload_files());
		
		for (MultipartFile file1 : bean.getUpload_files()) {
			if (file1 == null || file1.isEmpty())
				continue;
			logger.debug(file1.getOriginalFilename());

			long time = System.currentTimeMillis();
			String origin = file1.getOriginalFilename();
			newName = time + origin; // ���ϸ� �ߺ� ���� ���� ���ϸ� = �̸�+�ð�
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			
			bean.setUpdate_file_path1(origin); 	// �����н�1�� ���� ���ϸ� �־��ֱ�
			bean.setUpdate_file_path2(newName);	// �����н�2�� �ߺ����� ���ϸ� �־��ֱ�
			
			
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
	// defaultValue = "1" -> �⺻ �� �Ҵ� : ������������ 1�� �ʱ�ȭ
	public String howtouse(@RequestParam(defaultValue = "all") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "1") int curPage) throws SQLException {
		

		return "notice/howtouse";// howtouse.jsp�� List ���޵ȴ�

	}

}