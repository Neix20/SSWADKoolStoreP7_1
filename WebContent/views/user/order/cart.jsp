<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="domain.Product"%>
<%@ page import="utility.CartItem"%>
<%@ page import="session.CartBean"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Shopping Cart</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>


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

	$(document).ready(
			function() {
				$(".qt-minus").click(
						function() {
							child = $(this).parent().children(".qt");
							if (parseInt(child.html()) > 1) {
								child.html(parseInt(child.html()) - 1);
								child.parent().children(".qt").html(
										parseInt(child.html()) - 1);
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

	<%
		CartBean cart = (CartBean) session.getAttribute("cart");
		if (cart == null)
			cart = new CartBean();
		ArrayList<CartItem> cartItems = cart.getCartItems();
		double total = (double) session.getAttribute("total");
		double shipping = 5.0;
		int cartCount = cartItems.size();

		System.out.println(total);
	%>

	<header id="site-header">
		<div class="container">
			<h1>
				Shopping cart <span>[</span> <em><a href="IndexServlet">Back
						to Menu</a></em> <span class="last-span is-open">]</span>
			</h1>
		</div>
	</header>

	<main class="container">
	<div class="h1">
		Cart (<%=cartCount%>)
	</div>

	<%
		if (cartCount == 0) {
	%>
	<div class="row text-center">
		<span><strong>Your cart is empty!</strong></span>
	</div>
	<%
		} else {
			for (CartItem cartItem : cartItems) {
				Product product = cartItem.getProduct();
	%>
	<div class="row">
		<div class="col-lg-8">
			<div class="mb-3">
				<div class="pt-4">
					<div class="row mb-4">
						<div class="col-md-5 col-lg-3 col-xl-3">
							<img class="img-fluid w-100" src="<%=product.getImagePath()%>"
								alt="Product">
						</div>
						<div class="col-md-7 col-lg-9 col-xl-9">
							<div>
								<div class="d-flex justify-content-between">
									<div>
										<h5><%=product.getProductname()%></h5>
										<p class="mb-3 text-muted text-uppercase small">
											Scale:
											<%=product.getProductscale()%></p>
										<p class="mb-2 text-muted text-uppercase small">
											Vendor:
											<%=product.getProductvendor()%></p>
									</div>
									<div>
										<div
											class="def-number-input number-input safari_only mb-0 w-100">
											<form action="cart" method="POST">
												<input type="hidden" name="action" value="decreaseQuantity">
												<button type="submit" class="minus"></button>
											</form>
											<input class="quantity" min="0" name="quantity" value="1"
												type="number">
											<form action="cart" method="POST">
												<input type="hidden" name="action" value="increaseQuantity">
												<button type="submit" class="plus"></button>
											</form>
										</div>
									</div>
								</div>
								<div class="d-flex justify-content-between align-items-center">
									<div>
										<form action="cart" method="POST">
											<input type="hidden" name="action" value="removeProduct">
											<button type="submit"
												class="card-link-secondary small text-uppercase mr-3">
												<i class="fas fa-trash-alt mr-1"></i> Remove item
											</button>
										</form>
									</div>
									<p class="mb-0">
										<span><strong>RM <%=product.getMsrp()%></strong></span>
									</p class="mb-0">
								</div>
							</div>
						</div>
					</div>
					<hr class="mb-4">
					<%
						}
					%>
					<p class="text-primary mb-0">
						<i class="fas fa-info-circle mr-1"></i> Do not delay the purchase,
						adding items to your cart does not mean booking them.
					</p>
				</div>
			</div>
			<div class="mb-3">
				<div class="pt-4">

					<h5 class="mb-4">We accept</h5>

					<img class="mr-2" width="45px"
						src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
						alt="Visa"> <img class="mr-2" width="45px"
						src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
						alt="American Express"> <img class="mr-2" width="45px"
						src="https://mdbootstrap.com/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
						alt="Mastercard"> <img class="mr-2" width="45px"
						src="https://mdbootstrap.com/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.png"
						alt="PayPal acceptance mark">
				</div>
			</div>
		</div>

		<div class="col-lg-4">
			<div class="mb-3">
				<div class="pt-4">

					<h5 class="mb-3">The total amount of</h5>

					<ul class="list-group list-group-flush">
						<li
							class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
							Temporary amount <span>RM <%=total%></span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center px-0">
							Shipping <span>RM 5.00</span>
						</li>
						<%
							if (total >= 50.0)
									shipping = 0.0;
						%>
						<li
							class="list-group-item d-flex justify-content-between align-items-center px-0">
							Free shipping <span>-RM 5.00</span>
						</li>
						<li
							class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
							<div>
								<strong>The total amount of</strong> <strong>
									<p class="mb-0">(including VAT)</p>
								</strong>
							</div> <span><strong>RM <%=(total + shipping)%></strong></span>
						</li>
					</ul>
					<form action="cart" method="POST">
						<input type="hidden" name="action" value="resetCart">
						<button type="submit" class="btn btn-primary btn-block">
							reset cart</button>
					</form>

					<a href="checkout" type="button" class="btn btn-primary btn-block">go
						to checkout</a>
				</div>
			</div>
		</div>
	</div>
	<%
		}
	%> </main>






	<%
		/*
		for(CartItem item: cartItems) {
			Product product = item.getProduct();
			out.println("<div class=\"container\">");
			out.println("<section id=\"cart\">");
			out.println("<article class=\"product\">");
			out.println("<header>");
			out.println("<a href=\"Cart?action=removefromCart&productId=" + product.getProductcode() + "\" class=\"remove\">");
			out.println("<img src=\"" + "\" alt=\"\">");
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
		*/
	%>

	<%
		session.invalidate();
	%>

</body>
</html>