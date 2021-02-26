package join.dao;

import java.sql.SQLException;
import java.util.List;

import join.vo.TermsVO;
import users.vo.UsersVO;

public interface IJoinDao {
	
	/**
	 * 회원가입
	 * @param UsersVO
	 * @return
	 * @throws SQLException
	 */
	public UsersVO insertUser(UsersVO UsersVO) throws SQLException; 

	
	/**
	 * 필수약관 가져오기
	 * @return
	 */
	public List<TermsVO> showTerm() throws SQLException;
	
	/**
	 * 선택약관 가져오기
	 * @return
	 */
	public List<TermsVO> showTerm2() throws SQLException;
	
	/**
	 * 약관 내용 가져오기
	 * @return
	 * @throws SQLException
	 */
	public TermsVO termsCon(int terms_no) throws SQLException;
}
