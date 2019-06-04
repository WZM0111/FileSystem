package admin.service.impl;

import java.util.HashMap;
import java.util.List;

import common.bean.PageInforBean;
import common.bean.UserInfoBean;
import common.service.PageInforService;


import admin.dao.AdminUserDao;
import admin.dao.impl.AdminUserDaoImpl;
import admin.service.AdminUserService;

public class AdminUserServiceImpl extends PageInforService implements AdminUserService {
	AdminUserDao adminDao=new AdminUserDaoImpl();
	
	public int getTotalRecordNumber(HashMap queryInforMap) {
		return adminDao.getTotalRecordNumber(queryInforMap);
		
	}

	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap) {
		return adminDao.getComponentPageList(fromCount, endCount, queryInforMap);
	}

}
