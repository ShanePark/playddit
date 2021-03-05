package feed.main;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;

import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import login.vo.ProfileVO;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import util.FileUtil;
import web.IAction;

public class InsertFeed implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 세션에서 프로필 정보 받아와서 유저 아이디 저장.
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		String id = profile.getUser_id();
		
		// 2. feed 의 cont를 저장 
		String cont = request.getParameter("cont");
		
		
		// 3. service 생성 / 저장
		IFeedService service = FeedServiceImpl.getService();

    	int result = service.insertFeed(id, cont);
		
				
		// 2. 사진을 저장할 경로는 FileUtil에서 처리한다. 배포 전까지는 강제로 경로를 잡아줄 예정.
				final String DIR = FileUtil.getFeedPath();
				
				final int LIMIT_SIZE_BYTES = 10 * 1024 * 1024;
				final String CHARSET = "utf-8";
				
				File attachDir = new File(DIR);
		
				
		// 4. 사진 저장
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(attachDir);
		fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		try {
		List<FileItem> items = fileUpload.parseRequest(request);
		for(FileItem item : items) {
			if(item.isFormField()) {
				System.out.printf("파라미터 명 : %s, 파라미터 값 :  %s \n", item.getFieldName(), item.getString(CHARSET));
			}else {
				System.out.printf("파라미터 명 : %s, 파일 명 : %s,  파일 크기 : %s bytes \n", item.getFieldName(),
                            item.getName(), item.getSize());
                if (item.getSize() > 0) {
                	// 1. 첨부된 파일에 대한 정보를 잘 정리한다.
                	String separator = File.separator;
                	int index =  item.getName().lastIndexOf(separator);
                	String fileName = item.getName().substring(index  + 1);
                	String ext = fileName.substring(fileName.lastIndexOf("."));
                	// 2. 유저 이름 + count + 확장자로 이름을 변경한다.
                
                	
                	// 3. feedpic 컬럼 데이터를 user_id+ext 로 수정한다.
                                	
                	response.setContentType("text/html; charset=UTF-8");
            		response.getWriter().write(""+ result);	
                	              	
                	// 4. 이름을 변경한 파일을 지정된 폴더에 업로드 한다.
                	
                }
			}
		}
	}catch(Exception e) {
		e.printStackTrace();
	}
		
	
				
		return null;
	}

}
