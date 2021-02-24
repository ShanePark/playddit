package users.main;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.UsersVO;
import web.IAction;

public class Join implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("mail");
		String user_nickname = request.getParameter("nickname");
		String user_password = request.getParameter("pass");
		String user_name = request.getParameter("name");
		String user_tel = request.getParameter("phone");
		String user_birth = request.getParameter("birth");
	

		UsersVO vo = new UsersVO();
		vo.setUser_id(user_id);
		vo.setUser_nickname(user_nickname);
		vo.setUser_password(user_password);
		vo.setUser_name(user_name);
		vo.setUser_tel(user_tel);
		vo.setUser_birth(user_birth);


		
		IUsersService service = UsersServiceImpl.getService();
		
		UsersVO insert = service.insertUser(vo);
		
		request.setAttribute("insert", insert);
		
		
		return "/users/insertUser.jsp";
		
	}

}
