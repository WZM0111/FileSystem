package common.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.bean.Comment;
import common.bean.UserInfoBean;

import common.dao.showFileDao;
import common.dao.impl.showFileImpl;


public class CommentAction extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String comm=request.getParameter("comm");	
		int fileid = Integer.parseInt(request.getParameter("file_id")); 
		//String fileid=request.getParameter("fileid");
		HttpSession session2=request.getSession();
		UserInfoBean userinfo=(UserInfoBean)session2.getAttribute("userinfo");
		String username=userinfo.getUser_account();
		Date currDate=Calendar.getInstance().getTime();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateTime=sdf.format(currDate);
		
		showFileDao dao=new showFileImpl();
		
		Comment c=new Comment();
		c.setFileid(fileid);
		c.setDate(dateTime);
		c.setContents(comm);
		c.setUsername(username);
		dao.addComment(c);
		//System.out.print("aa"+fileid);
		RequestDispatcher dispatcher = request.getRequestDispatcher("showfile.jsp?id="+fileid);
		dispatcher.forward(request, response);
		
	}

}
