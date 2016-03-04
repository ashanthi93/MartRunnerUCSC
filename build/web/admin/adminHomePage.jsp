<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.Vendor"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Administrator Home | Mart Runner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/bootstrap-submenu.min.css" rel="stylesheet">

        <!-- Custom css -->
        <link href="../static/css/martRunner.css" rel="stylesheet">
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

    </head>

    <body>
        <%@include file="header_sub.jsp" %>

        <jsp:include page="/ViewCustomerMessages_Admin" />

        <jsp:include page="/ViewMessages_Vendor" />

        <jsp:include page="/ViewProductRequests_Vendor" />

        <jsp:include page="/ViewPromotionalPostRequests_Vendor" />
        
        <%    
            int alert;
            if(session.getAttribute("updateDatabase") != null){
                alert = (Integer) session.getAttribute("updateDatabase");
            }
        
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

            if (!(username == null)) {
        %>

        <br/>            

        <section>

            <div class="container" >

                <div class="row">
                    <div class="box">
                        <table class="col-lg-12" >
                            <tr class="hidden-md hidden-lg">
                            </tr>
                            <tr>
                                <td>
                                    <!-- only for lg and md-->
                                    <div class="hidden-xs col-md-12 col-lg-12" style="width:240px; height:510px;"> 
                                        <div class="hidden-xs col-md-12 col-lg-12 panel panel-default" style="width:240px; height:510px;">
                                            <div class="hidden-xs col-md-12 col-lg-12 panel-body">
                                                <div class="hidden-xs col-md-12 col-lg-12" style="width:190px; height:480px;background-color:#71C671;">
                                                    <center> <label style="color: #000000; padding-top:35px; font-size:20px;"> ADMINISTRATOR </label>  <br/><br/> 

                                                        <div class="glyphicon glyphicon-user" style="font-size:100px; color:#000000;"></div> <br/><br/> 
                                                        <center> <a class="btn btn-default" style="width:135px;" href="editProfile_Admin.jsp"> <strong>  Edit Profile </strong>
                                                            </a> </center>

                                                        <br/>

                                                        <%
                                                            String adminID = (String) session.getAttribute("ID");
                                                            if (adminID.equals("u10001")) {
                                                        %>
                                                        <span class="glyphicon glyphicon-cog" style="font-size:100px; color:#000000;"></span> <br/><br/> 
                                                        <div class="btn-group" align="center" >
                                                            <button class="btn btn-default" style="width: 165px">
                                                                <a class="btn dropdown-toggle" data-toggle="dropdown" style="color:#000000">
                                                                    <b> Admin Handling</b>
                                                                    <span class="caret"></span>
                                                                </a>

                                                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                    <li> <a  href="createNew_Admin.jsp"> Create Admin</a> </li>
                                                                    <li> <a  href="removeAdmin.jsp"> Remove Admin </a> </li>
                                                                </ul>
                                                            </button>    
                                                        </div>

                                                        <%
                                                            }
                                                        %>

                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!---end of lg and md div-->


                                </td>
                                <td class="hidden-xs col-md-12 col-lg-12">
                                    <div  class="hidden-xs col-md-12 col-lg-12" style="width:30px; height:510px; "> </div>
                                </td>
                                <td>
                                    <div class="col-xs-12 col-sm-12" style=" width:auto; height:auto;" align="left" >
                                        <div class="panel panel-default col-xs-12 col-sm-12" style="height:auto;width: auto;">
                                            <div class="panel-body col-xs-12 col-sm-12" >
                                                <!-- only for lg and md -->
                                                <div class="hidden-xs hidden-sm col-md-12 col-lg-12">
                                                    <h3><label style="color:#009933; padding-left:130px;" >Administrator Dashboard </label> </h3>
                                                    <br/>

                                                </div>
                                                <!-- end of lg and md div-->

                                                <!-- only for sm and xs-->
                                                <div class="hidden-md hidden-lg">
                                                    <h3><label style="color:#009933; " >Administrator <br/>Dashboard </label> </h3>
                                                    <br/>

                                                </div>
                                                <!-- end of xs and sm div-->
                                                <%
                                                    ArrayList<Vendor> messageList = (ArrayList<Vendor>) session.getAttribute("messageList");
                                                    int num = messageList.size();
                                                    int customercount = Integer.parseInt(session.getAttribute("customerfeedbackno") + "");
                                                    int total = num + customercount;
                                                %>
                                                <div class="col-xs-4  col-md-12 col-lg-12 " id="iconDiv" >
                                                    <div class="col-xs-4 col-md-12 col-lg-12 rcorners" style="width:200px;height:120px;" align="center">
                                                        <a href="viewCustomerMessages.jsp"><span class="glyphicon glyphicon-envelope" style="font-size:60px; color:#FFCC00;padding-top:10px"><%if (total > 0) {%><span class="badge" style="font-size: 17px; background-color: red;"><%=total%></span><%}%></span> <br/>

                                                            <label style="color:#000000;padding-top: 8px;">Messages</label></a>
                                                    </div>




                                                    <%
                                                        int totalRequestCount = 0;
                                                        ArrayList<Vendor> requestList = (ArrayList<Vendor>) session.getAttribute("productRequestList");
                                                        int productRequestCount = requestList.size();

                                                        ArrayList<Vendor> postRequestList = (ArrayList<Vendor>) session.getAttribute("postRequestList");
                                                        int postRequestCount = postRequestList.size();

                                                        totalRequestCount += productRequestCount + postRequestCount;
                                                    %>
                                                    <div class="hidden-xs col-md-12 col-lg-12" style="width:15px;height:120px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <span class="glyphicon glyphicon-user" style="font-size:60px; color:#0066CC;"><%if (totalRequestCount > 0) {%><span class="badge" style="font-size: 17px; background-color: red;"><%=totalRequestCount%></span> <%}%></span><br/>
                                                        <!--<label style="color:#000000; padding-top: 8px;">Requests</label>-->
                                                        <div class="btn-group" align="center" >
                                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000">
                                                                <b> Requests</b>
                                                                <span class="caret"></span>
                                                            </a>

                                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                <li><a  href="viewProductRequests.jsp">Products<%if (productRequestCount > 0) {%><span class="badge" style="font-size: 17px; background-color: red;"><%=productRequestCount%></span><%}%></a></li>
                                                                <li><a  href="viewPromotionalPostRequests.jsp">Posts<%if (postRequestCount > 0) {%><span class="badge" style="font-size: 17px; background-color: red;"><%=postRequestCount%></span><%}%> </a> </li>
                                                            </ul>

                                                        </div>
                                                    </div>  
                                                    <div class="hidden-xs col-md-12 col-lg-12  " style="width:15px;height:120px;" ></div>
                                                      <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <span class="glyphicon glyphicon-wrench" style="font-size:60px; color:#99CCCC;"></span><br/>
                                                        <!--<label style="color:#000000">Vendor Handling</label></a>-->

                                                        <div class="btn-group" align="center" >
                                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000">
                                                                <b> Vendor Handling</b>
                                                                <span class="caret"></span>
                                                            </a>

                                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                <li> <a  href="createVendorAccount_Admin.jsp">Create Vendor</a> </li>
                                                                <li> <a  href="updateVendorProfile_Admin.jsp">Update Vendor</a> </li>
                                                                <li> <a href="removeVendorProfile_Admin.jsp">Remove Vendor</a> </li>

                                                            </ul>

                                                        </div>
                                                    </div>     



                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:800px;height:15px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <span class="glyphicon glyphicon-ok-sign" style="font-size:60px; color:#CCCC00;"></span><br/>
                                                        <!--<label style="color:#000000">Vendor Attendance</label></a>-->
                                                        <div class="btn-group" align="center" >
                                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000" >
                                                                <b> Vendor Attendance</b>
                                                                <span class="caret"></span>
                                                            </a>

                                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                <li ><a href="confirmVendorAttendance_Thursday.jsp">Thursday Market</a></li>   
                                                                <li ><a href="confirmVendorAttendance_Saturday.jsp">Saturday Market</a></li>   

                                                            </ul>

                                                        </div>
                                                    </div>  

                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:15px;height:120px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <a href="#"><span class="glyphicon glyphicon-calendar" style="font-size:60px; color:#BC2312;"></span><br/>
                                                            <!--<label style="color:#000000;padding-top: 8px;">Reports</label></a>-->

                                                            <div class="btn-group" align="center" >
                                                                <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000">
                                                                    <b> Reports</b>
                                                                    <span class="caret"></span>
                                                                </a>

                                                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">

                                                                    <li class="dropdown-submenu"><a href="#">Payment Reports</a>
                                                                        <ul class="dropdown-menu" role="menu">
                                                                            <li><a href="reportViewPaymentByDate.jsp">Paid Vendors for a Day</a></li>
                                                                            <li><a href="reportViewPaidVendorsForNextMarketDays.jsp">Paid Vendors for next market days</a></li>
                                                                        </ul>
                                                                    </li>
                                                                    <li class="dropdown-submenu"><a href="#">Attendance Reports</a>
                                                                        <ul class="dropdown-menu" role="menu">
                                                                            <li ><a href="reportViewAttendanceFullYear.jsp">View Full year attendance</a></li>
                                                                            <li class="dropdown-submenu"><a href="#">View Attendance of vendor</a>

                                                                                <ul class="dropdown-menu" role="menu">
                                                                                    <li><a href="reportViewAttendanceVendorFullYear.jsp">Full Year</a></li>
                                                                                    <li><a href="reportViewAttendanceVendorByDate.jsp">Date</a></li>
                                                                                    <li><a href="reportViewAttendanceVendorTimePeriod.jsp">Time period</a></li>
                                                                                </ul>
                                                                            </li>
                                                                            <li><a href="reportViewAttendanceDate.jsp">View Attendance by Date</a></li>
                                                                            <li><a href="reportViewAttendanceTimePeriod.jsp">View Attendance by Time period</a></li>
                                                                        </ul>
                                                                    </li>

                                                                    <li class="dropdown-submenu"><a href="#">Vendor Reports</a>
                                                                        <ul class="dropdown-menu" role="menu">
                                                                            <li><a href="../ReportViewBlackListedVendors">Blacklisted Vendors</a></li>
                                                                            <li><a href="../ReportViewHiddenVendors">Hidden Vendors</a></li>
                                                                            <li><a href="reportViewDetailsOfAVendor.jsp">View Details of a Vendor</a></li>
                                                                        </ul>
                                                                    </li>

                                                                </ul>

                                                            </div>
                                                    </div> 

                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:15px;height:120px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <span class="glyphicon glyphicon-search" style="font-size:60px; color:#666666;"></span><br/>
                                                        <!--<label style="color:#000000">Search Vendors</label></a>-->
                                                        <div class="btn-group" align="center" >
                                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000" >
                                                                <b> Search Vendors</b>
                                                                <span class="caret"></span>
                                                            </a>

                                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                <li><a href="searchMarket_Admin.jsp">Search by Market</a></li>
                                                                <li><a href="searchMainCategory_Admin.jsp">Search by Main Category</a></li>
                                                                <li><a href="searchSubCategory_Admin.jsp">Search by Sub Category</a></li>
                                                            </ul>

                                                        </div>

                                                    </div>  

                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:800px;height:15px;" ></div>
                                                   <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#663366;"></span><br/>
                                                        <!--<label style="color:#000000">Payment Handling</label></a>-->

                                                        <div class="btn-group" align="center" >
                                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000" >
                                                                <b> Payment Handling</b>
                                                                <span class="caret"></span>
                                                            </a>

                                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                <li><a href="addPayment_Admin.jsp">Add Payment</a></li>
                                                                <li><a href="viewPayment_Admin.jsp">View Payment</a></li>
                                                                <li><a href="updatePayment_Admin.jsp">Update Payment</a></li>
                                                                <li><a href="removePayment_Admin.jsp">Remove Payment</a></li>
                                                            </ul>

                                                        </div>

                                                    </div>   

                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:15px;height:120px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <a href="posts_Admin.jsp"><span class="glyphicon glyphicon-globe" style="font-size:60px; color:#000066;"></span><br/>
                                                            <label style="color:#000000">Posts</label> </a> 
                                                    </div>  

                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:15px;height:120px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <a href="uploadStallAssignment.jsp"><span class="glyphicon glyphicon-map-marker" style="font-size:60px; color:#009900;"></span><br/>
                                                            <label style="color:#000000">Stall Assignments</label> </a>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                </td>	 
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.container -->
        </section>

        <%
            }
        %>                                                               

        <!-- Modal Error -->
        <div class="modal" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="color: red;">                        
                        <h4 class="modal-title" id="errorHead" style="text-transform: none"> <% out.println(errorHead);%> </h4>
                    </div>
                    <div class="modal-body">
                        <p id="errorMsg" style="font-weight: normal; font-size: 17px;"> <% out.println(errorMsg);%> </p>
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
                        <h4 class="modal-title" id="successMsg" style="text-transform: none"> <% out.println(successHead);%> </h4>
                    </div>
                    <div class="modal-body">
                        <p id="successMsg" style="font-weight: normal; font-size: 17px;"> <% out.println(successMsg);%> </p>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-success" data-dismiss="modal"> OK </button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="footer_sub.jsp" %>

        <!-- jQuery -->
        <script src="../static/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-submenu.min.js"></script>

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