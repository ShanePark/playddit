package alarm.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import alarm.service.AlarmServiceImpl;
import alarm.service.IAlarmService;
import alarm.vo.AlarmVO;
import login.vo.ProfileVO;
import web.IAction;

public class GetAlarm implements IAction {

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
		String user = profile.getUser_id();
		
		// 3. 해당 변수들을 parameter로 service에 넘겨서 알람 리스트를 받아온다.
		IAlarmService service = AlarmServiceImpl.getService();
		List<AlarmVO> list = service.getAlarm(user);
		String listJson = new Gson().toJson(list);
		
		// 4. 해당 리스트를 ajax 로 보낸다.
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(listJson);
		
		return null;
	
	}

}


