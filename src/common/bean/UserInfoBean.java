package common.bean;

public class UserInfoBean {
	public String user_account;//用户名
	public String username;//昵称
	public String password;//密码
	public int age;//年龄
	public String gender;//性别
	public int up_count;//上传数量
	public String classes;//会员类别
	public double balance; //账户余额
	public String vipstrdate;//VIP开始日期
	public String vipenddate;//VIP结束日期
	
	
	public UserInfoBean(String user_account, String username,String password, int age,
			String gender, int up_count, String classes, double balance, String vipstrdate, String vipenddate) {
		this.user_account = user_account;
		this.username = username;
		this.password=password;
		this.age = age;
		this.gender = gender;
		this.up_count = up_count;
		this.classes = classes;
		this.balance = balance;
		this.vipstrdate=vipstrdate;
		this.vipenddate=vipenddate;
	}
	public UserInfoBean() {
		super();
	}
	public String getUser_account() {
		return user_account;
	}
	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getUp_count() {
		return up_count;
	}
	public void setUp_count(int up_count) {
		this.up_count = up_count;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getVipstrdate() {
		return vipstrdate;
	}
	public void setVipstrdate(String vipstrdate) {
		this.vipstrdate = vipstrdate;
	}
	public String getVipenddate() {
		return vipenddate;
	}
	public void setVipenddate(String vipenddate) {
		this.vipenddate = vipenddate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
