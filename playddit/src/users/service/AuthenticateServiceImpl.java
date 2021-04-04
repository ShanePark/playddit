package users.service;


import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;

import org.apache.commons.beanutils.BeanUtils;

import enumpkg.ServiceResult;
import users.dao.IUsersDao;
import users.dao.UsersDaoImpl;
import users.vo.UsersVO;

public class AuthenticateServiceImpl implements IAuthenticateService {
	private IUsersDao dao;
	private static IAuthenticateService service;
	
	private AuthenticateServiceImpl() {
		dao = UsersDaoImpl.getDao();
	}
	
	public static IAuthenticateService getService() {
		if(service == null) service = new AuthenticateServiceImpl();
		return service;
	}

	@Override
	public ServiceResult authenticate(UsersVO user) {
		UsersVO savedMember;
		ServiceResult result = null;
		try {
			savedMember = dao.selectMemberForAuth(user.getUser_id());
			if(savedMember != null) {
				String inputPass = user.getUser_password();
				String savedPass = savedMember.getUser_password();
				if(savedPass.equals(inputPass)) {
					try {
						BeanUtils.copyProperties(user, savedMember);
					} catch (IllegalAccessException | InvocationTargetException e) {
						e.printStackTrace();
					}
					result = ServiceResult.OK;
				}else {
					result = ServiceResult.INVALIDPASSWORD;
				}
			}else {
				result = ServiceResult.NOTEXIST;
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return result;
	}

}
