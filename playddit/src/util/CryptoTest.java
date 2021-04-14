package util;

public class CryptoTest {

	public static void main(String[] args) {
		try {
			String id = "guest@playddit.net";
			String password = "guest";
					
			System.out.println(" 원본 데이터 : " +password);
			
			String encPass = CryptoUtil.encryptPass(id, password);
			System.out.println("단방향암호화 된 데이터 : " + encPass);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
