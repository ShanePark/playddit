package join.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import join.service.IJoinservice;
import join.service.JoinServiceImpl;
import users.vo.UsersVO;
import web.IAction;

public class CodeCheck implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		// 세션에 저장된 mail값 가져오기
		UsersVO usersVo = (UsersVO)session.getAttribute("insertVo");
		
		/////////////////////////////////////
		//String mail = usersVo.getUser_id();
		String mail = "vhvhglgl@naver.com"; 	// 임시로 넣어둔 데이터입니다.
		/////////////////////////////////////
		
		IJoinservice service = JoinServiceImpl.getService();
		
		String code = service.codeCheck(mail);
	
		
		// 데이터를 ajax로 보낸다.
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(code);
		
		return null;
	}

}
