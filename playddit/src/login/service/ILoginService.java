package login.service;

import java.util.List;

import login.vo.ProfileVO;

public interface ILoginService {
	// 메인화면에 출력할 프로필 정보 불러오기
	public ProfileVO loadProfile(String user_id);
	
	// play에서 랜덤으로 팔로우 추천리스트 추천
	public List<ProfileVO> loadRandomFriends(String user_id);
}
