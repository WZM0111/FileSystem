package common.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.utils.ConnectionPool;
import common.bean.IncomeRecordBean;
import common.bean.UserInfoBean;
import common.dao.UserDao;

public class UserDaoImpl implements UserDao {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	@Override
	public int userLogin(String user_account, String pswd) {
		int result = 0; 
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "SELECT count(L.username) FROM Login L WHERE  L.username = ? AND L.password = ?";

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_account);
			pstmt.setString(2, pswd);
			
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			// 5.�жϽ��
			while (rs.next()) { // �ӽ����ȡ����¼��
				int num = rs.getInt(1);

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

	@Override
	public int userRegist(String new_user_account, String pswd) {
		
		int result = 0; // ��ʼ��Ϊ0���趨��ʼ���Ϊ�û�������벻��ȷ
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql1 = "INSERT INTO [dbo].[UserInfo]([username],[nickname]) VALUES ('"+new_user_account+"','"+new_user_account+"') " +
					  "INSERT INTO [dbo].[Login]([username],[password]) VALUES ('"+new_user_account+"','"+pswd+"')  ";
		//String sql2 = "INSERT INTO [dbo].[User_Login]([user_account],[password]) VALUES ("+new_user_account+","+pswd+")";
		try {
			
			pstmt = conn.prepareStatement(sql1);
			//pstmt = conn.prepareStatement(sql2);
			// 4.����ִ��sql���
			pstmt.executeUpdate();
			
			result = 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ�����
			ConnectionPool.close(pstmt, rs, conn);
		}

		return result;
	}
	
	public boolean userIfExist(String user_account) {
		boolean result = false; // ��ʼ��Ϊ0���趨��ʼ���Ϊ�û�������벻��ȷ
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "SELECT count(L.username) FROM Login L WHERE  L.username = ?";

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_account);
			
			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			// 5.�жϽ��
			while (rs.next()) { // �ӽ����ȡ����¼��
				int num = rs.getInt(1);

				// ����¼�����0����ʾ��ȷ��½����result��Ϊ1
				if (num > 0) {
					result = true;
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


	@Override
	public UserInfoBean findUserByName(String useraccount) {
		UserInfoBean userInfoBean=new UserInfoBean();
		conn = ConnectionPool.getConn();
		String sql="select username,viptype,vipenddate,account from UserInfo where username=? ";
		try {
			// 3.给占位符赋值
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, useraccount);
			
			// 4.发送执行sql语句
			rs = pstmt.executeQuery();

			// 5.判断结果
			if (rs.next()) {
				
				String username=rs.getString(1);
				String viptype = rs.getString(2);
				
				userInfoBean.setUser_account(username);
				userInfoBean.setClasses(viptype);		
				userInfoBean.setVipenddate(rs.getString(3));
				userInfoBean.setBalance(rs.getDouble(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 释放连接
			ConnectionPool.close(pstmt, rs, conn);
		}

		return userInfoBean;
	}
	
    
	
	@Override
	public UserInfoBean findUser(String username) {
		UserInfoBean user=new UserInfoBean();
		
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = ConnectionPool.getConn();
		try {
			
			String sql = "select username,nickname,age,sex FROM UserInfo WHERE username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				//int id=rs.getInt(1);
				String name=rs.getString(1);
				String nickname = rs.getString(2);
				int age = rs.getInt(3);
				String sex = rs.getString(4);
				//String filenumber = rs.getString(6);
				//String viptype = rs.getString(7);
				//String account = rs.getString(8);
							
								
				user.setUser_account(name);
				user.setUsername(nickname);
				user.setAge(age);
				user.setGender(sex);
						
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取用户失败：" + e.getMessage());
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

		return user;
	}

	@Override
	public void updateUserInfo(UserInfoBean user) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = ConnectionPool.getConn();
			String sql="update userinfo set nickname=?,age=?,sex=? where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,user.getUsername());
			ps.setInt(2,user.getAge());
			ps.setString(3,user.getGender());
			ps.setString(4,user.getUser_account());
			
			ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("修改用户失败：" + e.getMessage());
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

	public void addUserInfo(UserInfoBean user){
		
		Connection connection = null;
		PreparedStatement ps = null;
		try {
			conn = ConnectionPool.getConn();
			String sql="update userinfo set nickname=?,age=?,sex=? where username=?";
			ps=conn.prepareStatement(sql);
			
			ps.setString(1,user.getUsername());
			ps.setInt(2,user.getAge());
			ps.setString(3,user.getGender());
			ps.setString(4,user.getUser_account());
			
			ps.executeUpdate();
			
		}catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("添加用户信息失败：" + e.getMessage());
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
	
	public double getIncome(String username){
		double num=0;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = ConnectionPool.getConn();
		try {
			
			String sql = "select sum(money) from UserIncome where usename=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取收益失败：" + e.getMessage());
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
		return num;
	}
	
	public int getDownloadNum(String username){
		int num = 0;
		
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = ConnectionPool.getConn();
		try {
			
			String sql = "select sum(downloadnum) from FileInfo where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取下载量失败：" + e.getMessage());
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
		return num;
	}
	
	public List<IncomeRecordBean> getIncomeRecord(String username){
		List<IncomeRecordBean> records = new ArrayList<IncomeRecordBean>();
		
		
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = ConnectionPool.getConn();
		try {
			
			String sql = "select filename,fileform,incomedate,price*0.7 " +
					"from fileinfo f  join UserIncome i on f.id=i.fileid " +
					"where i.usename=? order by incomedate asc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			while(rs.next()) {
				String filename = rs.getString(1);
				String fileform = rs.getString(2);
				String downloaddate = rs.getString(3);
				double price = rs.getDouble(4);
				
				IncomeRecordBean record = new IncomeRecordBean();
				
				record.setFilename(filename);
				record.setFileform(fileform);
				record.setDownloaddate(downloaddate);
				record.setPrice(price);
				
				records.add(record);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取下载记录失败：" + e.getMessage());
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
		
		return records;
	}
	
	public double findUserAccount(String username){
		double balance = 0;
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = ConnectionPool.getConn();
		try {
			
			String sql = "select account from userinfo where username=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			rs = ps.executeQuery();
			if (rs.next()) {
				balance = rs.getDouble(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("获取账户余额失败：" + e.getMessage());
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
		return balance;
	}
	
	public void changeIncome(String username){
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		conn = ConnectionPool.getConn();
		try {
			
			String sql = "exec pro_changeincome @username=?,@income=0";
			ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException("转换余额失败：" + e.getMessage());
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
	public String updateviptype(String user_account) {
		// TODO Auto-generated method stub
		
		// 1.创建连接
		String a="0";
		conn = ConnectionPool.getConn();
		// 2.创建sql
		String sql = "update UserInfo set viptype='0' where username=?";
		try {
			// 3.给占位符赋值
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,user_account);
	
			
			// 4.发送执行sql语句
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// 释放连接
			ConnectionPool.close(pstmt, rs, conn);
		}
		return a;
	}
}
