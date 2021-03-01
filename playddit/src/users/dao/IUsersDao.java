package users.dao;

import java.sql.SQLException;
import java.util.List;

import users.vo.FollowerVO;
import users.vo.UsersVO;

public interface IUsersDao {
	public List<UsersVO> getAllUsers();
	
	// 아이디 중복검사
	public String selectById(String user_id) throws SQLException;
	
	// 닉네임 중복검사
	public String selectByNick(String user_nickname) throws SQLException;
	
	// 팔로잉 목록 출력
	public List<FollowerVO> followingList(String user_id) throws SQLException;
	
	// 팔로워 목록 출력
	public List<FollowerVO> followerList(String user_id) throws SQLException;
	
	// 팔로우 데이터 추가
	public int followUser(String follower, String followee) throws SQLException;
	
	// 팔로우 데이터 제거
	public int unfollowUser(String follower, String followee) throws SQLException;
	
	// 아이디 비밀번호 일치여부
	public UsersVO match(String user_id, String user_pw) throws SQLException;
	
	// 암호 변경하기
	public int setNewPass(String user_id, String password) throws SQLException;
	
}
	