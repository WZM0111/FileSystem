package common.domain;

import java.io.Serializable;

import common.domain.ResponseEntity;

/** 
* @ClassName: ResponseEntity 
* @Description: 
* @author albert
* @date 2017��3��17�� ����9:48:16 
*  
*/
public class ResponseEntity implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -7346458775767254754L;
	/**1 �ɹ� -1 ʧ��*/
	private Integer status;
	private String msg;
	/**��ӡģ��*/
	private String xml;
	/**��ӡ����json*/
	private String json;
	
	private String content;
	public ResponseEntity() {
	}
	
	public ResponseEntity(String content){
	    this.setContent(content);
	}
	public ResponseEntity(String xml,String json){
		this.xml = xml;
		this.json = json;
	}
	public static ResponseEntity success(String content){
	    ResponseEntity r = new ResponseEntity(content);
	    r.setContent(content);
	    return r;
	}
	public static ResponseEntity success(String xml,String json){
		ResponseEntity r = new ResponseEntity(xml, json);
		r.setStatus(1);
		r.setMsg("OK");
		return r;
	}
	public static ResponseEntity failed(String msg){
		ResponseEntity r = new ResponseEntity();
		r.setStatus(-1);
		r.setMsg(msg);
		return r;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getXml() {
		return xml;
	}
	public void setXml(String xml) {
		this.xml = xml;
	}
	public String getJson() {
		return json;
	}
	public void setJson(String json) {
		this.json = json;
	}

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
	
}