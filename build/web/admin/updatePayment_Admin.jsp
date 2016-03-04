<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Update Payment | Admin | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">
        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <style>
            #h4{
                font-weight: bold; 
                font-family: lucida bright;; 
                color:#218868;
                background-color: #C1FFC1;
                padding: 5px;
            }
        </style>
    </head>

    <body >

        <%@include file="header_sub.jsp" %>
        <jsp:include page="/LoadPaidVendors" />

        <section>
            <div class="container" >
                <div class="row col-xs-12 col-sm-12 col-sm-12 col-lg-12 ">
                    
                    <!--Start of Side Bar-->
                    <div class=" col-sm-3 col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                 
                                 <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 
                                        <!--Start of Side Bar Topic-->
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> Payment Handling </label>  
                                        <br/><br/>
                                        <!--End of Side Bar Topic-->
                                        
                                        <!--Start of Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> 
                                        <!--End of Dashboard Icon-->
                                        
                                        <!-- Start of Update Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#008B45; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-edit" style="font-size:20px; color:#008B45; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default active" style="width:auto" href="updatePayment_Admin.jsp"> <strong> Update Payment</strong></a>
                                        <br><br>  
                                        <!-- End of Update Payment Icon-->
                                       
                                    </center>
                                </div>
                                 
                            </div>
                        </div> 
                    </div>
                    <!--End of Side Bar-->
            
                    <!--Update Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> Update Payment </p>
                                </div>
                                <!--Form Body-->
                                <div class="panel-body">
                                    <form  action="${pageContext.request.contextPath}/UpdatePaymentDetails" class="form-horizontal" id="updatePayment" method="POST" role="form" name="updatePayment" onsubmit="return(validateForm())" novalidate>

                                        <!--Start of Select Vendor name-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="vendorname" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-3 required" style="display: inline-block; text-align: left;">Vendor Name</label>
                                                <div class="col-xs-6">
                                                    <select class="combobox form-control" name="vendorName" id="vendorName">
                                                        <option name="vendorName" value="" selected="selected">Select vendor name</option>
                                                        <%  List<String[]> allVendors = (List<String[]>) session.getAttribute("allVendors");
                                                            
                                                            if (allVendors.size() >0) {
                                                                for (String s[] : allVendors) {
                                                        %>
                                                        <option name="vendorName" value="<%=s[1]%>" > <%out.print(s[2]);%> </option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                    <!--Start of Vendor name error label-->
                                                    <label id="errorVendorName" style="font-size:10px"> </label>
                                                    <!--End of Vendor name error label-->
                                                </div>
                                            </div>
                                        </div>
                                      <!--End of Select Vendor name-->
                                      
                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-4 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> OK </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End of ok,cancel Buttons-->
                                    </form>
                                </div>
                            </div>


                            <!--End of update Payment Form-->
                            <br> 


                        </div>
                    </div>

                </div>
            </div>

        </section>
        <%@include file="footer_sub.jsp" %>

        <script type="text/javascript">
            function validateForm() {
                var errors = [];

                //Vendor name validation                

                if (!validateName("vendorName", "errorVendorName")) {
                    errors.push("errorVendorName");
                }
                
                if (errors.length > 0) {
                    return false;
                } else {
                    return true;
                }
            }
            
            //Vendor name validation function
            function validateName(text, errorLbl) {
                /*if executes for incorrect values. Error label will be displayed*/
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                 /*else executes for correct values. Error label will not be displayed*/
                } else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }

            

        </script>

        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/main.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.combobox').combobox();
            });
        </script>
        
        
    </body>
</html>
