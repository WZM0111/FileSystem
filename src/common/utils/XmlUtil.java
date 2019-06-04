/**
 * 
 */
package common.utils;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.io.SAXReader;

import common.domain.EntityBase;
import common.domain.Person;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @ClassName: XmlUtil
 * @Description:
 * @author albert
 * @date 2017��3��17�� ����4:19:49
 * 
 */
public class XmlUtil {
	/**
	 * xml�ļ�ת��Ϊ�ַ���
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	public static String xmlFile2str(String filePath)throws Exception{  
        //����SAXReader����  
        SAXReader reader = new SAXReader();  
        //��ȡ�ļ� ת����Document  
        Document document = reader.read(new File(filePath));  
        //documentת��ΪString�ַ���  
        String documentStr = document.asXML();  
        return documentStr;
    }  
	/**
	 * ��ȡ�ļ����ݵ�String
	 * @param filePath
	 * @return
	 */
	public static String file2str(String filePath){
		 StringBuilder result = new StringBuilder();
	        try{
	            BufferedReader br = new BufferedReader(new FileReader(new File(filePath)));
	            String s = null;
	            while((s = br.readLine())!=null){//ʹ��readLine������һ�ζ�һ��
	                result.append(System.lineSeparator()+s);
	            }
	            br.close();    
	        }catch(Exception e){
	            e.printStackTrace();
	        }
	        return result.toString();
	}
	/**
	 * ����ת��Ϊbyte[]
	 * @param obj
	 * @return
	 */
	public static byte[] toByteArray (Object obj) {      
        byte[] bytes = null;      
        ByteArrayOutputStream bos = new ByteArrayOutputStream();      
        try {        
            ObjectOutputStream oos = new ObjectOutputStream(bos);         
            oos.writeObject(obj);        
            oos.flush();         
            bytes = bos.toByteArray ();      
            oos.close();         
            bos.close();        
        } catch (IOException ex) {        
            ex.printStackTrace();   
        }      
        return bytes;    
    } 
	
	 public static InputStream str2InputStream(String xmlStr)throws Exception{  
		 	InputStream in = new ByteArrayInputStream(xmlStr.getBytes());
	        return in;
	    }  
	/**
	 * list ת��Ϊjson �ַ���
	 * @param list
	 */
	public static <T extends EntityBase> String domain2JsonFile(List<T> list){
		Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd").create();  
		String json = gson.toJson(list);
		return json;
	}
	/**
	 * �ַ���д�뵽�ļ�
	 * @param str
	 * @param path
	 * @throws Exception 
	 */
	public static void str2File(String str,String path) throws Exception{
		File file = new File(path);
		if(file.isDirectory()){
			throw new Exception("�ļ�����·��");
		}
		file.createNewFile();
		OutputStream out = new FileOutputStream(file);
		out.write(str.getBytes());
		out.close();
	}
	/*public static void main(String[] args) throws Exception {
		List<Person> list = new ArrayList<>();
		list.add(new Person("0001", "albert", "�㽭ʡ������", new Date()));

		list.add(new Person("0001", "albert", "�㽭ʡ������", new Date()));
		list.add(new Person("0001", "albert", "�㽭ʡ������", new Date()));
		list.add(new Person("0002", "albert2", "�㽭ʡ������", new Date()));
		list.add(new Person("0002", "albert2", "�㽭ʡ������", new Date()));
		
		String json = domain2JsonFile(list);
		//System.out.println(System.getProperty("user.dir"));
		str2File(json, System.getProperty("user.dir")+"/src/param.json");
	}*/
}