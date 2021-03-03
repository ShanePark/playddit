package users.service;

import java.util.List;

import users.vo.FollowerVO;
import users.vo.GroupVO;
import users.vo.UsersVO;

public interface IUsersService {
	public List<UsersVO> getAllUsers();
	
	// 아이디 중복 검사
	public String selectById(String user_id);
	
	// 닉네임 중복 검사
	public String selectByNick(String user_nickname);
	
	// 팔로잉 목록 출력
	public List<FollowerVO> followingList(String user_id);
	
	// 팔로워 목록 출력
	public List<FollowerVO> followerList(String user_id);
	
	// 소속 그룹 목록 출력
	public List<GroupVO> getGroups(String user_id);
	
	// 팔로우 데이터 추가
	public int followUser(String follower, String followee);
	
	// 팔로우 데이터 제거
	public int unfollowUser(String follower, String followee);
	
	// 아이디 비밀번호 일치여부
	public UsersVO match(String user_id, String user_pw);
	
	// 암호 변경하기
	public int setNewPass(String user_id, String password);

	// 프로필 변경하기
	public int setUserPic(String user_id, String user_pic);
	
}
