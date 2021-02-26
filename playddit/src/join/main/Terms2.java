package join.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import join.service.IJoinservice;
import join.service.JoinServiceImpl;
import join.vo.TermsVO;
import web.IAction;

public class Terms2 implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		IJoinservice service = JoinServiceImpl.getService();
		
		List<TermsVO> list = service.showTerm2();
		
		request.setAttribute("terms2", list);
		
		return "/join/Terms2.jsp";
	}

}
