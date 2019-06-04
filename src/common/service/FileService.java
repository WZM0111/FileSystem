package common.service;

import java.util.HashMap;
import java.util.List;

import common.bean.PageInforBean;
import common.bean.UserInfoBean;

public interface FileService {
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
