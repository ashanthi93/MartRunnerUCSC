<%@page import="java.io.IOException"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Image"%>
<%@page import="javax.swing.ImageIcon"%>
<%@page import="classes.User"%>
<%@page import="classes.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Vendor Profile | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <!--travel page CSS-->
        <link href="../static/css/vendor_travel.css" rel="stylesheet">

        <style type="text/css">
            #subHeader{
                background-color: #000;
                color: #fff;
                font-style: italic;
                padding-bottom: -10px;
                padding-top: -10px;
            }
        </style>
    </head>

    <body id="vendors">
        <!-- Including Header Page-->
        <%
            //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-cache");

            //Directs caches not to store the page under any circumstance
            response.setHeader("Cache-Control", "no-store");

            //Causes the proxy cache to see the page as "stale"
            response.setDateHeader("Expires", 0);

            //HTTP 1.0 backward compatibility
            response.setHeader("Pragma", "no-cache");
        %>

        <jsp:include page="header.jsp" />

        <!-- Start of Vendor Travel Page Content-->
        <section>
            <div class="row" >
                <div class="col-sm-12  col-lg-12">
                    <div class="panel panel-default" style="margin-top: 10px; margin-left: 15px;margin-right: 15px;">
                        <div class="panel-body">
                            <!--content-->
                            <div class="col-xs-10 col-xs-offset-2 col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-1  col-lg-5 col-lg-offset-1">
                                <%
                                    //ServletContext context=request.getServletContext();
                                    HttpSession vendorSession = request.getSession();
                                    Vendor vendor = (Vendor) vendorSession.getAttribute("vendor");
                                    User user = (User) vendorSession.getAttribute("user");
                                    String productCategory = vendorSession.getAttribute("productCategory") + "";
                                %>

                                <!--header-->
                                <div class="travelheader" >
                                    <label  id="title"> <%= vendor.getVendorName()%> </label>

                                    <%  if (session.getAttribute("User") == null) {%>
                                    <span class="col-xs-offset-1"><a href="contactVendor.jsp?selectedVendorId=<%=vendor.getVendorID()%>"> <button type="submit" class="btn btn-primary" >Contact Vendor <span class="glyphicon glyphicon-envelope"></span></button></a></span>
                                                <% }%>
                                </div>
                                <!--Vendor Details-->
                                <div class="container">
                                    <div class="row">
                                        <div class="col-xs-8" id="aboutDiv" >
                                            <table>
                                                <tr style="width:800px;">
                                                    <td colspan="2" style="width: 800px;">
                                                        <label style="color: #0066CC"> <h3> About</h3></label>
                                                        <p > <%= vendor.getDescription()%></p>
                                                    </td> 
                                                </tr>

                                                <tr >
                                                    <td rowspan ="2" >
                                                        <label style="color: #0066CC"><h3>Products</h3></label>
                                                        <p > <%= vendor.getProducts()%></p>
                                                    </td> 

                                                    <td>
                                                        <label style="color: #0066CC"><h5>Vendor Type:</h5></label>
                                                        <% String mainCategory = vendor.getMainCatg();
                                                            if (mainCategory == "RB") {
                                                                mainCategory = "Resposible Business";
                                                            } else if (mainCategory == "RP") {
                                                                mainCategory = "Rural Producers";
                                                            } else {
                                                                mainCategory = "Social Enterprise";
                                                            }

                                                        %>
                                                        <label><h5><%=mainCategory%></h5></label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <label style="color: #0066CC"><h5>Product Category:</h5></label>
                                                        <label><h5><%=productCategory%></h5></label>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td rowspan="3">
                                                        <label style="color: #0066CC"><h3>Contact Us</h3></label><br/>
                                                        <label style="color: #0066CC"><h5>Address: </h5></label>
                                                        <label ><h5>  <%=vendor.getAddress()%> </h5></label><br/>

                                                        <label style="color: #0066CC"><h5>Mobile Number: </h5></label>
                                                        <label ><h5>  <%=user.getUserContactNo()%> </h5></label><br/>
                                                        <%
                                                            System.out.print("Mob: " + user.getUserContactNo());
                                                            if (vendor.getFixedLine() != "") {
                                                        %>

                                                        <label style="color: #0066CC"><h5>Fixed Line: </h5></label><br/>
                                                        <label><h5> <%=vendor.getFixedLine()%> </h5></label><br/>

                                                        <% } %>

                                                        <%
                                                            if (user.getUserEmail() != "") {
                                                        %>

                                                        <label style="color: #0066CC"><h5> Email: </h5></label> <br/>
                                                        <label><h5> <%=user.getUserEmail()%> </h5></label> <br/>

                                                        <% } %>

                                                        <%
                                                            if (vendor.getFbLink() != "") {
                                                        %>
                                                        <a href="<%=vendor.getFbLink()%>">  <i class="fa fa-facebook-square" style="color: #1C0374;"></i> </a>
                                                        <% } %>

                                                        <%
                                                            if (vendor.getgPlus() != "") {
                                                        %>
                                                        <a href="<%=vendor.getgPlus()%>"><i class="fa fa-google-plus-square" style="color: #BC2312;"></i></a>
                                                            <% } %>

                                                        <%
                                                            if (vendor.getTweeter() != "") {
                                                        %>
                                                        <a href="<%=vendor.getTweeter()%>"><i class="fa fa-twitter-square" style="color: #0066CC;"></i></a>
                                                            <% }%>
                                                    </td>

                                                    <td>
                                                        <label style="color: #0066CC"><h5>Product Level:</h5></label>
                                                        <label><h5>Level <%=vendor.getProductLevel()%></h5></label>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <label style="color: #0066CC"><h5>Environmental Impact:</h5></label>
                                                        <label><h5>Level <%=vendor.getEiLevel()%></h5></label>

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <label style="color: #0066CC"><h5>Social Impact:</h5></label>
                                                        <label><h5>Level <%=vendor.getSiLevel()%></h5></label>

                                                    </td>
                                                </tr>

                                            </table>
                                        </div>

                                        <div class="col-xs-4">


                                            <img src="../static/images/vendorprofile/<%=vendor.getVendorID()%>.jpg" style="width: 300px; height: 300px;">



 <!--<img src="../static/images/PromotionalPost/<%=vendor.getVendorID()%>.jpg" style="width: 300px; height: 300px;">-->

                                        </div>



                                    </div>

                                </div>
                            </div>

                            <!--images-->	
                            <div class=" hidden-xs  col-sm-5   col-sm-offset-3 col-md-offset-1 col-md-5 col-lg-5 col-lg-offset-1">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include  file="footer.jsp" %>

        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>

        <script>
            $("#myCarousel").carousel({interval: 2500});
        </script>
    </body>
</html>
