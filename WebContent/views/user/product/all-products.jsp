<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="domain.Product"%>
    <%@page import="domain.Productline"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<%
List<Product> products = (List<Product>) request.getAttribute("products");
Productline pl = products.get(0).getProductlineBean();
String cat = pl.getProductline();
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
  text-align: left;
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
    content: "Product Name:";
  }
  td:nth-child(3):before {
    content: "Product Scale:";
  }
  td:nth-child(4):before {
    content: "Product Vendor:";
  }
  td:nth-child(5):before {
    content: "Product Description:";
  }
  td:nth-child(6):before {
    content: "Product Price:";
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

/* Style The Dropdown Button */
.dropbtn {
  background-color: #327a81;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
  background-color: #327a81;
}

</style>
<meta charset="ISO-8859-1">

<title>Product lists</title>
</head>
<body>
<div class="dropdown">
  <button class="dropbtn">Categories</button>
  <div class="dropdown-content">
  
    <a href="product?category=Classic Cars">Classic Cars</a>
    <a href="product?category=Motorcycles">Motorcycles</a>
    <a href="product?category=Planes">Planes</a>
    <a href="product?category=Ships">Ships</a>
    <a href="product?category=Trains">Trains</a>
    <a href="product?category=Trucks and Buses">Trucks and Buses</a>
    <a href="product?category=Vintage Cars">Vintage Cars</a>
  </div>
</div>

<div class="table-users">
<%
out.println("<div class=\"header\">"+cat+"</div>");
%>
   <table cellspacing="0">
      <tr>
         <th>Product Picture</th>
         <th>Product Name</th>
         <th>Product Scale</th>
         <th>Product Vendor</th>
         <th width="730">Product Description</th>
         <th>Product Price</th>
      </tr>

	<%
	Collections.reverse(products);
	for(Product p:products){
		out.println("<tr>");
		out.println("<td><img src=\""+ p.getImagePath()+"\" /></td>");
		out.println("<td><a href = \"product?productCode="+p.getProductcode()+"\">"+p.getProductname()+"</a></td>");
		out.println("<td>"+p.getProductscale()+"</td>");
		out.println("<td>"+p.getProductvendor()+"</td>");
		out.println("<td>"+p.getProductdescription()+"</td>");
		out.println("<td>RM "+p.getMsrp()+"</td>");
		out.println("</tr>");
	}
	
	%>
      
   </table>
</div>
</body>
</html>