<%@page import="java.util.List"%>
<%@page import="classes.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>View Vendor Attendance | Admin</title>
        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="../static/css/bootstrap-combobox.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">
        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="../static/css/datepicker.css">
    </head>

    <body>
        <jsp:include page="/paymentGetVendors" />
        <%@include file="header_sub.jsp" %>

        <section>


            <div class="container">
                <div class="col-lg-12 col-md-12 col-sm-12" style="padding-top: 10px;">

                    <!--start of view attendance by market day panel-->
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color:#71C671;">
                            <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> View Attendance of Full Year </div>
                        </div><br/>


                        <form action="${pageContext.request.contextPath}/viewFullYearAttendance" method="POST" class="form-horizontal" onsubmit="return(validateSearch())">
                            <div class="form-group col-xs-8 ">
                                <label class="col-md-3 col-xs-offset-1"> Select a Market Day </label>
                                <ul style="list-style:none;">
                                    <li> <input type="checkbox" name="marketDay" id="marketDay" value="TH"/> Thursday Market </li>
                                    <li> <input type="checkbox" name="marketDay" id="marketDay" value="SA"/> Saturday Market </li>
                                </ul>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-offset-3 col-xs-9">
                                    <button type="submit" class="btn btn-default" id="fullYearSubmit"> View </button>
                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                </div>
                            </div>
                        </form>
                    </div> 
                    <!--end of view attendance by market day panel-->
                    <br>

                    <!--Start of view attendance by vendor name-->
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color:#71C671;">
                            <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> View Attendance of a Vendor </div>
                        </div>
                        <br/>
                        <form method="POST" class="form-horizontal">

                            <!--Vendor name-->
                            <div class="row">
                                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                    <label for="vendorname" class="control-label col-xs-3 col-sm-3 col-md-2 col-md-offset-1 col-lg-2" style="display: inline-block; text-align: left;">Vendor Name</label>
                                    <div class="col-xs-6">
                                        <select class="combobox form-control col-xs-offset-0" name="vendorName" id="vendorName">
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

                            <div class="container">
                                <div class="row">
                                    <!--panel 1-->
                                    <div class="col-xs-3">
                                        <div class="panel panel-default">
                                            <div class="panel-body">

                                                <!--start of panel 1 content-->
                                                <div class="text-left form-group">
                                                    <label class="col-xs-10"> Select Market Day </label>
                                                    <br>

                                                    <div class="form-group">
                                                        <div class="form-group col-xs-10">
                                                            <ul style="list-style:none;">
                                                                <li> <input type="radio" name="marketDay" value="TH" /> Thursday </li>
                                                                <li> <input type="radio" name="marketDay" value="SA" /> Saturday </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br><br>


                                                <!--view button-->
                                                <div class="form-group">
                                                    <div class="col-xs-offset-3 col-xs-9">
                                                        <button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath}/viewFullYearAttendanceOfVendor" onclick="return validateSearch()"> view </button>
                                                    </div>
                                                </div>
                                                <!--end of panel 1 content-->

                                            </div>
                                        </div>
                                    </div>
                                    <!--end of panel1-->

                                    <!--start panel 2-->
                                    <div class="col-xs-4">
                                        <div class="panel panel-default">
                                            <div class="panel-body">
                                                <!--Date-->
                                                <div class="row">
                                                    <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                        <label  class="control-label col-xs-12" style="display: inline-block; text-align: left;"> Select a Date </label>
                                                        <br><br>

                                                        <div class="hero-unit col-xs-12 ">
                                                            <input  type="text" class="form-control" placeholder="click to add a date"  name="vendorDate" id="vendorDate">
                                                        </div>
                                                    </div>
                                                </div>
                                                <br><br><br><br>
                                                <!--view button-->
                                                <div class="form-group">
                                                    <div class="col-xs-offset-3 col-xs-9">
                                                        <button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath}/viewAttendanceDayOfVendor"> view </button>
                                                    </div>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                    <!--end of panel 2-->

                                    <!--start of panel 3-->
                                    <div class="col-xs-4">
                                        <div class="panel panel-default">
                                            <div class="panel-body">

                                                <!--Start Date-->
                                                <div class="row">
                                                    <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                        <label  class="control-label col-xs-12" style="display: inline-block; text-align: left;"> Select Start Date </label>

                                                        <div class="hero-unit col-xs-12 ">
                                                            <input type="text" class="form-control" placeholder="click to add a date"  name="vendorStartDate" id="vendorStartDate">
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--End Date-->
                                                <div class="row">
                                                    <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                        <label  class="control-label col-xs-12" style="display: inline-block; text-align: left;"> Select End Date </label>

                                                        <div class="hero-unit col-xs-12 ">
                                                            <input type="text" class="form-control" placeholder="click to add a date"  name="vendorEndDate" id="vendorEndDate">
                                                        </div>
                                                    </div>
                                                </div>
                                                <br>
                                                <!--view button-->
                                                <div class="form-group">
                                                    <div class="col-xs-offset-3 col-xs-9">
                                                        <button type="submit" class="btn btn-default" formaction="${pageContext.request.contextPath}/viewAttendancePeriodOfVendor" > view </button>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <!--end of panel 3-->
                                </div>
                            </div>
                        </form>
                    </div>
                    <!--end of view attendance by vendor name panel-->      
                    <br>      
                    <!--start of view by a date panel-->
                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color:#71C671;">
                            <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> View Attendance of a Date </div>
                        </div><br/>
                        <div class="panel-body">
                            <form action="${pageContext.request.contextPath}/viewAttendanceOfADay" method="POST" class="form-horizontal">
                                <!--panel thursday-->
                                <div class="col-xs-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <!--Thursday-->
                                            <div class="row">
                                                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                    <label  class="control-label col-xs-12" style="display: inline-block; text-align: left;"> Select a Date </label>
                                                    <br><br>

                                                    <div class="hero-unit col-xs-12 ">
                                                        <input  type="text" class="form-control" placeholder="click to add a date"  name="date" id="dateThursday">
                                                    </div>
                                                </div>
                                            </div>
                                            <br><br><br><br>
                                            <!--view thursday button-->
                                            <div class="form-group">
                                                <div class="col-xs-offset-3 col-xs-9">
                                                    <button type="submit" class="btn btn-default" > view </button>
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </form>

                            <form action="" method="POST" class="form-horizontal">
                                <!--panel thursday-->
                                <div class="col-xs-6">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <!--Thursday-->
                                            <div class="row">
                                                <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                    <label  class="control-label col-xs-12" style="display: inline-block; text-align: left;"> Select a Date </label>
                                                    <br><br>

                                                    <div class="hero-unit col-xs-12 ">
                                                        <input  type="text" class="form-control" placeholder="click to add a date"  name="dateSaturday" id="dateSaturday">
                                                    </div>
                                                </div>
                                            </div>
                                            <br><br><br><br>
                            
                                            <!--view thursday button-->
                                            <div class="form-group">
                                                <div class="col-xs-offset-3 col-xs-9">
                                                    <button type="submit" class="btn btn-default" > view </button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </form>
                            <!--end of panel saturday-->
                        </div>
                    </div>
                    <!--end of thursday panel>
                </form>
            </div>
            
                    <!--end of view by a date panel-->

                    <br>
                    <!--start of view by a time period-->

                    <div class="panel panel-default">
                        <div class="panel-heading" style="background-color:#71C671;">
                            <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> View Attendance of a Time Period </div>
                        </div><br/>

                        <form action="${pageContext.request.contextPath}/viewAttendanceOfAPeriod" method="POST" class="form-horizontal">
                            <div class="form-group col-xs-10">
                                <!--Start Date-->
                                <div class="row">
                                    <div class="form-group  col-xs-10">
                                        <label  class="control-label col-xs-3 col-xs-offset-1" style="display: inline-block; text-align: left;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select Start Date </label>

                                        <div class="hero-unit col-xs-5 col-xs-offset-1">
                                            <input type="text" class="form-control" placeholder="click to add a date"  name="startDate" id="startDate">
                                        </div>
                                    </div>
                                </div>

                                <!--end Date-->
                                <div class="row">
                                    <div class="form-group  col-xs-10">
                                        <label  class="control-label col-xs-3 col-xs-offset-1" style="display: inline-block; text-align: left;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Select End Date </label>

                                        <div class="hero-unit col-xs-5 col-xs-offset-1">
                                            <input type="text" class="form-control" placeholder="click to add a date"  name="endDate" id="endDate">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-offset-3 col-xs-9">
                                    <button type="submit" class="btn btn-default" > View </button>
                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                </div>
                            </div>
                            
                        </form>
                    </div>

                    <!--end of view by a time period-->
                    <br>
                </div>
            </div>

        </section>

        <%@include file="footer_sub.jsp"%>

        <script type="text/javascript">
            function validateSearch() {
                var marketDay = document.getElementsByName("marketDay");
                if (!(marketDay[0].checked || marketDay[1].checked || marketDay[2].checked)) {
                    alert('Empty Selection');
                    return false;
                }
                return true;
            }
        </script>
        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/main.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>
        <script src="../static/js/bootstrap-datepicker.js"></script>

        <!--script for vendor name-->
        <script type="text/javascript">
            $(document).ready(function () {
                $('.combobox').combobox();
            });
        </script>

        <!--scripts for date picker-->
        <!--scripts for vendorDate-->
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#vendorDate').datepicker({
                    format: "yyyy-mm-dd"
                });
            });
        </script>
        <!--scripts for vendorStartDate-->
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#vendorStartDate').datepicker({
                    format: "yyyy-mm-dd"
                });
            });
        </script>


        <!--scripts for vendorEndDate-->
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#vendorEndDate').datepicker({
                    format: "yyyy-mm-dd"
                });
            });
        </script>

        <!--scripts for thursday-->
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#dateThursday').datepicker({
                    format: "yyyy-mm-dd"
                });
            });
        </script>
        <!--scripts for saturday-->
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#dateSaturday').datepicker({
                    format: "yyyy-mm-dd"
                });
            });
        </script>

        <!--scripts for main start date-->
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#startDate').datepicker({
                    format: "yyyy-mm-dd"
                });
            });
        </script>

        <!--scripts for main end date-->
        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#endDate').datepicker({
                    format: "yyyy-mm-dd"
                });
            });
        </script>

    </body>
</html>
