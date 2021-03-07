package users.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import alarm.service.AlarmServiceImpl;
import alarm.service.IAlarmService;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import web.IAction;

public class ApproveClass implements IAction {
	

	@Override
	public boolean isRedirect() {
		return false;
	}


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String targetId = request.getParameter("targetId");
		String approve = request.getParameter("approve");
		
		IUsersService userService = UsersServiceImpl.getService();
		IAlarmService alarmService = AlarmServiceImpl.getService();
		
		if("true".equals(approve)) {// 승인일 경우에만 유저 등급 1로 변환
			userService.setUserRate(targetId,1);
		}
		
		// 관련 알람 모두 삭제
		alarmService.deleteAlarm(targetId, 10);
		
		return null;
	}

}
