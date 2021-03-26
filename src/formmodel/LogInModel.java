package formmodel;

public class LogInModel extends Model{
	
	private String username;
	private String password;
	
	public LogInModel() {
		super();
		username = "";
		password = "";
	}

	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}

}
