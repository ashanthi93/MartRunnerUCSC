<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Add Payment | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <!-- Datepicker CSS -->
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
            label.required:after {
                content: "*";
                color: red;
            }
        </style>
    </head>

    <body>
        <!--Load all vendors from the servlet-->
        <jsp:include page="/paymentGetVendors" />
        <!--Header of the page-->
        <%@include file="header_sub.jsp" %>

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

                                        <!--Add Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#EEC900; border-radius: 5px; height:80px;width:80px; background-color: whitesmoke; padding: 10px;"></span>  
                                            <span class="glyphicon glyphicon-plus" style="font-size:20px; color:#EEC900; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>
                                        </div> <br> 
                                        <a class="btn btn-default active" style="width:auto;" href="addPayment_Admin.jsp"> <strong> Add Payment</strong></a>

                                        <br><br> 

                                        <!--Update Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#008B45; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-edit" style="font-size:20px; color:#008B45; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default" style="width:auto" href="updatePayment_Admin.jsp"> <strong> Update Payment</strong></a>
                                        <br><br>  

                                        <!--View Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#8B1C62; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-eye-open" style="font-size:20px; color:#8B1C62; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default" style="width:auto" href="viewPayment_Admin.jsp"> <strong> View Payment</strong></a>

                                        <br><br>  
                                        <!--Remove Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#EE0000; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>  
                                            <span class="glyphicon glyphicon-remove" style="font-size:20px; color:#EE0000; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>
                                        </div> <br> 
                                        <a class="btn btn-default " style="width:auto" href="removePayment_Admin.jsp"> <strong>Remove Payment</strong></a>

                                        <br/><br/> 
                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>
                    <!--End of Side Bar-->

                    <!--Add Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Add Payment Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> Add Payment </p>
                                </div>
                                <!--Form Body-->
                                <div class="panel-body">
                                    <form action="${pageContext.request.contextPath}/addPayment" class="form-horizontal" id="changevendorprofile" method="POST"  role="form" onsubmit="return(validateForm())" novalidate>

                                        <!--start of Vendor name-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="vendorname" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-4 required" style="display: inline-block; text-align: left;">Vendor Name</label>
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
                                        <!--Market Day-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Market Type-->
                                                <label for="marketType" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-4 required" style="display: inline-block; text-align: left;"> Select Market Day </label>
                                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="panel panel-default" id="errorMarketType">
                                                        <div class="panel-body">
                                                            <span>
                                                                <label style="font-weight: normal;"> <input type="radio" name="marketType" id="marketType" value="sa"/> Saturday </label> <br/>
                                                                <label style="font-weight: normal;"> <input type="radio" name="marketType" id="marketType" value="th"/> Thursday </label> <br/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <br> 

                                        <!--Payment Start Date-->
                                        <div class="row">
                                            <div class="form-group ">
                                                <label for="startdate" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-4 required" style="display: inline-block; text-align: left;">Payment Start Date</label>
                                                <div class="row">
                                                    <div >
                                                        <!--date picker-->     
                                                        <div class="container">
                                                            <div class="form-group col-xs-4 col-sm-3 col-md-2 col-lg-2 hero-unit">
                                                                <div>
                                                                    <input  name="startDate" id="startDate" type="text" class="form-control" placeholder="Click to add date"/>
                                                                    <label id="errorStartDate" style="font-size:10px"> </label>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <!-- end of date picker-->      


                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <!--Duration-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Duration-->
                                                <label for="duration" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-4 required" style="display: inline-block; text-align: left;"> Payment Duration </label>
                                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="panel panel-default" id="errorDuration">
                                                        <div class="panel-body">
                                                            <span>
                                                                <label style="font-weight: normal;" > <input type="radio" name="duration" id="duration" value="day"/> One Day </label> <br/>
                                                                <label style="font-weight: normal;" > <input type="radio" name="duration" id="duration" value="month"/> One Month </label> <br/>
                                                                <label style="font-weight: normal;" > <input type="radio" name="duration" id="duration" value="quarter"/> Quarter</label> 
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                        <br> <br>

                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-3 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> Submit </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <!--End of Add Payment Form-->
                            <br> 

                            <!--View Payment Form-->
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                    <strong> View Payment </strong> 
                                </div>
                                <br/>

                                <div class="panel-body">
                                    <form class="form-horizontal" id="changevendorprofile" method="post" action="" role="form">


                                        <!--Select Vendor name-->
                                        <div class="row">
                                            <div class="form-group ">
                                                <label for="viewpaymentvendorname" class="col-xs-5  col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label" style="text-align:left;">Vendor Name</label>
                                                <div class="col-xs-5 col-sm-4  col-md-4 col-lg-4">
                                                    <input type="text" class="form-control" id="vendorName" placeholder="Select Vendor Name" disabled="disabled"/>
                                                </div>
                                                <div class="input-group-btn">
                                                    <button class="btn btn-default" type="submit"> <i class="glyphicon glyphicon-search"> </i> </button>
                                                </div>
                                            </div>
                                        </div>

                                        <!--Select Market Type-->
                                        <div class="row">
                                            <div class="form-group ">

                                                <label for="viewpaymentmarkettype" class="col-xs-5  col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label" style="text-align:left;"> Select Market </label>

                                                <div >
                                                    <ul class="col-xs-5 col-sm-4 col-sm-offset-0 col-md-4 col-lg-4" style="list-style:none;">
                                                        <li> <input type="checkbox" name="marketDay" disabled="disabled"/> Thursday Market </li>
                                                        <li> <input type="checkbox" name="marketDay" disabled="disabled"/> Saturday Market </li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <br> <br>
                                        <!--ok,cancel Buttons-->
                                        <div class="row">
                                            <!--Ok Button-->
                                            <center>
                                                <div class="col-xs-2 col-xs-offset-3 col-sm-offset-5 col-sm-2 col-md-2 col-lg-2 ">
                                                    <button type="button" id="addpaymentok" class="btn btn-default " value="Hidden" disabled="disabled" style="width:auto; color:black;border-color: green;" > <strong>OK</strong></button>
                                                </div>

                                                <!--Cancel Button-->

                                                <div class="col-xs-2 col-xs-offset-2 col-sm-offset-0 col-sm-2 col-md-2 col-lg-2 ">
                                                    <button type="button" class="btn btn-default " value="Hidden" disabled="disabled" style="width:auto; color:black; border-color: green;" > <strong>Cancel</strong></button>
                                                </div>
                                            </center>

                                        </div>
                                       
                                    </form>
                                    <!--End of view payment form-->
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

        <!--Footer of the page-->
        <%@include file="footer_sub.jsp" %>

        <!-- script for data validation-->
        <script type="text/javascript">

            //function for validate form
            function validateForm() {
                var errors = [];

                if (!validateVendorName()) {
                    errors.push("errorVendorName");
                }

                if (!validateStartDate()) {
                    errors.push("errorStartDate");
                }

                var group = document.getElementsByName("marketType");
                if (!(validateRadio(group, "errorMarketType"))) {
                    errors.push("errorMarketType");
                }

                var group = document.getElementsByName("duration");
                if (!(validateRadio(group, "errorDuration"))) {
                    errors.push("errorDuration");
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

            //validate Radio Buttons
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


            //validate Start Date
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

        <!--script for vendor name combo box-->
        <script type="text/javascript">
            $(document).ready(function () {
                $('.combobox').combobox();
            });
        </script>

        <!--script for datepicker-->
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#startDate').datepicker({
                    format: "yyyy-mm-dd"
                });
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
