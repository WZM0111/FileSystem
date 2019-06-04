package admin.dao.impl;

import admin.dao.AdminUserDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import common.utils.FieldCheck;

import common.bean.UserInfoBean;
import common.utils.ConnectionPool;
public class AdminUserDaoImpl implements AdminUserDao {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	@Override
	public int userCount() {

		int count=0;
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "SELECT count(*) FROM UserInfo";

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			// 5.�жϽ��
			while (rs.next()) { // �ӽ����ȡ����¼��
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}

		return count;
	}

	@Override
	public int fileCount() {
		int count=0;
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "SELECT count(*) FROM FileInfo";

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			// 5.�жϽ��
			while (rs.next()) { // �ӽ����ȡ����¼��
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}

		return count;
	}

	@Override
	public int commentCount() {
		int count=0;
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "SELECT count(*) FROM Comment";

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			// 5.�жϽ��
			while (rs.next()) { // �ӽ����ȡ����¼��
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}

		return count;
	}

	@Override
	public int vipCount() {
		int count=0;
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "SELECT count(*) FROM UserInfo where viptype='1'";

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			// 5.�жϽ��
			while (rs.next()) { // �ӽ����ȡ����¼��
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}

		return count;
	}


	@Override
	public int getTotalRecordNumber(HashMap queryInforMap) {
		int i=0;
		int x;
		int totalNum=0;
		//1.��ȡ����
		conn=ConnectionPool.getConn();
		//2.����sql
		try {
			if(FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime")).equals("")
					&&FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime")).equals("")){
				String sql="select count(*) num from UserInfo u,Login l where u.username=l.username " +
						"and u.username like ?  ";//and u.vipenddate between ? and ?
			// 3.��ռλ��ֵuser_nm
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_username")) + "%");
		}else if(!FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime")).equals("")
				&&FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime")).equals("")){
			String sql="select count(*) num from UserInfo u,Login l where u.username=l.username " +
					"and u.username like ? and u.vipenddate > ? ";//and u.vipenddate between ? and ?
			// 3.��ռλ��ֵuser_nm
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_username")) + "%");
			pstmt.setString(2,FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime")));
		}else if(FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime")).equals("")
				&&!FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime")).equals("")){
			String sql="select count(*) num from UserInfo u,Login l where u.username=l.username " +
					"and u.username like ? and u.vipenddate < ? ";//and u.vipenddate between ? and ?
			// 3.��ռλ��ֵuser_nm
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_username")) + "%");
			pstmt.setString(2,FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime")));
		}else{
			String sql="select count(*) num from UserInfo u,Login l where u.username=l.username " +
					"and u.username like ? and u.vipenddate between ? and ? ";//
			// 3.��ռλ��ֵuser_nm
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_username")) + "%");
			pstmt.setString(2,FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime")));
			pstmt.setString(3,FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime")));
		}
			//4.����ִ��sql
			rs=pstmt.executeQuery();
			//5.�ӽ����ȡ���
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
		System.out.println("AdminDaoImpl");
		String startTime=FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime"));
		String endTime=FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime"));
		String in_username=FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_username"));
		List<UserInfoBean> userList = new ArrayList<UserInfoBean>();
		// 1.��ȡ����
		conn = ConnectionPool.getConn();
		// 2.����sql
		try {
			if(startTime.equals("")&&endTime.equals("")){
				String sql="select username,nickname,viptype,vipenddate,filenumber,password " +
						"from(select u.username,nickname,viptype,vipenddate,filenumber,password,  ROW_NUMBER() over (order by u.username) rn " +
						"from UserInfo u,Login l where u.username=l.username and u.username like ? " +
						
						") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
			// 3.��ռλ��ֵuser_nm
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_username+ "%");
			pstmt.setInt(2, fromCount);
			pstmt.setInt(3, endCount+1);
		}else if(!startTime.equals("")&&endTime.equals("")){
			String sql="select username,nickname,viptype,vipenddate,filenumber,password " +
					"from(select u.username,nickname,viptype,vipenddate,filenumber,password,  ROW_NUMBER() over (order by u.username) rn " +
					"from UserInfo u,Login l where u.username=l.username and u.username like ? " +
					"and u.vipenddate > ?" +
					") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
			// 3.��ռλ��ֵuser_nm
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_username+ "%");
			pstmt.setString(2,startTime);
			pstmt.setInt(3, fromCount);
			pstmt.setInt(4, endCount+1);
		}else if(startTime.equals("")&&!endTime.equals("")){
			String sql="select username,nickname,viptype,vipenddate,filenumber,password " +
					"from(select u.username,nickname,viptype,vipenddate,filenumber,password,  ROW_NUMBER() over (order by u.username) rn " +
					"from UserInfo u,Login l where u.username=l.username and u.username like ? " +
					"and u.vipenddate < ?" +
					") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
			// 3.��ռλ��ֵuser_nm
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_username + "%");
			pstmt.setString(2,endTime);
			pstmt.setInt(3, fromCount);
			pstmt.setInt(4, endCount+1);
		}else{
			String sql="select username,nickname,viptype,vipenddate,filenumber,password " +
					"from(select u.username,nickname,viptype,vipenddate,filenumber,password,  ROW_NUMBER() over (order by u.username) rn " +
					"from UserInfo u,Login l where u.username=l.username and u.username like ? " +
					"and u.vipenddate between ? and ?" +
					") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
			// 3.��ռλ��ֵuser_nm
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_username + "%");
			pstmt.setString(2,startTime);
			pstmt.setString(3,endTime);
			pstmt.setInt(4, fromCount);
			pstmt.setInt(5, endCount+1);
		}
			// 4.����ִ��sql
			//System.out.println("nishishabi");
			rs = pstmt.executeQuery();
			//System.out.println("nicaishi ");
			
			// 5.�ӽ����ȡ���
			while (rs.next()) {
				UserInfoBean user = new UserInfoBean();
				
				user.setUser_account(rs.getString("username"));
		
				user.setUsername(rs.getString("nickname"));
				user.setClasses(rs.getString("viptype"));
				user.setVipenddate(rs.getString("vipenddate"));
				user.setUp_count(rs.getInt("filenumber"));
				user.setPassword(rs.getString("password"));
				
				userList.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.close(pstmt, rs, conn);
		}
		return userList;
	}

	@Override
	public double incomeSum() {
		double count=0;
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "select SUM(money) from AdIncome";

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			// 5.�жϽ��
			while (rs.next()) { // �ӽ����ȡ����¼��
				count = rs.getDouble(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}

		return count;
	}

	@Override
	public int adminLogin(String ad_account,String pswd) {
		int result = 0; // ��ʼ��Ϊ0���趨��ʼ���Ϊ�û�������벻��ȷ
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "SELECT count(id) num FROM Admin ad WHERE adminname = ? AND password = ?";

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ad_account);
			pstmt.setString(2, pswd);
			
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			// 5.�жϽ��
			while (rs.next()) { // �ӽ����ȡ����¼��
				int num = rs.getInt("num");

				// ����¼�����0����ʾ��ȷ��½����result��Ϊ1
				if (num > 0) {
					result = 1;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}

		return result;
	}

	

}
