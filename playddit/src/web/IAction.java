package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface IAction {
	// 이 IAction 인터페이스를 implements한 클래스에서 View(jsp문서)를 결정하고, 
	// 해당 View로 Redirect할 것인지, forward를 할 것인지를 결정하는 메서드 선언
	// 반환값이 true ==> redirect
	// 반환값이 false ==> forward
	
	public boolean isRedirect();
	
	// 이 IAction인터페이스를 implements한 클래스의 process() 메서드를 
	// 호출해서 URI를 기준으로 1개의 요청 처리를 위임하고 view페이지를 반환하는 메서드
	public String process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
