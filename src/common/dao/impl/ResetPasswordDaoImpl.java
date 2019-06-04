package common.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.utils.ConnectionPool;

import common.bean.UserPasswordBean;
import common.dao.ResetPasswordDao;

public class ResetPasswordDaoImpl implements ResetPasswordDao {

	/** ������ݿ�����õ��Ķ��� **/
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public int findPassword(UserPasswordBean userPasswordBean) {
		String userpswd = userPasswordBean.getUserpswd();// ��ǰ����
		String username = userPasswordBean.getUsername();// �û�cd

		// TODO Auto-generated method stub
		int result = 0; // ��ʼ��Ϊ0���趨��ʼ���Ϊ��һ��
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "select * from Login where username=? and password=?";

		// System.out.println(uder_pass+"uder_pass");
		// System.out.println(user_cd+"user_cd");

		try {
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, userpswd);

			// 4.����ִ��sql���
			rs = pstmt.executeQuery();

			boolean next = false;
			next = rs.next();
			// System.out.println(next+"rs.next1");

			// 5.�жϽ��
			if (next) { // �ӽ����ȡ����¼��
				result = 1;
				// System.out.println(result+"result1");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ���
			ConnectionPool.close(pstmt, rs, conn);

		}
		// System.out.println(result+"result11");
		return result;
	}

	@Override
	public int updatePassword(UserPasswordBean userPasswordBean) {
		String username = userPasswordBean.getUsername();// �û�cd
		// String uder_cd =adminUserPasswordBean.getUser_cd();
		String newpswd = userPasswordBean.getNewpswd();// ������

		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		int result = 0;
		// 1.��������
		conn = ConnectionPool.getConn();

		// 2.����sql
		String sql = "update Login set password = ? where username = ?";

		try { 
			// 3.��ռλ��ֵ
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newpswd);
			pstmt.setString(2, username);

			// 4.����ִ��sql���
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			// �ͷ���
			ConnectionPool.close(pstmt, rs, conn);

		}
		// System.out.println(result+"result22");
		return result;
	}

}
