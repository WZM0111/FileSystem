package admin.dao;

import java.util.HashMap;
import java.util.List;

import common.bean.UserInfoBean;

public interface AdminUserDao {
	/**
	 * �û�����
	 * @return
	 */
	public int userCount();

	/**
	 * �ļ�����
	 * @return
	 */
	public int fileCount();

	/**
	 * ��������
	 * @return
	 */
	public int commentCount();

	/**
	 * ��Ա����
	 * @return
	 */
	public int vipCount();
	
	/**
	 * ��վ����
	 * @return
	 */
	public double incomeSum();
	
	public int adminLogin(String ad_account,String pswd);
	

	public int getTotalRecordNumber(HashMap queryInforMap);

	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap);
	

}
