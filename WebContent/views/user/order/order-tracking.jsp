<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Tracking</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
	
<!--  jQuery -->
<script src="js/jquery-1.8.3.min.js"></script>
<script>
	$(document).ready(function () {
		$("#ajaxbutton").click(function () {
			$("#test").empty();
			$.ajax({
				url: 'OrderTracking',
				type: 'POST',
				dataType: 'json',
				data: $("#ajaxform").serialize(),
				success: function (data) {
					if (data === null) {
						alert("Invalid Order Number! Please try again!");
					} else {
						console.log(data);
						$("#test").append("<br>Order number: " + data[0].ordernumber);
						$("#test").append("<br>Comments: " + data[0].comments);
						$("#test").append("<br>Customer number: " + data[0].customernumber);
						$("#test").append("<br>Order date: " + data[0].orderdate);
						$("#test").append("<br>Required date: " + data[0].requireddate);
						$("#test").append("<br>Shipped date: " + data[0].shippeddate);
						$("#test").append("<br>Status: " + data[0].status);	
					}
				},
				error: function () {
					alert("An error occurred...");
				}
			});
			return false;
		});
	});
</script>
</head>
<body>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
		crossorigin="anonymous"></script>

	<div class="container">
		<div class="row">
			<div class="col-6 offset-3">

				<h1>Order Tracking</h1>

				<form id="ajaxform">
					<input type="text" id="ordernumber" name="ordernumber" value="" />
					<input type="button" id="ajaxbutton" value="Track Order!" />
				</form>
				<div id='test'></div>
			</div>
		</div>
	</div>
</body>
</html>