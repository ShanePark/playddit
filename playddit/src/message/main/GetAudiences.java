package message.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import login.vo.ProfileVO;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import message.vo.AudienceVO;
import web.IAction;

public class GetAudiences implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 1. 세션에서 프로필 정보 받아와서 유저 아이디 변수에 저장하기.
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		String user_id = profile.getUser_id();
		
		// 2. 해당 유저 아이디 기준으로 서비스에서 대화주고받은 사람들 목록 받아오기 
		IMessageService service = MessageServiceImpl.getService();
		List<AudienceVO> list = service.getAudiences(user_id);
		String listJson = new Gson().toJson(list);
		
		// 3. 해당 유저들의 AudienceVO가 담긴 List를 json 형태로 ajax에 보낸다.
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(listJson);
		
		return null;
		
	}

}
