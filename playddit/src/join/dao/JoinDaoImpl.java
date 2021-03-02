package join.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import join.vo.TermsVO;
import users.vo.UsersVO;

public class JoinDaoImpl implements IJoinDao {
	
	private SqlMapClient client;
	private static IJoinDao dao;
	
	private JoinDaoImpl() {
		client = SqlMapClientFactory.getClient();
	}
	
	public static IJoinDao getDao() {
		if(dao == null) dao = new JoinDaoImpl();
		
		return dao;
	}
	
	/**
	 * 회원가입
	 */
	@Override
	public int insertUser(UsersVO UsersVO) throws SQLException {
		return (int) client.insert("users.insertUser", UsersVO);
	}

	/**
	 * 필수약관 가져오기
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<TermsVO> showTerm() throws SQLException{
		return (List<TermsVO>)client.queryForList("join.showTerm");
	}

	/**
	 * 선택약관 가져오기
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<TermsVO> showTerm2() throws SQLException {
		return (List<TermsVO>)client.queryForList("join.showTerm2");
	}
	
	/**
	 * 약관 내용 가져오기
	 */
	@Override
	public TermsVO termsCon(int terms_no) throws SQLException {
		return (TermsVO)client.queryForObject("join.termsCon", terms_no);
	}
	
	/**
	 * 인증코드 insert
	 */
	@Override
	public int insertCode(String code, String mail) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("code", code);
		map.put("mail", mail);
		
		if(client.insert("join.insertCode", map) == null) {
			return 1;
		}else {
			return 0;
		}
		
	}
	
	/**
	 * 인증코드 일치검사
	 */
	@Override
	public String codeCheck(String mail) throws SQLException {
		return (String)client.queryForObject("join.codeCheck", mail);
	}


}
