package common.dao;

import java.util.List;

import common.bean.IncomeRecordBean;
import common.bean.UserInfoBean;

public interface UserDao {
	/**
	 * 用户登录
	 * @param user_account
	 * @param pswd
	 */
	public int userLogin(String user_account,String pswd);
	
	/**
	 * 注册
	 * @param new_user_account
	 * @param pswd
	 * @return
	 */
	public int userRegist(String new_user_account,String pswd);
	/**
	 * 
	 * 用户是否存在
	 * @param user_account
	 * @return
	 */
	public boolean userIfExist(String user_account);

	/**
	 * 根据用户账号查找用户信息
	 * 
	 * @param useraccount
	 * @return
	 */
	public UserInfoBean findUserByName(String useraccount);

	/**
	 * 根据用户名查找用户个人信息
	 * 
	 * @param username
	 * @return
	 */
	public UserInfoBean findUser(String username);

	/**
	 * 修改用户信息
	 * 
	 * @param user
	 * @return
	 */
	public void updateUserInfo(UserInfoBean user);

	/**
	 * 增加用户信息
	 * 
	 * @param user
	 */
	public void addUserInfo(UserInfoBean user);

	/**
	 * 根据用户名查询收益
	 * 
	 * @param username
	 * @return
	 */
	public double getIncome(String username);

	/**
	 * 根据用户名查询下载量
	 * 
	 * @param username
	 * @return
	 */
	public int getDownloadNum(String username);

	/**
	 * 根据用户名查询下载记录
	 * 
	 * @param username
	 * @return
	 */
	public List<IncomeRecordBean> getIncomeRecord(String username);

	/**
	 * 根据用户名查询用户余额
	 * 
	 * @param username
	 * @return
	 */
	public double findUserAccount(String username);

	/**
	 * 个人收益兑换成余额
	 * 
	 * @param username
	 */
	public void changeIncome(String username);
	
	public String updateviptype(String user_account);
}
