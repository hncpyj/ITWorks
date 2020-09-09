package com.kh.itworks.fileBox.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kh.itworks.common.CommonUtils;
import com.kh.itworks.fileBox.Pagination;
import com.kh.itworks.fileBox.model.service.FileBoxService;
import com.kh.itworks.fileBox.model.service.StorageService;
import com.kh.itworks.fileBox.model.vo.FileBox;
import com.kh.itworks.fileBox.model.vo.PageInfo;
import com.kh.itworks.fileBox.model.vo.Storage;
import com.kh.itworks.member.model.vo.Member;

@Controller
public class FileBoxController {
	
	@Autowired
	private FileBoxService fbs;
	@Autowired
	private StorageService stgs;
	
//    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping("selectFirst.fb")
	public String showFileBox(Model model, FileBox fb, HttpServletRequest request) {
		System.out.println("controller 넘어오니..?");
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = fbs.getListCount();
			System.out.println("controller : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			System.out.println("controller : " + pi);
			
			ArrayList<FileBox> list = fbs.selectFileList(pi);
			System.out.println("controller : " + list);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
			return "fileBox/fileBox";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
	}
	
	@RequestMapping("selectOne.fb")
	public String FileBoxDetail() {
		
		
		return "fileBox/fileDetail";
	}
	
	@RequestMapping("admin.fb")
	public String FileBoxAdmin(Model model, Storage stg, HttpServletRequest request) {
		System.out.println("admin controller 넘어오니..?");
		try {
			int stgSize = stgs.getStgSize();
			System.out.println("controller getStorageSize : " + stgSize);
			
			
			ArrayList<Storage> list = stgs.selectFolderList();
			System.out.println("controller : " + list);
			request.setAttribute("list", list);
			
			return "fileBox/fileBoxAdmin";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
//		return "fileBox/fileBoxAdmin";
	}
	
	@RequestMapping("uploadPage.fb")
	public String FileUploadPage() {
		
		return "fileBox/fileUpload";
	}
	
	@RequestMapping("error.fb")
	public String errorPage() {
		
		return "common/error";
	}
	
	@RequestMapping("delete.fb")
	public String FileDelete(Model model, FileBox fb, HttpServletRequest request, String fileNo, @SessionAttribute("loginUser") Member loginUser) {
		System.out.println("controller delete fileNo : " + fileNo);
		fb.setFileNo(fileNo);
		int fileDelete = fbs.fileDelete(fileNo);
		System.out.println("controller fileDelete : " + fileDelete);
		
		return "redirect:select.fb";
	}
	
	@RequestMapping("upload.fb")
	public String FileUpload(Model model
							, MultipartFile[] files
							, MultipartHttpServletRequest request
//							, HttpServletResponse response
							, @SessionAttribute("loginUser") Member loginUser) {
		
		ArrayList<FileBox> fileArr = new ArrayList<FileBox>();
		FileBox fb = null;
		
		System.out.println("controller model : " + model);
		System.out.println("controller fb : " + fb);
		System.out.println("controller file : " + files);
		
		if(!files[0].isEmpty()) {
			//저장할 경로 지정(톰캣이 가지고 있는 webapp 폴더 밑 resources 폴더의 절대경로를 가져와라). 톰캣에서 관리하는 폴더는 하위폴더를 구분할 때 역슬러쉬(\)를 사용한다.
			String root = request.getSession().getServletContext().getRealPath("resources");
			
			System.out.println("root : " + root);
					
			//이스케이프 문자 주의할 것
			String filePath = root + "/uploadFiles/fileBox";
			filePath = filePath.replace("/", "\\");
			System.out.println("filePath : " + filePath);
					
			for(int i = 0; i < files.length; i++) {
				fb = new FileBox();
				
				//원본 이름 저장
				String originFileName = files[i].getOriginalFilename();
				//확장자 따로 저장
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				//이름 바꾸기
				String changeName = CommonUtils.getRandomString();
				//파일 사이즈
				Long size = files[i].getSize();
				System.out.println("fileuploud controller originFileName : " + originFileName);
				System.out.println("fileuploud controller ext : " + ext);
				System.out.println("fileuploud controller changeName : " + changeName);
				System.out.println("fileuploud controller size : " + size);
				
				
				fb.setOriginName(originFileName);
				fb.setChangeName(changeName);
				fb.setFilePath(filePath);
				fb.setFileSize(size);
				fb.setFileRole("999");
//				fb.setFileType("STG");
				fb.setCorp_no(loginUser.getCorpNo());
				fb.setFileType("fileBox");
				fb.setExt(ext);
				
				System.out.println(fb);
				fileArr.add(fb);
				try {
					files[i].transferTo(new File(filePath + "/" + changeName + ext));
					
					
					System.out.println("fb : " + fb);
//					fbs.uploadFile(fb, loginUser);
//					return "fileBox/fileDetail";
				} catch (IllegalStateException|IOException e) {
					new File(filePath + "/" + changeName + ext).delete();
//					model.addAttribute("msg", "파일 업로드 실패");
//					return "common/error";
				}
			}
		
		int uploadFile = fbs.uploadFile(fileArr, loginUser);
		}
		return "fileBox/fileDetail";
	}
	
	
	
	@RequestMapping("download.fb")
	public void FileDownload(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		String fileNo = request.getParameter("fileNo");
		
		HashMap<String, Object> file = fbs.selectOneFile(fileNo);
		
		//폴더에서 파일을 읽어들일 때 사용할 스트림 생성
		BufferedInputStream buf = null;
				
		//클라이언트로 내보낼 출력스트림 생성
		ServletOutputStream downOut = null;
				
		downOut = response.getOutputStream();
		
		Object filePath = file.get("FILE_PATH");
		
		
		filePath = ((String) filePath).replace("\\", "/");
		
		System.out.println("controller downFile path : " + filePath);
		//스트림으로 전송할 파일 객체 생성
		File downFile = new File((String) filePath + "//" + file.get("CHANGE_NAME") + file.get("EXT"));
		
		
		
		
		
		response.setContentType("text/plane; charset=UTF-8");
		
		//한글파일명에 대한 인코딩 처리
		//강제적으로 다운로드 처리(버튼 누르면 바로 다운로드 진행하는 기능, 크롬은 강제다운로드만 진행함)
		response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(((String) file.get("ORIGIN_NAME")).getBytes("UTF-8"), "ISO-8859-1") + "\"");
		//attachment : 강제다운로드방식
				
		response.setContentLength((int)downFile.length());
				
		FileInputStream fin = new FileInputStream(downFile);
				
		buf = new BufferedInputStream(fin);
				
		int readBytes = 0;
				
		while((readBytes = buf.read()) != -1) {
			downOut.write(readBytes);
		}
			
		downOut.close();
		buf.close();
		
	}
	
}
