package common.utils;

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

import common.bean.UserInfoBean;

public class LoginFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		HttpServletRequest req=(HttpServletRequest) request;
		HttpServletResponse resp=(HttpServletResponse) response;
		PrintWriter out=response.getWriter();
		
		HttpSession session=req.getSession();
		UserInfoBean user =(UserInfoBean) session.getAttribute("userinfo");
		
		if(user!=null){
			//�û��ѵ�¼
			chain.doFilter(request, response);
		}else{
			//�û�δ��¼
			String path=req.getContextPath()+"/Login.jsp";
			resp.sendRedirect(path);
		}
		
		String loginPage = req.getContextPath()+"/Login.jsp";
		String logincheck = req.getContextPath()+"/userlogin";
		String url=req.getRequestURI();
		
		//String strid=request.getParameter("id");
		//int id=Integer.parseInt(strid);
		
		if(loginPage.equals(url) || logincheck.equals(url)){
			chain.doFilter(request, response);
		}else{
		
			if(user!=null){
				//�û��ѵ�¼
				chain.doFilter(request, response);
			}else{								
				//�û�δ��¼
				out.println("<script type=\"text/javascript\">alert('请先登录')");
				out.println("window.location='Login.jsp'");
				out.println("</script>"); 
				
				//String path=req.getContextPath()+"/login.jsp";
				//resp.sendRedirect(path);
			}
		}
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
