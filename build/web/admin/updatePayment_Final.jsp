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
        <link rel="stylesheet" href="../static/css/datepicker.css">

        
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

    <body >

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
                            <!--Start of Side Bar -->
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

                                        <!--Start of Update Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#008B45; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-edit" style="font-size:20px; color:#008B45; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default active" style="width:auto" href="updatePayment_Admin.jsp"> <strong> Update Payment</strong></a>
                                        <br><br>
                                        <!--End of Update Payment Icon-->

                                    </center>
                                </div>

                            </div>
                            <!--End of Side Bar -->
                        </div> 
                    </div>

                    <!--Start of Update Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <!--Start of panel -->
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Start of panel Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> Update Payment </p>
                                </div>
                                <!--End of panel Topic-->

                                <!--Start of panel Body-->
                                <div class="panel-body" >
                                    <form action="${pageContext.request.contextPath}/UpdatePayment" class="form-horizontal" id="updatePayment" method="POST" role="form" name="updatePayment" onsubmit="return(validateForm())" novalidate>
                                        <%                                            String vendorName = (String) session.getAttribute("finalUpdateName");
                                            String marketDay = (String) session.getAttribute("finalUpdateMarketDay");
                                            String stallType = (String) session.getAttribute("finalUpdateStallType");

                                        %>   
                                        <!--Start of vendor name-->
                                        <div class="row">                                       
                                            <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Vendor Name : </span>
                                                <%=vendorName%></p> 
                                        </div>
                                        <!--End of vendor name-->

                                        <!--Start of market day-->
                                        <div class="row">                                       
                                            <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Market Day &nbsp;&nbsp;: </span>
                                                <%=marketDay%></p>
                                        </div>
                                        <!--End of market day-->

                                        <!--Start of stall type-->
                                        <div class="row">                                       
                                            <p style="font-family: lucida bright;font-size: 15px;"><span style="font-weight: bold; padding-left: 5px;">Stall type &nbsp;&nbsp;&nbsp;&nbsp;:  </span>
                                                <%=stallType%></p> 
                                        </div>
                                        <!--End of stall type-->
                                        <br/>

                                        <!--Start of start date div-->
                                        <div class="row">
                                            <div class="form-group ">
                                                <label for="startdate" class="control-label col-xs-3  required" style="font-family: lucida bright;font-size: 15px; font-weight: bold; padding-left: 20px;display: inline-block; text-align: left;">Start Date &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  :</label>
                                                <div class="row">
                                                    <div >
                                                        <!--Start of start date-->     
                                                        <div class="container">
                                                            <div class="form-group col-xs-3 hero-unit">
                                                                <div>
                                                                    <input  name="startDate" id="startDate" type="text" class="form-control" placeholder="Click to add date"/>
                                                                    <label id="errorStartDate" style="font-size:10px"> </label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!--End of start date-->       
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!--End of start date div-->

                                        <!--Start of half stall payments-->
                                        <%
                                            if (stallType.equals("Half Stall")) {
                                        %>

                                        <label  class="col-xs-3  required" style="font-family: lucida bright;font-size: 15px; font-weight: bold; text-align: left; margin-left: -22px;">Payment Duration &nbsp; :</label>

                                        <!--start of half stall radio buttons-->
                                        <div class="row">

                                            <!--Start of half stall radio buttons-->
                                            <div class="panel panel-default col-xs-3" id="errorStallType" >

                                                <!--Start of one day stall radio-->
                                                <label style=" font-weight: normal;">
                                                    <input type="radio" name="stallType" id="stallType" value="dayStall"/> One Day
                                                </label>
                                                <br>
                                                <!--End of one day stall radio-->


                                                <!--Start of one month stall radio-->
                                                <label style=" font-weight: normal;">
                                                    <input type="radio" name="stallType" id="stallType" value="monthStall"/> One Month 
                                                </label>
                                                <br>
                                                <!--End of one month stall radio-->

                                            </div>
                                            <!--End of half stall radio buttons-->
                                        </div>
                                        <!--end of half stall  radio-->
                                        <%
                                            }
                                        %>
                                        <!--End of half stall payments-->

                                        <!--Start of full stall payments-->
                                        <%if (stallType.equals("Full Stall")) {
                                        %>

                                        <label  class="col-xs-3  required" style="font-family: lucida bright;font-size: 15px; font-weight: bold; text-align: left; margin-left: -22px;">Payment Duration &nbsp;  :</label>

                                        <!--Start of full stall radio buttons-->
                                        <div class="panel panel-default col-xs-3" id="errorStallType">

                                            <!--Start of one day stall radio-->
                                            <label style=" font-weight: normal;">
                                                <input type="radio" name="stallType" id="stallType" value="dayStall"/> One Day
                                            </label> 
                                            <br>
                                            <!--End of one day stall radio-->


                                            <!--Start of one month stall radio-->
                                            <label style=" font-weight: normal;">
                                                <input type="radio" name="stallType" id="stallType" value="monthStall"/> One Month
                                            </label>
                                            <br>
                                            <!--End of one month stall radio-->


                                            <!--Start of quarter stall radio-->
                                            <label style=" font-weight: normal;">
                                                <input type="radio" name="stallType" id="stallType" value="quarterStall"/> Quarter 
                                            </label> 
                                            <!--End of quarter stall radio-->

                                        </div>
                                        <!--End of full stall radio buttons-->

                                        <%}%>
                                        <!--End of full stall payments-->


                                        <!--Start of two stalls payments-->
                                        <%if (stallType.equals("Two Stalls")) {
                                        %>

                                        <div class="row">
                                            <label  class="col-xs-3  required" style="font-family: lucida bright;font-size: 15px; font-weight: bold; text-align: left; margin-left: -10px;">Payment Duration &nbsp;&nbsp;  :</label>

                                            <!--Start of two stalls radio buttons-->
                                            <div class="panel panel-default col-xs-3 " id="errorStallType">

                                                <!--Start of one day radio -->
                                                <label style=" font-weight: normal;">
                                                    <input type="radio" name="stallType" id="stallType" value="dayStall"/> One Day 
                                                </label> 
                                                <br>
                                                <!--End of one day radio -->

                                                <!--Start of one month radio -->
                                                <label style=" font-weight: normal;">
                                                    <input type="radio" name="stallType" id="stallType" value="monthStall"/> One Month 
                                                </label>
                                                <br>
                                                <!--End of one month radio -->

                                                <!--Start of quarter radio -->
                                                <label style=" font-weight: normal;">
                                                    <input type="radio" name="stallType" id="stallType" value="quarterStall"/> Quarter 
                                                </label> 
                                                <!--End of quarter radio -->

                                            </div>
                                            <!--End of two stalls radio buttons-->

                                        </div>
                                        <%}%>
                                        <!--End of two stalls payments-->

                                        <!--Start of OK,Cancel buttons-->
                                        <div class="row">
                                            <center>

                                                <!--Start of OK Button-->
                                                <div class="col-xs-2 col-xs-offset-3 col-sm-offset-5 col-sm-2 col-md-2 col-lg-2 ">
                                                    <button type="submit" id="addpaymentok" class="btn btn-default " style="width:auto; color:black;border-color: green;" >OK</button>
                                                </div>
                                                <!--End of OK Button-->

                                                <!--Start of Cancel Button-->
                                                <div class="col-xs-2 col-xs-offset-2 col-sm-offset-0 col-sm-2 col-md-2 col-lg-2 ">
                                                    <button type="reset" class="btn btn-default " style="width:auto; color:black; border-color: green;" onclick="window.location.reload()"> Cancel</button>
                                                </div>
                                                <!--End of Cancel Button-->

                                            </center>
                                        </div>
                                        <!--End of OK,Cancel buttons-->

                                    </form>
                                </div>
                                <!--End of panel Body-->

                            </div>
                            <!--End of panel-->
                            <br/>
                        </div>

                    </div>
                    <!--End of update Payment Form-->

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

                    <!--Start of Footer-->
                    <%@include file="footer_sub.jsp" %>
                    <!--End of Footer-->

                    <!-- script for data validation-->
                    <script type="text/javascript">

                        //function for validate form
                        function validateForm() {
                            var errors = [];

                            //start date validation
                            if (!validateStartDate()) {
                                errors.push("errorStartDate");
                            }

                            //stall type validation
                            var group = document.getElementsByName("stallType");
                            if (!(validateRadio(group, "errorStallType"))) {
                                errors.push("errorStallType");
                            }

                            if (errors.length > 0) {
                                return false;
                            }
                            else {
                                return true;
                            }

                        }

                        //Radio button validation function
                        function validateRadio(group, errorLbl) {
                            for (var i = 0; i < group.length; i++) {
                                if (group[i].checked) {
                                    document.getElementById(errorLbl).style.borderColor = "green";
                                    return true;
                                }
                            }
                            document.getElementById(errorLbl).focus();
                            document.getElementById(errorLbl).style.borderColor = "red";
                            return false;
                        }


                        //Start Date validation function
                        function validateStartDate() {
                            if (document.getElementById("startDate").value == "" || document.getElementById("startDate").value == null) {
                                document.getElementById("startDate").focus();
                                document.getElementById("startDate").style.borderColor = "red";
                                document.getElementById("errorStartDate").innerHTML = "required";
                                document.getElementById("errorStartDate").style.color = "red";
                                return false;
                            }
                            else {
                                document.getElementById("startDate").style.borderColor = "green";
                                document.getElementById("errorStartDate").innerHTML = "";
                                return true;
                            }
                        }
                    </script>
                   
                    <script src="../static/js/bootstrap-combobox.js"></script>
                    <script src="../static/js/bootstrap-datepicker.js"></script>

                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('.combobox').combobox();
                        });
                    </script>

                    <script type="text/javascript">
                        // When the document is ready
                        $(document).ready(function () {

                            $('#startDate').datepicker({
                                format: "yyyy-mm-dd"
                            });

                        });

                    </script>

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
