package c;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class Authentification implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws ServletException, IOException {
		
	
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession();
		// String loginURI = request.getContextPath() + "/Login";
		StringBuffer requestURL = request.getRequestURL();
		if (request.getQueryString() != null) {
			requestURL.append("?").append(request.getQueryString());
		}
		String completeURL = requestURL.toString();
		StringBuffer url = request.getRequestURL();
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String base = url.substring(0, url.length() - uri.length() + ctx.length()) + "/";
		String loginURI = base + "Login";
		System.out.println("complete  URL  " + completeURL);
		System.out.println("base  " + base);
		System.out.println("loginURI  " + loginURI);
		boolean loggedIn = session.getAttribute("user") != null;
		boolean loginRequest = completeURL.equals(loginURI);
		System.out.println("bool req  " + loginRequest);
		System.out.println("bool login  " + loggedIn);
		if (loggedIn || loginRequest) {
			System.out.println("loooogggggeeeeeeeeeeedddd");
			System.out.println(session.getAttribute("user"));
			chain.doFilter(request, response);
		} else {
			System.out.println("redirect loog");
			response.sendRedirect(loginURI);
		}
		//chain.doFilter(req, res);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}
}