package common.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.dao.impl.FileDaoImpl;

public class FileAction extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		doPost(request, response);
		
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String action=request.getParameter("action");
		String fileid1[] = request.getParameterValues("fileid1");//ÏÂÔØ
		String fileid2[] = request.getParameterValues("fileid");//ÉÏ´«
		
		if("delete1".equals(action)&&fileid1!=null){
 
			for(int i=0;i<fileid1.length;i++){
//				System.out.println(fileid1[i]);
				String strfileid1=fileid1[i];
				int fileid=Integer.parseInt(strfileid1);
				
				FileDaoImpl dao = new FileDaoImpl();
				dao.deleteDownloadFileById(fileid);
			}
//			RequestDispatcher dispatcher=request.getRequestDispatcher("myDownload.jsp");
//			dispatcher.forward(request,response);
			response.sendRedirect("myDownload.jsp");
		}
		
		if("delete".equals(action)&&fileid2!=null){
			 
			for(int i=0;i<fileid2.length;i++){
//				System.out.println(fileid1[i]);
				String strfileid=fileid2[i];
				int fileid=Integer.parseInt(strfileid);
				FileDaoImpl dao = new FileDaoImpl();
				dao.deleteUploadFileById(fileid);
			}
//			RequestDispatcher dispatcher=request.getRequestDispatcher("myUpload.jsp");
//			dispatcher.forward(request,response);
			response.sendRedirect("myUpload.jsp");
		}
		
		
		
		
	}

}
