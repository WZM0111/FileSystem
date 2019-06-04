package common.service;

import java.util.HashMap;
import java.util.List;

import common.bean.PageInforBean;

/**
 * 封装了分页共通的业务逻辑处理
 * @author dell
 *
 */
public abstract class PageInforService {
	/**
	 * 检索首页
	 * @param pageInforBean 分页信息bean
	 * 
	 */
	public PageInforBean getPageInitialList(PageInforBean pageInforBean)  {
		pageInforBean.setCurrentPage(1);
		return getPageListByPageNo(pageInforBean);
	}
	
	/**
	 * 根据页码检索此页内容
	 * @param pageInforBean 分页信息bean,封装了要检索的页码和每页显示的记录数等信息
	 */
	public PageInforBean getPageListByPageNo(PageInforBean pageInforBean)
	{
		System.out.println("++getPageListByPageNo++");
		//检索条件
		HashMap queryInforMap = pageInforBean.getHm();
		
		//获取当前页的起始记录数
		if(pageInforBean.getCurrentPage()==1)
		{
			pageInforBean.setFromCount(1);
		}else
		{
			pageInforBean.setFromCount((pageInforBean.getCurrentPage()-1)*pageInforBean.getShowCount()+1);
		}
		//根据检索条件，查询满足条件的总记录数
		int totalNumber = getTotalRecordNumber(queryInforMap);
		int showCount = pageInforBean.getShowCount();
		
		System.out.println(showCount+"++++++++++++++++");
		
		//根据总记录数和每页显示的记录数，获取总页数；
		int tmp = totalNumber% showCount;
		int tmpPageNumber = totalNumber/showCount;
		pageInforBean.setTotalPage(tmp == 0  ? tmpPageNumber : tmpPageNumber + 1);
		pageInforBean.setTotalNumber(totalNumber);
		int endCount = pageInforBean.getFromCount()+showCount-1;
		//根据起始记录数、结束记录数以及检索条件，获取当前页的数据列表；
		pageInforBean.setList(getComponentPageList(pageInforBean.getFromCount(),endCount,queryInforMap));
		return pageInforBean;
	}
	
	/**
	 * 根据检索条件，获取满足条件的记录总数（每个业务来实现）
	 * 
	 * @param queryInforMap 检索条件
	 * @return int 总记录数
	 */
	public abstract int getTotalRecordNumber(HashMap queryInforMap);
	
	/**
	 * 根据起始记录数、结束记录数以及检索条件，获取当前页的数据列表（每个业务来实现）
	 * @param fromCount 起始记录数
	 * @param endCount 截止记录数
	 * @param queryInforMap 检索条件
	 * @return List 当前页的数据列表
	 */
	public abstract List getComponentPageList(int fromCount,int endCount,HashMap queryInforMap);
}
