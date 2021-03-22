package utility;

import java.io.PrintWriter;

public class JsControl {
	
	public static void redirectWithMessage(PrintWriter out, String message, String location) {
		out.println("<script>");
		out.println("alert(\"" + message + "\");");
		out.println("window.location.assign(\"" + location + "\";");
		out.println("</script>");
	}

}
