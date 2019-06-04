package common.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import com.microsoft.sqlserver.jdbc.SQLServerStatement;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import common.utils.ConnectionPool;

public class addchongzhi extends HttpServlet {

	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String name = req.getParameter("txtusername");
		if (name ==null)
		{
		  name ="";
		}
		String jine=req.getParameter("miane");
		if (jine ==null)
		{
			jine="0";
		}
		
		String  months="0";
		if ( jine.equals("9.9"))
				
		{
			months="1";
		}
		else if (jine.equals("19.9"))
		{
			months="2";
		}
		else
		{
			months="3";
			
		}
		
		Statement stmt = null;         
		Connection conn = null;
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
			    stmt=conn.createStatement();			    
			    strsql="update UserInfo set account= account + " +jine ;
			    
			    strsql =strsql +" where username='"+ name+"'";
			     int iupdateline = stmt.executeUpdate(strsql);
			     if (iupdateline ==1)
			     {
			    	 out.print("成功给用户"+ name +"充值ֵ"+jine+"元");
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
				out.print("数据库连接错误"+ strsql);
				out.close();
		}	
				
	
	}
}