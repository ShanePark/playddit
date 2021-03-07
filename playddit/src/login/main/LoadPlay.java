package login.main;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import join.service.IJoinservice;
import join.service.JoinServiceImpl;
import join.vo.ClassVO;
import login.service.ILoginService;
import login.service.LoginServiceImpl;
import login.vo.PlayVO;
import login.vo.ProfileVO;
import web.IAction;

public class LoadPlay implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 해당 servlet을 통해 playvo에 데이터를 채워서 ajax로 돌려보낼 예정.
		PlayVO playvo = new PlayVO();
		
		// 1. 세션에서 프로필 정보 받아와서 유저 아이디, 닉네임, 학급 정보 받아오기
		HttpSession session = request.getSession();
		String profileJson = (String) session.getAttribute("profile");
		Gson gson = new Gson();
		ProfileVO profile = gson.fromJson(profileJson, ProfileVO.class);
		
		// 2. 세션에서 불러온 정보로 접속유저에 대한 정보를 vo에 담는다.
		String user_id = profile.getUser_id();
		playvo.setUser_id(user_id);
		playvo.setUser_nickname(profile.getUser_nickname());
		playvo.setClass_id(profile.getClass_id());
		
		// 3. 필요한 Service들을 호출한다.
		IJoinservice joinService = JoinServiceImpl.getService();
		ILoginService loginService = LoginServiceImpl.getService();
		
		List<ClassVO> classList = joinService.selectClass();
		List<ProfileVO> followList = loginService.loadRandomFriends(user_id);
		
		playvo.setClassList(classList);
		playvo.setFollowList(followList);
		
		String playVoJson = new Gson().toJson(playvo);
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(playVoJson);
		
		return null;
	
	}

}


