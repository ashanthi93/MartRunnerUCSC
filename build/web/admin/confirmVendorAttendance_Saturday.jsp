<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Confirm Saturday Attendance | Mart Runner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font awesome style sheets for some icons-->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <style type="text/css">
            .control-label{
                display: inline-block; 
                text-align: left;
            }
        </style>
    </head>

    <!-- Display relevant values when loading -->
    <body>

        <jsp:include page="/LoadAttendingVendorsSaturday" />

        <!-- Header file-->
        <%@include file="header_sub.jsp" %>

        <%            
            List<Vendor> attendingVendorList = new ArrayList<Vendor>();
            List<Vendor> notAttendingVendorList = new ArrayList<Vendor>();
            List<Vendor> remainingVendorList = new ArrayList<Vendor>();

            attendingVendorList = (List<Vendor>) session.getAttribute("attendingVendorList");
            notAttendingVendorList = (List<Vendor>) session.getAttribute("notAttendingVendorList");
            remainingVendorList = (List<Vendor>) session.getAttribute("remainVendorList");

            int confirm = (Integer) session.getAttribute("confirm");
            int nConfirm = (Integer) session.getAttribute("nConfirm");

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
            <!-- Start of confirm vendor attendance content-->
            <div class="container">

                <!-- Start of Saturday Attendance Content-->
                <div class="container">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <br/>

                        <!-- Start of Saturday Attendance panel-->
                        <div class="panel panel-default">                            

                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:20px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;"> 
                                <strong> Saturday Vendor Attendance </strong> 
                            </div>

                            <div class="panel-body">    

                                <!-- Attending Vendor Panel -->
                                <div class="panel panel-default col-xs-6 col-md-6 col-md-6 col-lg-6">

                                    <br/>

                                    <!-- panel title -->    
                                    <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                        <strong> Attending Vendors </strong> 
                                    </div>

                                    <br/>

                                    <form class="form-horizontal" name="attendVendorForm" method="POST" onsubmit="return(validateSelection1())" action="${pageContext.request.contextPath}/SaturdayAttendanceRemove">

                                        <% if (attendingVendorList.size() > 0) {%>

                                        <label> Select vendors that are not attending this week and click on attend button </label>

                                        <div class="form-group">
                                            <div class="col-xs-offset-2 col-xs-10">
                                                <span>
                                                    <% for (Vendor vendor : attendingVendorList) {%>
                                                    <input type="checkbox" name="attendVendor" id="attendVendor" value="<%=vendor.getVendorID()%>"/> <% out.println(vendor.getVendorName()); %> <br/>
                                                    <% } %>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-offset-3 col-xs-9">
                                                <button type="submit" class="btn btn-default"> Not-Attending </button>
                                                <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                            </div>
                                        </div>    

                                        <% } %>

                                    </form>

                                </div>

                                <!-- Not Attending Vendor Panel -->        
                                <div class="panel panel-default col-xs-5 col-md-5 col-md-5 col-lg-5 col-xs-offset-1">

                                    <br/>

                                    <!-- panel title -->    
                                    <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                        <strong> Not-Attending Vendors </strong> 
                                    </div>

                                    <br/>

                                    <form class="form-horizontal" name="nAttendVendorForm" method="POST" onsubmit="return(validateSelection2())" action="${pageContext.request.contextPath}/SaturdayAttendanceConfirmation">

                                        <% if (notAttendingVendorList.size() > 0) { %>

                                        <label> Select vendors that are attending this week and click on submit </label>

                                        <div class="form-group">
                                            <div class="col-xs-offset-3 col-xs-9">
                                                <span>
                                                    <% for (Vendor vendor : notAttendingVendorList) {%>
                                                    <input type="checkbox" name="notAttendVendor" id="notAttendVendor" value="<%=vendor.getVendorID()%>"/> <% out.println(vendor.getVendorName()); %> <br/>
                                                    <% } %>
                                                </span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-xs-offset-3 col-xs-9">
                                                <button type="submit" class="btn btn-default"> Attending </button>
                                                <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                            </div>
                                        </div>    
                                        <% } %>
                                    </form>
                                </div>

                                <!-- Stall Count -->
                                <div class="row">
                                    <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                        <label> Number of Attending Vendors : <% out.println(confirm);%> </label> <br/>
                                        <label> Number of Vacant Stalls : <% out.println(15 - confirm);%> </label>
                                    </div>
                                </div>

                                <!-- Add new vendor panel -->
                                <div class="row">
                                    <div class="panel panel-default col-lg-10 col-md-10 col-sm-10 col-xs-10 col-xs-offset-1">

                                        <br/>

                                        <!-- panel title -->    
                                        <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                            <strong> Add New Attending Vendors </strong> 
                                        </div>

                                        <br/>

                                        <form class="form-horizontal"  method="POST" name="newVendorForm" onsubmit="return(validateSelection3())" action="${pageContext.request.contextPath}/AddNewAttendanceSaturday">

                                            <% if (remainingVendorList.size() > 0) {%>

                                            <label> Select vendors that are attending this week and click on submit button </label>

                                            <div class="form-group">
                                                <div class="col-xs-offset-2 col-xs-10">
                                                    <span>
                                                        <% for (Vendor vendor : remainingVendorList) {%>
                                                        <input type="checkbox" name="newVendor" id="newVendor" value="<%=vendor.getVendorID()%>"/> <% out.println(vendor.getVendorName()); %> <br/>
                                                        <% } %>
                                                    </span>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-xs-offset-3 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> Submit </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>    

                                            <% }%>

                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Saturday Attendance content-->

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

        <!-- include footer -->
        <%@include  file="footer_sub.jsp" %>

        <!-- data validation -->
        <script type="text/javascript">
            var count = 0;

            function validateSelection1() {
                var group = document.attendVendorForm.attendVendor;
                for (var i = 0; i < group.length; i++) {
                    if (group[i].checked) {
                        return true;
                        break;
                    }
                }
                if (i == group.length) {
                    document.getElementById("errorHead").innerHTML = "Empty Submission";
                    document.getElementById("errorMsg").innerHTML = "Please select a vendor name before submit !";
                    $('#errorModal').modal('show');
                    return false;
                }
            }

            function validateSelection2() {
                var group = document.nAttendVendorForm.notAttendVendor;
                for (var i = 0; i < group.length; i++) {
                    if (group[i].checked) {
                        return true;
                        break;
                    }
                }
                if (i == group.length) {
                    document.getElementById("errorHead").innerHTML = "Empty Submission";
                    document.getElementById("errorMsg").innerHTML = "Please select a vendor name before submit !";
                    $('#errorModal').modal('show');
                    return false;
                }
            }

            function validateSelection3() {
                var group = document.newVendorForm.newVendor;
                for (var i = 0; i < group.length; i++) {
                    if (group[i].checked) {
                        return(countSelections());
                        break;
                    }
                }
                if (i == group.length) {
                    document.getElementById("errorHead").innerHTML = "Empty Submission";
                    document.getElementById("errorMsg").innerHTML = "Please select a vendor name before submit !";
                    $('#errorModal').modal('show');
                    return false;
                }
            }

            function countSelections() {
                var group = document.newVendorForm.newVendor;
                var count = 0;
                var vacantStalls = <%=(15 - confirm)%>;
                for (var i = 0; i < group.length; i++) {
                    if (group[i].checked) {
                        count++;
                    }
                }
                if (count > vacantStalls) {
                    document.getElementById("errorHead").innerHTML = "Selection Exceeds";
                    document.getElementById("errorMsg").innerHTML = "You have selected more no.of vendors than vacant !";
                    $('#errorModal').modal('show');
                    return false;
                } else {
                    return true;
                }
            }
        </script>

        <!-- jQuery -->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>

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
