package common.dao;

import common.bean.UserPasswordBean;


public interface ResetPasswordDao {
	/**
	 检查用户的密码
	 */
   public  int findPassword(UserPasswordBean userPasswordBean);
   
   /**
           变更用户密码
    */
   public  int updatePassword(UserPasswordBean userPasswordBean);
}
