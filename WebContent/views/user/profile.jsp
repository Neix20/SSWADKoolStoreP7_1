<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="formmodel.ProfileModel"%>
<%@ page import="domain.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>
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

<script
	src="${ pageContext.request.contextPath }js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>

	<jsp:include page="../layout/header.jsp"></jsp:include>

	<main class="container">
	
	<%
		String message = null;
		try {
			message = (String) session.getAttribute("message");

		} catch (NullPointerException ex) {

		}

		if (message != null) {
			out.println("<div class=\"alert alert-success mt-4\" role=\"alert\">" + message + "</div>");
		}
	%>
	
	<div class="row">

		<div class="col-12">
			<h1>Edit Profile</h1>
			<form action="profile" method="post">

				<%
					try {
						ProfileModel m = (ProfileModel) session.getAttribute("profile");
						out.println(
								"<input type=\"text\" name=\"customernumber\" value=\"" + m.getCustomernumber() + "\"hidden>");
				%>

				<div class="mb-3">
					<%
						boolean customername = false;
							if (m.getErrorMessage("customername").equals(""))
								customername = true;
					%>
					<label for="customername" class="form-label">Customer Name</label>
					<input type="text"
						class="form-control<%=customername ? "" : " is-invalid"%>"
						name="customername" value="<%=m.getCustomername()%>">
					<div class="<%=customername ? "" : "invalid-feedback"%>"><%=customername ? "" : m.getErrorMessage("customername")%></div>
				</div>

				<div class="row">
					<div class="col">
						<div class="mb-3">
							<%
								boolean contactfirstname = false;
									if (m.getErrorMessage("contactfirstname").equals(""))
										contactfirstname = true;
							%>
							<label for="contactfirstname" class="form-label">Contact
								First Name</label> <input type="text"
								class="form-control<%=contactfirstname ? "" : " is-invalid"%>"
								name="contactfirstname" value="<%=m.getContactfirstname()%>">
							<div class="<%=contactfirstname ? "" : "invalid-feedback"%>">
								<%=contactfirstname ? "" : m.getErrorMessage("contactfirstname")%>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="mb-3">
							<%
								boolean contactlastname = false;
									if (m.getErrorMessage("contactlastname").equals(""))
										contactlastname = true;
							%>
							<label for="contactlastname" class="form-label">Contact
								Last Name</label> <input type="text"
								class="form-control<%=contactlastname ? "" : " is-invalid"%>"
								name="contactlastname" value="<%=m.getContactlastname()%>">
							<div class="<%=contactlastname ? "" : "invalid-feedback"%>">
								<%=contactlastname ? "" : m.getErrorMessage("contactlastname")%>
							</div>
						</div>
					</div>
				</div>

				<div class="mb-3">
					<%
						boolean addressline1 = false;
							if (m.getErrorMessage("addressline1").equals(""))
								addressline1 = true;
					%>
					<label for="addressline1" class="form-label">Address Line 1</label>
					<input type="text"
						class="form-control<%=addressline1 ? "" : " is-invalid"%>"
						name="addressline1" value="<%=m.getAddressline1()%>">
					<div class="<%=addressline1 ? "" : "invalid-feedback"%>">
						<%=addressline1 ? "" : m.getErrorMessage("addressline1")%>
					</div>
				</div>

				<div class="mb-3">
					<%
						boolean addressline2 = false;
							if (m.getErrorMessage("addressline2").equals(""))
								addressline2 = true;
					%>
					<label for="addressline2" class="form-label">Address Line 2</label>
					<input type="text"
						class="form-control<%=addressline2 ? "" : " is-invalid"%>"
						name="addressline2" value="<%=m.getAddressline2()%>">
					<div class="<%=addressline2 ? "" : "invalid-feedback"%>">
						<%=addressline2 ? "" : m.getErrorMessage("addressline2")%>
					</div>
				</div>

				<div class="mb-3">
					<%
						boolean phone = false;
							if (m.getErrorMessage("phone").equals(""))
								phone = true;
					%>
					<label for="phone" class="form-label">Phone</label> <input
						type="text" class="form-control<%=phone ? "" : " is-invalid"%>"
						name="phone" value="<%=m.getPhone()%>">
					<div class="<%=phone ? "" : "invalid-feedback"%>">
						<%=phone ? "" : m.getErrorMessage("phone")%>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<div class="mb-3">
							<%
								boolean postalcode = false;
									if (m.getErrorMessage("postalcode").equals(""))
										postalcode = true;
							%>
							<label for="postalcode" class="form-label">Postal Code</label> <input
								type="text"
								class="form-control<%=postalcode ? "" : " is-invalid"%>"
								name="postalcode" value="<%=m.getPostalcode()%>">
							<div class="<%=postalcode ? "" : "invalid-feedback"%>">
								<%=postalcode ? "" : m.getErrorMessage("postalcode")%>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="mb-3">
							<%
								boolean city = false;
									if (m.getErrorMessage("city").equals(""))
										city = true;
							%>
							<label for="city" class="form-label">City</label> <input
								type="text" class="form-control<%=city ? "" : " is-invalid"%>"
								name="city" value="<%=m.getCity()%>">
							<div class="<%=city ? "" : "invalid-feedback"%>">
								<%=city ? "" : m.getErrorMessage("city")%>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<div class="mb-3">
							<%
								boolean state = false;
									if (m.getErrorMessage("state").equals(""))
										state = true;
							%>
							<label for="state" class="form-label">State</label> <input
								type="text" class="form-control<%=state ? "" : " is-invalid"%>"
								name="state" value="<%=m.getState()%>">
							<div class="<%=state ? "" : "invalid-feedback"%>">
								<%=state ? "" : m.getErrorMessage("state")%>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="mb-3">
							<%
								boolean country = false;
									if (m.getErrorMessage("country").equals(""))
										country = true;
							%>
							<label for="country" class="form-label">Country</label> <input
								type="text"
								class="form-control<%=country ? "" : " is-invalid"%>"
								name="country" value="<%=m.getCountry()%>">
							<div class="<%=country ? "" : "invalid-feedback"%>">
								<%=country ? "" : m.getErrorMessage("country")%>
							</div>
						</div>
					</div>
				</div>

				<div class="mb-3">
					<%
						boolean creditlimit = false;
							if (m.getErrorMessage("creditlimit").equals(""))
								creditlimit = true;
					%>
					<label for="creditlimit" class="form-label">Credit Limit</label> <input
						type="number"
						class="form-control<%=creditlimit ? "" : " is-invalid"%>"
						name="creditlimit" value="<%=m.getCreditlimit()%>">
					<div class="<%=creditlimit ? "" : "invalid-feedback"%>">
						<%=creditlimit ? "" : m.getErrorMessage("creditlimit")%>
					</div>
				</div>


				<%
					} catch (NullPointerException ex) {
						Customer c = (Customer) session.getAttribute("customer");
				%>

				<div class="mb-3">
					<input type="text" class="form-control" name="customernumber"
						value="<%=c.getCustomernumber()%>" hidden>
				</div>


				<div class="mb-3">
					<label for="customername" class="form-label">Customer Name</label>
					<input type="text" class="form-control" name="customername"
						value="<%=c.getCustomername()%>">
				</div>

				<div class="row">
					<div class="col">
						<div class="mb-3">
							<label for="contactfirstname" class="form-label">Contact
								First Name</label> <input type="text" class="form-control"
								name="contactfirstname" value="<%=c.getContactfirstname()%>">
						</div>
					</div>

					<div class="col">
						<div class="mb-3">
							<label for="contactlastname" class="form-label">Contact
								Last Name</label> <input type="text" class="form-control"
								name="contactlastname" value="<%=c.getContactlastname()%>">
						</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="addressline1" class="form-label">Address Line 1</label>
					<input type="text" class="form-control" name="addressline1"
						value="<%=c.getAddressline1()%>">
				</div>

				<div class="mb-3">
					<label for="addressline2" class="form-label">Address Line 2</label>
					<input type="text" class="form-control" name="addressline2"
						value="<%=c.getAddressline2()%>">
				</div>

				<div class="mb-3">
					<label for="phone" class="form-label">Phone</label> <input
						type="text" class="form-control" name="phone"
						value="<%=c.getPhone()%>">
				</div>

				<div class="row">
					<div class="col">
						<div class="mb-3">
							<label for="postalcode" class="form-label">Postal Code</label> <input
								type="text" class="form-control" name="postalcode"
								value="<%=c.getPostalcode()%>">
						</div>
					</div>

					<div class="col">
						<div class="mb-3">
							<label for="city" class="form-label">City</label> <input
								type="text" class="form-control" name="city"
								value="<%=c.getCity()%>">
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col">
						<div class="mb-3">
							<label for="state" class="form-label">State</label> <input
								type="text" class="form-control" name="state"
								value="<%=c.getState()%>">
						</div>
					</div>

					<div class="col">
						<div class="mb-3">
							<label for="country" class="form-label">Country</label> <input
								type="text" class="form-control" name="country"
								value="<%=c.getCountry()%>">
						</div>
					</div>
				</div>

				<div class="mb-3">
					<label for="creditlimit" class="form-label">Credit Limit</label> <input
						type="number" class="form-control" name="creditlimit"
						value="<%=c.getCreditlimit()%>">
				</div>
				<%
					}
				%>

				<div class="text-center mb-3">
					<button type="submit" class="btn btn-primary">Update
						Profile</button>
				</div>

			</form>
		</div>
	</div>
	</main>

	<jsp:include page="../layout/footer.jsp"></jsp:include>

	<%
		session.invalidate();
	%>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
		crossorigin="anonymous"></script>
	<script
		src="${ pageContext.request.contextPath }/js/vendor/jquery.gmap3.min.js"></script>
	<script
		src="${ pageContext.request.contextPath }/js/jquery.easing-1.3.js"></script>
	<script src="${ pageContext.request.contextPath }/js/plugins.js"></script>
	<script src="${ pageContext.request.contextPath }/js/main.js"></script>
</body>
</html>