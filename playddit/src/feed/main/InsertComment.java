package feed.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import feed.service.FeedServiceImpl;
import feed.service.IFeedService;
import feed.vo.ComVO;
import login.vo.ProfileVO;
import web.IAction;

public class InsertComment implements IAction {

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
		
		String id = profile.getUser_id();
		String user_pic = profile.getUser_pic();
		String nickname = profile.getUser_nickname();
		
		// feed 번호 및 comment content를 받아온다. 
		int feedno = Integer.parseInt(request.getParameter("feedno"));
		String content = request.getParameter("content");

		// 댓글을 등록한다. insertComment의 반환값은 등록한 코멘트 넘버.
		IFeedService service = FeedServiceImpl.getService();
		int comno = service.insertComment(id, content, feedno);
		
		
		// 댓글 append를 위해 필요한 정보들을 vo 객체에 담는다.
		ComVO vo = new ComVO();
		vo.setId(id);
		vo.setProfile(user_pic);
		vo.setNickname(nickname);
		vo.setComcont(content);
		vo.setComno(comno);
		
		// json 데이터로 변환해서 ajax로 돌려 보낸다.
		String voJson = new Gson().toJson(vo);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write(voJson);
		
		return null;
	}

}
