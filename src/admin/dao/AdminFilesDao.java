package admin.dao;

import java.util.HashMap;
import java.util.List;

import common.bean.FileInfoBean;

public interface AdminFilesDao {
	public int getTotalRecordNumber(HashMap queryInforMap);

	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap);
	
	public Boolean setSate(int sate ,int fileId);
	
	public FileInfoBean findFileById(int fileId);
}
