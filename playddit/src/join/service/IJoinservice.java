package join.service;

import java.sql.SQLException;
import java.util.List;

import join.vo.TermsVO;
import users.vo.UsersVO;

public interface IJoinservice {
	
	// 회원가입
	public int insertUser(UsersVO UsersVO); 
	
	
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
	
	/**
	 * 약관 내용 가져오기
	 * @return
	 */
	public TermsVO termsCon(int terms_no);
	
	
	/**
	 * 인증코드 insert하기
	 * @param code
	 * @param mail
	 * @return
	 */
	public int insertCode(String code, String mail);

	
	/**
	 * 인증코드 일치검사
	 * @param mail
	 * @return
	 * @throws SQLException
	 */
	public String codeCheck(String mail);
}
