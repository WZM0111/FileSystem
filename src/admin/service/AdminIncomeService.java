package admin.service;

import java.util.HashMap;
import java.util.List;

public interface AdminIncomeService {
	/**
	 * ���ݼ�����������ȡ���������ļ�¼����
	 * @param queryInforMap
	 * @return
	 */
	public int getTotalRecordNumber(HashMap queryInforMap);
	
	
	/**
	 * ������ʼ��¼����������¼���Լ�������������ȡ��ǰҳ�������б�
	 * @param fromCount
	 * @param endCount
	 * @param queryInforMap
	 * @return
	 */
	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap);
}
