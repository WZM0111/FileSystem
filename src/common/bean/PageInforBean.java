package common.bean;

import java.util.HashMap;
import java.util.List;

/**
 * 
 * 
 * @author dell
 *
 */
public class PageInforBean<T> {
	/**
	 * 
	 */
	private int showCount = 10; 

	/**
	 * 
	 */
	private int fromCount = 0;
	/**
	 * 
	 */
	private int totalNumber = 0;
	/**
	 * 
	 */
	private List<T> list = null;
	/**
	 * 
	 */
	private int totalPage = 0;
	/**
	 * 
	 */
	private int currentPage = 0;

	/**
	 * 
	 */
	private HashMap<String,String> hm;

	public HashMap<String, String> getHm() {
		return hm;
	}

	public void setHm(HashMap<String, String> hm) {
		this.hm = hm;
	}

	public int getShowCount() {
		return showCount;
	}

	public void setShowCount(int showCount) {
		this.showCount = showCount;
	}

	public int getFromCount() {
		return fromCount;
	}

	public void setFromCount(int fromCount) {
		this.fromCount = fromCount;
	}

	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}	
}
