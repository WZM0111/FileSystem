package common.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import common.bean.FileInfoBean;
import common.dao.FileDao;
import common.utils.ConnectionPool;
import common.utils.FieldCheck;
import common.utils.PageBean;


public class FileDaoImpl implements FileDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	@Override
	public List<FileInfoBean> findType() {
		List<FileInfoBean> fileinfolist=new ArrayList<FileInfoBean>();
		conn=ConnectionPool.getConn();
		
	String sql="select distinct filetype from FileInfo";
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//5.从结果集中取数据
			while(rs.next())
			{
				
				FileInfoBean fileinfo=new FileInfoBean();
				
				fileinfo.setFileType(rs.getString("filetype"));
				
				fileinfolist.add(fileinfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionPool.close(pstmt, rs, conn);
		}
		
		
		return fileinfolist;
	}
	public List<FileInfoBean> findname(String filetype) {
		
		List<FileInfoBean> fileinfolist=new ArrayList<FileInfoBean>();
		conn=ConnectionPool.getConn();
		
		String sql="select top 6 id,filename,fileform,introduce from FileInfo where filetype=? and filestate='有效' and sate=1";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, filetype);
			rs=pstmt.executeQuery();
			//5.从结果集中取数据
			while(rs.next())
			{
				
				FileInfoBean fileinfo1=new FileInfoBean();
				
				int id=rs.getInt("id");
				String filename=rs.getString("filename");
				String fileform=rs.getString("fileform");
				String introduce=rs.getString("introduce");
				
				fileinfo1.setFileId(id);
				fileinfo1.setFileName(filename);
				fileinfo1.setFileForm(fileform);
				fileinfo1.setIntroduce(introduce);
				
				fileinfolist.add(fileinfo1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionPool.close(pstmt, rs, conn);
		}
		
		
		return fileinfolist;
	}
	public void add(FileInfoBean fileinfobean) {
		
		conn=ConnectionPool.getConn();
		String sql="insert into FileInfo(filename,filetype,fileform,username,introduce,price,uploaddate,filestate,sate) values(?,?,?,?,?,?,?,'有效',0)";
		try {
			// 3.给占位符赋值
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setString(1, fileinfobean.getFileName());
			
			pstmt.setString(2, fileinfobean.getFileType());
			pstmt.setString(3, fileinfobean.getFileForm());
			pstmt.setString(4, fileinfobean.getUsername());
			pstmt.setString(5, fileinfobean.getIntroduce());
			pstmt.setDouble(6, fileinfobean.getPrice());
			pstmt.setString(7, fileinfobean.getUploadDate());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 释放连接
			ConnectionPool.close(pstmt, rs, conn);
		}
}
	@Override
	public PageBean<FileInfoBean> getFilesList(String filetype, int page,
			int pageSize) {
		PageBean<FileInfoBean> pageBean=null;

		conn=ConnectionPool.getConn();
		int total=0;
		String sql = "SELECT COUNT(*) FROM FileInfo WHERE filetype=? and filestate='有效' and sate=1";
		try {
		
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, filetype);
			rs=pstmt.executeQuery();
			//5.从结果集中取数据
	
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			//记录列表
			List<FileInfoBean> files =new ArrayList<FileInfoBean>();
			sql="SELECT TOP "+pageSize+" id,fileform,filename,username,downloadnum,uploaddate FROM FileInfo WHERE filetype=? and filestate='有效' and sate=1"+
			"AND id NOT IN (SELECT TOP " +(page - 1) * pageSize + " id FROM FileInfo WHERE filetype=? and filestate='有效' and sate=1)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, filetype);
			pstmt.setString(2, filetype);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				int id=rs.getInt(1);
				String fileform=rs.getString(2);
				
				String filename=rs.getString(3);
				String username=rs.getString(4);
				int downloadnum=rs.getInt(5);				
				//java.sql.Date uploaddate=rs.getDate(5);
				String uploaddate=rs.getString(6); 
				FileInfoBean file=new FileInfoBean();
				file.setFileId(id);
				file.setFileForm(fileform);
				file.setFileName(filename);
				file.setUsername(username);
				file.setUploadDate(uploaddate);
				file.setDownloadnum(downloadnum);
				files.add(file);
				
			}
			
			pageBean =new PageBean<FileInfoBean>(page,pageSize,total,files);
		}  catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionPool.close(pstmt, rs, conn);
		}
		
	

		return pageBean;
	}
	
	@Override
	public FileInfoBean findfile(String filename, String username) {
		FileInfoBean fileinfos=new FileInfoBean();
		
		conn=ConnectionPool.getConn();
		
		String sql = "select id from FileInfo where filename=? and username=?";
		try {
		
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, filename);
			pstmt.setString(2, username);
			rs=pstmt.executeQuery();
			//5.从结果集中取数据
	
			if(rs.next()) {
				int fileid=rs.getInt(1);
				fileinfos.setFileId(fileid);
			}
		}  catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionPool.close(pstmt, rs, conn);
		}
	return fileinfos;
	}
		
	@Override
	public PageBean<FileInfoBean> findFilesByUsername(String username,int page,int pageSize) {
		PageBean<FileInfoBean> pageBean=null;
		
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ConnectionPool.getConn();
			
			//计算总记录数
			int total=0;
			String sql = "select count(*) from FileInfo where username=? and filestate='有效' ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			List<FileInfoBean> files = new ArrayList<FileInfoBean>();
			
			sql = "select top " + pageSize + " id,filename,filetype,uploaddate,downloadnum,price,sate " +
					"from FileInfo where username=? and filestate='有效' " +
					"and id not in (select top "+(page - 1) * pageSize+" id " +
					"from FileInfo where username=? and filestate='有效' order by uploaddate asc ) " +
					"order by uploaddate asc ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id=rs.getInt(1);
				String filename=rs.getString(2);
				String filetype=rs.getString(3);
				String uploaddate = rs.getString(4);
			    int downloadnum=rs.getInt(5);
			    int price = rs.getInt(6);
                int state=rs.getInt(7);
                
			    FileInfoBean file = new FileInfoBean();
				
			    file.setFileId(id);
				file.setFileName(filename);
				file.setFileType(filetype);
				file.setUploadDate(uploaddate);
				file.setDownloadnum(downloadnum);
				file.setPrice(price);
				file.setSate(state);
				files.add(file);
			}
			
			pageBean =new PageBean<FileInfoBean>(page,pageSize,total,files);
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取上传文件失败：" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("关闭ResultSet失败：" + e.getMessage());
			} finally {
				try {
					if (ps != null) {
						ps.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw new RuntimeException("关闭PreparedStatement失败："
							+ e.getMessage());
				} finally {
					try {
						if (connection != null) {
							connection.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
						throw new RuntimeException("关闭Connection失败："
								+ e.getMessage());
					}
				}
			}
		}

		return pageBean;
	}

	@Override
	public PageBean<FileInfoBean> findDfilesByUsername(String username,int page,int pageSize) {
		PageBean<FileInfoBean> pageBean=null;
		
		
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ConnectionPool.getConn();
			
			//计算总记录数
			int total=0;
			String sql = "select count(*) from Download where username=? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			List<FileInfoBean> files = new ArrayList<FileInfoBean>();
			
			conn = ConnectionPool.getConn();
//			sql = "select top "+pageSize+" d.id,filename,filetype,price,d.downloaddate " +
//					"from FileInfo f,Download d " +
//					"where f.id=d.fileid and f.username=? " +
//					"and d.id not in (select top "+(page - 1) * pageSize+" d.id " +
//					"from Download where username=? order by downloaddate asc ) "+
//					"order by downloaddate asc ";
			
//			sql = "select top "+pageSize+" d.id,filename,filetype,price,downloaddate " +
//					"from FileInfo f,Download d where f.id=d.fileid and d.username=? " +
//					"and d.id not in (select top "+(page - 1) * pageSize+" id from download where d.username =? " +
//					"order by downloaddate asc)order by downloaddate asc";
			
			sql = "select top "+pageSize+" d.id,filename,filetype,price,downloaddate " +
					"from FileInfo f,Download d where f.id=d.fileid " +
					"and d.username=? and d.id not in " +
					"(select top "+(page - 1) * pageSize+" id from download where username =? " +
					"order by downloaddate asc) order by downloaddate asc";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, username);
			rs = ps.executeQuery();
			while (rs.next()) {
				int id=rs.getInt(1);
				String filename=rs.getString(2);
				String filetype=rs.getString(3);
				int price = rs.getInt(4);
				String downloaddate = rs.getString(5);

			    FileInfoBean file = new FileInfoBean();
				
			    file.setFileId(id);
				file.setFileName(filename);
				file.setFileType(filetype);
				file.setPrice(price);
				file.setDownloaddate(downloaddate);
				
				files.add(file);
			}
			
			pageBean =new PageBean<FileInfoBean>(page,pageSize,total,files);
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取下载文件失败：" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("关闭ResultSet失败：" + e.getMessage());
			} finally {
				try {
					if (ps != null) {
						ps.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw new RuntimeException("关闭PreparedStatement失败："
							+ e.getMessage());
				} finally {
					try {
						if (connection != null) {
							connection.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
						throw new RuntimeException("关闭Connection失败："
								+ e.getMessage());
					}
				}
			}
		}

		return pageBean;
	}

	@Override
	public void deleteDownloadFileById(int id) {
		
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ConnectionPool.getConn();
			String sql = "delete from Download where id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("删除下载记录失败：" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("关闭ResultSet失败：" + e.getMessage());
			} finally {
				try {
					if (ps != null) {
						ps.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw new RuntimeException("关闭PreparedStatement失败："
							+ e.getMessage());
				} finally {
					try {
						if (connection != null) {
							connection.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
						throw new RuntimeException("关闭Connection失败："
								+ e.getMessage());
					}
				}
			}
		}
	}

	@Override
	public void deleteUploadFileById(int id) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ConnectionPool.getConn();
			//String sql = "delete from FileInfo where id=?";
			String sql2 = "update fileinfo set filestate='无效' where id=?";
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, id);
			ps.executeUpdate();
