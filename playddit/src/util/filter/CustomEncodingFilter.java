package util.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CustomEncodingFilter implements Filter {
	
	private String encoding;
	
	@Override
	public void destroy() {	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// contextPath 등록
		ServletContext application = request.getServletContext();
		application.setAttribute("cPath", application.getContextPath());
		
		request.setCharacterEncoding(encoding);
		chain.doFilter(request, response);
		response.setCharacterEncoding(encoding);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		encoding = config.getInitParameter("encoding");
		if(encoding==null) encoding = "utf-8";
	}

}
