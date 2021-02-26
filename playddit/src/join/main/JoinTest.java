package join.main;

import java.sql.SQLException;
import java.util.List;

import join.dao.IJoinDao;
import join.dao.JoinDaoImpl;
import join.service.IJoinservice;
import join.service.JoinServiceImpl;
import join.vo.TermsVO;

public class JoinTest {

	public static void main(String[] args) {
		IJoinservice service = JoinServiceImpl.getService();
		
		List<TermsVO> list = null;
		list = service.showTerm2();
		for(TermsVO vo : list) {
			System.out.println(vo.getTerms_title());
		}

	}

}
