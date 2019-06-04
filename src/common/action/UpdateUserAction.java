package common.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.bean.LoginBean;

import common.bean.UserInfoBean;
import common.dao.UserDao;
import common.dao.impl.UserDaoImpl;

public class UpdateUserAction extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nickname=request.getParameter("nickname1");   //�ǳ�
		String strsex=request.getParameter("sex1");          //�Ա�
		String strage=request.getParameter("age1");          //����
		int age=Integer.parseInt(strage);
		String sex;
		if("1".equals(strsex)){
			sex="男";
		}else{
			sex="女";
		}
		
		// ��ȡ��ǰ�û�cd
		HttpSession session1 = request.getSession();
		
		 UserInfoBean userinfo=( UserInfoBean)session1.getAttribute("userinfo");
		String username = userinfo.getUser_account();
		
		System.out.println("222:"+username);
		UserInfoBean user = new UserInfoBean();
		
		user.setUser_account(username);
		user.setUsername(nickname);
		user.setGender(sex);
		user.setAge(age);
		
		//HttpSession session = request.getSession();
		//session.setAttribute("user", user);
		UserDao dao = new UserDaoImpl();
		dao.updateUserInfo(user);
		response.sendRedirect("userInformation.jsp");
		
			
	}

}
