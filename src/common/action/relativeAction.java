package common.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.service.FileServiceImpl;

public class relativeAction extends PageListBaseServlet {


	@Override
	public void initPageInforBean(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session=request.getSession();
//		String content=(String)session.getAttribute("content");
//		String action=(String)session.getAttribute("action");
		String types=null; 
		try {
			types = new String(request.getParameter("types").getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} 
		
		System.out.println(types);
		HashMap<String ,String> hm=new HashMap<String,String>();
		
		hm.put("content", types);
		
		
		session.setAttribute("content", types);
		super.getPageInforBean().setHm(hm);
		super.setPageInforService(new FileServiceImpl());
		super.setForward("/find.jsp");
	}

}
