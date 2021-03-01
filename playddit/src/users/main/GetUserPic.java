package users.main;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import login.vo.ProfileVO;
import web.IAction;

public class GetUserPic implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}
	

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String DIR = "../images/profile";
		
		// 세션을 받아온다. 유저 아이디와 user_pic 정보를 불러 올 예정이다.
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		String user_id = profile.getUser_id();
		String user_pic = DIR + File.separator + profile.getUser_pic();
		
		// 유저 아이디와 유저 프로필 사진 데이터를 ajax로 보내준다.
		Map<String, String> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("user_pic",user_pic);
		String mapJson = new Gson().toJson(map);
		
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(mapJson);
		
		return null;
	
	}

}


