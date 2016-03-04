<%@page import="java.util.List"%>
<%@page import="classes.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Details of a Vendor | Reports | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <!-- datepicker CSS -->
        <link rel="stylesheet" href="../static/css/datepicker.css">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <style>
            #h4{
                font-weight: bold; 
                font-family: lucida bright;
                color:#218868;
                background-color: #C1FFC1;
                padding: 5px;
            }

            label.required:after {
                content: "*";
                color: red;
            }
        </style>

    </head>
    <body>
        <!-- header of the page -->
        <%@include file="header_sub.jsp" %>
        <!-- load servlet -->
        <jsp:include page="/paymentGetVendors" />


        <section>
            <div class="container" >
                <div class="row col-xs-12 col-sm-12 col-sm-12 col-lg-12 ">
                    <!--Start of Side Bar-->
                    <div class=" col-sm-3 col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 
                                        <!--Side Bar Topic-->
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> Vendor Details Reports </label>  
                                        <br/><br/> 
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> 
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End of Side Bar-->

                    <!-- start of form -->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> View Details Of a Vendor </p>
                                </div>
                                <!--Form Body-->
                                <div class="panel-body">
                                    <form action="${pageContext.request.contextPath}/ReportViewDetailsOfAVendor" class="form-horizontal" id="changevendorprofile" method="POST"  role="form" onsubmit="return(validateForm())" novalidate>
                                        <br><br>
                                        <!--Vendor name-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="vendorname" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-3 required" style="display: inline-block; text-align: left;">Vendor Name</label>
                                                <div class="col-xs-6">
                                                    <select class="combobox form-control" name="vendorName" id="vendorName">
                                                        <option name="vendorName" value="" selected="selected">Select vendor name</option>
                                                        <%                                                    List<Vendor> VendorList = (List<Vendor>) session.getAttribute("vendorList");
                                                            if (VendorList != null) {
                                                                for (Vendor vendor : VendorList) {
                                                        %>
                                                        <option name="vendorName" value="<%=vendor.getVendorID()%>" > <%out.print(vendor.getVendorName());%> </option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                    <label id="errorVendorName" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <!--ok,cancel Buttons-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-5 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> Submit </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div><br><br>
                                    </form>
                                </div>
                            </div>
                            </section>

                                                    <br><br><br><br><br><br><br>
                            <!--footer of the page -->
                            <%@include file="footer_sub.jsp" %>
                            <!-- script foe data validation-->
                            <script type="text/javascript">

                                //function for validate form
                                function validateForm() {
                                    var errors = [];

                                    if (!validateVendorName()) {
                                        errors.push("errorVendorName");
                                    }

                                    if (errors.length > 0) {
                                        return false;
                                    }
                                    else {
                                        return true;
                                    }

                                    //validate vendor name
                                    function validateVendorName() {
                                        var option = document.getElementById("vendorName").value;
                                        if (option == "" || option == null) {
                                            document.getElementById("vendorName").focus();
                                            document.getElementById("vendorName").style.borderColor = "red";
                                            document.getElementById("errorVendorName").innerHTML = "required";
                                            document.getElementById("errorVendorName").style.color = "red";
                                            return false;
                                        }
                                        else {
                                            document.getElementById("vendorName").style.borderColor = "green";
                                            document.getElementById("errorVendorName").innerHTML = "";
                                            return true;
                                        }
                                    }
                                }
                            </script>  



                            <!-- Java Script file-->
                            <script src="../static/js/jquery.js"></script>
                            <script src="../static/js/main.js"></script>
                            <script src="../static/js/bootstrap-combobox.js"></script>
                            <!-- script for combobox -->
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $('.combobox').combobox();
                                });
                            </script>
                            </body>
                            </html>
