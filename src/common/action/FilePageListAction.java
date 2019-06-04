package common.action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.service.FileServiceImpl;


public class FilePageListAction extends PageListBaseServlet{

	@Override
	public void initPageInforBean(HttpServletRequest request,
			HttpServletResponse response) {
		
	
		//��ȡ����������������
		String content=request.getParameter("content"); 
		//��ȡ������ѡ��ĸ�ʽ
		String action=request.getParameter("action"); 
		//String type=request.getParameter("type");
		//System.out.println(action);
		HttpSession session=request.getSession();
		
		
		//System.out.println("FilePageListActiontype:"+type);
		//������ŵ�hm��
		HashMap<String ,String> hm=new HashMap<String,String>();
		//��ѡ���˸�ʽ����ȡ����������
		if(action!=null){
			String content1=null;
			try {
				
				content1 = new String(request.getParameter("content1").getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} 
			if("all".equals(action)){
				action="%";
			}
			session.setAttribute("content", content1);
			hm.put("content", content1);
			hm.put("form", action);
		}else{
			
			session.setAttribute("content", content);
			hm.put("content", content);
		}
		
		//session.setAttribute("type", type);
	
		super.getPageInforBean().setHm(hm);
		super.setPageInforService(new FileServiceImpl());
		super.setForward("/find.jsp");
	}
	}
