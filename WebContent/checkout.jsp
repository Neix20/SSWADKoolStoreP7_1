<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="domain.Product"%>
<%@ page import="domain.Cart"%>
<%@ page import="domain.Customer"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Checkout</title>
<link rel="stylesheet" href="css/cart.css">

<!--  jQuery -->
<script src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
	<header id="site-header">
		<div class="container">
			<h1>Checkout<br></h1>
			<%
				Customer customer = (Customer) request.getAttribute("customer");
				out.println("Customer Name: <b><i>" + customer.getCustomername() + "</i></b><br>");
				out.println("Contact Name: <b><i>" + customer.getContactfirstname() + "\t" + customer.getContactlastname()  + "</i></b><br>");
				out.println("Phone Number: <b><i>" + customer.getPhone() + "</i></b><br>");
				out.println("Address:<br><b><i>" + customer.getAddressline1() + "\t" + customer.getAddressline2() + "<br> "
						+ customer.getPostalcode() + "\t" + customer.getCity() + "\t" + customer.getState() + "<br> "
						+ customer.getCountry() + "</i></b>");
			%>
		</div>
	</header>
	<%
		out.println("<form action=\"\" method=\"\">");
		List<Cart> items = (List<Cart>) request.getAttribute("items");
		Double total = 0.0;
		out.println("<input name=\"customernumber\" type=\"hidden\" value=\"" + customer.getCustomernumber() + "\">");
		
		for (Cart item : items) {
			Product product = item.getProduct();
			out.println("<div class=\"container\">");
			out.println("<section id=\"cart\">");
			out.println("<article class=\"product\">");
			out.println("<header>");
			out.println("<img src=\"" + product.getImagePath() + "\" alt=\"\">");
			out.println("</header>");
			out.println("<div class=\"content\">");
			out.println("<h1>" + product.getProductname() + "</h1>");
			out.println("<b><i>Vendor: " + product.getProductvendor() + "</i></b><br>"
					+ product.getProductdescription());
			out.println("<div style=\"top: 43px\" class=\"type small\">Scale:<br>" + product.getProductscale()
					+ "</div>");
			out.println("</div>");
			out.println("<footer class=\"content\">");

			int quantity = item.getQuantity();
			Double subtotal = Math.round(product.getMsrp().doubleValue() * quantity * 100.0) / 100.0;
			total += subtotal;
			out.print("<span class=\"qt\">X" + quantity + "</span>");
			out.println("<h2 class=\"full-price\">" + subtotal + "</h2>");
			out.println("<input name=\"subtotal\" type=\"hidden\" value=\"" + subtotal + "\">");
			out.println("<h2 class=\"price\">" + product.getMsrp().doubleValue() + "/each</h2>");
			out.println("</footer>");
			out.println("</article>");
			out.println("</section>");
			out.println("</div>");
		}

		out.println("<footer id=\"site-footer\">");
		out.println("<div class=\"container clearfix\">");
		out.println("<div class=\"left\">");
		out.println("<a href=\"Cart?action=viewCart\" class=\"btn\">Back to Cart</a>");
		out.println("</div>");
		out.println("<div class=\"right\">");
		out.println("<h1 class=\"total\">");
		out.println("Total: RM <span>" + total + "</span>");
		out.println("<input name=\"total\" type=\"hidden\" value=\"" + total + "\">");
		out.println("</h1>");
		out.println("<a href=\"#\" class=\"btn\">Confirm</a>");
		out.println("</div>");
		out.println("</div>");
		out.println("</footer>");
		out.println("</form");
	%>

</body>
</html>