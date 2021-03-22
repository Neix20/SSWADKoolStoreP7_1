<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="formmodels.LogInModel"%>
<%@page import="java.util.*"%>
<%@page import="domain.Product"%>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
<%

List<Product> productlist = null;
try{
	productlist = (List<Product>) request.getAttribute("productlist");
	Collections.shuffle(productlist);
} catch(NullPointerException exx){
	response.sendRedirect(request.getContextPath() +  "/IndexServlet");
}


%>

<!-- 
Kool Store Template
http://www.templatemo.com/preview/templatemo_428_kool_store
-->
    <meta charset="utf-8">
    <title>Kool Store - Responsive eCommerce Template</title>

    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/normalize.min.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/templatemo-misc.css">
    <link rel="stylesheet" href="css/templatemo-style.css">

    <script src="js/vendor/modernizr-2.6.2.min.js"></script>

</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    
    <div class="content-section">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
<!--                     <div class="product-item-1"> -->
<%
							out.println("<div class=\"product-item-1\" onclick=\"location.href='Product?productCode="+productlist.get(0).getProductcode()+"';\" style=\"cursor: pointer;\">");
							%>
                        <div class="product-thumb">
                        <%
                        out.println("<img src=\""+productlist.get(0).getImagePath()+"\" alt=\"Product Title\">");
                        %>
<!--                             <img src="images/gallery-image-1.jpg" alt="Product Title"> -->
                        </div> <!-- /.product-thumb -->
                        <div class="product-content">
                        <%
                        out.println("<h5><a href = \"Product?productCode="+productlist.get(0).getProductcode()+"\">"+productlist.get(0).getProductname()+"</a></h5>");
                        out.println("<span class=\"tagline\">"+productlist.get(0).getProductvendor()+"</span>");
                        out.println("<span class=\"price\">RM "+productlist.get(0).getMsrp()+"</span>");
                        out.println("<p>"+productlist.get(0).getProductdescription()+"</p>");
                        %>
<!--                             <h5><a href="#">Kool Shirt</a></h5> -->
<!--                             <span class="tagline">Partner Name</span> -->
<!--                             <span class="price">$25.00</span> -->
<!--                             <p>Doloremque quo possimus quas necessitatibus blanditiis excepturi. Commodi, sunt asperiores tenetur deleniti labore!</p> -->
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item -->
                </div> <!-- /.col-md-3 -->
                
                <div class="col-md-5">
                    <div class="product-holder">
                    
<!--                           <div class="product-item-2">   -->
							<%
							out.println("<div class=\"product-item-2\" onclick=\"location.href='Product?productCode="+productlist.get(1).getProductcode()+"';\" style=\"cursor: pointer;\">");
							%>
                        
                            <div class="product-thumb">
                            
                            <%
                        out.println("<img src=\""+productlist.get(1).getImagePath()+"\" alt=\"Product Title\">");
                        %>
<!--                                 <img src="images/featured/1.jpg" alt="Product Title"> -->
                            </div> <!-- /.product-thumb -->
                            
                            
                            <div class="product-content overlay">
                            
                            <%
                        out.println("<h5><a href = \"Product?productCode="+productlist.get(1).getProductcode()+"\">"+productlist.get(1).getProductname()+"</a></h5>");
                        out.println("<span class=\"tagline\">"+productlist.get(1).getProductvendor()+"</span>");
                        out.println("<span class=\"price\">RM "+productlist.get(1).getMsrp()+"</span>");
                        out.println("<p>"+productlist.get(1).getProductdescription()+"</p>");
                        %>
<!--                                 <h5><a href="#">Kooler Shirt</a></h5> -->
<!--                                 <span class="tagline">Partner Name</span> -->
<!--                                 <span class="price">$30.00</span> -->
<!--                                 <p>Doloremque quo possimus quas necessitatibus blanditiis excepturi. Commodi, sunt tenetur deleniti labore!</p> -->
                            </div> <!-- /.product-content -->
                            
                            
                        </div> <!-- /.product-item-2 -->
                        
