package users.main;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.service.IUsersService;
import users.service.UsersServiceImpl;
import util.CryptoUtil;
import util.EmailUtil;
import web.IAction;

public class SendTempPass2 implements IAction {

	@Override
	public boolean isRedirect() {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email");
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
		
		String encPass=CryptoUtil.encryptPass(email, password);
		
		String result = service.setNewPass(email,encPass)+"";
		request.setAttribute("result",result);
		
		return "/users/isSuccess.jsp";
	}

}
