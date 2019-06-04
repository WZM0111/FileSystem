package admin.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.dao.impl.AdminUserDaoImpl;
import admin.service.impl.AdminUserServiceImpl;
import common.action.PageListBaseServlet;

public class AdminUserPageListAction extends PageListBaseServlet{

	@Override
	public void initPageInforBean(HttpServletRequest request,
			HttpServletResponse response) {
		
		//��ȡ�����п�ʼʱ��
		String startTime=request.getParameter("startTime"); 
	
		//��ȡ��ֹʱ��
		String endTime=request.getParameter("endTime");
		//��ȡ�û�����
		String in_username=request.getParameter("in_username");
		
		System.out.println("AdminUserPageListAction"+startTime);
		
		//user_ownerF.matches(regex);
		//����״̬
	
	
		//�ж�"ȫѡ"�Ƿ�ѡ�У�ѡ�еĻ�����ƥ�����У�δѡ�еĻ����ȡ������е�ֵ
		
		//���������ŵ�hm��
		HashMap<String ,String> hm=new HashMap<String,String>();
		
		hm.put("startTime", startTime);
		hm.put("endTime", endTime);
		hm.put("in_username", in_username);
		
		HttpSession session=request.getSession();
		session.setAttribute("in_username", in_username);
		session.setAttribute("startTime", startTime);
		session.setAttribute("endTime", endTime);
		
	/*	hm.put("startTime", startTime);
		hm.put("endTime", endTime);
		hm.put("in_username", in_username);
		*/
		super.getPageInforBean().setHm(hm);
		super.setPageInforService(new AdminUserServiceImpl());
		super.setForward("/admin/pages/user.jsp");
	}
	}
