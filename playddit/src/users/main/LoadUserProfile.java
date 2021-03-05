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

public class LoadUserProfile implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("feed_id");
		
		ILoginService service = LoginServiceImpl.getService();

		ProfileVO profile = service.loadProfile(id);
		String profileJson = new Gson().toJson(profile);
		
		// 해당 profile(json으로 변경된 것)을 ajax 로 보낸다.
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(profileJson);
		
		return null;
	}

}