<!--                         <div class="product-item-2"> -->
<%
							out.println("<div class=\"product-item-2\" onclick=\"location.href='Product?productCode="+productlist.get(2).getProductcode()+"';\" style=\"cursor: pointer;\">");
							%>
                            <div class="product-thumb">
                            <%
                        out.println("<img src=\""+productlist.get(2).getImagePath()+"\" alt=\"Product Title\">");
                        %>
<!--                                 <img src="images/featured/2.jpg" alt="Product Title"> -->
                            </div> <!-- /.product-thumb -->
                            <div class="product-content overlay">
                            <%
                        out.println("<h5><a href = \"Product?productCode="+productlist.get(2).getProductcode()+"\">"+productlist.get(2).getProductname()+"</a></h5>");
                        out.println("<span class=\"tagline\">"+productlist.get(2).getProductvendor()+"</span>");
                        out.println("<span class=\"price\">RM "+productlist.get(2).getMsrp()+"</span>");
                        out.println("<p>"+productlist.get(2).getProductdescription()+"</p>");
                        %>
<!--                                 <h5><a href="#">Koolest Shirt</a></h5> -->
<!--                                 <span class="tagline">Partner Name</span> -->
<!--                                 <span class="price">$45.00</span> -->
<!--                                 <p>Doloremque quo possimus quas necessitatibus blanditiis excepturi. Commodi, sunt tenetur deleniti labore!</p> -->
                            </div> <!-- /.product-content -->
                        </div> <!-- /.product-item-2 -->
                        <div class="clearfix"></div>
                    </div> <!-- /.product-holder -->
                </div> <!-- /.col-md-5 -->
                <div class="col-md-4">
<!--                     <div class="product-item-3"> -->
<%
							out.println("<div class=\"product-item-3\" onclick=\"location.href='Product?productCode="+productlist.get(3).getProductcode()+"';\" style=\"cursor: pointer;\">");
							%>
                        <div class="product-thumb">
                        <%
                        out.println("<img src=\""+productlist.get(3).getImagePath()+"\" alt=\"Product Title\">");
                        %>
<!--                             <img src="images/featured/6.jpg" alt=""> -->
                        </div> <!-- /.product-thumb -->
                        <div class="product-content">
                            <div class="row">
                                <div class="col-md-6 col-sm-6">
                                <%
                        out.println("<h5><a href = \"Product?productCode="+productlist.get(3).getProductcode()+"\">"+productlist.get(3).getProductname()+"</a></h5>");
                        out.println("<span class=\"tagline\">"+productlist.get(3).getProductvendor()+"</span>");
                        out.println("<span class=\"price\">RM "+productlist.get(3).getMsrp()+"</span>");
                        out.println("<p>"+productlist.get(3).getProductdescription()+"</p>");
                        %>
<!--                                     <h5><a href="#">Name Of Shirt</a></h5> -->
<!--                                     <span class="tagline">Partner Name</span> -->
<!--                                     <span class="price">$20.00</span> -->
                                </div> <!-- /.col-md-6 -->
