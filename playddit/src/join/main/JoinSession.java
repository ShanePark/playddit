package join.main;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import join.service.IJoinservice;
import join.service.JoinServiceImpl;
import users.vo.UsersVO;
import web.IAction;

public class JoinSession implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 세션으로 저장하기
		HttpSession session = request.getSession();
		
		String mail = request.getParameter("mail");
		String nickname = request.getParameter("nickname");
		String pass = request.getParameter("pass");
		String name = request.getParameter("name");
		String tel = request.getParameter("phone");
		String birth = request.getParameter("birth");

		UsersVO insertVo = new UsersVO();
		insertVo.setUser_id(mail);
		insertVo.setUser_nickname(nickname);
		insertVo.setUser_password(pass);
		insertVo.setUser_name(name);
		insertVo.setUser_tel(tel);
		insertVo.setUser_birth(birth);

		session.setAttribute("insertVo", insertVo);
		
		return "/play.html";
		
	}

}
