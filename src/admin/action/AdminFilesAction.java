package admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.dao.AdminFilesDao;
import admin.dao.impl.AdminFilesDaoImpl;

public class AdminFilesAction extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if("sate".equals(method)){
			doSate(request, response);
		}
	}

	private void doSate(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		int fileId=Integer.parseInt(request.getParameter("fileId"));
		System.out.println("fileId:"+fileId);
		String sate=request.getParameter("sate");
		System.out.println("sate:"+sate);
		AdminFilesDao dao=new AdminFilesDaoImpl();
		if(sate.equals("true")){
			int x=1;
			boolean result=dao.setSate(x, fileId);
			out.println(result);
		}else{
			int x=0;
			boolean result=dao.setSate(x, fileId);
			out.println(result);
		}
	}

}
