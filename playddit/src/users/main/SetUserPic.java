package users.main;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;

import login.vo.ProfileVO;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import util.FileUtil;
import web.IAction;

public class SetUserPic implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사진을 저장할 경로는 FileUtil에서 처리한다. 배포 전까지는 강제로 경로를 잡아줄 예정.
		final String DIR = FileUtil.getProfilePath();
		
		final int LIMIT_SIZE_BYTES = 2 * 1024 * 1024;
		final String CHARSET = "utf-8";
		
		File attachDir = new File(DIR);
		
		// 세션을 받아온다. 유저 아이디를 사용할 것이며, user_pic 정보를 업데이트 해야한다.
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(attachDir);
		fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		String user_id = profile.getUser_id();
		
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
	                	// 2. 유저 이름 + 확장자로 이름을 변경한다.
	                	File uploadFile = new File(DIR +  separator + user_id + ext);
	                	
	                	// 3. user_pic 컬럼 데이터를 user_id+ext 로 수정한다.
	                	IUsersService service = UsersServiceImpl.getService();
	                	service.setUserPic(user_id, user_id+ext);
	                	
	                	// 4. 세션의 user_pic 또한 수정해준 뒤, 세션을 새로 업데이트 한다.
	                	profile.setUser_pic(user_id+ext);
	                	profileJson = new Gson().toJson(profile);
	                	session.setAttribute("profile", profileJson);
	                	
	                	// 5. 이름을 변경한 파일을 지정된 폴더에 업로드 한다.
	                	item.write(uploadFile);
	                }
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/playddit/tests/profileEditTest.html");
		
		return null;
	
	}

}


