package users.service;

import java.util.List;
import users.vo.UsersVO;

public interface IUsersService {
	public List<UsersVO> getAllUsers();
	
	// 아이디 중복 검사
	public String selectById(String user_id);
	
	// 닉네임 중복 검사
	public String selectByNick(String user_nickname);
	
	// 팔로잉 목록 출력
	public List<UsersVO> followingList(String user_id); 
	
	// 아이디 비밀번호 일치여부
	public UsersVO match(String user_id, String user_pw);
	
	// 임시 암호 설정 및 이메일로 전송
	public int sendTempPass2(String email);

}
