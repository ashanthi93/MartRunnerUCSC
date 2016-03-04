<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> View Attendance By Vendor Name | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

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
        <!-- load servlet -->
        <jsp:include page="/paymentGetVendors" />
        <!-- header of the page-->
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
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> View Attendance of a Vendor</label>  
                                        <br/><br/> 
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> <br/><br/> 

                                        <!--View by vendor name Icon-->
                                        <i class="glyphicon glyphicon-user " style="font-size:75px; color:#EEC900; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></i> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="reportViewAttendanceVendorFullYear.jsp"> <strong> View  Full Year Attendance</strong></a>
                                        <br/><br/> <br><br/> 


                                        <!--View by date Icon-->
                                        <i class="glyphicon glyphicon-calendar " style="font-size:75px; color:#008B45; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></i> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="reportViewAttendanceVendorByDate.jsp"> <strong> View By Date</strong></a>
                                        <br/><br/> <br><br/>

                                        <!--View by time period Icon-->
                                        <i class="glyphicon glyphicon-calendar " style="font-size:75px; color:#EE0000; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></i> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="reportViewAttendanceVendorTimePeriod.jsp"> <strong> View By Time Period</strong></a>
                                        <br/><br/> <br><br/> 




                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>
                    <!--end of side bar-->

                    <!--start of form3-->
                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <!--Form Topic-->
                            <div class="panel-heading" style="background-color: #71C671;">
                                <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> View Attendance for Time Period </p>
                            </div>
                            <!--Form Body-->
                            <div class="panel-body">
                                <form action="${pageContext.request.contextPath}/viewAttendancePeriodOfVendor" class="form-horizontal" id="form1" method="POST"  role="form" onsubmit="return(validateForm3())" novalidate>

                                    <!--Vendor name-->
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="vendorname" class="control-label col-xs-3 col-xs-offset-1  required" style="display: inline-block; text-align: left;">Vendor Name</label>
                                            <div class="col-xs-6">
                                                <select class="combobox form-control" name="vendorName3" id="vendorName3" required>
                                                    <option name="vendorName3" value="" selected="selected">Select vendor name</option>
                                                    <%                                                            List<Vendor> VendorList = (List<Vendor>) session.getAttribute("vendorList");
                                                        if (VendorList != null) {
                                                            for (Vendor vendor : VendorList) {
                                                    %>
                                                    <option name="vendorName3" id="vendorName3" value="<%=vendor.getVendorID()%>" > <%out.print(vendor.getVendorName());%> </option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                                <label id="errorVendorName3" style="font-size:10px"> </label>
                                            </div>
                                        </div>
                                    </div>

                                    <!--market day-->
                                    <div class="row">
                                        <div class="form-group">
                                            <!-- Market Type-->
                                            <label for="marketType" class="control-label col-xs-3 col-xs-offset-1  required" style="display: inline-block; text-align: left;"> Select Market Day </label>
                                            <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
                                                <span>
                                                    <label style="font-weight: normal;"> <input type="radio" name="marketDay3" id="marketDay3" value="SA" /> Saturday Market</label> <br/>
                                                    <label style="font-weight: normal;"> <input type="radio" name="marketDay3" id="marketDay3" value="TH"/> Thursday Market</label> <br/>
                                                </span>
                                                <label id="errorMarketDay3" style="font-size:10px"> </label>
                                            </div>
                                        </div>
                                    </div>


                                    <!--Start Date-->
                                    <div class="row">
                                        <div class="form-group ">
                                            <label  class="control-label col-xs-3 col-xs-offset-1  required" style="display: inline-block; text-align: left;"> Select Start Date </label>

                                            <div class="hero-unit col-xs-4 ">
                                                <input  type="text" class="form-control" placeholder="click to add a date"  name="startDate" id="startDate">
                                            </div>

                                            <label id="errorStartDate" style="font-size:10px"> </label>
                                        </div>
                                    </div>

                                    <!--End Date-->
                                    <div class="row">
                                        <div class="form-group ">
                                            <label  class="control-label col-xs-3  col-xs-offset-1  required" style="display: inline-block; text-align: left;"> Select End Date </label>

                                            <div class="hero-unit col-xs-4 ">
                                                <input  type="text" class="form-control" placeholder="click to add a date"  name="endDate" id="endDate">
                                            </div>

                                            <label id="errorEndDate" style="font-size:10px"> </label>
                                        </div>
                                    </div>
                                    <br>
                                    <!-- Submit, cancel button-->
                                    <div class="row">
                                        <div class="form-group">
                                            <div class="col-xs-offset-5 col-xs-9">
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
                    </div>

                    <!--end of form 3-->

                    <!--start of form1-->

                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <!--Form Topic-->
                            <div class="panel-heading" style="background-color: #71C671;">
                                <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> View Attendance for Full Year </p>
                            </div>
                            <!--Form Body-->
                            <div class="panel-body">
                                <form action="${pageContext.request.contextPath}/test" class="form-horizontal" id="form1" method="POST"  role="form" onsubmit="return(validateForm1())" novalidate>

                                    <!--Vendor name-->
                                    <div class="row">
                                        <div class="form-group ">
                                            <label for="vendorname" class="control-label col-xs-3 col-xs-offset-1  required" style="display: inline-block; text-align: left;">Vendor Name</label>
                                            <div class="col-xs-6">
                                                <select class="combobox form-control" name="vendorName1" id="vendorName1" required disabled="disabled">
                                                    <option name="vendorName1" value="" selected="selected">Select vendor name</option>
                                                    <%
                                                        if (VendorList != null) {
                                                            for (Vendor vendor : VendorList) {
                                                    %>
                                                    <option name="vendorName1" id="vendorName1" value="<%=vendor.getVendorID()%>" > <%out.print(vendor.getVendorName());%> </option>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                                </select>
                                                <label id="errorVendorName1" style="font-size:10px"> </label>
                                            </div>
                                        </div>

                                        <!--market day-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Market Type-->
                                                <label for="marketType" class="control-label col-xs-3 col-xs-offset-1  required" style="display: inline-block; text-align: left;"> Select Market Day </label>
                                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">


                                                    <span>
                                                        <label style="font-weight: normal;"> <input type="radio" name="marketDay1" id="marketDay1" value="SA" disabled="disabled"/> Saturday Market</label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="marketDay1" id="marketDay1" value="TH" disabled="disabled" /> Thursday Market</label> <br/>

                                                    </span>

                                                    <label id="errorMarketDay1" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <br> <br><br><br>

                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-3 col-xs-9">
                                                    <button type="submit" class="btn btn-default" disabled="disabled"> Submit </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()" disabled="disabled"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>

                                </form>
                            </div>

                        </div>
                        <!--End of Add Payment Form-->
                        <br> 


                    </div>
                </div>
                <!--end of form 1-->

                <!--start of form2-->

                <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                    <div class="panel panel-default" style="margin-top: 10px;">
                        <!--Form Topic-->
                        <div class="panel-heading" style="background-color: #71C671;">
                            <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> View Attendance of a Date </p>
                        </div>
                        <!--Form Body-->
                        <div class="panel-body">
                            <form action="${pageContext.request.contextPath}/test" class="form-horizontal" id="form1" method="POST"  role="form" onsubmit="return(validateForm2())" novalidate>

                                <!--Vendor name-->
                                <div class="row">
                                    <div class="form-group">
                                        <label for="vendorname" class="control-label col-xs-3 col-xs-offset-1  required" style="display: inline-block; text-align: left;">Vendor Name</label>
                                        <div class="col-xs-6">
                                            <select class="combobox form-control" name="vendorName2" id="vendorName2" required disabled="disabled">
                                                <option name="vendorName2" value="" selected="selected">Select vendor name</option>
                                                <%
                                                    if (VendorList != null) {
                                                        for (Vendor vendor : VendorList) {
                                                %>
                                                <option name="vendorName2" id="vendorName2" value="<%=vendor.getVendorID()%>" > <%out.print(vendor.getVendorName());%> </option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                            <label id="errorVendorName2" style="font-size:10px"> </label>
                                        </div>
                                    </div>
                                </div>

                                <!--market day-->
                                <div class="row">
                                    <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                        <!-- Market Type-->
                                        <label for="marketType" class="control-label col-xs-3 col-xs-offset-1  required" style="display: inline-block; text-align: left;"> Select Market Day </label>
                                        <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">


                                            <span>
                                                <label style="font-weight: normal;"> <input type="radio" name="marketDay2" id="marketDay2" value="SA" disabled="disabled"/> Saturday Market</label> <br/>
                                                <label style="font-weight: normal;"> <input type="radio" name="marketDay2" id="marketDay2" value="TH" disabled="disabled"/> Thursday Market</label> <br/>

                                            </span>

                                            <label id="errorMarketDay2" style="font-size:10px"> </label>
                                        </div>
                                    </div>
                                </div>


                                <!--Date-->
                                <div class="row">
                                    <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                        <label  class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-4 required" style="display: inline-block; text-align: left;"> Select Start Day </label>

                                        <div class="hero-unit col-xs-4 ">
                                            <input  type="text" class="form-control" placeholder="click to add a date"  name="date" id="date" disabled="disabled" >
                                        </div>

                                        <label id="errorDate" style="font-size:10px"> </label>
                                    </div>
                                </div>

                                <!-- Submit, cancel button-->
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-xs-offset-3 col-xs-9">
                                            <button type="submit" class="btn btn-default" disabled="disabled" > Submit </button>
                                            <button type="reset" class="btn btn-default" onclick="window.location.reload()" disabled="disabled"> Cancel </button>
                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>
                    <!--End of Add Payment Form-->
                    <br> 


                </div>

                <!--end of form 2-->








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
                    <h4 class="modal-title" id="successHead"> <% out.println(successHead);%> </h4>
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

    <!-- footer of the page -->
    <%@include file="footer_sub.jsp" %>

    <!-- script foe data validation-->
    <script type="text/javascript">

        //function for validate form1
        function validateForm1() {

            var errors1 = [];


            if (!validateVendorName("vendorName1", "errorVendorName1")) {
                errors1.push("errorVendorName1");
            }

            var group = document.getElementsByName("marketDay1");
            if (!(validateRadio(group, "errorMarketDay1"))) {
                errors1.push("errorMarketDay1");
            }


            if (errors1.length > 0) {
                return false;
            }
            else {
                return true;
            }

        }

        //function for validate form 2
        function validateForm2() {

            var errors2 = [];


            if (!validateVendorName("vendorName2", "errorVendorName2")) {
                errors2.push("errorVendorName2");
            }

            var group = document.getElementsByName("marketDay2");
            if (!(validateRadio(group, "errorMarketDay2"))) {
                errors2.push("errorMarketDay2");
            }

            if (!(validateDate("date", "errorDate"))) {
                errors2.push("errorDate");
            }

            if (errors2.length > 0) {
                return false;
            }
            else {
                return true;
            }

        }

//function for validate form 2
        function validateForm3() {

            var errors3 = [];


            if (!validateVendorName("vendorName3", "errorVendorName3")) {
                errors3.push("errorVendorName3");
            }

            var group = document.getElementsByName("marketDay3");
            if (!(validateRadio(group, "errorMarketDay3"))) {
                errors3.push("errorMarketDay3");
            }

            if (!(validateDate("startDate", "errorStartDate"))) {
                errors3.push("errorStartDate");
            }

            if (!(validateDate("endDate", "errorEndDate"))) {
                errors3.push("errorEndDate");
            }
            if (errors3.length > 0) {
                return false;
            }
            else {
                return true;
            }

        }









//validate vendor name
        function validateVendorName(text, errorLabel) {
            var name = document.getElementById(text).value;
            if (name == "" || name == null) {
                document.getElementById(text).focus();
                document.getElementById(text).style.borderColor = "red";
                document.getElementById(errorLabel).innerHTML = "required";
                document.getElementById(errorLabel).style.color = "red";
                return false;
            }
            else {
                document.getElementById(text).style.borderColor = "green";
                document.getElementById(errorLabel).innerHTML = "";
                return true;
            }
        }


        //validate Radio Buttons
        function validateRadio(group, errorLbl) {
            for (var i = 0; i < group.length; i++) {
                if (group[i].checked) {
                    document.getElementById(errorLbl).innerHTML = "";
                    document.getElementById(errorLbl).style.color = "green";
                    return true;
                }
            }
            document.getElementById(errorLbl).innerHTML = "required";
            document.getElementById(errorLbl).style.color = "red";
            return false;
        }

        //validate dates
        function validateDate(text, errorLabel) {
            if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                document.getElementById(text).focus();
                document.getElementById(text).style.borderColor = "red";
                document.getElementById(errorLabel).innerHTML = "required";
                document.getElementById(errorLabel).style.color = "red";
                return false;
            }
            else {
                document.getElementById(text).style.borderColor = "green";
                document.getElementById(errorLabel).innerHTML = "";
                return true;
            }
        }

    </script>

    <!-- Java Script file-->
    <script src="../static/js/jquery.js"></script>
    <script src="../static/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.combobox').combobox();
        });
    </script>

    <!-- Load jQuery and bootstrap datepicker scripts -->
    <script src="../static/js/bootstrap-datepicker.js"></script>
    <script src="../static/js/bootstrap-combobox.js"></script>

    <!-- script for datepicker -->
    <script type="text/javascript">
        // When the document is ready
        $(document).ready(function () {

            $('#date').datepicker({
                format: "yyyy-mm-dd"
            });

        });

    </script>

    <!-- script for datepicker -->
    <script type="text/javascript">
        // When the document is ready
        $(document).ready(function () {

            $('#startDate').datepicker({
                format: "yyyy-mm-dd"
            });

        });

    </script>

    <!-- script for datepicker -->
    <script type="text/javascript">
        // When the document is ready
        $(document).ready(function () {

            $('#endDate').datepicker({
                format: "yyyy-mm-dd"
            });

        });

    </script>

    <!-- To handle modal -->
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
