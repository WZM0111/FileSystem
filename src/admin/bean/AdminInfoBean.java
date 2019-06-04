package admin.bean;

public class AdminInfoBean {
	public String adminName;//管理员账户
	public String password;//密码
	
	public AdminInfoBean(String adminName, String password) {
		super();
		this.adminName = adminName;
		this.password = password;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
