<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="formmodels.LogInModel"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Log In</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<body>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>

	<div class="container" style="margin-top: 100px">
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

	<%
		session.invalidate(); // Clear all session
	%>
</body>
</html>