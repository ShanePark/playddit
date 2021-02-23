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
		
		String user_id = request.getParameter("user_id");
		String user_nickname = request.getParameter("user_nickname");
		String user_password = request.getParameter("user_password");
		String user_name = request.getParameter("user_name");
		String user_tel = request.getParameter("user_tel");
		String user_birth = request.getParameter("user_birth");
		String user_class = request.getParameter("user_class");
		int user_rating = Integer.parseInt(request.getParameter("user_rating"));
		int user_theme = Integer.parseInt(request.getParameter("user_theme"));
		
		UsersVO vo = new UsersVO();
		vo.setUser_id(user_id);
		vo.setUser_nickname(user_nickname);
		vo.setUser_password(user_password);
		vo.setUser_name(user_name);
		vo.setUser_tel(user_tel);
		vo.setUser_birth(user_birth);
		vo.setUser_class(user_class);
		vo.setUser_rating(user_rating);
		vo.setUser_theme(user_theme);
		
		IUsersService service = UsersServiceImpl.getService();
		
		service.insertUser(vo);
		
		return "/users/insertUser.jsp";
		
	}

}
