package common.bean;

public class IncomeRecordBean {
	private String filename;
	private String fileform;
	private String downloaddate;
	private double price;
	private int fileid;
	
	
	public int getFileid() {
		return fileid;
	}
	public void setFileid(int fileid) {
		this.fileid = fileid;
	}
	public IncomeRecordBean() {
		super();
	}
	public IncomeRecordBean(String filename,String fileform, String downloaddate, double price) {
		super();
		this.filename = filename;
		this.fileform = fileform;
		this.downloaddate = downloaddate;
		this.price = price;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public void setFileform(String fileform) {
		this.fileform = fileform;
	}
	public String getFileform() {
		return fileform;
	}
	public String getDownloaddate() {
		return downloaddate;
	}
	public void setDownloaddate(String downloaddate) {
		this.downloaddate = downloaddate;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	} 
	
	
}
