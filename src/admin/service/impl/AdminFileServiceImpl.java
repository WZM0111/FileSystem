package admin.service.impl;

import java.util.HashMap;
import java.util.List;
import common.service.PageInforService;
import admin.dao.AdminFilesDao;
import admin.dao.impl.AdminFilesDaoImpl;
import admin.service.AdminFileService;

public class AdminFileServiceImpl extends PageInforService implements AdminFileService {
	AdminFilesDao adminDao=new AdminFilesDaoImpl();
	public int getTotalRecordNumber(HashMap queryInforMap) {
		return adminDao.getTotalRecordNumber(queryInforMap);
		
	}

	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap) {
		return adminDao.getComponentPageList(fromCount, endCount, queryInforMap);
	}
}
