package util;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import web.IAction;

public class FileUpload implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		final String DIR = FileUtil.getProfilePath();
		
		final int LIMIT_SIZE_BYTES = 2 * 1024 * 1024;
		final String CHARSET = "utf-8";
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		File attachDir = new File(DIR);
		
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
	                	String separator = File.separator;
	                	int index =  item.getName().lastIndexOf(separator);
	                	String fileName = item.getName().substring(index  + 1);
	                	File uploadFile = new File(DIR +  separator + fileName);
	                	item.write(uploadFile);
	                }
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return null;
	
	}

}


