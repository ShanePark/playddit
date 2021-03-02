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

public class SendCode implements IAction {

	@Override
	public boolean isRedirect() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		UsersVO vo = null;
		
		UsersVO usersVo = (UsersVO)session.getAttribute("insertVo");
		
		// 세션 테스트
			System.out.println(usersVo);
			System.out.println(usersVo.getUser_id());
		// 세션 테스트 끝
		String mail = usersVo.getUser_id();
		
		
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
