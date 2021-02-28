package users.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import login.vo.ProfileVO;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import users.vo.FollowerVO;
import web.IAction;

public class FollowerList implements IAction{
	
	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. 세션에서 접속 정보 받아오기
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		String id = profile.getUser_id();
		
		// 2. 접속정보를 이용해 팔로잉 목록 받아오기
		IUsersService service = UsersServiceImpl.getService();
		List<FollowerVO> list = service.followerList(id);
		
		// 3. Json 형태로 변환해 보내주기
		String listJson = new Gson().toJson(list);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(listJson);
		
		return null;
	}
}
