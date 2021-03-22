<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="domain.Product"%>
<!DOCTYPE html>

<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<%
	Product product = (Product) request.getAttribute("product");
	List<Product> productlist = (List<Product>) request.getAttribute("productlist");
	Collections.shuffle(productlist);
%>
<!-- 
Kool Store Template
http://www.templatemo.com/preview/templatemo_428_kool_store
-->
<meta charset="ISO-8859-1">
<title>Kool Store - Responsive eCommerce Template</title>

<meta name="description" content="">
<meta name="viewport" content="width=device-width">

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800"
	rel="stylesheet">

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/normalize.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/templatemo-misc.css">
<link rel="stylesheet" href="css/templatemo-style.css">

<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>

	<div class="content-section">
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="product-image">
						<%
							out.println("<img src=\"" + product.getImagePath() + "\">");
						%>
						<!--                         <img src="images/featured/7.jpg" alt=""> -->
					</div>
					<!-- /.product-image -->
					<div class="product-information">
						<%
							out.println("<h2>" + product.getProductname() + "</h2>");
							out.println("<p>" + product.getProductdescription() + "</p>");
							out.println(" <p class=\"product-infos\">");
							out.println("<span>Price: RM " + product.getMsrp() + "</span>");
							out.println("</p>");
							out.println("<ul class=\"product-buttons\">");
							out.println("<li>");
						%>
						<script>
							$(document)
									.ready(
											function() {

												var quantity = 0;
												$('.quantity-right-plus')
														.click(
																function(e) {

																	// Stop acting like a button
																	e
																			.preventDefault();
																	// Get the field name
																	var quantity = parseInt($(
																			'#quantity')
																			.val());

																	// If is not undefined

																	$(
																			'#quantity')
																			.val(
																					quantity + 1);

																	// Increment

																});

												$('.quantity-left-minus')
														.click(
																function(e) {
																	// Stop acting like a button
																	e
																			.preventDefault();
																	// Get the field name
																	var quantity = parseInt($(
																			'#quantity')
																			.val());

																	// If is not undefined

																	// Increment
																	if (quantity > 0) {
																		$(
																				'#quantity')
																				.val(
																						quantity - 1);
																	}
																});

											});
						</script>
						<form action="Cart" method="GET">
							<div class="container">
								<div class="row">
									<div class="col-lg-2">
										<div class="input-group">
											<span class="input-group-btn">
												<button type="button"
													class="quantity-left-minus btn btn-danger btn-number"
													data-type="minus" data-field="">
													<span class="glyphicon glyphicon-minus"></span>
												</button>
											</span> <input type="hidden" name="action" value="addToCart" /> <input
												type="text" id="quantity" name="quantity"
												class="form-control input-number" value="1" min="1"
												max="100">

											<%
												out.println(
														"<input type = \"hidden\" name = \"productId\" value = \"" + product.getProductcode() + "\"/>");
											%>

											<span class="input-group-btn">
												<button type="button"
													class="quantity-right-plus btn btn-success btn-number"
													data-type="plus" data-field="">
													<span class="glyphicon glyphicon-plus"></span>
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
							<input type="submit" class="main-btn" value="Add to Cart"/>
						</form>
						</li>
						</ul>
						<!--                          <h2>Product</h2>  -->
						<!--                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eaque, esse, excepturi, sint ut et numquam reiciendis nulla in deserunt quaerat provident obcaecati reprehenderit iusto ab neque corporis id temporibus architecto quia adipisci? Officia, aliquam, eveniet, molestias, voluptate porro assumenda error soluta ab blanditiis voluptatum nisi voluptates debitis doloribus. Asperiores, provident fuga quibusdam id tenetur!<br><br>Nostrum quis quo earum enim suscipit molestiae cupiditate reprehenderit? Atque, numquam nostrum adipisci suscipit exercitationem sed ullam. Odio, laborum, obcaecati harum nostrum pariatur ipsam itaque minima atque expedita at amet dignissimos odit quisquam laboriosam eius officiis ratione alias sint rerum distinctio. Quidem, veritatis consequuntur voluptas sunt quo deleniti reprehenderit deserunt atque minus non.</p> -->
						<!--                         <p class="product-infos"> -->
						<!--                             <span>Bundle Price: $450</span> -->
						<!--                             <span>Discount: 30%</span> -->
						<!--                         </p> -->
						<!--                         <ul class="product-buttons"> -->
						<!--                             <li> -->
						<!--                                 <a href="#" class="main-btn">Buy Now</a> -->
						<!--                             </li> -->
						<!--                             <li> -->
						<!--                                 <a href="#" class="main-btn">Add to Cart</a> -->
						<!--                             </li> -->
						<!--                         </ul> -->
					</div>
					<!-- /.product-information -->
				</div>
				<!-- /.col-md-8 -->
				<!--                 <div class="col-md-4 col-sm-8"> -->
				<!--                     <div class="product-item-2"> -->
				<!--                         <div class="product-thumb"> -->
				<!--                             <img src="images/featured/1.jpg" alt="Product Title"> -->
				<!--                         </div> /.product-thumb -->
				<!--                         <div class="product-content overlay"> -->
				<!--                             <h5><a href="#">Name Of Shirt</a></h5> -->
				<!--                             <span class="tagline">Partner Name</span> -->
				<!--                             <span class="price">$30.00</span> -->
				<!--                             <p>Doloremque quo possimus quas necessitatibus blanditiis excepturi. Commodi, sunt tenetur deleniti labore!</p> -->
				<!--                         </div> /.product-content -->
				<!--                     </div> /.product-item-2 -->
				<!--                     <div class="product-item-2"> -->
				<!--                         <div class="product-thumb"> -->
				<!--                             <img src="images/featured/2.jpg" alt="Product Title"> -->
				<!--                         </div> /.product-thumb -->
				<!--                         <div class="product-content overlay"> -->
				<!--                             <h5><a href="#">Name Of Shirt</a></h5> -->
				<!--                             <span class="tagline">Partner Name</span> -->
				<!--                             <span class="price">$40.00</span> -->
				<!--                             <p>Doloremque quo possimus quas necessitatibus blanditiis excepturi. Commodi, sunt tenetur deleniti labore!</p> -->
				<!--                         </div> /.product-content -->
				<!--                     </div> /.product-item-2 -->
				<!--                     <div class="product-item-2"> -->
				<!--                         <div class="product-thumb"> -->
				<!--                             <img src="images/featured/8.jpg" alt="Product Title"> -->
				<!--                         </div> /.product-thumb -->
				<!--                         <div class="product-content overlay"> -->
				<!--                             <h5><a href="#">Name Of Shirt</a></h5> -->
				<!--                             <span class="tagline">Partner Name</span> -->
				<!--                             <span class="price">$50.00</span> -->
				<!--                             <p>Doloremque quo possimus quas necessitatibus blanditiis excepturi. Commodi, sunt tenetur deleniti labore!</p> -->
				<!--                         </div> /.product-content -->
				<!--                     </div> /.product-item-2 -->
				<!--                 </div> /.col-md-4 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.content-section -->

	<div class="content-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-title">
					<h2>Similar Products</h2>
				</div>
				<!-- /.section -->
			</div>
			<!-- /.row -->
			<div class="row">
				<%
					int count = 0;
					for (Product p : productlist) {
						count++;
						out.println("<div class=\"col-md-3 col-sm-6\">");
						out.println("<div class=\"product-item-vote\">");
						out.println("<div class=\"product-thumb\">");
						out.println("<img src=\"" + p.getImagePath() + "\">");
						out.println("</div>");
						out.println("<div class=\"product-content\">");
						out.println("<h5><a href = \"Product?productCode=" + p.getProductcode() + "\">" + p.getProductname()
								+ "</a></h5>");
						out.println("<span class=\"tagline\">RM " + p.getMsrp() + "</span>");
						out.println("</div>");
						out.println("</div>");
						out.println("</div>");
						if (count >= 4)
							break;
					}
				%>
				<!--                 <div class="col-md-3 col-sm-6"> -->
				<!--                     <div class="product-item-vote"> -->
				<!--                         <div class="product-thumb"> -->

				<!--                              <img src="images/products/1.jpg" alt=""> -->
				<!--                         </div> /.product-thum -->
				<!--                         <div class="product-content"> -->

				<!--                              <h5><a href="#">Name of Shirt</a></h5>  -->
				<!--                              <span class="tagline">By: Catherine</span>  -->

				<!--                         </div> /.product-content -->
				<!--                     </div> /.product-item-vote -->
				<!--                 </div> /.col-md-3 -->
				<!--                 <div class="col-md-3 col-sm-6"> -->
				<!--                     <div class="product-item-vote"> -->
				<!--                         <div class="product-thumb"> -->

				<!--                              <img src="images/products/2.jpg" alt="">  -->
				<!--                         </div> /.product-thum -->
				<!--                         <div class="product-content"> -->

				<!--                              <h5><a href="#">Name of Shirt</a></h5>  -->
				<!--                              <span class="tagline">By: Rebecca</span>  -->

				<!--                         </div> /.product-content -->
				<!--                     </div> /.product-item-vote -->
				<!--                 </div> /.col-md-3 -->
				<!--                 <div class="col-md-3 col-sm-6"> -->
				<!--                     <div class="product-item-vote"> -->
				<!--                         <div class="product-thumb"> -->

				<!--                              <img src="images/products/3.jpg" alt="">  -->
				<!--                         </div> /.product-thum -->
				<!--                         <div class="product-content"> -->

				<!--                              <h5><a href="#">Name of Shirt</a></h5>  -->
				<!--                              <span class="tagline">By: Catherine</span>  -->

				<!--                         </div> /.product-content -->
				<!--                     </div> /.product-item-vote -->
				<!--                 </div> /.col-md-3 -->
				<!--                 <div class="col-md-3 col-sm-6"> -->
				<!--                     <div class="product-item-vote"> -->
				<!--                         <div class="product-thumb"> -->

				<!--                              <img src="images/products/4.jpg" alt="">  -->
				<!--                         </div> /.product-thum -->
				<!--                         <div class="product-content"> -->

				<!--                              <h5><a href="#">Name of Shirt</a></h5>  -->
				<!--                              <span class="tagline">By: Rebecca</span>  -->

				<!--                         </div> /.product-content -->
				<!--                     </div> /.product-item-vote -->
				<!--                 </div> /.col-md-3 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.content-section -->

    <jsp:include page="footer.jsp"></jsp:include>

	<script src="js/vendor/jquery-1.10.1.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')
	</script>
	<script src="js/jquery.easing-1.3.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/main.js"></script>


</body>
</html>