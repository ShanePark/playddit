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

public class TermsCon implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		IJoinservice service = JoinServiceImpl.getService();
		
		TermsVO vo = service.termsCon(no);

		request.setAttribute("termsCon", vo);
		
		return "/join/TermsCon.jsp";
	}

}
