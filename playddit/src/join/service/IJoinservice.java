package join.service;

import java.util.List;

import join.vo.TermsVO;
import users.vo.UsersVO;

public interface IJoinservice {
	
	// 회원가입
	public UsersVO insertUser(UsersVO UsersVO); 
	
	
	/**
	 * 필수약관 가져오기
	 * @return
	 */
	public List<TermsVO> showTerm();
	
	/**
	 * 선택약관 가져오기
	 * @return
	 */
	public List<TermsVO> showTerm2();

}
