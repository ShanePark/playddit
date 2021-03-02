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
import util.EmailUtil;
import web.IAction;

public class JoinSessionAdd implements IAction{

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
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
		
		// 인증 코드 생성 & 발송
		String code = "";
		for(int i = 0; i <10; i++) {
			char randomChar = (char)(int)(Math.random() * 26 + 65 );
			code += randomChar;
		}
		
		String title = "PLAYDDIT 가입을 위한 인증코드 안내";
		String content = "인증코드를 안내해 드립니다. 괄호 안의 값만 입력해주세요. [" + code + "]";
		EmailUtil.sendEmail(mail, title, content);
		
		
		// db에 인증코드 insert
		IJoinservice service = JoinServiceImpl.getService();
		int result = service.insertCode(code, mail);
		String resultJson = new Gson().toJson(result);
		
		// 해당 데이터를 ajax로 보낸다.
		response.setContentType("text/html; charset=UTF-8"); 
		response.getWriter().write(resultJson);
		return null;
		
	}

}
