package common.bean;

public class FileInfoBean {
	public int fileId;//文件ID
	public String fileName;//文件名
	public String fileType;//文件类型
	public String fileForm;//文件格式
	public String introduce;//简介
	public String username;//上传者
	public int downloadnum;//下载量
	public String uploadDate;//上传日期
	public double price;//价格
	public int sate;//状态
	public String downloaddate;//下载日期
	
	public FileInfoBean(int fileId, String fileName, String fileType,
			String fileForm, String introduce, String up_user, int downloadnum,
			String uploadDate, double price, int sate,String downloaddate) {
		super();
		this.fileId = fileId;
		this.fileName = fileName;
		this.fileType = fileType;
		this.fileForm = fileForm;
		this.introduce = introduce;
		this.username = up_user;
		this.downloadnum = downloadnum;
		this.uploadDate = uploadDate;
		this.price = price;
		this.sate = sate;
		this.downloaddate=downloaddate;
	}
	
	public FileInfoBean(){
		super();
	}


	public int getFileId() {
		return fileId;
	}

	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileForm() {
		return fileForm;
	}
	public void setFileForm(String fileForm) {
		this.fileForm = fileForm;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getDownloadnum() {
		return downloadnum;
	}

	public void setDownloadnum(int downloadnum) {
		this.downloadnum = downloadnum;
	}

	public int getSate() {
		return sate;
	}

	public void setSate(int sate) {
		this.sate = sate;
	}

	public void setPrice(double price) {
		this.price = price;
	}
	
	public String getDownloaddate() {
		return downloaddate;
	}

	public void setDownloaddate(String downloaddate) {
		this.downloaddate = downloaddate;
	}
	
}
