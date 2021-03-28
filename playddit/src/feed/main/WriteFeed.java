package feed.main;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

public class WriteFeed implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 사진을 저장할 경로는 FileUtil에서 처리한다. 배포 전까지는 강제로 경로를 잡아줄 예정.
		final String DIR = FileUtil.getFeedPath();
		final int LIMIT_SIZE_BYTES = 15 * 1024 * 1024;
		final String CHARSET = "utf-8";
		File attachDir = new File(DIR);
		
		// 세션을 받아온다. 유저 아이디를 사용할 것이다.
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		String user_id = profile.getUser_id();
		
		// feedService 얻어오기
		IFeedService service = FeedServiceImpl.getService();
		
		DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
		fileItemFactory.setRepository(attachDir);
		fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES);
		ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
		
		ArrayList<FileItem> pictureFiles = new ArrayList<>();
		String separator = File.separator;
		String ext = "";
		String feedcont = "";
		
		try {
			List<FileItem> items = fileUpload.parseRequest(request);
			for(FileItem item : items) {
				if(item.isFormField()) {
					if(("feedcont").equals(item.getFieldName())){
						feedcont = item.getString(CHARSET);
					}	
					//System.out.printf("파라미터 명 : %s, 파라미터 값 :  %s \n", item.getFieldName(), item.getString(CHARSET));
				}else {
					//System.out.printf("파라미터 명 : %s, 파일 명 : %s,  파일 크기 : %s bytes \n", item.getFieldName(), item.getName(), item.getSize());
	                if (item.getSize() > 0) {
	                	// 첨부된 파일에 대한 정보를 잘 정리한다.
	                	int index =  item.getName().lastIndexOf(separator);
	                	String fileName = item.getName().substring(index  + 1);
	                	ext = fileName.substring(fileName.lastIndexOf("."));
	                	
	                	pictureFiles.add(item);
	                	
	                }
				}
			}
			
			// 유저 아이디와 피드 글 내용만 업로드 하며, 업로드할 피드의 번호를 받아온다.
			int feed_no = service.insertFeed(user_id, feedcont);
			
			ArrayList<File> uploadFiles = new ArrayList<>();
			StringBuffer feedpic_names = new StringBuffer();
	    	// feed_cur_no + count + 확장자로 이름을 변경한다.
			final int SIZE = pictureFiles.size();
			for(int i=0; i<SIZE; i++) {
				String feedpic_name = feed_no + "_" + i + ext;
				if(i != 0) {
					feedpic_names.append(",");
				}
				feedpic_names.append(feedpic_name);
				uploadFiles.add(new File(DIR + separator + feedpic_name));
				
			}
			
	    	// feedpic 컬럼 데이터를 feedpic_names 로 수정한다.
	    	service.updateFeedPic(feedpic_names.toString(), feed_no);
	    	
	    	// 이름을 변경한 파일들을 지정된 폴더에 업로드 한다.
			for(int i=0; i<SIZE; i++) {
				pictureFiles.get(i).write(uploadFiles.get(i));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		response.sendRedirect("/playddit/feed.jsp");
		
		return null;
	
	}

}