<!--                                 <div class="col-md-6 col-sm-6"> -->
<!--                                     <div class="full-row"> -->
<!--                                         <label for="cat">Gender:</label> -->
<!--                                         <select name="cat" id="cat" class="postform"> -->
<!--                                             <option value="-1">- Select -</option> -->
<!--                                             <option class="level-0" value="49">Female</option> -->
<!--                                             <option class="level-0" value="56">Male</option> -->
<!--                                         </select> -->
<!--                                     </div> -->
<!--                                     <div class="full-row"> -->
<!--                                         <label for="cat1">Size:</label> -->
<!--                                         <select name="cat1" id="cat1" class="postform"> -->
<!--                                             <option value="-1">- Select -</option> -->
<!--                                             <option class="level-0" value="49">Small</option> -->
<!--                                             <option class="level-0" value="49">Medium</option> -->
<!--                                             <option class="level-0" value="56">Large</option> -->
<!--                                             <option class="level-0" value="56">X-Large</option> -->
<!--                                         </select> -->
<!--                                     </div> -->
<!--                                     <div class="full-row"> -->
<!--                                         <label for="cat2">Color:</label> -->
<!--                                         <select name="cat2" id="cat2" class="postform"> -->
<!--                                             <option value="-1">- Select -</option> -->
<!--                                             <option class="level-0" value="2">Blue</option> -->
<!--                                             <option class="level-0" value="3">Red</option> -->
<!--                                             <option class="level-0" value="1">Pink</option> -->
<!--                                             <option class="level-0" value="4">Black</option> -->
<!--                                             <option class="level-0" value="4">Wlack</option> -->
<!--                                         </select> -->
<!--                                     </div> -->
<!--                                 </div> /.col-md-6 -->
<!--                                 <div class="col-md-12 col-sm-12"> -->
<!--                                     <div class="button-holder"> -->
<!--                                         <a href="#" class="red-btn"><i class="fa fa-angle-down"></i></a> -->
<!--                                     </div> /.button-holder -->
<!--                                 </div> /.col-md-12 -->
                            </div> <!-- /.row -->
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item-3 -->
                </div> <!-- /.col-md-4 -->
            </div> <!-- /.row -->
            <div class="row">
                <div class="col-md-4 col-sm-6 col-xs-12">
<!--                     <div class="product-item-4"> -->
<%
							out.println("<div class=\"product-item-4\" onclick=\"location.href='Product?productCode="+productlist.get(4).getProductcode()+"';\" style=\"cursor: pointer;\">");
							%>
                        <div class="product-thumb">
                        <%
                        out.println("<img src=\""+productlist.get(4).getImagePath()+"\" alt=\"Product Title\">");
                        %>
<!--                             <img src="images/featured/3.jpg" alt="Product Title"> -->
                        </div> <!-- /.product-thumb -->
                        <div class="product-content overlay">
                        <%
                        out.println("<h5><a href = \"Product?productCode="+productlist.get(4).getProductcode()+"\">"+productlist.get(4).getProductname()+"</a></h5>");
                        out.println("<span class=\"tagline\">"+productlist.get(4).getProductvendor()+"</span>");
                        out.println("<span class=\"price\">RM "+productlist.get(4).getMsrp()+"</span>");
                        out.println("<p>"+productlist.get(4).getProductdescription()+"</p>");
                        %>
<!--                             <h5><a href="#">Name Of Shirt</a></h5> -->
<!--                             <span class="tagline">Partner Name</span> -->
<!--                             <span class="price">$60.00</span> -->
<!--                             <p>Doloremque quo possimus quas necessitatibus.</p> -->
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item-4 -->
                </div> <!-- /.col-md-4 -->
                <div class="col-md-4 col-sm-6 col-xs-12">
<!--                     <div class="product-item-4"> -->
<%
							out.println("<div class=\"product-item-4\" onclick=\"location.href='Product?productCode="+productlist.get(5).getProductcode()+"';\" style=\"cursor: pointer;\">");
							%>
                        <div class="product-thumb">
                        <%
                        out.println("<img src=\""+productlist.get(5).getImagePath()+"\" alt=\"Product Title\">");
                        %>
<!--                             <img src="images/featured/4.jpg" alt="Product Title"> -->
                        </div> <!-- /.product-thumb -->
                        <div class="product-content overlay">
                        <%
                        out.println("<h5><a href = \"Product?productCode="+productlist.get(5).getProductcode()+"\">"+productlist.get(5).getProductname()+"</a></h5>");
                        out.println("<span class=\"tagline\">"+productlist.get(5).getProductvendor()+"</span>");
                        out.println("<span class=\"price\">RM "+productlist.get(5).getMsrp()+"</span>");
                        out.println("<p>"+productlist.get(5).getProductdescription()+"</p>");
                        %>
<!--                             <h5><a href="#">Name Of Shirt</a></h5> -->
<!--                             <span class="tagline">Partner Name</span> -->
<!--                             <span class="price">$30.00</span> -->
<!--                             <p>Doloremque quo possimus quas necessitatibus.</p> -->
                        </div> <!-- /.product-content -->
                    </div> <!-- /.product-item-4 -->
                </div> <!-- /.col-md-4 -->
