package login.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import alarm.service.AlarmServiceImpl;
import alarm.service.IAlarmService;
import join.vo.ClassVO;
import login.vo.ProfileVO;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import web.IAction;

public class Play implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 입력된 학급 정보대로 학급 정보 변경 및 해당 학급 관리자에게 승인알람 보내기 위한 서블릿 입니다.
		
		String user_id = request.getParameter("user_id");
		String class_id = request.getParameter("class_id");
		String user_nickname = request.getParameter("user_nickname");
		
		// 필요한 Service들을 호출한다.
		IUsersService userService = UsersServiceImpl.getService();
		IAlarmService alarmService = AlarmServiceImpl.getService();
		
		// play 하는 유저의 학급 정보를 입력한 값으로 변경해준다.
		userService.setUserClass(user_id, class_id);
		
		// 해당 학급의 권한자들을 List<String> 으로 받아온다.
		List<String> RightHoldersList = userService.getRightHolders(class_id);
		
		// 해당 학급의 관리자들에게 승인 알람을 보낸다.
		for(String holder :RightHoldersList) {
			alarmService.sendNewAlarm(holder, user_nickname, 10, user_id);
		}
		
		return null;
	
	}

}


