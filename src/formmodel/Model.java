package formmodel;

import java.util.Hashtable;

public class Model {

	private Hashtable<String, String> errors;
	
	public Model() {
		this.errors = new Hashtable<String, String>();
	}
	
	public String getErrorMessage(String attribute) {
		String msg = errors.get(attribute.trim());
		return (msg == null) ? "" : msg;
	}


	public void setErrors(String key, String msg) {
		errors.put(key,  msg);
	}
	
	public Hashtable<String, String> getErrors() {
		return errors;
	}

	public void setErrors(Hashtable<String, String> errors) {
		this.errors = errors;
	}

	
}
