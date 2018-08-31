package thelecture.aop;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.CodeSignature;

import thelecture.model.LectureBean;
import thelecture.model.MemberBean;
import thelecture.model.PageBean;
import thelecture.model.QuestionBean;
import thelecture.model.ReplyBean;
import thelecture.model.UnivBean;
import thelecture.model.VOBean;

@Aspect
public class LoggingAspect {
	public static boolean isGetter(Method method) {
		if (!method.getName().startsWith("get"))
			return false;
		if (method.getParameterTypes().length != 0)
			return false;
		if (void.class.equals(method.getReturnType()))
			return false;

		return true;
	}

	public static boolean isSetter(Method method) {
		if (!method.getName().startsWith("set"))
			return false;
		if (method.getParameterTypes().length != 1)
			return false;
		return true;
	}

	public static Object mainAdvice(ProceedingJoinPoint joinpoint) throws Throwable {
		CodeSignature codeSignature = (CodeSignature) joinpoint.getSignature();
		long st = System.currentTimeMillis();

		try {
			
			return joinpoint.proceed();
		} finally {
			long et = System.currentTimeMillis();
			System.out.println(codeSignature.toShortString() + " 경과시간 : " + (et - st));
			
			//argument 불러오기
			
			Object[] arguments = joinpoint.getArgs();

			// 메소드 argument출력
			for (int i = 0; i < arguments.length; i++) {
				
				// parameter 이름 출력
				System.out.print(codeSignature.getParameterNames()[i] + ":");

				// argument출력
				// session일 경우
				if (arguments[i] instanceof HttpSession) {

					Enumeration<String> attributes = ((HttpSession) arguments[i]).getAttributeNames();
					String attribute;

					
					while (attributes.hasMoreElements()) {
						attribute = attributes.nextElement();
						System.out.print(attribute + "=");
						System.out.print(((HttpSession) arguments[i]).getValue(attribute) + ",");
					}
					System.out.println();

					// Model일 경우 필드 값
				} /*else if (arguments[i] instanceof PageBean || arguments[i] instanceof LectureBean
						|| arguments[i] instanceof MemberBean || arguments[i] instanceof QuestionBean
						|| arguments[i] instanceof ReplyBean || arguments[i] instanceof UnivBean

				) {
					Class VO = arguments[i].getClass();
					Method[] methods = VO.getMethods();

					for (int k=0; k <methods.length; k++) {
						if (isGetter(methods[k])) {

							// 필드 이름 구하기(get없애고, 첫글자를 소문자로)
							char c[] = methods[k].getName().replace("get", "").toCharArray();
							c[0] = Character.toLowerCase(c[0]);
							
							// 이름으로 필드 불러오기
							try {

								Field field = VO.getDeclaredField(new String(c));
								field.setAccessible(true);

								if (field.get(arguments[i]).equals(null)) {
									
									Object value = field.get(arguments[i]);

									System.out.print(field.getName() + "=" + value.toString() + ", ");
								}
							} catch (Exception e) {

								e.printStackTrace();
							}
						}
					}
				} */else if (arguments[i] instanceof String[]) {
					String[] slist = (String[]) arguments[i];
					for (int j = 0; i < slist.length; j++) {
						System.out.print(slist[j] + ",");
					}
					System.out.println();
				} else {
					System.out.print(arguments[i]);
					System.out.println();
				}
				

			}
		}
	}

}
