<%@page import="classes.Vendor"%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Message History| Mart Runner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/bootstrap-submenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

    </head>

    <body>
        <%@include file="header_sub.jsp" %>

        <%            if (!(username == null)) {
        %>

        <br/>            

        <section>

            <div class="container" >
                <div class="row">

                    <!--Start of Side Bar-->
                    <div class=" col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 

                                        <!--Side Bar Topic-->
                                        <label style="color: #000000; padding-top:35px; font-size:22px;"> Contact Administrator </label>  
                                        <br/><br/><br/><br/> 

                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#EE2C2C; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width: auto;" href="vendorHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br><br><br><br><br><br> 

                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>
                    <div class="container" >
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <%
                                    List<Vendor> vendorMessages = (List<Vendor>) session.getAttribute("vendorMessages");
                                    String vendorId = "";

                                    if (vendorMessages.size() > 0) {
                                        Vendor messageVendor = vendorMessages.get(0);
                                        vendorId = messageVendor.getVendorID();

                                    }

                                %>
                                <!--panel Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <div class="row">
                                        <p class="panel-title col-xs-10" style="color:#000; font-weight:bold; font-size: 20px;"> My Message History </p>
                                        <a href="contactAdmin.jsp"> <button type="submit" class="btn btn-default" style="background-color: #C1FFC1;">Back</button></a>
                                    </div>
                                </div>
                                <!--panel Body-->
                                <div class="panel-body">
                                    <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6' >
                                        <%                                        for (Vendor messageVendor : vendorMessages) {
                                                out.println("<b>");
                                                out.println(messageVendor.getMessageTime());
                                                out.println("</b>");
                                                out.println("<br/>");

                                                out.println(messageVendor.getMessage());
                                                out.println("<br/>");
                                                out.println("<br/>");
                                            }

                                        %>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>
        <%            }
        %>                                                               
        <br>
        <%@include file="footer_sub.jsp" %>




        <!-- jQuery -->
        <!--<script src="static/js/jquery.js"></script> dropdown won't work for this -->
        <script src="../static/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-submenu.min.js"></script>

        <script>
            $('.dropdown-submenu > a').submenupicker();
        </script>
    </body>
</html>