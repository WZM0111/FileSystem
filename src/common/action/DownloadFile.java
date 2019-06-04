package common.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.bean.UserInfoBean;
import common.dao.UserDao;
import common.dao.showFileDao;
import common.dao.impl.UserDaoImpl;
import common.dao.impl.showFileImpl;

/**
 * @ClassName:DownLoadServlet
 * @Description:文件下载
 * @author: 
 * @date:2018年9月16日
 */
public class DownloadFile extends HttpServlet{
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		//获取请求参数，知道要下载那个文件
		String strfileid=req.getParameter("fileid");
		int fileid=Integer.parseInt(strfileid);
		String fileForm=req.getParameter("fileForm");
		
		System.out.println(fileid+fileForm);
		
		HttpSession session=req.getSession();
		UserInfoBean userinfo=(UserInfoBean) session.getAttribute("userinfo");
		String useraccount=userinfo.getUser_account();
		
  	     Date currDate=Calendar.getInstance().getTime();
  	     SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
  	     String dateTime=sdf.format(currDate);
  	     
  	     showFileDao dao=new showFileImpl();
  	     dao.add(useraccount, fileid, dateTime);
  	     
//		HttpSession session=req.getSession();
//	  	UserInfoBean user=(UserInfoBean)session.getAttribute("user");
//        String type=user.getClasses();
//        if(type.equals("1")){
        
		//设置响应头
		String contentType=getServletContext().getMimeType(fileid +"."+ fileForm);//依据文件名自动获取对应的Content-Type头
		res.setContentType(contentType);
		res.setHeader("Content-Dispotition", "attachment;filename="+fileid +"."+ fileForm);//设置该头，以附件形式打开下载
		//获取文件的输入流
		String path=getServletContext().getRealPath("/upload")+"/"+fileid +"."+ fileForm;
		FileInputStream in=new FileInputStream(new File(path));
		OutputStream out= res.getOutputStream();
		byte[] b=new byte[1024];
		int len=0;
		while((len=in.read(b))!=-1){
			out.write(b,0,len);
		}
		in.close();
		out.close();
       
        	
    
	}
	
}