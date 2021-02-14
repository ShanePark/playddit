package util;

public class CryptoTest {

	public static void main(String[] args) {
		try {
			String plainText = "java2";
			String key ="playdditplayddit";	// 16 글자 이상.
			
			String result = CryptoUtil.encryptAES256(plainText, key);
			String result2 = CryptoUtil.decryptAES256(result, key);
			System.out.println(" 원본 데이터 : " +plainText);
			System.out.println(" 암호화 데이터 : " +result);
			System.out.println(" 복호화 데이터 : " + result2);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
