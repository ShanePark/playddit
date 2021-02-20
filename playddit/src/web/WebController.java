package web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*
		 * 	URL ==> http:/서버이름 또는 ip주소:포트번호/컨텍스트이름/폴더명/문서명
		 * 	    ==> http://localhost:80/servletTest/member/memberList.do
		 * 
		 * 	URI ==> /servletTest/member/memberList.ddit
		 * 
		 * 	ContextPath ==> /servleTest
		 * 
		 * 	원하는 요청 URI ==> /member/memberList.ddit
		 */

		// 	1. 사용자의 요청 정보 가져오기
		String uri = req.getRequestURI(); // 전체 요청 URI  	
		
		// 원하는 요청 URI
		uri = uri.substring(req.getContextPath().length());	
		
		String viewPage = null;
		IAction action = null;
		
		action = URIActionMapper.getAction(uri);
		if(action == null) {	// 실행할 URI가 없으면 404 에러처리
			resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
		}else {
			//	실행 부분 ==> 작업 처리 후 view 페이지를 받는다.
			viewPage = action.process(req, resp);
			
			if(viewPage != null) {
				if(action.isRedirect()) {
					resp.sendRedirect(req.getContextPath()+viewPage);
				}else {
					RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/view"+viewPage);
					rd.forward(req, resp);
				}
			}
		}
		
		
	}
}
