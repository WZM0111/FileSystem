package admin.dao;

import java.util.HashMap;
import java.util.List;

import common.bean.UserInfoBean;

public interface AdminUserDao {
	/**
	 * 用户数量
	 * @return
	 */
	public int userCount();

	/**
	 * 文件数量
	 * @return
	 */
	public int fileCount();

	/**
	 * 评论数量
	 * @return
	 */
	public int commentCount();

	/**
	 * 会员数量
	 * @return
	 */
	public int vipCount();
	
	/**
	 * 网站收益
	 * @return
	 */
	public double incomeSum();
	
	public int adminLogin(String ad_account,String pswd);
	

	public int getTotalRecordNumber(HashMap queryInforMap);

	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap);
	

}
