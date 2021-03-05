package users.main;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import login.service.ILoginService;
import login.service.LoginServiceImpl;
import login.vo.ProfileVO;
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


