package admin.dao;

import java.util.HashMap;
import java.util.List;

public interface AdminIncomeDao {
	public int getTotalRecordNumber(HashMap queryInforMap);

	public List getComponentPageList(int fromCount, int endCount,
			HashMap queryInforMap);
}
