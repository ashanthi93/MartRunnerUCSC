<%@page import="classes.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Vendor Home | Mart Runner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/bootstrap-submenu.min.css" rel="stylesheet">
        
        <link href="../static/css/martRunner.css" rel="stylesheet">

    </head>

    <body>
        <jsp:include page="/ViewMessages_Customer" />

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

            if (!(username == null)) {
                String vendorID = (String) session.getAttribute("vendorID");
        %>

        <section>

            <div class="container">

                <div class="row" >
                    <div class="box" >
                        <table class="col-lg-12">

                            <tr>
                                <td class="hidden-xs col-md-12 col-lg-12">
                                    <!-- only for lg and md-->
                                    <div class=" hidden-xs col-md-12 col-lg-12" style="width:240px; height:auto;"> 
                                        <div class="hidden-xs col-md-12 col-lg-12 panel panel-default" style="width:240px; height:auto;">
                                            <div class="hidden-xs col-md-12 col-lg-12 panel-body">
                                                <div class="hidden-xs col-md-12 col-lg-12" style="width:180px; height:auto;background-color:#71C671;">
                                                    <center>  <label style="color:#000000; padding-top:35px; font-size:20px;"> VENDOR </label>  <br/><br/> 
                                                        <span class="glyphicon glyphicon-user" style="font-size:70px; color:#000000;"></span> <br/><br/> 
                                                        <a class="btn btn-default" style="width:135px" href="editProfile_Vendor.jsp"> <strong> Edit Profile</strong></a>`
                                                        <br/><br/><br/>
                                                        <span class="glyphicon glyphicon-envelope" style="font-size:70px; color:#000000;"></span> <br/><br/> 
                                                        <a class="btn btn-default" style="width:135px" href="contactAdmin.jsp"> <strong>Contact<br/> Administartor</strong></a>
                                                        <br/><br/>
                                                    </center>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="hidden-xs col-md-12 col-lg-12">
                                    <div  class="col-lg-12" style="width:10px; height:auto; "> </div>
                                </td>
                                <td >
                                    <div class="col-xs-12 col-sm-12" style=" width:auto; height:auto; margin-top:-10px;" align="left">
                                        <div class="panel panel-default col-xs-12 col-sm-12" style=" width:auto; height:auto;">
                                            <div class="panel-body col-xs-12 col-sm-12" >
                                                <!-- only for lg and md -->
                                                <div class="hidden-xs hidden-sm col-md-12 col-lg-12">
                                                    <h3><label style="color:#009933;padding-left:105px;" >Vendor Dashboard </label> </h3>
                                                    <br/> <br/>

                                                </div>
                                                <!-- end of lg and md div-->

                                                <!-- only for xs and sm -->
                                                <div class="hidden-md hidden-lg">
                                                    <h3><label style="color:#009933;" >Vendor <br/>Dashboard </label> </h3>
                                                    <br/> <br/>

                                                </div>
                                                <!-- end of xs and sm div-->

                                                <div class="col-xs-4  col-md-12 col-lg-12 " id="iconDiv" >
                                                    <div class="col-xs-4 col-md-12 col-lg-12 rcorners"  style="width:200px;height:120px;" align="center">
                                                        <span class="glyphicon glyphicon-ok-sign" style="font-size:60px; color:#BC2312;padding-top:10px"></span><br/>
                                                        <!--<label style="color:#000000">Confirm Attendance</label></a>-->

                                                        <div class="btn-group" align="center" >
                                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000">
                                                                <b> Confirm Attendance</b>
                                                                <span class="caret"></span>
                                                            </a>

                                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                <li><a  href="../CheckAttendanceThursday">Thursday Market</a></li>
                                                                <li><a  href="../CheckAttendanceSaturday">Saturday Market</a></li>
                                                            </ul>

                                                        </div>
                                                    </div>
                                                    <%
                                                        ArrayList<Customer> messageList = (ArrayList<Customer>) session.getAttribute("custMessageList");
                                                        int num = messageList.size();
                                                    %>
                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:15px;height:120px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <a href="viewMessages_Customer.jsp"><span class="glyphicon glyphicon-envelope" style="font-size:60px; color:#FFCC00; padding-top:10px"><%if (num > 0) {%><span class="badge" style="font-size: 17px; background-color: red;"><%=num%></span><%}%></span><br/>
                                                            <label style="color:#000000;padding-top: 8px;">Messages</label></a>

                                                    </div>  
                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:15px;height:120px;" ></div>

                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <span class="glyphicon glyphicon-map-marker" style="font-size:60px; color:#009900;"></span><br/>
                                                        <!--<label style="color:#000000">Stall Assignments</label></a>-->

                                                        <div class="btn-group" align="center" >
                                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000">
                                                                <b> Stall Assignments</b>
                                                                <span class="caret"></span>
                                                            </a>

                                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                <li><a  href="viewThursdayStallMap.jsp">View Stall Assignment Thursday</a></li>
                                                                <li><a  href="viewSaturdayStallMap.jsp">View Stall Assignment Saturday</a></li>
                                                            </ul>
                                                        </div>
                                                    </div> 

                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:800px;height:15px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <span class="glyphicon glyphicon-globe" style="font-size:60px; color:#000066;"></span><br/>
                                                        <!--<label style="color:#000000">Products & Posts</label></a>-->

                                                        <div class="btn-group" align="center" >
                                                            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#" style="color:#000000">
                                                                <b> Products & Posts</b>
                                                                <span class="caret"></span>
                                                            </a>

                                                            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
                                                                <li><a  href="addProducts.jsp">Products</a></li>
                                                                <li><a  href="addPosts.jsp">Post</a></li>
                                                            </ul>

                                                        </div>

                                                    </div>  

                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:15px;height:120px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <a href="../../MartRunner/CreateVendorProfile?param=<%=vendorID%>"><span class="glyphicon glyphicon-eye-open" style="font-size:60px; color:#666666;"></span><br/>
                                                            <label style="color:#000000;padding-top: 8px;">Customer View</label></a>
                                                    </div>  

                                                    <div class="hidden-xs col-md-12 col-lg-12 " style="width:15px;height:170px;" ></div>
                                                    <div class="col-xs-12 rcorners" style="width:200px;height:120px;padding-top:10px;" align="center">
                                                        <a href="viewPayment_Vendor.jsp">
                                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#663366;"></span><br/>
                                                            <label style="color:#000000;padding-top: 8px;">Payment details</label>
                                                        </a>
                                                    </div>  
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
                        <h4 class="modal-title" id="successHead" style="text-transform: none"> <% out.println(successHead);%> </h4>
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
