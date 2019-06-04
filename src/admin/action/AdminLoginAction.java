package admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.dao.AdminUserDao;
import admin.dao.impl.AdminUserDaoImpl;

import common.dao.UserDao;
import common.dao.impl.UserDaoImpl;

public class AdminLoginAction extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");
		if("login".equals(method)){
			doLogin(request, response);
		}
	}

	private void doLogin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String user_account=request.getParameter("username");
		String pswd=request.getParameter("password");
		AdminUserDao dao=new AdminUserDaoImpl();
		int result=dao.adminLogin(user_account, pswd);
		HttpSession session=request.getSession();
		session.setAttribute("account", user_account);
		if(result!=1){
			/*request.setAttribute("errMsg", "用户名或密码错误");
			request.getRequestDispatcher("admin/Login.jsp").forward(request, response);*/
			session.setAttribute("errMsg", "用户名或密码错误");
			response.sendRedirect("pages/login.jsp");
		}else{
			session.setAttribute("admin_login","admin_login" );
			response.sendRedirect("pages/index.jsp");
		}
	}

}
