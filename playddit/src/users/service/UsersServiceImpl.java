package users.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import users.dao.IUsersDao;
import users.dao.UsersDaoImpl;
import users.main.signUp.VerifyEmail;
import users.vo.UsersVO;
import util.CryptoUtil;

public class UsersServiceImpl implements IUsersService {
	private IUsersDao dao;
	private static UsersServiceImpl service;
	
	
	public UsersServiceImpl() {
		dao = UsersDaoImpl.getDao();
	}
	
	public static UsersServiceImpl getService() {
		if(service == null) service = new UsersServiceImpl();
		
		return service;
	}
	

	@Override
	public List<UsersVO> getAllUsers() {
		return dao.getAllUsers();
	}
	/**
	 * 아이디 중복 검사
	 */
	@Override
	public String selectById(String user_id) {
		String resId = null;
		
		try {
			resId = dao.selectById(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return resId;
	}
	
	/**
	 * 닉네임 중복 검사
	 */
	@Override
	public String selectByNick(String user_nickname) {
		String resNick = null;
		try {
			resNick = dao.selectByNick(user_nickname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resNick;
	}

	/**
	 * 팔로잉 목록 출력
	 */
	@Override
	public List<UsersVO> followingList(String user_id) {
		List<UsersVO> following = null;
		
		try {
			following = dao.followingList(user_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return following;
	}

	/**
	 * 아이디 비밀번호 일치 여부
	 */
	@Override
	public UsersVO match(String user_id,String user_pw) {
		UsersVO vo = null;
		try {
			vo = dao.match(user_id, user_pw);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	@Override
	public int sendTempPass2(String email) {
		String password = "";	//	10글자의 암호 랜덤생성
		for(int i=0; i<10; i++) {
			char randomChar = (char)(int)(Math.random()*26+65);
			password += randomChar;
		}
		
		// 변경된 임시 암호를 이메일로 보내기	
		VerifyEmail.sendEmail(email, password);
		
		// 암호는 암호화하여 DB에 저장 , 보안을 위해 key값을 복합적으로 구성
		String key = "playddit"+email+password;
		String data1="";
		try {
			data1 = CryptoUtil.encryptAES256(password, key);
		} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException
				| InvalidAlgorithmParameterException | IllegalBlockSizeException | BadPaddingException e1) {
			e1.printStackTrace();
		}
		int result = -1;
		try {
			result = dao.sendTempPass2(email, data1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
}
