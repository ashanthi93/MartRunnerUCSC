<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Confirm Saturday Vendor Attendance | Vendor </title>

        <!-- Bootstrap style sheets-->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">

    </head>

    <body>

        <!--Including Header Page-->
        <%@include file="header_sub.jsp" %>

        <%            String confirmation = (String) session.getAttribute("AttendanceS");

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
            <!-- Start of Post Page content-->
            <div class="container">

                <!-- Start of side bar-->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">

                    <!-- Start of panel-->
                    <div class="panel panel-default hidden-xs hidden-sm" style="margin-top: 10px; width:auto;">
                        <div class="panel-body">
                            <center>

                                <!-- Start of inner body of start bar-->
                                <div style="width:auto; height:auto; background-color:#71C671; margin-top:10px;"> 

                                    <!-- Side bar title-->
                                    <label style="color:#000; padding-top:15px; font-size:20px;"> Confirm Attendance </label>  

                                    <br/><br/>

                                    <!-- Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="vendorHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>

                                    <br/><br/>

                                    <!-- Confirm Saturday Attendance icon-->
                                    <span class="glyphicon glyphicon-ok-sign" style="font-size:75px; color: #d58512; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/>
                                    <a class="btn btn-default active" style="width:auto" href="ConfirmSaturdayVendorAttendense.jsp">
                                        <strong>Confirm Saturday <br/> Attendance</strong>
                                    </a>

                                    <br/><br/>
                                </div>
                                <!-- End of inner body of start bar-->
                            </center>
                        </div>
                    </div>
                    <!-- End of panel-->
                </div>
                <!-- End of side bar-->

                <!-- Start of Saturday Attendance Content-->
                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <br/>

                        <!-- Start of Saturday Attendance panel-->
                        <div class="panel panel-default">                            
                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;"> 
                                <strong> Confirm Saturday Attendance </strong> 
                            </div>

                            <div class="panel-body">    

                                <form class="form-horizontal"  method="POST" onsubmit="return(validate_Attendace(<%=confirmation%>))" action="${pageContext.request.contextPath}/ConfirmAttendanceSaturday">
                                    <div class="form-group">
                                        <label class="control-label col-xs-3">Your Attendance Status</label>
                                        <div class="col-xs-6">
                                            <select class="form-control" id="Confirmation" name="Confirmation" >
                                                <% if ("1".equals(confirmation)) {
                                                        out.println("<option value='1' selected='selected' > Attending </option>");
                                                        out.println("<option value='0' > Not-Confirmed</option>");
                                                    } else if ("0".equals(confirmation)) {
                                                        out.println("<option value='1' > Attending </option>");
                                                        out.println("<option value='0' selected='selected' > Not-Attending </option>");
                                                    }%>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-offset-3 col-xs-9">
                                            <button type="submit" class="btn btn-default" style="width: 75px"> Submit </button>
                                            <button type="submit" class="btn btn-default"> Cancel </button>
                                        </div>
                                    </div>

                                </form>
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

        <!-- Footer fie of page -->
        <%@include file="footer_sub.jsp"%>

        <script type="text/javascript">
            function validate_Attendace(confirmation) {
                if (confirmation == "1") {
                    if (document.getElementById("Confirmation").value != "0") {
                        document.getElementById("errorHead").innerHTML = "No Changes";
                        document.getElementById("errorMsg").innerHTML = "You haven't done any changes to submit";
                        $('#errorModal').modal('show');
                        return false;
                    } else {
                        return true;
                    }
                } else if (confirmation == "0") {
                    if (document.getElementById("Confirmation").value != "1") {
                        document.getElementById("errorHead").innerHTML = "No Changes";
                        document.getElementById("errorMsg").innerHTML = "You haven't done any changes to submit";
                        $('#errorModal').modal('show');
                        return false;
                    } else {
                        return true;
                    }
                }
            }
        </script>

        <!-- JQuery file-->
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