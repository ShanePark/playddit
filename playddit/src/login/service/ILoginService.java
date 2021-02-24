package login.service;

import login.vo.ProfileVO;

public interface ILoginService {
	// 메인화면에 출력할 프로필 정보 불러오기
	public ProfileVO loadProfile(String user_id);
}
