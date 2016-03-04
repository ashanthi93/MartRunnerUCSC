<%@page import="java.util.List"%>
<%@page import="classes.Vendor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Vendor Messages | Mart Runner</title>
        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/bootstrap-submenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header_sub.jsp" %>
        
        <% if (!(username == null)) { %>
        <br/>            
        <section>
            <div class="container" >
                <div class="row">
                   
                    <div class="container" >
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <%
                                    List<Vendor> vendorMessages=(List<Vendor>)session.getAttribute("vendorMessages");
                                    String vendorId="";
                                    String vendorName="";
                                    if(vendorMessages.size()>0){
                                        Vendor messageVendor=vendorMessages.get(0);
                                        vendorId=messageVendor.getVendorID();
                                        Vendor vendor=new Vendor();
                                        vendor.setVendorID(vendorId);
                                        vendorName=vendor.getVendornameByVendorID();
                                    }
                                    
                                %>
                                <!--panel Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <div class="row">
                                    <p class="panel-title col-xs-11" style="color: black; font-weight: bold; padding-left: 10px; font-family: lucida bright; font-size: 20px;"> <%= vendorName %></p>
                                    <a href="viewAllVendorMessages.jsp"> <button type="submit" class="btn btn-default" style="background-color: #C1FFC1;">Back</button></a>
                                    </div>
                                </div>
                                <!--panel Body-->
                                <div class="panel-body">
                                    <div class='col-xs-6 col-sm-6 col-md-6 col-lg-6' >
                                    <%
                                     
                                     for(Vendor messageVendor:vendorMessages){
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
        <%
            }
        %>                                                               
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