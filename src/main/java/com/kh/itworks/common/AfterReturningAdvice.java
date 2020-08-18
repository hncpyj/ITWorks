package com.kh.itworks.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class AfterReturningAdvice {
	@Pointcut("execution(* com.kh.itworks..*ServiceImpl.*(..))")
	public void allPointcut() {}
	@Pointcut("execution(* com.kh.itworks..*DaoImpl.*(..))")
	public void daoPointcut() {}
	
	@AfterReturning(pointcut = "allPointcut()", returning = "returnObj")
	public void afterLog(JoinPoint jp, Object returnObj) {
		
//		String methodName = jp.getSignature().getName();
//		
//		if(returnObj instanceof Member) {
//			Member m = (Member)returnObj;
//			System.out.println(m.getUserId() + "님이 로그인하셨습니다.");
//		}
//		
//		System.out.println("[메소드 리턴] " + methodName + "() 메소드 리턴값 : " + returnObj.toString());
		
	}
	
	@AfterReturning(pointcut = "daoPointcut()", returning = "returnObj")
	public void agterDaoLog(JoinPoint jp, Object returnObj) {
		
	}
}
