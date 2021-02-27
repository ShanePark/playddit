package message.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import alarm.service.AlarmServiceImpl;
import alarm.service.IAlarmService;
import login.vo.ProfileVO;
import message.service.IMessageService;
import message.service.MessageServiceImpl;
import web.IAction;

public class SendMessage implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		String sender = profile.getUser_id();
		String nickname = profile.getUser_nickname();
		
		String receiver = request.getParameter("receiver");
		String content = request.getParameter("content");
		
		IMessageService service = MessageServiceImpl.getService();
		IAlarmService alarmService = AlarmServiceImpl.getService();
		
		service.insertMessage(sender, receiver, content);
		// 알람 서비스에서 기존 해당하는 알람 삭제하기 + 새로운 알람 보내는 서비스 실행 
		// 새로운 메시지를 보냈다는 알람 타입 넘버는 12 입니다.
		alarmService.renewAlarm(receiver, nickname, 12);
		
		return null;
	
	}

}


