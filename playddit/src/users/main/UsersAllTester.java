package users.main;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import users.dao.IUsersDao;
import users.dao.UsersDaoImpl;
import users.service.IUsersService;
import users.service.UsersServiceImpl;
import util.CryptoUtil;
import util.EmailUtil;

public class UsersAllTester {

	public static void main(String[] args) {
		
		String email = "psh40963@naver.com";
		IUsersService service = UsersServiceImpl.getService();
		
		String password = "";	//	10글자의 암호 랜덤생성
		for(int i=0; i<10; i++) {
			char randomChar = (char)(int)(Math.random()*26+65);
			password += randomChar;
		}
		
		// 변경된 임시 암호를 이메일로 보내기	
		String title = "PLAYDDIT 임시 비밀번호 안내";
		String content = "임시비밀번호를 안내해 드립니다. 괄호 안의 값만 입력해주세요 [" + password + "]";
		EmailUtil.sendEmail(email, title, content);
		
		// 암호는 암호화하여 DB에 저장 , 보안을 위해 key값을 복합적으로 구성
		String key = "playddit"+email+password;
		String data1="";
		try {
			data1 = CryptoUtil.encryptAES256(password, key);
		} catch (InvalidKeyException | UnsupportedEncodingException | NoSuchAlgorithmException | NoSuchPaddingException
				| InvalidAlgorithmParameterException | IllegalBlockSizeException | BadPaddingException e1) {
			e1.printStackTrace();
		}
		
		int result = service.setNewPass(email,data1);
		System.out.println(result);
		
		
	}
	

}
