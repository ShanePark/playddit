package users.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import alarm.service.AlarmServiceImpl;
import alarm.service.IAlarmService;
import login.vo.ProfileVO;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import web.IAction;

public class FollowUser implements IAction {
	

	@Override
	public boolean isRedirect() {
		return false;
	}


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1. 세션에서 접속 정보 받아오기
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		String id = profile.getUser_id();
		String nickname = profile.getUser_nickname();
		
		String targetId = request.getParameter("targetId");
		// 2. 팔로우 데이터 insert 
		IUsersService service = UsersServiceImpl.getService();
		service.followUser(id, targetId);
		
		// 알람 서비스에서 기존 해당하는 알람 삭제하기 + 새로운 알람 보내는 서비스 실행 
		// 팔로우 한다는 알람 타입 넘버는 11 입니다.
		IAlarmService alarmService = AlarmServiceImpl.getService();
		alarmService.renewAlarm(targetId, nickname, 11);
		
		// 3. 세션에 팔로잉 넘버 정보를 + 1 해서 새로 저장한다.
		profile.setFollowing(profile.getFollowing() + 1 );
		profileJson = new Gson().toJson(profile);
		session.setAttribute("profile", profileJson);
		
		// 4. 새로운 팔로잉 정보를 ajax로 보내준다.
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(String.valueOf(profile.getFollowing()));
		
		return null;
	}

}
