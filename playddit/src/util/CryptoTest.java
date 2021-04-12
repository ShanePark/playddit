package util;

public class CryptoTest {

	public static void main(String[] args) {
		try {
//			String id = "psh40963@naver.com";
//			String password = "1234";
//			String key = "playddit"+id+password;	// 16 글자 이상.
//			
//			String result = CryptoUtil.encryptAES256(password, key);
//			String result2 = CryptoUtil.decryptAES256(result, key);
//					
//			System.out.println(" 원본 데이터 : " +password);
//			System.out.println(" 암호화 데이터 : " +result);
//			System.out.println(" 복호화 데이터 : " + result2);
//			
//			String shaResult = CryptoUtil.encryptSha512(result);
//			System.out.println("이중 단방향 암호화된 데이터 : " + shaResult);
//			
//			String shaResult2 = CryptoUtil.encryptPass(id, password);
//			System.out.println("result에서 단방향암호화 된 데이터 : " + shaResult2);
			
			String originalPass = "wE09QgX6bbZ5dfKNgOJa2w==";
			String shaPass = CryptoUtil.encryptSha512(originalPass);
			System.out.println("Original Pass");
			System.out.println(originalPass);
			System.out.println("Sha Pass");
			System.out.println(shaPass);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