<!--                 <div class="col-md-4 col-sm-12 col-xs-12"> -->
<!--                     <div class="ads-placemenet"> -->
<!--                         <img src="images/featured/5.jpg" alt=""> -->
<!--                     </div> /.ads-placement -->
<!--                 </div> /.col-md-4 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.content-section -->

    <div class="content-section">
        <div class="container">
            <div class="row">
                <div class="col-md-12 section-title">
                    <h2>Other Products</h2>
                </div> <!-- /.section -->
            </div> <!-- /.row -->
            <div class="row">
            <%
            int count = 0;
            for(count = 6; count<10;count++){
            	out.println("<div class=\"col-md-3 col-sm-6\">");
            	out.println("<div class=\"product-item\" onclick=\"location.href='Product?productCode="+productlist.get(count).getProductcode()+"';\" style=\"cursor: pointer;\">");
            	out.println("<div class=\"product-thumb\">");
            	out.println("<img src=\""+productlist.get(count).getImagePath()+"\" alt=\"Product Title\">");
            	out.println("</div>");
            	out.println("<div class=\"product-content\">");
            	out.println("<h5><a href = \"Product?productCode="+productlist.get(count).getProductcode()+"\">"+productlist.get(count).getProductname()+"</a></h5>");
            	out.println("<span class=\"price\">RM "+productlist.get(count).getMsrp()+"</span>");
            	out.println("</div>");
            	out.println("</div>");
            	out.println("</div>");
            }
            %>
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="product-item"> -->
<!--                         <div class="product-thumb"> -->
<!--                             <img src="images/gallery-image-2.jpg" alt=""> -->
<!--                         </div> /.product-thum -->
<!--                         <div class="product-content"> -->
<!--                             <h5><a href="#">Name of Shirt</a></h5> -->
<!--                             <span class="price">$40.00</span> -->
<!--                         </div> /.product-content -->
<!--                     </div> /.product-item -->
<!--                 </div> /.col-md-3 -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="product-item"> -->
<!--                         <div class="product-thumb"> -->
<!--                             <img src="images/gallery-image-3.jpg" alt=""> -->
<!--                         </div> /.product-thum -->
<!--                         <div class="product-content"> -->
<!--                             <h5><a href="#">Sport Shirt</a></h5> -->
<!--                             <span class="price">$40.00</span> -->
<!--                         </div> /.product-content -->
<!--                     </div> /.product-item -->
<!--                 </div> /.col-md-3 -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="product-item"> -->
<!--                         <div class="product-thumb"> -->
<!--                             <img src="images/gallery-image-4.jpg" alt=""> -->
<!--                         </div> /.product-thum -->
<!--                         <div class="product-content"> -->
<!--                             <h5><a href="#">Elegant Shirt</a></h5> -->
<!--                             <span class="price">$60.00</span> -->
<!--                         </div> /.product-content -->
<!--                     </div> /.product-item -->
<!--                 </div> /.col-md-3 -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="product-item"> -->
<!--                         <div class="product-thumb"> -->
<!--                             <img src="images/gallery-image-5.jpg" alt=""> -->
<!--                         </div> /.product-thum -->
<!--                         <div class="product-content"> -->
<!--                             <h5><a href="#">Another New Shirt</a></h5> -->
<!--                             <span class="price">$80.00</span> -->
<!--                         </div> /.product-content -->
<!--                     </div> /.product-item -->
<!--                 </div> /.col-md-3 -->
            </div> <!-- /.row -->
        </div> <!-- /.container -->
    </div> <!-- /.content-section -->

