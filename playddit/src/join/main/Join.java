package join.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import join.service.IJoinservice;
import join.service.JoinServiceImpl;
import users.vo.UsersVO;
import web.IAction;

public class Join implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		  // 세션 값 가져오기
		  HttpSession session = request.getSession(); 
		  
		  UsersVO vo = (UsersVO)session.getAttribute("insertVo");
		  String mail = vo.getUser_id();

		  // 쿠키 값 가져오기
		  String pick1 = request.getParameter("pick1");
		  String pick2 = request.getParameter("pick2");
		  String pick3 = request.getParameter("pick3");
		  
		  IJoinservice service = JoinServiceImpl.getService();
		  int insert = service.insertUser(vo);
		  
		  if("true".equals(pick1)) {
			  service.pickConInsert(4, mail);
		  }
		  
		  if("true".equals(pick2)) {
			  service.pickConInsert(5, mail);
		  }
		  if("true".equals(pick3)) {
			  service.pickConInsert(6, mail);
		  }
		  

		  
		  
		  String insertJson = new Gson().toJson(insert);
		  
		  // 해당 데이터를 ajax로 보낸다.
		  response.setContentType("text/html; charset=UTF-8");
		  response.getWriter().write(insertJson);
		
		  return null;
	}

}
