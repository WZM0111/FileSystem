package common.dao;

import common.bean.UserPasswordBean;


public interface ResetPasswordDao {
	/**
	 ����û�������
	 */
   public  int findPassword(UserPasswordBean userPasswordBean);
   
   /**
           ����û�����
    */
   public  int updatePassword(UserPasswordBean userPasswordBean);
}
