<%@page import="classes.HiddenVendors"%>
<%@page import="classes.BlacklistVendors"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Remove Vendor | Admin </title>

        <!-- Bootstrap style sheets-->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font awesome style sheets for some icons-->
        <link type="text/css" href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Basic styles sheet-->
        <link type="text/css" href="../static/css/martRunner.css" rel="stylesheet">
    </head>

    <body>

        <!-- Header file of page -->
        <%@include file="header_sub.jsp" %>

        <section>
            <!-- Start of Remove vendor content-->
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
                                    <label style="color:#000; padding-top:15px; font-size:25px;"> Vendor Handling </label>  

                                    <br/><br/>

                                    <!-- Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="adminHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Remove vendor icon-->
                                    <span class="glyphicon glyphicon-remove-sign" style="font-size:75px; color:red; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/>
                                    <a class="btn btn-default active" style="width:auto;" href="removeVendorProfile_Admin.jsp"> 
                                        <strong> Remove Vendor </strong> 
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

                <!-- Start of Remove vendor details-->
                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-9">

                        <%                            BlacklistVendors blacklistVendor = (BlacklistVendors) session.getAttribute("BlackListVendor");
                            if (blacklistVendor != null) {
                        %>

                        <!-- Start of Header of Blacklist Vendor page-->
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-heading" style="background-color:#71C671;">
                                <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Blacklist Vendor Details </div>
                            </div>
                        </div>
                        <!-- End of Header of Blacklist vendor page-->

                        <!-- Start of Blacklist vendor account panel-->
                        <div class="panel panel-default">

                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                <strong> Details of Blacklisted vendor <% out.println(blacklistVendor.getVendorName());%> </strong>
                            </div>

                            <br/>

                            <div class="panel-body">
                                <!-- Start of Remove vendor account form-->
                                <form class="form-horizontal"  action="${pageContext.request.contextPath}/HandleBlackListVendor2" method="POST" role="form"  novalidate>
                                    
                                    <div class="form-group">
                                        <label class="col-xs-12"> Blacklisted Reason &nbsp; : &nbsp;<% out.println(blacklistVendor.getBlackListReason()); %>  </label>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-xs-12"> Blacklisted Date &nbsp; &nbsp;  &nbsp;  &nbsp; : &nbsp;<% out.println(blacklistVendor.getBlacklistDate()); %>  </label>
                                    </div>

                                    <!-- Buttons to undo blacklist, hidden or view details-->
                                    <div class="form-group">
                                        <div class="col-xs-offset-1 col-xs-10">
                                            <button name="blackList" value="undoBlackList" type="submit" class="btn btn-default"> Undo Blacklist </button>
                                            <button name="blackList" value="hidden" type="submit" class="btn btn-default"> Hidden </button>
                                            <button name="blackList" value="cancel" type="submit" class="btn btn-default"> Cancel </button>
                                        </div>
                                    </div>

                                </form>
                                <!-- End of Remove vendor account form-->
                            </div>
                        </div>                                
                        <!-- End of Remove vendor account panel-->

                        <% } else {
                            HiddenVendors hiddenVendor = (HiddenVendors) session.getAttribute("HiddenVendor");
                        %>

                        <!-- Start of Header of Hidden Vendor page-->
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-heading" style="background-color:#71C671;">
                                <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Hidden Vendor Details </div>
                            </div>
                        </div>
                        <!-- End of Header of Hidden vendor page-->

                        <!-- Start of Hidden vendor account panel-->
                        <div class="panel panel-default">

                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                <strong> Details of Hidden vendor <% out.println(hiddenVendor.getVendorName());%> </strong>
                            </div>

                            <br/>

                            <div class="panel-body">
                                <!-- Start of Remove vendor account form-->
                                <form class="form-horizontal"  action="${pageContext.request.contextPath}/HandleRemoveVendors2" method="POST" role="form"  novalidate>
                                    <div class="form-group">
                                        <label class="col-xs-12"> Hidden Reason &nbsp; : &nbsp;<% out.println(hiddenVendor.getHiddenReason()); %>  </label>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-xs-12"> Hidden Date &nbsp; &nbsp;  &nbsp;  &nbsp; : &nbsp;<% out.println(hiddenVendor.getHideDate()); %>  </label>
                                    </div>

                                    <!-- Buttons to undo unhide or view details-->
                                    <div class="form-group">
                                        <div class="col-xs-offset-1 col-xs-10">
                                            <button type="submit" class="btn btn-default" name="hiddenList" value="unhide"> Unhide </button>
                                            <button type="submit" class="btn btn-default" name="hiddenList" value="cancel"> Cancel </button>
                                        </div>
                                    </div>

                                </form>
                                <!-- End of Remove vendor account form-->
                            </div>
                        </div>                                
                        <!-- End of Remove vendor account panel-->
                        <% }%>
                    </div>
                </div>
                <!-- End of Remove vendor-->
            </div>
            <!-- End of Remove vendor content-->
        </section>

        <!-- Footer fie of page -->
        <%@include file="footer_sub.jsp"%>

        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>

    </body>
</html>
