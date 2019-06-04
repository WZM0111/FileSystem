package common.dao.impl;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.bean.Comment;
import common.bean.FileInfoBean;

import common.dao.showFileDao;
import common.utils.ConnectionPool;


public class showFileImpl implements showFileDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public FileInfoBean fileinfo(int id) {
		
		FileInfoBean file = new FileInfoBean();
			// 1.��������
			conn = ConnectionPool.getConn();
			// 2.����sql
			String sql = "SELECT * FROM FileInfo WHERE id=?";
			try {
				// 3.��ռλ��ֵ
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, id);
				// 4.����ִ��sql���
				rs = pstmt.executeQuery();
				//System.out.println(sql);
				// 5.�жϽ��
				while (rs.next()) {
					//Filebean file=new Filebean();
					file.setFileId(rs.getInt(1));
					file.setFileName(rs.getString(2));
					file.setFileType(rs.getString(3));
					file.setFileForm( rs.getString(4));
					file.setIntroduce(rs.getString(5));
					file.setUploadDate(rs.getString(6));
					file.setUsername(rs.getString(7));
					file.setDownloadnum(rs.getInt(8));
					file.setPrice(rs.getDouble(9));
					
					
					//String name=file.getUsername();
					//System.out.println("showFileImpl"+rs.getString(7));
				
				}
				
			} catch (SQLException e){
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				// �ͷ�����
				ConnectionPool.close(pstmt, rs, conn);
			}
			return file;
	
	}

	public List<Comment> filecomment(int id) {
		System.out.println("123321123");
		List<Comment> comments = new ArrayList<Comment>();
		// 1.��������
		conn = ConnectionPool.getConn();
		// 2.����sql
		String sql = "SELECT username,contents,date FROM Comment WHERE fileid=? order by date desc";
		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();
			//System.out.println(sql);
			// 5.�жϽ��
			while (rs.next()) {
				//comment.setId(rs.getString(1));
				Comment comment=new Comment();
				comment.setUsername(rs.getString(1));
				comment.setContents(rs.getString(2));
				comment.setDate(rs.getString(3));
				comments.add(comment);
				System.out.println("22222"+rs.getString(1));
				System.out.println("22222"+rs.getString(2));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}
		
		return comments;
	}

	@Override
	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		FileInfoBean file = new FileInfoBean();
		// 1.��������
		conn = ConnectionPool.getConn();
		// 2.����sql
		String sql = "insert into Comment(username,fileid,date,contents) values(?,?,?,?)";
		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment.getUsername());
			pstmt.setInt(2,comment.getFileid());
			pstmt.setString(3,comment.getDate());
			pstmt.setString(4,comment.getContents());
			// 4.����ִ��sql���
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}
	}
	
	@Override
	public void add(String username,int fileid,String date) {
		// TODO Auto-generated method stub
		// 1.��������
		conn = ConnectionPool.getConn();
		// 2.����sql
		String sql = "insert into Download values(?,?,?)";
		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,username);
			pstmt.setInt(2,fileid);
			pstmt.setString(3,date);
			// 4.����ִ��sql���
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}
	}
	
}


