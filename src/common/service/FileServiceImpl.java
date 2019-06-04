package common.service;

import java.util.HashMap;
import java.util.List;
import common.dao.FileDao;
import common.dao.impl.FileDaoImpl;
import common.service.FileService;
import common.service.PageInforService;

public class FileServiceImpl extends PageInforService implements FileService {
	FileDao filedao=new FileDaoImpl();
		
	public int getTotalRecordNumber(HashMap queryInforMap) {
		return filedao.getTotalRecordNumber(queryInforMap);
		
	}

	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap) {
		return filedao.getComponentPageList(fromCount, endCount, queryInforMap);
	}

}
