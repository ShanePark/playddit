package join.service;

import java.sql.SQLException;
import java.util.List;

import join.dao.IJoinDao;
import join.dao.JoinDaoImpl;
import join.vo.TermsVO;
import users.vo.UsersVO;

public class JoinServiceImpl implements IJoinservice {
	private IJoinDao dao;
	private static IJoinservice service;
	
	public JoinServiceImpl() {
		dao = JoinDaoImpl.getDao();
	}
	
	public static IJoinservice getService() {
		if(service == null) service = new JoinServiceImpl();
		
		return service;
	}
	

	/**
	 * 회원가입
	 */
	@Override
	public int insertUser(UsersVO UsersVO) {
		int result = 0;
		try {
			result = dao.insertUser(UsersVO);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<TermsVO> showTerm() {
		List<TermsVO> list = null;
		
		try {
			list = dao.showTerm();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TermsVO> showTerm2() {
		List<TermsVO> list = null;
		
		try {
			list = dao.showTerm2();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 약관 내용 가져오기
	 */
	@Override
	public TermsVO termsCon(int terms_no) {
		TermsVO vo = null;
		
		try {
			vo = dao.termsCon(terms_no);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	/**
	 * 인증코드 insert
	 */
	@Override
	public int insertCode(String code, String mail) {
		int result = 0;
		try {
			result = dao.insertCode(code, mail);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 인증코드 일치검사
	 */
	@Override
	public String codeCheck(String mail) {
		String code = null;
		try {
			code = dao.codeCheck(mail);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return code;
	}



		
}
