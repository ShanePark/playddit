package users.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import users.vo.UsersVO;
import util.SqlMapUtil;

public class UsersDaoImpl implements UsersDao {
	private SqlMapClient smc = SqlMapUtil.getSqlMapClient();
	
	@Override
	public List<UsersVO> getAllUsers() {
		List<UsersVO> list = new ArrayList<>();
		try {
			list = smc.queryForList("users.selectAll");
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
