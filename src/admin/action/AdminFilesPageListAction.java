package admin.action;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.service.impl.AdminFileServiceImpl;
import admin.service.impl.AdminUserServiceImpl;

import common.action.PageListBaseServlet;
import common.bean.FileInfoBean;

public class AdminFilesPageListAction extends PageListBaseServlet{

	@Override
	public void initPageInforBean(HttpServletRequest request,
			HttpServletResponse response)  {
		
			
			String startTime=request.getParameter("startTime"); 
		
			
			String endTime=request.getParameter("endTime");
		
			String in_filename=request.getParameter("in_filename");
			
			System.out.println(in_filename);
		
		HashMap<String ,String> hm=new HashMap<String,String>();
		
		hm.put("startTime", startTime);
		hm.put("endTime", endTime);
		hm.put("in_filename", in_filename);
		
		HttpSession session=request.getSession();
		session.setAttribute("in_filename", in_filename);
		session.setAttribute("startTime", startTime);
		session.setAttribute("endTime", endTime);
		
	/*	hm.put("startTime", startTime);
		hm.put("endTime", endTime);
		hm.put("in_username", in_username);
		*/
		super.getPageInforBean().setHm(hm);
		super.setPageInforService(new AdminFileServiceImpl());
		super.setForward("/admin/pages/article.jsp");
	}
	}
