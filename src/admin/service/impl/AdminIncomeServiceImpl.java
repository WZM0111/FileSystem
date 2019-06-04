package admin.service.impl;

import java.util.HashMap;
import java.util.List;

import common.service.PageInforService;

import admin.dao.AdminIncomeDao;
import admin.dao.impl.AdminIncomeDaoImpl;
import admin.service.AdminIncomeService;

public class AdminIncomeServiceImpl extends PageInforService implements AdminIncomeService {
	AdminIncomeDao adminDao=new AdminIncomeDaoImpl();
	@Override
	public int getTotalRecordNumber(HashMap queryInforMap) {
		return adminDao.getTotalRecordNumber(queryInforMap);
	}

	@Override
	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap) {
		return adminDao.getComponentPageList(fromCount, endCount, queryInforMap);
	}

}
