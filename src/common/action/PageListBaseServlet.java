package common.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.bean.PageInforBean;
import common.service.PageInforService;

/**
 * ʵ�ַ�ҳ��ʾ��ͨ���ܵ�servlet��
 * 
 * @author guojl
 *
 */

public abstract class PageListBaseServlet extends HttpServlet {
	/**
	 * ��ҳ������Service
	 */
	private PageInforService pageInforService = null;
	/**
	 * ��ҳ��Ϣbean
	 */
	private PageInforBean pageInforBean = null;
	/**
	 * ��ת·��
	 */
	private String forward = null;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		pageInforBean = new PageInforBean();
		
		request.setCharacterEncoding("UTF-8");
		
		response.setCharacterEncoding("UTF-8");	
		String showCount = request.getParameter("showCount");
		if (showCount != null && !"".equals(showCount)) {
			pageInforBean.setShowCount(Integer.valueOf(showCount));
		}
		String pageNo = request.getParameter("pageNo");
		if (pageNo != null && !"".equals(pageNo)) {
			pageInforBean.setCurrentPage(Integer.valueOf(pageNo));
		}
		setPageInforBean(pageInforBean);
		initPageInforBean(request, response);
		HttpSession session = request.getSession();
		if (request.getParameter("method") != null) {
			if (request.getParameter("method").equals("firstPage")) {
				session.setAttribute("pageInforBean", pageInforService.getPageInitialList(pageInforBean));
			} else if (request.getParameter("method").equals("showPage")) {
				System.out.println("+++++++++++++++"+showCount+"+++++++++++++");
				session.setAttribute("pageInforBean", pageInforService.getPageListByPageNo(pageInforBean));
			}
		}
		response.sendRedirect(request.getContextPath() + this.forward);
		
		
	}

	/**
	 * ��ʼ��PageInforBean����װ�ͻ��˴��ݵĲ�ѯ������Ϣ�� ��ʼ��forward�� listBean �� forward
	 * 
	 * @param request
	 * @param response
	 */
	public abstract void initPageInforBean(HttpServletRequest request, HttpServletResponse response);

	public PageInforService getPageInforService() {
		return pageInforService;
	}

	public void setPageInforService(PageInforService pageInforService) {
		this.pageInforService = pageInforService;
	}

	public PageInforBean getPageInforBean() {
		return pageInforBean;
	}

	public void setPageInforBean(PageInforBean pageInforBean) {
		this.pageInforBean = pageInforBean;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}
}
