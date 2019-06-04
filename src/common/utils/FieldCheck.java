package common.utils;

public class FieldCheck {
	/**
	 * ÅÐ¶Ï×Ö·û´®ÊÇ·ñÎªnull»ò¿Õ´®
	 * @param str
	 * @return
	 */
	
	public static boolean isNullOrBlank(String str){
		return(str==null || str.trim().length()==0);
	}
	
	
	/**
	 * ½«null×ª»»Îª¿Õ
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
	 * È¥µô×Ö·û´®Á½±ßµÄ¿Õ¸ñ
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
