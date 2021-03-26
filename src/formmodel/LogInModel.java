package formmodel;

import java.util.Hashtable;

public class LogInModel {
	
	private String username;
	private String password;
	
	private Hashtable<String, String> errors;
	
	public LogInModel() {
		username = "";
		password = "";
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


	public Hashtable<String, String> getErrors() {
		return errors;
	}


	public void setErrors(Hashtable<String, String> errors) {
		this.errors = errors;
	}

}
