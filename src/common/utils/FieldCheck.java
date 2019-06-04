package common.utils;

public class FieldCheck {
	/**
	 * �ж��ַ����Ƿ�Ϊnull��մ�
	 * @param str
	 * @return
	 */
	
	public static boolean isNullOrBlank(String str){
		return(str==null || str.trim().length()==0);
	}
	
	
	/**
	 * ��nullת��Ϊ��
	 * @param str
	 * @return
	 */
	public static String convertNullToEmpty(String str){
		if(str==null)
			return "";
		else
			return str;
	}
	
	/**
	 * ȥ���ַ������ߵĿո�
	 * @param str
	 * @return
	 */
	
	public static String trimString(String str){
		if(str==null)
			return "";
		else
			return str.trim();
	}
	

}