<!--     <div class="content-section"> -->
<!--         <div class="container"> -->
<!--             <div class="row"> -->
<!--                 <div class="col-md-12 section-title"> -->
<!--                     <h2>Vote For Future Products</h2> -->
<!--                 </div> /.section -->
<!--             </div> /.row -->
<!--             <div class="row"> -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="product-item-vote"> -->
<!--                         <div class="product-thumb"> -->
<!--                             <img src="images/products/1.jpg" alt=""> -->
<!--                         </div> /.product-thum -->
<!--                         <div class="product-content"> -->
<!--                             <h5><a href="#">Name of Shirt</a></h5> -->
<!--                             <span class="tagline">By: Catherine</span> -->
<!--                             <ul class="progess-bars"> -->
<!--                                 <li> -->
<!--                                     <div class="progress"> -->
<!--                                         <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div> -->
<!--                                         <span>4<i class="fa fa-heart"></i></span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <div class="progress"> -->
<!--                                         <div class="progress-bar comments" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div> -->
<!--                                         <span class="comments">6<i class="fa fa-heart"></i></span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> /.product-content -->
<!--                     </div> /.product-item-vote -->
<!--                 </div> /.col-md-3 -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="product-item-vote"> -->
<!--                         <div class="product-thumb"> -->
<!--                             <img src="images/products/2.jpg" alt=""> -->
<!--                         </div> /.product-thum -->
<!--                         <div class="product-content"> -->
<!--                             <h5><a href="#">Name of Shirt</a></h5> -->
<!--                             <span class="tagline">By: Rebecca</span> -->
<!--                             <ul class="progess-bars"> -->
<!--                                 <li> -->
<!--                                     <div class="progress"> -->
<!--                                         <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div> -->
<!--                                         <span>4<i class="fa fa-heart"></i></span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <div class="progress"> -->
<!--                                         <div class="progress-bar comments" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div> -->
<!--                                         <span class="comments">6<i class="fa fa-heart"></i></span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> /.product-content -->
<!--                     </div> /.product-item-vote -->
<!--                 </div> /.col-md-3 -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="product-item-vote"> -->
<!--                         <div class="product-thumb"> -->
<!--                             <img src="images/products/3.jpg" alt=""> -->
<!--                         </div> /.product-thum -->
<!--                         <div class="product-content"> -->
<!--                             <h5><a href="#">Name of Shirt</a></h5> -->
<!--                             <span class="tagline">By: Catherine</span> -->
<!--                             <ul class="progess-bars"> -->
<!--                                 <li> -->
<!--                                     <div class="progress"> -->
<!--                                         <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div> -->
<!--                                         <span>4<i class="fa fa-heart"></i></span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <div class="progress"> -->
<!--                                         <div class="progress-bar comments" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div> -->
<!--                                         <span class="comments">6<i class="fa fa-heart"></i></span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> /.product-content -->
<!--                     </div> /.product-item-vote -->
<!--                 </div> /.col-md-3 -->
<!--                 <div class="col-md-3 col-sm-6"> -->
<!--                     <div class="product-item-vote"> -->
<!--                         <div class="product-thumb"> -->
<!--                             <img src="images/products/4.jpg" alt=""> -->
<!--                         </div> /.product-thum -->
<!--                         <div class="product-content"> -->
<!--                             <h5><a href="#">Name of Shirt</a></h5> -->
<!--                             <span class="tagline">By: Rebecca</span> -->
<!--                             <ul class="progess-bars"> -->
<!--                                 <li> -->
<!--                                     <div class="progress"> -->
<!--                                         <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%;"></div> -->
<!--                                         <span>4<i class="fa fa-heart"></i></span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                                 <li> -->
<!--                                     <div class="progress"> -->
<!--                                         <div class="progress-bar comments" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div> -->
<!--                                         <span class="comments">6<i class="fa fa-heart"></i></span> -->
<!--                                     </div> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                         </div> /.product-content -->
<!--                     </div> /.product-item-vote -->
<!--                 </div> /.col-md-3 -->
<!--             </div> /.row -->
<!--         </div> /.container -->
<!--     </div> /.content-section -->

    <jsp:include page="footer.jsp"></jsp:include>

    
    <script src="js/vendor/jquery-1.10.1.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.10.1.min.js"><\/script>')</script>
    <script src="js/jquery.easing-1.3.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>


</body>
</html>