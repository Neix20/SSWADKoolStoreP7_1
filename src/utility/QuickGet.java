package utility;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class QuickGet {
	
	public static String getCurrentUsername(HttpServletRequest request) {
		try {
			Cookie[] cookies = request.getCookies();
			for(Cookie c: cookies) {
				if(c.getName().equals("username")) {
					return c.getValue();
				}
			}
		} catch (NullPointerException ex) {
			return "";
		}
		
		return "";
	}

}
