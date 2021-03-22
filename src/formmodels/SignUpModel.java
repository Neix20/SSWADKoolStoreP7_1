package formmodels;

import java.util.Hashtable;

public class SignUpModel {
	
	private String username;
	private String password;
	private String confirmPassword;
	
	private Hashtable<String, String> errors;
	
	public SignUpModel() {
		username = "";
		password = "";
		confirmPassword = "";
		errors = new Hashtable<String, String>();
	}
	
	public String getErrorMessage(String attribute) {
		String msg = errors.get(attribute.trim());
		return (msg == null) ? "" : msg;
	}


	public void setErrors(String key, String msg) {
		errors.put(key,  msg);
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


	public String getConfirmPassword() {
		return confirmPassword;
	}


	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}


	public Hashtable<String, String> getErrors() {
		return errors;
	}


	public void setErrors(Hashtable<String, String> errors) {
		this.errors = errors;
	}
	
}
