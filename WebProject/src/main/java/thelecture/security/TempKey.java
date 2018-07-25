package thelecture.security;

import java.util.Random;

/**
 * 임의의 길이의 문자열을 생성합니다.<br>
 * 범위 : 대문자 소문자 숫자
 */
public enum TempKey {
	Instance;

    private boolean lowerCheck;
    private int size;

    /**
     * 임의의 길이의 문자열을 생성합니다.
     * @param size
     * @param lowerCheck(소문자로 변형시킬지 말지 여부)
     * @return TempKey
     */
    public String getKey(int size, boolean lowerCheck) {
        this.size = size;
        this.lowerCheck = lowerCheck;
        return init();
    }

    private String init() {
        Random ran = new Random();
        StringBuffer sb = new StringBuffer();
        int num = 0;
        do {
            num = ran.nextInt(75)+48;
            if((num>=48 && num<=57) || (num>=65 && num<=90) || (num>=97 && num<=122)) {
                sb.append((char)num);
            }else {
                continue;
            }
        } while (sb.length() < size);
        if(lowerCheck) {
            return sb.toString().toLowerCase();
        }
        return sb.toString();
    }
   
}
