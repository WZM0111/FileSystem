package admin.bean;

public class AdminIncomeBean {
	public String down_user;
	public String filename;
	public String up_user;
	public double money;
	public String downtime;
	public int is_vip;
	
	public AdminIncomeBean() {
		super();
	}
	
	public AdminIncomeBean(String down_user, String filename, String up_user,
			double money, String downtime, int is_vip) {
		super();
		this.down_user = down_user;
		this.filename = filename;
		this.up_user = up_user;
		this.money = money;
		this.downtime = downtime;
		this.is_vip = is_vip;
	}
	public String getDown_user() {
		return down_user;
	}
	public void setDown_user(String down_user) {
		this.down_user = down_user;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getUp_user() {
		return up_user;
	}
	public void setUp_user(String up_user) {
		this.up_user = up_user;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getDowntime() {
		return downtime;
	}
	public void setDowntime(String downtime) {
		this.downtime = downtime;
	}
	public int getIs_vip() {
		return is_vip;
	}
	public void setIs_vip(int is_vip) {
		this.is_vip = is_vip;
	}
	
	
}
