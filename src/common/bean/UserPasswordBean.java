package common.bean;

public class UserPasswordBean {
	//当前用户CD
		private String username;
		//当前密码
		 private String userpswd;
		 //确认密码
		 private String newpswd;
		 
		 /**
			 * @return 当前密码
			 */
		 public String getUserpswd() {
				return userpswd;
			}
		 /**
			 * @param 设置当前密码
			 */
		 public void setUserpswd(String userpswd) {
				this.userpswd = userpswd;
			}
		 /**
			 * @return 用户newpsad
			 */
		 public String getUsername() {
				return username;
			}
		 /**
			 * @param 用户名 要设置的 user_pswd
			 */
		 public void setUsername(String username) {
				this.username = username;
			}
		 /**
			 * @return 用户repsad
			 */
		 public String getNewpswd() {
				return newpswd;
			}
		 /**
			 * @param 用户名 要设置的 user_repasd
			 */
		 public void setNewpswd(String newpswd) {
				this.newpswd = newpswd;
			}
	

}
