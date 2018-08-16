package thelecture.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * SHA256 해쉬화 개체입니다.
 * 
 */
public enum SHA256 {
	/**
	 * Singleton 객체입니다.
	 */
	Instance;
	/**
	 *  SHA256방식으로 해쉬화시켜서 리턴한다.
	 * @param plain_text
	 * @return hashed_text
	 */
	public String encrypt(String plain_text) {
		String SHA = "";
		try {
			MessageDigest sh = MessageDigest.getInstance("SHA-256");
			sh.update(plain_text.getBytes());
			byte byteData[] = sh.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 255) + 0x100, 16).substring(1));
			}
			SHA = sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			SHA = null;
		}
		return SHA;
	}
	
	
}
