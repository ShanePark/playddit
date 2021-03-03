package login.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import web.IAction;

public class Login implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String profile = (String)session.getAttribute("profile");
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(profile);
		
		return null;
	
	}

}


