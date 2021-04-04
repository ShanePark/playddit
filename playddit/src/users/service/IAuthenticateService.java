package users.service;


import enumpkg.ServiceResult;
import users.vo.UsersVO;

public interface IAuthenticateService {
	public ServiceResult authenticate(UsersVO user);
}
