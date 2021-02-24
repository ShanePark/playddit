package login.dao;

import java.sql.SQLException;

import login.vo.ProfileVO;

public interface ILoginDao {
	// 메인화면에 출력할 프로필 정보 불러오기
	public ProfileVO loadProfile(String user_id) throws SQLException;
}
