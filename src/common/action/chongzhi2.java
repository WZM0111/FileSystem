package common.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.microsoft.sqlserver.jdbc.SQLServerStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.bean.UserInfoBean;
import common.utils.ConnectionPool;

public class chongzhi2 extends HttpServlet {

	
    /**
	 * 
	 */
	private static final long serialVersionUID = 21L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String name = req.getParameter("txtusername");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		if (name ==null)
		{
		  name ="";
		}
		Double jine=Double.parseDouble(req.getParameter("miane"));
		if (jine==null)
		{
			jine=0.0;
		}
		
		int  months=0;
		if ( jine==30.0)
				
		{
			months=1;
		}
		else if (jine==55.0)
		{
			months=2;
		}
		else
		{
			months=3;
			
		}

		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String uploadDate=sdf.format(new Date());
		Calendar c = Calendar.getInstance();//
		c.add(Calendar.MONTH, +months);
		String date=sdf.format(c.getTime());
		System.out.print(date);
		System.out.print(uploadDate);
	
		try
		{
			conn = ConnectionPool.getConn();
			if(conn!=null) System.out.println("Connection OK");
		}
		catch (Exception e) {
			  e.printStackTrace();
		}
		String strsql="";
		try
		{
		
			if(conn!=null)
			{
			    strsql =strsql +"update UserInfo set   [vipstrdate] =?,[vipenddate] =?,viptype='1' " +
			    		"where username='"+ name+"'";
			    pstmt=conn.prepareStatement(strsql);
			    pstmt.setString(1,uploadDate);
			    pstmt.setString(2, date);
			    int iupdateline = pstmt.executeUpdate();
			    if (iupdateline ==1)
			     {
			    	HttpSession session=req.getSession();
			    	UserInfoBean userinfo=(UserInfoBean) session.getAttribute("userinfo");
			    	if("0".equals(userinfo.getClasses())){
			    		userinfo.setClasses("1");
			    	}
			    	 out.print( "充值会员成功");
			    	 
			    	 }
			     else
			    {
			    	 out.print("充值失败");
			     }

			     strsql ="INSERT INTO [dbo].[AdIncome]([username] ,[money] ,[vip],[time])VALUES(?,?,1,?)";
			     pstmt=conn.prepareStatement(strsql);
			     pstmt.setString(1,name);
				 pstmt.setDouble(2, jine);
				 pstmt.setString(3,uploadDate);
			     iupdateline = pstmt.executeUpdate();
			     if (iupdateline ==1)
			     {
			    	 
			     }
			     else
			     {
			    	 out.print("充值失败");
			     }
			     
			
				out.close();
			}
		}
		catch (Exception e) {
			  
			   e.printStackTrace();
				out.print("数据库连接失败"+ strsql);
				out.close();
		}	
		
	
	}
}