//			ps = conn.prepareStatement(sql);
//			ps.setInt(1, id);
//			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("删除文件失败：" + e.getMessage());
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("关闭ResultSet失败：" + e.getMessage());
			} finally {
				try {
					if (ps != null) {
						ps.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
					throw new RuntimeException("关闭PreparedStatement失败："
							+ e.getMessage());
				} finally {
					try {
						if (connection != null) {
							connection.close();
						}
					} catch (SQLException e) {
						e.printStackTrace();
						throw new RuntimeException("关闭Connection失败："
								+ e.getMessage());
					}
				}
			}
		}
	}
	

	@Override
	public int getTotalRecordNumber(HashMap queryInforMap) {
		String form=FieldCheck.convertNullToEmpty((String) queryInforMap.get("form"));
		//System.out.println("filedaoimpl"+form);
		int i=0;
		int x;
		int totalNum=0;
		//1.获取连接
		conn=ConnectionPool.getConn();
		//2.创建sql
		try {
			String sql="select count(*) as count from FileInfo where (filename like ? or filetype like ?) and fileform like ?  and filestate='有效' and sate=1 ";
			// 3.给占位符赋值user_nm
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+ FieldCheck.convertNullToEmpty((String) queryInforMap.get("content")) + "%");
			pstmt.setString(2, "%" + FieldCheck.convertNullToEmpty((String) queryInforMap.get("content")) + "%");
			//pstmt.setString(3, "%" + FieldCheck.convertNullToEmpty((String) queryInforMap.get("content")) + "%");
			pstmt.setString(3,"%" +form+ "%");
			
			//4.发送执行sql
			rs=pstmt.executeQuery();
			//5.从结果集中取数据
			while(rs.next())
			{
				totalNum=rs.getInt("count");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			ConnectionPool.close(pstmt, rs, conn);
		}
		return totalNum;
	}

	@Override
	public List getComponentPageList(int fromCount, int endCount,HashMap queryInforMap) {
		String content=FieldCheck.convertNullToEmpty((String) queryInforMap.get("content"));
		String form=FieldCheck.convertNullToEmpty((String) queryInforMap.get("form"));
		String type=FieldCheck.convertNullToEmpty((String) queryInforMap.get("types"));
		List<FileInfoBean> files = new ArrayList<FileInfoBean>();
		System.out.println("FileDaoImpl2"+form);
		System.out.println("FileDaoImpl2"+content);
		// 1.获取连接
		conn = ConnectionPool.getConn();
		// 2.创建sql
		try {
			if(!form.equals("")&&type.equals("")){
				String sql="select id, filename,filetype,fileform,substring(introduce,0,30)+'...' as introduce,uploaddate,username,downloadnum " +
						"from(select id, filename,filetype,fileform,substring(introduce,0,30)+'...' as introduce,uploaddate,username,downloadnum,ROW_NUMBER() over (order by id) rn " +
						"from FileInfo where (filename like ? or filetype like ?) and fileform like ? and filestate='有效' and sate=1)" +
						" as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<?" ;
				
				
				// 3.给占位符赋值user_nm
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + content + "%");
				pstmt.setString(2, "%" + content + "%");
				//pstmt.setString(3, "%" + content + "%");
				pstmt.setString(3, "%" + form + "%");
				pstmt.setInt(4, fromCount );
				pstmt.setInt(5, endCount+1 );		
			}else if(!content.equals(""))
			{
				String sql="select id, filename,filetype,fileform,substring(introduce,0,30)+'...' as introduce,uploaddate,username,downloadnum " +
						"from(select id, filename,filetype,fileform,substring(introduce,0,30)+'...' as introduce,uploaddate,username,downloadnum,ROW_NUMBER() over (order by id) rn " +
						"from fileinfo where (filename like ? or filetype like ?) and fileform like ?  and filestate='有效' and sate=1) " +
						" as  ShowSelect where ShowSelect.rn>=? AND ShowSelect.rn<?" ;
				
				// 3.给占位符赋值user_nm
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + content + "%");
				pstmt.setString(2, "%" + content + "%");
				//pstmt.setString(3, "%" + content + "%");
				pstmt.setString(3, "%" + form + "%");
				pstmt.setInt(4, fromCount );
				pstmt.setInt(5, endCount +1);	
			}
			// 4.发送执行sql
			rs = pstmt.executeQuery();
			// 5.从结果集中取数据
			while (rs.next()) {
				FileInfoBean file=new FileInfoBean();
				file.setFileId(rs.getInt(1));
				file.setFileName(rs.getString(2));
				file.setFileType(rs.getString(3));
				file.setFileForm( rs.getString(4));
				file.setIntroduce(rs.getString(5));
				file.setUploadDate(rs.getString(6));
				file.setUsername(rs.getString(7));
				file.setDownloadnum(rs.getInt(8));
				files.add(file);
				//System.out.println(rs);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectionPool.close(pstmt, rs, conn);
		}
		return files;
	}
	
	
	@Override
	public List<FileInfoBean> filetypes(String content) {
		List<FileInfoBean> files = new ArrayList<FileInfoBean>();
		//System.out.println(content);
		// 1.创建连接
		conn = ConnectionPool.getConn();
		// 2.创建sql
		//String sql = "SELECT distinct filename FROM FileInfo WHERE filename like '%" + content + "%'";
		String sql = "select top 5 downloadnum, filename FROM FileInfo WHERE filename like ? order by downloadnum desc";
		try {
			// 3.给占位符赋值
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "%" + content + "%");
			pstmt.setString(1, "%" + content + "%");
			// 4.发送执行sql语句
			rs = pstmt.executeQuery();
			//System.out.println(sql);
			// 5.判断结果
			while (rs.next()) {
				int downloadnum = rs.getInt(1);
				String filename = rs.getString(2);
				FileInfoBean file=new FileInfoBean();
				file.setDownloadnum(downloadnum);
				file.setFileName(filename);
				files.add(file);
				//System.out.println(type);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 释放连接
			ConnectionPool.close(pstmt, rs, conn);
		}
//		HttpSession session=request.getSession();
//		session.setAttribute("files");
		return files;
	}


}

