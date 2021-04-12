package users.main;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import login.service.ILoginService;
import login.service.LoginServiceImpl;
import login.vo.ProfileVO;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.UsersVO;
import util.CryptoUtil;
import web.IAction;

public class Match implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		String encryptedPass = CryptoUtil.encryptPass(id, pw);
		
		IUsersService service = UsersServiceImpl.getService();

		UsersVO vo = service.match(id, encryptedPass);
		
		if(vo != null) {	// 로그인 성공한경우 세선에 접속정보 저장합니다.
			ILoginService loginService = LoginServiceImpl.getService();
			ProfileVO profile = loginService.loadProfile(id);
			
			HttpSession session = request.getSession();
			String profileJson = new Gson().toJson(profile);
			session.setAttribute("profile", profileJson);
			
		}

		request.setAttribute("match", vo);
		return "/users/match.jsp";
	
	}

}


