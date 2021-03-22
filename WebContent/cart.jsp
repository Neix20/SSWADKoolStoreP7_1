<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="domain.Product"%>
<%@ page import="domain.Cart"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Shopping Cart</title>
<link rel="stylesheet" href="css/cart.css">

<!--  jQuery -->
<script src="js/jquery-1.8.3.min.js"></script>
<script>
	var check = false;

	function changeSubtotal(root) {
		var quantity = parseFloat(root.parent().children(".qt").html());
		var price = parseFloat(root.parent().children(".price").html());
		console.log(parseFloat(root.parent().children("#quantity").val()));
		console.log(price);
		var subtotal = Math.round(price * quantity * 100) / 100;
		root.parent().children(".full-price").html(subtotal);

		calculateTotal();
	}

	function calculateTotal() {
		var total = 0;
		$(".full-price").each(function(index) {
			total += parseFloat($(".full-price").eq(index).html());
		});

		total = Math.round(total * 100) / 100;
		$(".total span").html(total);
	}

	$(document).ready(function() {
		$(".qt-minus").click(function() {
			child = $(this).parent().children(".qt");
			if (parseInt(child.html()) > 1) {
				child.html(parseInt(child.html()) - 1);
				child.parent().children(".qt").html(parseInt(child.html()) - 1);
			}
			changeSubtotal($(this));
		});

		$(".qt-plus").click(function() {
			child = $(this).parent().children(".qt");
			child.html(parseInt(child.html()) + 1);

			changeSubtotal($(this));
		});
	});
</script>
</head>
<body>
	<header id="site-header">
		<div class="container">
			<h1>
				Shopping cart <span>[</span> <em><a href="IndexServlet">Back
						to Menu</a></em> <span class="last-span is-open">]</span>
			</h1>
		</div>
	</header>
	<%
		List<Cart> items = (List<Cart>) request.getAttribute("items");
		Double total = 0.0;
		
		for(Cart item: items) {
			Product product = item.getProduct();
			out.println("<div class=\"container\">");
			out.println("<section id=\"cart\">");
			out.println("<article class=\"product\">");
			out.println("<header>");
			out.println("<a href=\"Cart?action=removefromCart&productId=" + product.getProductcode() + "\" class=\"remove\">");
			out.println("<img src=\"" + product.getImagePath() + "\" alt=\"\">");
			out.println("<h3>Remove product</h3>");
			out.println("</a>");
			out.println("</header>");
			out.println("<div class=\"content\">");
			out.println("<h1><a href = \"Product?productCode=" + product.getProductcode() + "\">" + product.getProductname() + "</a></h1>");
			out.println("<b><i>Vendor: " + product.getProductvendor() + "</i></b><br>" + product.getProductdescription());
			out.println("<div style=\"top: 43px\" class=\"type small\">Scale:<br>" + product.getProductscale() + "</div>");
			out.println("</div>");
			out.println("<footer class=\"content\">");
			
			int quantity = item.getQuantity();
			Double subtotal = Math.round(product.getMsrp().doubleValue() * quantity * 100.0)/ 100.0;
			total += subtotal;
			out.print("<span class=\"qt-minus\">-</span>");
			out.print("<span class=\"qt\">" + quantity);
			out.print("<input id=\"quantity\" type=\"hidden\" value=\"" + quantity + "\">");
			//out.print("<span><input type=\"text\" class=\"qt\" value=\"" + quantity + "\"readonly>");
			out.println("</span><span class=\"qt-plus\">+</span>");
			out.println("<h2 class=\"full-price\">" +  subtotal + "</h2>");
			out.println("<input id=\"subtotal\" type=\"hidden\" value=\"" +  subtotal + "\">");
			//out.println("<h2>RM <input type=\"text\" class=\"full-price\" value=\"" +  subtotal + "\"readonly></h2>");
			out.println("<h2 class=\"price\">" + product.getMsrp().doubleValue() + "/each</h2>");
			out.println("</footer>");
			out.println("</article>");
			out.println("</section>");
			out.println("</div>");
		}
		
	
	
		out.println("<footer id=\"site-footer\">");
		out.println("<div class=\"container clearfix\">");
		out.println("<div class=\"right\">");
		out.println("<h1 class=\"total\">");
		out.println("Total: RM <span>"  + total + "</span>");
		out.println("<input id=\"total\" type=\"hidden\" value=\"" + total + "\">");
		out.println("</h1>");
		out.println("<a href=\"CheckOut\" class=\"btn\">Checkout</a>");
		out.println("</div>");
		out.println("</div>");
		out.println("</footer>");
	%>
	
</body>
</html>