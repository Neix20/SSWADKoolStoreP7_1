<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="domain.Order"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<%
List<Order> orders = (List<Order>) request.getAttribute("orders");
%>
<style>
body {
  background-color: #91ced4;
}
body * {
  box-sizing: border-box;
}

.header {
  background-color: #327a81;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}

img {
  height: 300px;
  width: 300px;
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  margin: 1em auto;
  overflow: hidden;
  width: 90%;
}

table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: center;
}
table th {
  background-color: #daeff1;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #edf7f8;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: "";
    display: block;
    left: 0;
    position: absolute;
  }
  td:nth-child(2):before {
    content: "Order Date:";
  }
  td:nth-child(3):before {
    content: "Required Date:";
  }
  td:nth-child(4):before {
    content: "Shipped Date:";
  }
  td:nth-child(5):before {
    content: "Status:";
  }
  td:nth-child(6):before {
    content: "Order Details:";
  }

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 100px;
    margin: 0.5rem 0;
    width: 100px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: 0.8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}
</style>
<meta charset="ISO-8859-1">

<title>My Order</title>
</head>
<body>
<div class="table-users">
<div class="header">My Orders</div>
   
   <table cellspacing="0">
      <tr>
         <th>Order Number</th>
         <th>Order Date</th>
         <th>Required Date</th>
         <th>Shipped Date</th>
         <th>Status</th>
         <th>Action</th>
      </tr>

	<%
	if (orders.size() != 0) {
		for(Order o:orders) {
			out.println("<tr>");
			out.println("<td>" + o.getOrdernumber() + "</td>");
			out.println("<td>" + o.getOrderdate() + "</td>");
			out.println("<td>" + o.getRequireddate() + "</td>");
			out.println("<td>" + o.getShippeddate() + "</td>");
			out.println("<td>" + o.getStatus() + "</td>");
			out.println("<td><form action=\"OrderDetails\" method=\"POST\">"
					+ "<input type=\"hidden\" name=\"ordernumber\" value=\"" + o.getOrdernumber() + "\"><button type=\"submit\">More</button></form>");
			if (o.getStatus().equals("In Process")) {
				out.println("<form action=\"OrderTracking\" method=\"POST\">"
						+ "<input type=\"hidden\" name=\"ordernumber\" value=\"" + o.getOrdernumber() + "\"><button type=\"submit\">Cancel Order</button></form>");
			}
			out.println("</td></tr>");
		}
	} else {
    	out.println("<tr>");
		String status = "No records";
		for (int i = 0; i < 8; i++) {
			out.println("<td>" + status + "</td>");
		}
		out.println("</tr>");
    }
	%>
   </table>
</div>

</body>
</html>
