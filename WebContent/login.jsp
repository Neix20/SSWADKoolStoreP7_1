<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="formmodels.LogInModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<meta charset="utf-8">
<title>Kool Store - Responsive eCommerce Template</title>
<meta name="viewport" content="width=device-width">

<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
	integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/normalize.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/animate.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/templatemo-misc.css">
<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/templatemo-style.css">

<script src="js/vendor/modernizr-2.6.2.min.js"></script>

</head>
<body>


	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-6 offset-3">
				<h1>Log In</h1>
				<form action="login" method="post">

					<%
						try {
							LogInModel m = (LogInModel) session.getAttribute("login");
					%>
					<div class="mb-3">
						<%
							boolean usernameFlag = false;
								if (m.getErrorMessage("username").equals(""))
									usernameFlag = true;
						%>
						<label for="username" class="form-label">Username</label> <input
							type="text"
							class="form-control <%=usernameFlag ? "" : "is-invalid"%>"
							name="username" value="<%=m.getUsername()%>">

						<div class="<%=usernameFlag ? "" : "invalid-feedback"%>">
							<%=usernameFlag ? "" : m.getErrorMessage("username")%>
						</div>
					</div>

					<div class="mb-3">
						<%
							boolean passwordFlag = false;
								if (m.getErrorMessage("password").equals(""))
									passwordFlag = true;
						%>
						<label for="password" class="form-label">Password</label> <input
							type="password"
							class="form-control <%=passwordFlag ? "" : "is-invalid"%>"
							name="password" value="<%=m.getPassword()%>">

						<div class="<%=passwordFlag ? "" : "invalid-feedback"%>">
							<%=passwordFlag ? "" : m.getErrorMessage("password")%>
						</div>
					</div>

					<%
						} catch (NullPointerException ex) {
					%>

					<div class="mb-3">
						<label for="username" class="form-label">Username</label> <input
							type="text" class="form-control" name="username">
					</div>

					<div class="mb-3">
						<label for="password" class="form-label">Password</label><input
							type="password" class="form-control" name="password">
					</div>

					<%
						}
					%>

					<div class="text-center mb-3">
						<button type="submit" class="btn btn-primary">Log in</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script
		src="${ pageContext.request.contextPath }/js/vendor/jquery.gmap3.min.js"></script>
	<script src="${ pageContext.request.contextPath }/js/plugins.js"></script>
	<script src="${ pageContext.request.contextPath }/js/main.js"></script>

	<%
		session.invalidate(); // Clear all session
	%>
</body>
</html>