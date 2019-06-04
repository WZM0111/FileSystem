package common.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.bean.UserInfoBean;
import common.dao.UserDao;
import common.dao.impl.UserDaoImpl;

public class UserLoginAction extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String method = request.getParameter("method");
		if("login".equals(method)){
			doLogin(request, response);
		}else if("regist".equals(method)){
			regist(request, response);
		}else if("acc_if_exist".equals(method)){
			ifExist(request, response);
		}else if("add".equals(method)){
			addUser(request, response);
		}
		
		
	}
	
	private void ifExist(HttpServletRequest request,HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String user_account=request.getParameter("account");
		UserDao dao=new UserDaoImpl();
		boolean result=dao.userIfExist(user_account);
		out.println(result);
	}

	public void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_account=request.getParameter("user_account");
		String pswd=request.getParameter("password");
		UserDao dao=new UserDaoImpl();
		int result=dao.userLogin(user_account, pswd);
		if(result!=1){
			request.setAttribute("user_acc", user_account);
			request.setAttribute("errMsg", "用户名或密码错误");
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		}else{
			UserInfoBean userinfo=dao.findUserByName(user_account);
			String classes=userinfo.getClasses();
	   	     String vipenddate=userinfo.getVipenddate();
	   	     Date currDate=Calendar.getInstance().getTime();
	   	     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	   	     
	   	     String dateTime=sdf.format(currDate);
   	       if("1".equals(classes)){
   			int a=vipenddate.compareTo(dateTime);
   			System.out.println(a);
   			if(a<0)  //enddate<dateTime
   			{
   				 String a1=dao.updateviptype(user_account);
   				 userinfo.setClasses(a1);
				
   			}
   			}
   	    HttpSession session=request.getSession();
		session.setAttribute("userinfo", userinfo);
			response.sendRedirect("index.jsp");
		}
	}
	
	public void regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String new_user_account=request.getParameter("new_user_account");
		String pswd=request.getParameter("pswd");
		UserDao dao=new UserDaoImpl();
		int result=dao.userRegist(new_user_account, pswd);
		request.setAttribute("user_acc", new_user_account);
		request.getRequestDispatcher("addUser.jsp?username="+new_user_account).forward(request, response);
		/*HttpSession session=request.getSession();
		session.setAttribute("user_acc", new_user_account);
		response.sendRedirect("Login.jsp");*/
	}
	
	public void addUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String nickname = request.getParameter("nickname");
		
		String strage = request.getParameter("age");
		int age = Integer.parseInt(strage);
		
		String strsex = request.getParameter("sex");
		String sex;
		if("1".equals(strsex)){
			sex="男";
		}else{
			sex="女";
		}
		
		UserDao dao = new UserDaoImpl();
		UserInfoBean userinfo=dao.findUserByName(username);
		HttpSession session=request.getSession();
		session.setAttribute("userinfo", userinfo);
		
		UserInfoBean user = new UserInfoBean();
		user.setUser_account(username);
		user.setUsername(nickname);
		user.setAge(age);
		user.setGender(sex);
		
		
		dao.addUserInfo(user);
		
		response.sendRedirect("index.jsp");
//		RequestDispatcher dispatcher=request.getRequestDispatcher("UserInfo.jsp");
//		dispatcher.forward(request,response);

	}
}



