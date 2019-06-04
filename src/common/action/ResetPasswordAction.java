package common.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.bean.LoginBean;
import common.bean.UserInfoBean;
import common.bean.UserPasswordBean;

import common.dao.ResetPasswordDao;
import common.dao.impl.ResetPasswordDaoImpl;

public class ResetPasswordAction extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");
		if ("check".equals(method)) {
			setPassword(request, response);
		}

	}

	public void setPassword(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String user_old = request.getParameter("password_old");
		String user_pswd = request.getParameter("password_1");
		String new_pswd = request.getParameter("password_2");
		
		HttpSession session1 = request.getSession();
		
		 UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo");
		String username = userinfo.getUser_account();
		
		UserPasswordBean userPasswordBean = new UserPasswordBean();
		HttpSession session = request.getSession();

		userPasswordBean.setUserpswd(user_old);
		userPasswordBean.setUsername(username);
		userPasswordBean.setNewpswd(new_pswd);
		session.setAttribute("userPasswordBean", userPasswordBean);

		ResetPasswordDao dao = new ResetPasswordDaoImpl();
		int count = dao.findPassword(userPasswordBean);

		if (count == 0) {
			request.setAttribute("errMsg", "密码和当前密码不一致");
			
			request.getRequestDispatcher("resetPasswd.jsp").forward(request,
					response);
		} else {
			if (!user_pswd.equals(new_pswd)) {
				request.setAttribute("errMsg", "新密码和确认密码不一致");
				request.getRequestDispatcher("resetPasswd.jsp").forward(request,
						response);
			} else {
				int check = new ResetPasswordDaoImpl()
						.updatePassword(userPasswordBean);
				
//				response.sendRedirect("resetPasswd.jsp");
				
				request.setAttribute("message","密码修改成功");
				RequestDispatcher dispatcher=request.getRequestDispatcher("resetPasswd.jsp");
				dispatcher.include(request,response);
				
			}
		}

	}

}
