package admin.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public  class AdminLoginFilter  implements Filter {

	public void destroy(){
		
	}
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
			throws ServletException, IOException {
		HttpServletRequest request = (HttpServletRequest)servletRequest;
		HttpServletResponse response = (HttpServletResponse)servletResponse;
		String currentURL = request.getRequestURI();
		String ctxPath = request.getContextPath();
		//除掉项目名称时访问页面当前路径
		String targetURL = currentURL.substring(ctxPath.length());
		//System.out.println(targetURL);
		HttpSession session = request.getSession();
		//对当前页面进行判断，如果当前页面不为管理员登录页面
		if(!("/admin/pages/login.jsp".equals(targetURL))){
			//System.out.println("1"+targetURL+"ctxPath:"+ctxPath+"currentURL:"+currentURL);
			//在不为登陆页面时，再进行判断，如果不是登陆页面也没有session则跳转到登录页面，
			if(session == null || session.getAttribute("admin_login") == null
					||!session.getAttribute("admin_login").equals("admin_login")){
				response.sendRedirect("login.jsp");
				return;
			}else{
				//这里表示正确，会去寻找下一个链，如果不存在，则进行正常的页面跳转
				filterChain.doFilter(request, response);
				return;
			}
		}else{
			//这里表示如果当前页面是登陆页面，跳转到登陆页面
			filterChain.doFilter(request, response);
			return;
		}
		
	}
	public void init(FilterConfig filterConfig)throws ServletException{
		
	}

}
