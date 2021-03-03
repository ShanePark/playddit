package join.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import config.SqlMapClientFactory;
import join.vo.ClassVO;
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
		
		if(client.insert("join.insertUser", UsersVO) == null) {
			return 1;
		}else {
			return 0;
		}
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
		return client.queryForList("join.showTerm2");
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

	/**
	 * 선택약관 저장
	 */
	@Override
	public int pickConInsert(int no, String mail) throws SQLException {
		
		/**
		 * vo객체는 String과 number를 쓰기위해 빌려 썼습니다 죄송함다 ㅜ
		 * Terms_no = 선택약관번호
		 * Terms_title = 회원아이디
		 */
		TermsVO vo = new TermsVO();
		vo.setTerms_no(no);
		vo.setTerms_title(mail);

		
		if(client.insert("join.pickConInsert", vo) == null) {
			return 1;
		}else {
			return 0;
		}
	}
	
	/**
	 * class 정보 출력
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<ClassVO> selectClass() throws SQLException {
		return client.queryForList("join.selectClass");
	}


}
