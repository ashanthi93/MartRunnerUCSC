<%@page import="org.joda.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details of a Vendor | Reports | MartRunner</title>
        <!-- Bootstrap Core CSS -->
        <link href="../../static/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body{
                font-family: serif;
                font-size: 18px;
            }
            .panel-default > .panel-heading {
                background-color:white;
            }

        </style>
    </head>
    <body>
        <!-- get details from the servlet -->
        <%
            Vendor vendor = new Vendor();
            vendor = (Vendor) session.getAttribute("vendor");
            //admin name
            String username = (String) session.getAttribute("User");
            //today
            LocalDate currentDate = LocalDate.now();


        %>

        <br/>

        <section>
            <div class="container">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <!-- start of report header -->
                        <div class="row">
                            <div class="col-sm-12">
                                <!-- logo -->
                                <div class="col-xs-2">
                                    <img src="../../static/images/logo.png">
                                </div>
                                <!-- topic of the report -->
                                <div class="col-sm-7">
                                    <h1 style="text-align: center;"> Vendor Details Report </h1>
                                </div>
                                <!--download and back buttons-->
                                <div class="col-sm-3">
                                    <button class="btn btn-primary hidden-print" onClick="window.print();">Download report</button>
                                    <a href="../reportViewDetailsOfAVendor.jsp"><button class="btn btn-primary hidden-print" >Back</button></a>
                                </div>
                            </div>
                        </div>
                        <!-- Vendor name -->
                        <div class="row">
                            <div class="col-xs-12 col-xs-offset-4">
                                <h3> <% out.println(vendor.getVendorName());%> </h3>
                            </div>
                        </div>

                        <!-- report generation details date and admin -->
                        <div class="row">
                            <div class="col-sm-12">
                                <h4 id="left" style="float: left; margin-left: 10px;"> Generated By : <% out.println(username); %>  </h4>
                                <h4 id="right" style="float: right; margin-right: 10px;"> Generated Date : <% out.println(currentDate);%> </h4>
                            </div>
                        </div>

                        <!-- End of report header -->

                        <hr>

                        <div class="panel-body">
                            <!--Details of the vendor -->

                            <!-- contact details -->
                            <h3 style="font-weight: bold; font-style: oblique;"> Contact Details  </h3>



                            <div class="col-xs-10 col-xs-offset-1 ">
                                <!-- Vendor Name-->
                                <div class="row">                                       
                                    <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Vendor Name &nbsp;&nbsp;&nbsp;&nbsp;: </span>
                                        <%=vendor.getVendorName()%></p> 
                                </div>

                                <!-- first Name-->
                                <div class="row">                                       
                                    <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Owner Name &nbsp;&nbsp;&nbsp;&nbsp; : </span>
                                        <%=vendor.getUserFirstname()%> &nbsp; <%=vendor.getUserLastName()%></p> 
                                </div>

                                <!-- nic number-->
                                <div class="row">                                       
                                    <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">NIC Number &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </span>
                                        <%=vendor.getUserNIC()%></p> 
                                </div>

                                <!-- contact number-->
                                <div class="row">                                       
                                    <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Contact Number &nbsp;&nbsp;: </span>
                                        <%=vendor.getUserContactNo()%></p> 
                                </div>

                                <!-- email-->
                                <div class="row">                                       
                                    <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Email Address &nbsp;&nbsp;&nbsp; : </span>
                                        <%=vendor.getUserEmail()%></p> 
                                </div>

                                <!-- Address-->
                                <div class="row">                                       
                                    <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Address &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </span>
                                        <%=vendor.getAddress()%></p> 
                                </div>


                            </div>
                            <!-- product details -->
                            <div class="col-xs-10 ">
                                <h3 style="font-weight: bold; font-style: oblique;"> Product Details  </h3>

                                <div class="col-xs-10 col-xs-offset-1">
                                    <!-- Products-->
                                    <div class="row">                                       
                                        <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Products &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </span>
                                            <%=vendor.getProducts()%></p> 
                                    </div>

                                    <!-- Description-->
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; margin-left: -10px;">Description &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: </span></p>
                                        </div>
                                        <div class="col-xs-9" >
                                            <p style="font-family: lucida bright;font-size: 15px; margin-left: -30px; text-align: justify;"><%=vendor.getDescription()%></p></div>
                                    </div>
                                </div>
                            </div>
                            <label> <i> This is an auto generated report from MartRunner. </i> </label>
                        </div>
                    </div>
                    </section>
                    <!-- jQuery -->
                    <script src="../static/js/jquery.js"></script>

                    <!-- Bootstrap Core JavaScript -->
                    <script src="../static/js/bootstrap.min.js"></script>

                    </body>
                    </html>
