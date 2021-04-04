package users.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import enumpkg.ServiceResult;
import login.vo.ProfileVO;
import users.service.AuthenticateServiceImpl;
import users.service.IAuthenticateService;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.UsersVO;
import util.CryptoUtil;
import web.IAction;

public class ChangePassword implements IAction {
	IUsersService service = UsersServiceImpl.getService();
	IAuthenticateService authService = AuthenticateServiceImpl.getService();

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String oldPass = request.getParameter("passCheck");
		String newPass = request.getParameter("newPass");
		
		// 세션에서 프로필 정보 받아와서 유저 아이디 변수에 저장하기.
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		String user_id = profile.getUser_id();
		
		// newPass 여부에 따라 비밀번호 확인인지 비밀번호 변경인지를 분기시킨다.
		if(newPass == null) {	// 비밀번호 일치 여부 확인
			
			String encryptedPass = CryptoUtil.encryptPass(user_id,oldPass);
			ServiceResult result = authService.authenticate(new UsersVO(user_id,encryptedPass));
			String answer = null;
			
			if(ServiceResult.OK.equals(result)) {
				answer = "OK";
			}else {
				answer = "FAIL";
			}
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write(answer);
			
		}else {
			// newPass로 비밀번호 변경하기
			String encryptedPass = CryptoUtil.encryptPass(user_id,newPass);
			int queryResult = service.setNewPass(user_id, encryptedPass);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write(String.valueOf(queryResult));
		}


		return null;
	}	

}
