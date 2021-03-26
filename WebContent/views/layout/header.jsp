<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="javax.servlet.http.Cookie" %>
<%
	Cookie[] cookies = request.getCookies();
	String username = "";
	try {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("username")) {
				username = cookie.getValue();
				break;
			}
		}
	} catch (NullPointerException ex) {

	}
%>

<style>
.top-header .header-box-left div {
	border-left: 1px solid #dddddd;
	padding: 10px 15px;
	display: inline-block;
}

.top-header .header-box-left div:last-child {
	border-right: 1px solid #dddddd;
}
</style>

<header class="site-header">
	<div class="top-header">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6">

					<%
						if (!username.equals("")) {
					%>
					<div class="header-box-left top-header-left">
						<div>
							Welcome back,
							<%=username%>!
						</div>
						<%
							if (username.equals("admin")) {
						%>
						<a href="admin">System Managing</a>
						<%
							}
						%>
						<a href="profile">Profile</a> <a href="logout">Logout</a>
					</div>


					<%
						} else {
					%>
					<div class="top-header-left">
						<a href="signup">Sign Up</a> <a href="login">Log In</a>
					</div>
					<%
						}
					%>
				</div>
				<!-- /.col-md-6 -->
				<div class="col-md-6 col-sm-6">
					<div class="social-icons">
						<ul>
							<li><a href="#" class="fa fa-facebook"></a></li>
							<li><a href="#" class="fa fa-dribbble"></a></li>
							<li><a href="#" class="fa fa-twitter"></a></li>
							<li><a href="#" class="fa fa-linkedin"></a></li>
						</ul>
						<div class="clearfix"></div>
					</div>
					<!-- /.social-icons -->
				</div>
				<!-- /.col-md-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.top-header -->
	<div class="main-header">
		<div class="container">
			<div class="row">
				<div class="col-md-4 col-sm-6 col-xs-8">
					<div class="logo">
						<h1>
							<a href="#">Kool Store</a>
						</h1>
					</div>
					<!-- /.logo -->
				</div>
				<!-- /.col-md-4 -->
				<div class="col-md-8 col-sm-6 col-xs-4">
					<div class="main-menu">
						<a href="cart" class="toggle-menu"> <img
							src="${ pageContext.request.contextPath }/images/shopping_cart.png" width="50px" />
						</a>
					</div>
					<!-- /.main-menu -->
				</div>
				<!-- /.col-md-8 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.main-header -->
	<div class="main-nav">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-7">
					<div class="list-menu">
						<ul>
							<li><a href="product">Products</a></li>
							<li><a href="OrderTracking">My Order</a></li>
							<li><a href="contact">Contact Us</a></li>
						</ul>
					</div>
					<!-- /.list-menu -->
				</div>
				<!-- /.col-md-6 -->
				<div class="col-md-6 col-sm-5">
					<div class="notification">
						<span>Free Shipping on any order above $50</span>
					</div>
				</div>
				<!-- /.col-md-6 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.main-nav -->
</header>
<!-- /.site-header -->
