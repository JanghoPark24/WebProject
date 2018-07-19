package thelecture.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;

@Aspect
public class LoggingAspect {
	
	
	public Object mainAdvice(ProceedingJoinPoint joinpoint ) throws Throwable {
		String signatureStr = joinpoint.getSignature().toShortString();
		
		long st = System.currentTimeMillis();
		
		try {
			Object obj = joinpoint.proceed();
			return obj;
		} finally {
			long et = System.currentTimeMillis();
			System.out.println( signatureStr + " 경과시간 : " + (et - st));
		}
	}
	
}
