<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Remove Payment | Admin | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">


        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>        
        <!-- bootstrap js -->
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>
        <script src="../static/js/bootstrap-datepicker.js"></script>

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


    <body>
        <%@include file="header_sub.jsp" %>
        <jsp:include page="/LoadPaidVendors" />

        <%
            /* To handle error messages or success messages */
            String errorMsg = "", successMsg = "";
            String errorHead = "", successHead = "";
            int error = 0, success = 0;

            if (session.getAttribute("error") != null) {

                error = (Integer) session.getAttribute("error");
                if (error == 1) {
                    errorHead = (String) session.getAttribute("errorHead");
                    errorMsg = (String) session.getAttribute("errorMsg");
                }
            }

            if (session.getAttribute("success") != null) {

                success = (Integer) session.getAttribute("success");
                if (success == 1) {
                    successHead = (String) session.getAttribute("successHead");
                    successMsg = (String) session.getAttribute("successMsg");
                }
            }
        %>

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
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> Payment Handling </label>  
                                        <br/><br/> 
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> 


                                        <!--Remove Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#EE0000; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>  
                                            <span class="glyphicon glyphicon-remove" style="font-size:20px; color:#EE0000; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>
                                        </div> <br> 
                                        <a class="btn btn-default active" style="width:auto" href="removePayment_Admin.jsp"> <strong>Remove Payment</strong></a>

                                        <br/><br/> 
                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>

                    <!--update Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >


                            <!--Remove Payment Form-->
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <div class="panel-title" style="font-size:16px; font-weight:bold;   padding: 5px; font-family: lucida bright;">
                                        <strong> Remove Payment </strong> 
                                    </div>
                                </div><br/>

                                <div class="panel-body">
                                    <form action="${pageContext.request.contextPath}/RemovePaymentDetails" class="form-horizontal" id="removePayment" name="removePayment" method="POST" role="form" onsubmit="return(validateForm())" novalidate>
                                        <!--Vendor name-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="vendorname" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-3 required" style="display: inline-block; text-align: left;">Vendor Name</label>
                                                <div class="col-xs-6">
                                                    <select class="combobox form-control" name="vendorName" id="vendorName">
                                                        <option name="vendorName" value="" selected="selected">Select vendor name</option>
                                                        <%  List<String[]> allVendors = (List<String[]>) session.getAttribute("allVendors");

                                                            if (allVendors.size() > 0) {
                                                                for (String s[] : allVendors) {
                                                        %>
                                                        <option name="vendorName" value="<%=s[1]%>" > <%out.print(s[2]);%> </option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                    <label id="errorVendorName" style="font-size:10px"> </label>

                                                </div>
                                            </div>
                                        </div>

                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-4 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> OK </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>

                                        <!--End of remove payment-->

                                    </form>

                                </div>


                            </div> 
                        </div>

                    </div>
                </div>
            </div>           
        </section>

        <!-- Modal Error -->
        <div class="modal" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="color: red;">                        
                        <h4 class="modal-title" id="errorHead"> <% out.println(errorHead);%> </h4>
                    </div>
                    <div class="modal-body">
                        <p id="errorMsg" style="font-weight: normal;"> <% out.println(errorMsg);%> </p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-danger" data-dismiss="modal"> OK </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal Success -->
        <div class="modal" id="successModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="color: green;">                        
                        <h4 class="modal-title" id="successMsg"> <% out.println(successHead);%> </h4>
                    </div>
                    <div class="modal-body">
                        <p id="successMsg" style="font-weight: normal;"> <% out.println(successMsg);%> </p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" data-dismiss="modal"> OK </button>
                    </div>
                </div>
            </div>
        </div>    
                    <br><br>
        <%@include file="footer_sub.jsp" %>

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
            }
            //validate vendor name
            function validateVendorName() {
                if (document.getElementById("vendorName").value == "" || document.getElementById("vendorName").value == null) {
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



        </script>

    

        <script type="text/javascript">
            $(document).ready(function () {
                $('.combobox').combobox();
            });
        </script>
        
        <!--script for prompt error messages-->
        <script>
            var error = '<%= error%>';

            if (error == 1) {

                $(window).load(function () {
                    $('#errorModal').modal('show');
                });

            <%
                session.removeAttribute("error");
                session.removeAttribute("errorHead");
                session.removeAttribute("errorMsg");
            %>
            }

            var success = '<%= success%>';

            if (success == 1) {

                $(window).load(function () {
                    $('#successModal').modal('show');
                });

            <%
                session.removeAttribute("success");
                session.removeAttribute("successHead");
                session.removeAttribute("successMsg");
            %>
            }
        </script>

    </body>
</html>
