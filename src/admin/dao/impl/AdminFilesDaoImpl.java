package admin.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import common.bean.FileInfoBean;
import common.utils.ConnectionPool;
import common.utils.FieldCheck;

import admin.dao.AdminFilesDao;

public class AdminFilesDaoImpl implements AdminFilesDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public int getTotalRecordNumber(HashMap queryInforMap) {
		int i=0;
		int x;
		int totalNum=0;
		String startTime=FieldCheck.convertNullToEmpty((String) queryInforMap.get("startTime"));
		String endTime=FieldCheck.convertNullToEmpty((String) queryInforMap.get("endTime"));
		String in_filename=FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_filename"));
		
		conn=ConnectionPool.getConn();
		
		try {
			if(startTime.equals("")&&endTime.equals("")){
				String sql="select count(*) num from FileInfo  where filename like ? and filestate='有效' ";//and u.vipenddate between ? and ?
			
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_filename+ "%");
		}else if(!startTime.equals("")&&endTime.equals("")){
			String sql="select count(*) num from FileInfo  where filename like ? and uploaddate > ? and filestate='有效' ";//and u.vipenddate between ? and ?
			
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_filename + "%");
			pstmt.setString(2,startTime);
		}else if(startTime.equals("")&&!endTime.equals("")){
			String sql="select count(*) num from FileInfo  where filename like ? and uploaddate < ? and filestate='有效'";//and u.vipenddate between ? and ?
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_filename + "%");
			pstmt.setString(2,endTime);
		}else{
			String sql="select count(*) num from FileInfo  where filename like ? and filestate='有效' and uploaddate between ? and ? ";//
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_filename + "%");
			pstmt.setString(2,startTime);
			pstmt.setString(3,endTime);
		}
			
			rs=pstmt.executeQuery();
			
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
		String in_filename=FieldCheck.convertNullToEmpty((String) queryInforMap.get("in_filename"));
		List<FileInfoBean> List = new ArrayList<FileInfoBean>();
		
		conn = ConnectionPool.getConn();
		
		try {
			if(startTime.equals("")&&endTime.equals("")){
				String sql="select id, filename,filetype,downloadnum,username,uploaddate,sate " +
						"from(select id,  filename,filetype,downloadnum,username,uploaddate,sate, ROW_NUMBER() over (order by uploaddate desc) rn  " +
						"from FileInfo  where  filename like ? and filestate='有效' " +
						") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
			
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_filename+ "%");
			pstmt.setInt(2, fromCount);
			pstmt.setInt(3, endCount+1);
		}else if(!startTime.equals("")&&endTime.equals("")){
			String sql="select id, filename,filetype,downloadnum,username,uploaddate,sate " +
					"from(select id, filename,filetype,downloadnum,username,uploaddate,sate, ROW_NUMBER() over (order by uploaddate desc) rn  " +
					"from FileInfo  where  filename like ? and filestate='有效' " +
					"and uploaddate >= ?" +
					") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_filename+ "%");
			pstmt.setString(2,startTime);
			pstmt.setInt(3, fromCount);
			pstmt.setInt(4, endCount+1);
		}else if(startTime.equals("")&&!endTime.equals("")){
			String sql="select id, filename,filetype,downloadnum,username,uploaddate,sate " +
					"from(select id, filename,filetype,downloadnum,username,uploaddate,sate, ROW_NUMBER() over (order by uploaddate desc) rn  " +
					"from FileInfo  where  filename like ? and filestate='有效' " +
					"and uploaddate <= ?" +
					") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_filename + "%");
			pstmt.setString(2,endTime);
			pstmt.setInt(3, fromCount);
			pstmt.setInt(4, endCount+1);
		}else{
			String sql="select id, filename,filetype,downloadnum,username,uploaddate,sate " +
					"from(select id, filename,filetype,downloadnum,username,uploaddate,sate, ROW_NUMBER() over (order by uploaddate desc) rn  " +
					"from FileInfo  where  filename like ? and filestate='有效' " +
					"and uploaddate between ? and ?" +
					") as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<? ";//and u.vipenddate between ? and ?
			
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ in_filename + "%");
			pstmt.setString(2,startTime);
			pstmt.setString(3,endTime);
			pstmt.setInt(4, fromCount);
			pstmt.setInt(5, endCount+1);
		}
		
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				FileInfoBean fileInfoBean=new FileInfoBean();
				fileInfoBean.setFileId(rs.getInt(1));
				fileInfoBean.setFileName(rs.getString(2));
				fileInfoBean.setFileType(rs.getString(3));
				fileInfoBean.setDownloadnum(rs.getInt(4));
				fileInfoBean.setUsername(rs.getString(5));
				fileInfoBean.setUploadDate(rs.getString(6));
				fileInfoBean.setSate(rs.getInt(7));
				
				List.add(fileInfoBean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.close(pstmt, rs, conn);
		}
		return List;
	}
	@Override
	public Boolean setSate(int sate,int fileId) {
		conn = ConnectionPool.getConn();

		
		try {
			Statement pstmt = conn.createStatement();
			String sql = "update FileInfo set sate="+sate+" where id='"+fileId+"'";
		
			pstmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			ConnectionPool.close(pstmt, rs, conn);
		}

		return true;
	}

	public FileInfoBean findFileById(int fileId)
	{
		FileInfoBean fileInfoBean=new FileInfoBean();
		int result = 0; 
		
		conn = ConnectionPool.getConn();

		
		String sql = "SELECT * FROM FileInfo WHERE  id = ? and filestate='有效'";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fileId);
			
			
			rs = pstmt.executeQuery();

			while (rs.next()) { 
				fileInfoBean.setFileName(rs.getString("filename"));
				fileInfoBean.setFileForm(rs.getString("fileform"));
				fileInfoBean.setFileId(fileId);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			ConnectionPool.close(pstmt, rs, conn);
		}

		return fileInfoBean;
	}
}
