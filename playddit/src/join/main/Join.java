package join.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		HttpSession session = request.getSession();
		UsersVO vo = new UsersVO();
		
		vo = (UsersVO)session.getAttribute("insertVo");
		
		IJoinservice service = JoinServiceImpl.getService();
		
		UsersVO insert = service.insertUser(vo);
		
		request.setAttribute("insert", insert);
		
		return "/join/join.jsp";
	}

}
