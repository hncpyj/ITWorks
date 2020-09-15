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
import com.kh.itworks.common.PageInfo;
import com.kh.itworks.common.Pagination;
import com.kh.itworks.fileBox.model.service.FileBoxService;
import com.kh.itworks.fileBox.model.service.StorageService;
import com.kh.itworks.fileBox.model.vo.FileBox;

import com.kh.itworks.fileBox.model.vo.Storage;
import com.kh.itworks.member.model.vo.Member;

import net.sf.json.JSONArray;

@Controller
public class FileBoxController {
	
	@Autowired
	private FileBoxService fbs;
	
	@Autowired
	private StorageService stgs;
	
	
//    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping("selectFirst.fb")
	public String showFileBox(Model model, FileBox fb, HttpServletRequest request) {
		System.out.println("===================controller 넘어오니..?=============================");
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		String stgNo = null;
		if(request.getParameter("stgNo") != null) {
			stgNo = request.getParameter("stgNo");
		}
		
		
		
		try {
			int listCount = fbs.getListCount();
			System.out.println("controller : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			System.out.println("controller : " + pi);
			
			ArrayList<FileBox> list = fbs.selectFileList(pi);
			
			ArrayList<Storage> slist = stgs.selectFolderList();
			
			//list json으로 parsing하기위해 json배열 할당
		    JSONArray jsonArray = new JSONArray();
		    
		    //json으로 파싱해서 모델에 리스트랑 같이 보내줌
		    model.addAttribute("slist", slist); 
		    model.addAttribute("jsonList", jsonArray.fromObject(slist));
		    request.setAttribute("slist", slist);
			
			System.out.println("controller : " + list);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
			return "fileBox/fileBox";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
	}
	
	
	@RequestMapping("searchList.fb")
	public String showStorageFile(Model model, FileBox fb, HttpServletRequest request) {
		System.out.println("********************************search folder controller 넘어오니..?**************************************************");
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//각 폴더에 저장되어있는 파일들 불러오기 위해 폴더 번호 받아오기
		String stgNo = "00";
		if(request.getParameter("stgNo") != null) {
			stgNo = request.getParameter("stgNo");
		}
		System.out.println("*************************search search folder stgNo : " + stgNo);
		
		//검색 조건 받아오기
		String searchCondition = null;
		if(request.getParameter("searchSelect") != null) {
			searchCondition = request.getParameter("searchSelect");
		}
		//검색값 받아오기
		String searchValue = null;
		if(request.getParameter("searchText") != null) {
			searchValue = request.getParameter("searchText");
		}
		
		// 받아온 정보 객체에 담아주기
		fb.setStgNo(stgNo);
		System.out.println("***** search searchCondition : " + searchCondition);
		System.out.println("***** search searchValue : " + searchValue);
		if(searchCondition != null){
			if(searchCondition.equals("originName")) {
				fb.setOriginName(searchValue);
			} else if(searchCondition.equals("ext")){
				fb.setExt(searchValue);
			} else if(searchCondition.equals("uploadDate")) {
				fb.setUploadDate(searchValue);
			}
		}
		
		
		try {
			int listCount = fbs.getSearchListCount(fb);
			System.out.println("***search controller : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			System.out.println("***search controller : " + pi);
			
			ArrayList<FileBox> list = fbs.searchFileList(pi, fb);
			System.out.println("***search controller list: " + list);
			
			ArrayList<Storage> slist = stgs.selectSearchFolderList();
			System.out.println("***search slist : " + slist);
			
			//list json으로 parsing하기위해 json배열 할당
			JSONArray jsonArray = new JSONArray();
			
			//json으로 파싱해서 모델에 리스트랑 같이 보내줌
			model.addAttribute("list", list); 
			model.addAttribute("stgNo", stgNo); 
			model.addAttribute("jsonList", jsonArray.fromObject(slist));
			
			System.out.println("***search controller : " + list);
			request.setAttribute("slist", slist);
			request.setAttribute("pi", pi);
			
			return "fileBox/fileBox";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
	}
	
	@RequestMapping("selectTrash.fb")
	public String selectTrash(Model model, FileBox fb, HttpServletRequest request) {
		System.out.println("selectTrash controller 넘어오니..?");
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = fbs.getListCount();
			System.out.println("controller : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			System.out.println("controller : " + pi);
			
			ArrayList<FileBox> list = fbs.selectTrashList(pi);
			
			ArrayList<Storage> slist = stgs.selectFolderList();
			
			//list json으로 parsing하기위해 json배열 할당
		    JSONArray jsonArray = new JSONArray();
		    
		    //json으로 파싱해서 모델에 리스트랑 같이 보내줌
		    model.addAttribute("slist", slist); 
		    model.addAttribute("jsonList", jsonArray.fromObject(slist));
		    request.setAttribute("slist", slist);
			
			System.out.println("controller : " + list);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
			return "fileBox/fileTrash";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
	}
	
	
	@RequestMapping("selectAdminTrash.fb")
	public String selectAdminTrash(Model model, FileBox fb, HttpServletRequest request) {
		System.out.println("selectTrash controller 넘어오니..?");
		int currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		try {
			int listCount = fbs.getListCount();
			System.out.println("controller : " + listCount);
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			System.out.println("controller : " + pi);
			
			ArrayList<FileBox> list = fbs.selectTrashList(pi);
			
			ArrayList<Storage> slist = stgs.selectFolderList();
			
			//list json으로 parsing하기위해 json배열 할당
			JSONArray jsonArray = new JSONArray();
			
			//json으로 파싱해서 모델에 리스트랑 같이 보내줌
			model.addAttribute("slist", slist); 
			model.addAttribute("jsonList", jsonArray.fromObject(slist));
			request.setAttribute("slist", slist);
			
			System.out.println("controller : " + list);
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			
			return "fileBox/adminTrash";
			
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
			
			return "common/error";
		}
	}
	
	@RequestMapping("selectOne.fb")
	public String FileBoxDetail() {
		
		
		return "fileBox/fileDetail";
	}
	
	@RequestMapping("referer.fb")
	public String Referer(Model model, FileBox fb, HttpServletRequest request) {
		
		return "redirect:selectFirst.fb";
	}
	
	
	
	@RequestMapping("uploadPage.fb")
	public String FileUploadPage(Model model, FileBox fb, HttpServletRequest request) {
		String fileType = request.getParameter("fileType");
		System.out.println("fileType : " + fileType);
		fileType = "STG";
		fb.setFileType(fileType);

		ArrayList<Storage> slist = stgs.selectFolderList();
		
		//list json으로 parsing하기위해 json배열 할당
	    JSONArray jsonArray = new JSONArray();
	    
	    //json으로 파싱해서 모델에 리스트랑 같이 보내줌
	    model.addAttribute("slist", slist); 
	    model.addAttribute("jsonList", jsonArray.fromObject(slist));
	    request.setAttribute("slist", slist);
		
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
		int fileDelete = fbs.fileDelete(fb);
		System.out.println("controller fileDelete : " + fileDelete);
//		return "fileBox/fileBox";
		return showStorageFile(model, fb, request);
	}
	
	@RequestMapping("restore.fb")
	public String FileRestore(Model model, FileBox fb, HttpServletRequest request, String fileNo, @SessionAttribute("loginUser") Member loginUser) {
		System.out.println("controller restore fileNo : " + fileNo);
		fb.setFileNo(fileNo);
		int fileRestore = fbs.fileRestore(fb);
		System.out.println("controller restore : " + fileRestore);
//		return "fileBox/fileBox";
		return selectTrash(model, fb, request);
	}
	
	@RequestMapping("deleteForever.fb")
	public String fileDeleteForever(Model model, FileBox fb, HttpServletRequest request, String fileNo, @SessionAttribute("loginUser") Member loginUser) {
		System.out.println("controller restore fileNo : " + fileNo);
		fb.setFileNo(fileNo);
		int fileDeleteForever = fbs.fileDeleteForever(fb);
		System.out.println("controller fileDeleteForever : " + fileDeleteForever);
//		return "fileBox/fileBox";
		return selectAdminTrash(model, fb, request);
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
				fb.setMno(loginUser.getMno());
				
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
		return showStorageFile(model, fb, request);
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
