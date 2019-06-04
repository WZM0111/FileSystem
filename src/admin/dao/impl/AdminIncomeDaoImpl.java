package admin.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import common.bean.FileInfoBean;
import common.utils.ConnectionPool;
import common.utils.FieldCheck;

import admin.bean.AdminIncomeBean;
import admin.dao.AdminIncomeDao;

public class AdminIncomeDaoImpl implements AdminIncomeDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	@Override
	public int getTotalRecordNumber(HashMap queryInforMap) {
		int totalNum=0;
		String startTime=FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime"));
		String endTime=FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime"));
		String in_upuser=FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_upuser"));
		//1.获取连接
		conn=ConnectionPool.getConn();
		//2.创建sql
		try {
			if(startTime.equals("")&&endTime.equals("")){
				String sql="select count(*) num from AdIncome ad,FileInfo f   where ad.fileid=f.id and f.username like ? ";//and u.vipenddate between ? and ?
			// 3.给占位符赋值user_nm
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_upuser+ "%");
		}else if(!startTime.equals("")&&endTime.equals("")){
			String sql="select count(*) num from AdIncome ad,FileInfo f   where ad.fileid=f.id and f.username like ? and time > ? ";//and u.vipenddate between ? and ?
			// 3.给占位符赋值user_nm
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_upuser + "%");
			pstmt.setString(2,startTime);
		}else if(startTime.equals("")&&!endTime.equals("")){
			String sql="select count(*) num from AdIncome ad,FileInfo f   where ad.fileid=f.id and f.username like ? and time < ? ";//and u.vipenddate between ? and ?
			// 3.给占位符赋值user_nm
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_upuser + "%");
			pstmt.setString(2,endTime);
		}else{
			String sql="select count(*) num from AdIncome ad,FileInfo f   where ad.fileid=f.id and f.username like ? and time between ? and ? ";//
			// 3.给占位符赋值user_nm
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_upuser + "%");
			pstmt.setString(2,startTime);
			pstmt.setString(3,endTime);
		}
			//4.发送执行sql
			rs=pstmt.executeQuery();
			//5.从结果集中取数据
			while(rs.next())
			{
				totalNum=rs.getInt("num");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionPool.close(pstmt, rs, conn);
		}
		return totalNum;
	}

	@Override
	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap) {
		String startTime=FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime"));
		String endTime=FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime"));
		String in_upuser=FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_upuser"));
		
		
		List<AdminIncomeBean> List = new ArrayList<AdminIncomeBean>();
		// 1.获取连接
		conn = ConnectionPool.getConn();
		// 2.创建sql
		try {
			if(in_upuser!=""){
					if(startTime.equals("")&&endTime.equals("")){
						String sql="select  down,filename,up,money,time,vip " +
								"from(select ad.username down,f.filename,f.username up,ad.money,ad.time,ad.vip , ROW_NUMBER() over (order by time) rn   " +
								"from AdIncome ad, FileInfo f  where ad.fileid=f.id and f.username  like ?  " +
								") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<?";//and u.vipenddate between ? and ?
					// 3.给占位符赋值user_nm
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,"%"+ in_upuser+ "%");
					pstmt.setInt(2, fromCount);
					pstmt.setInt(3, endCount+1);
				}else if(!startTime.equals("")&&endTime.equals("")){
					String sql="select  down,filename,up,money,time,vip " +
							"from(select ad.username down,f.filename,f.username up,ad.money,ad.time,ad.vip , ROW_NUMBER() over (order by time) rn   " +
							"from AdIncome ad, FileInfo f  where ad.fileid=f.id and f.username  like ?  " +
							"and ad.time >= ?" +
							") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
					// 3.给占位符赋值user_nm
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,"%"+ in_upuser+ "%");
					pstmt.setString(2,startTime);
					pstmt.setInt(3, fromCount);
					pstmt.setInt(4, endCount+1);
				}else if(startTime.equals("")&&!endTime.equals("")){
					String sql="select  down,filename,up,money,time,vip " +
							"from(select ad.username down,f.filename,f.username up,ad.money,ad.time,ad.vip , ROW_NUMBER() over (order by time) rn   " +
							"from AdIncome ad, FileInfo f  where ad.fileid=f.id and f.username  like ?  " +
							"and ad.time <= ?" +
							") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
					// 3.给占位符赋值user_nm
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,"%"+ in_upuser + "%");
					pstmt.setString(2,endTime);
					pstmt.setInt(3, fromCount);
					pstmt.setInt(4, endCount+1);
				}else{
					String sql="select  down,filename,up,money,time,vip " +
							"from(select ad.username down,f.filename,f.username up,ad.money,ad.time,ad.vip , ROW_NUMBER() over (order by time) rn   " +
							"from AdIncome ad, FileInfo f  where ad.fileid=f.id and f.username  like ?  " +
							"and ad.time between ? and ?" +
							") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
					// 3.给占位符赋值user_nm
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,"%"+ in_upuser + "%");
					pstmt.setString(2,startTime);
					pstmt.setString(3,endTime);
					pstmt.setInt(4, fromCount);
					pstmt.setInt(5, endCount+1);
				}
			}else{
				if(startTime.equals("")&&endTime.equals("")){
					String sql="select  down_user,filename,up_user,money,time,vip " +
							"from(select username  down_user, " +
							"(case when vip=1 then '' else(select filename from FileInfo f,AdIncome ad where f.id=ad.fileid )  end) as filename ," +
							"(case when vip=1 then '' else(select f.username  from FileInfo f,AdIncome ad where f.id=ad.fileid )  end) as up_user," +
							"money,time,vip,ROW_NUMBER() over (order by time) rn " +
							"from AdIncome " +
							")as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<?";//and u.vipenddate between ? and ?
				// 3.给占位符赋值user_nm
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, fromCount);
				pstmt.setInt(2, endCount+1);
			}else if(!startTime.equals("")&&endTime.equals("")){
				String sql="select  down_user,filename,up_user,money,time,vip " +
						"from(select username  down_user, " +
						"(case when vip=1 then '' else(select filename from FileInfo f,AdIncome ad where f.id=ad.fileid )  end) as filename ," +
						"(case when vip=1 then '' else(select f.username  from FileInfo f,AdIncome ad where f.id=ad.fileid )  end) as up_user," +
						"money,time,vip,ROW_NUMBER() over (order by time) rn " +
						"from AdIncome where time >= ?" +
						")as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<?";//and u.vipenddate between ? and ?
				// 3.给占位符赋值user_nm
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,startTime);
				pstmt.setInt(2, fromCount);
				pstmt.setInt(3, endCount+1);
			}else if(startTime.equals("")&&!endTime.equals("")){
				String sql="select  down_user,filename,up_user,money,time,vip " +
						"from(select username  down_user, " +
						"(case when vip=1 then '' else(select filename from FileInfo f,AdIncome ad where f.id=ad.fileid )  end) as filename ," +
						"(case when vip=1 then '' else(select f.username  from FileInfo f,AdIncome ad where f.id=ad.fileid )  end) as up_user," +
						"money,time,vip,ROW_NUMBER() over (order by time) rn " +
						"from AdIncome where time <= ?" +
						")as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<?";//and u.vipenddate between ? and ?
				// 3.给占位符赋值user_nm
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,endTime);
				pstmt.setInt(2, fromCount);
				pstmt.setInt(3, endCount+1);
			}else{
				String sql="select  down_user,filename,up_user,money,time,vip " +
						"from(select username  down_user, " +
						"(case when vip=1 then '' else(select filename from FileInfo f,AdIncome ad where f.id=ad.fileid )  end) as filename ," +
						"(case when vip=1 then '' else(select f.username  from FileInfo f,AdIncome ad where f.id=ad.fileid )  end) as up_user," +
						"money,time,vip,ROW_NUMBER() over (order by time) rn " +
						"from AdIncome where time between ? and ?" +
						")as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<?";//and u.vipenddate between ? and ?
				// 3.给占位符赋值user_nm
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,startTime);
				pstmt.setString(2,endTime);
				pstmt.setInt(3, fromCount);
				pstmt.setInt(4, endCount+1);
			}
			}
			// 4.发送执行sql
			//System.out.println("nishishabi");
			rs = pstmt.executeQuery();
			//System.out.println("nicaishi ");
			
			// 5.从结果集中取数据
			while (rs.next()) {
				AdminIncomeBean bean=new AdminIncomeBean();
				bean.setDown_user(rs.getString(1));
				
				bean.setFilename(rs.getString(2));
				bean.setUp_user(rs.getString(3));
				
				bean.setMoney(rs.getDouble(4));
				bean.setDowntime(rs.getString(5));
				bean.setIs_vip(rs.getInt(6));
				
				List.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.close(pstmt, rs, conn);
		}
		return List;
	}

}
