package admin.service;

import java.util.HashMap;
import java.util.List;

public interface AdminFileService {
	/**
	 * 根据检索条件，获取满足条件的记录总数
	 * @param queryInforMap
	 * @return
	 */
	public int getTotalRecordNumber(HashMap queryInforMap);
	
	
	/**
	 * 根据起始记录数、结束记录数以及检索条件，获取当前页的数据列表
	 * @param fromCount
	 * @param endCount
	 * @param queryInforMap
	 * @return
	 */
	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap);
	
	/**
	 * 得到
	 * @param usercd
	 * @param search
	 * @param currentPage
	 * @return
	 */
}
