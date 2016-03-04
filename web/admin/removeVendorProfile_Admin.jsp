<%@page import="classes.HiddenVendors"%>
<%@page import="classes.BlacklistVendors"%>
<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Remove Vendor | Admin </title>

        <!-- Bootstrap style sheets-->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="../static/css/bootstrap-combobox.css" rel="stylesheet">

        <!-- Font awesome style sheets for some icons-->
        <link type="text/css" href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>

    <body>

        <jsp:include page="/RemoveDetails_Vendor" />

        <!-- Header file of page -->
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

                                    <br/>

                                    <!-- Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="adminHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>

                                    <br/><br/>

                                    <!-- Create vendor icon-->
                                    <span class="fa fa-user-plus" style="font-size:75px; color: #d58512; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto" href="createVendorAccount_Admin.jsp">
                                        <strong>Create Vendor</strong>
                                    </a>

                                    <br/><br/>

                                    <!-- Update vendor profile icon-->
                                    <span class="glyphicon glyphicon-edit" style="font-size:75px; color:#009; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/> 
                                    <a class="btn btn-default" style="width:auto;" href="updateVendorProfile_Admin.jsp" >
                                        <strong> Update Vendor <br/> Profile</strong> 
                                    </a>

                                    <br/><br/>

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

                <!-- Start of Remove vendor-->
                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-9">

                        <!-- Start of Header of Remove vendor page-->
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-heading" style="background-color:#71C671;">
                                <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Remove Vendor </div>
                            </div>
                        </div>
                        <!-- End of Header of Remove vendor page-->

                        <!-- Start of Remove vendor account panel-->
                        <div class="panel panel-default">

                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                <strong> Remove Vendor Account </strong>
                            </div>

                            <br/>

                            <div class="panel-body">
                                <!-- Start of Remove vendor account form-->
                                <form class="form-horizontal"  action="${pageContext.request.contextPath}/RemoveVendors" method="POST" role="form"  onsubmit="return(validateForm());" novalidate>
                                    <div class="form-group">
                                        <label class="col-xs-12"> Type vendor name and click on find. </label>
                                    </div>

                                    <!-- Vendor name field-->
                                    <div class="form-group">
                                        <label for="inputVendorName" class="control-label col-xs-3"> Select Vendor Name </label>
                                        <div class="col-xs-6">
                                            <select class="combobox form-control" id="removeVendor" name="removeVendor" onclick="return(activeTextBox())" >

                                                <option value="" selected="selected"> Select Vendor</option> 
                                                <%                                                    List<Vendor> SearchResults = (List<Vendor>) session.getAttribute("VendorList");
                                                    if (SearchResults != null) {
                                                        for (Vendor type : SearchResults) {
                                                %>
                                                <option id="removeVendor" name="removeVendor" value= "<%=type.getVendorID()%>"  > <%out.print(type.getVendorName()); %> </option>  
                                                <%
                                                        }
                                                    } else {
                                                        System.out.println("No match found");
                                                    }
                                                %>                                        
                                            </select>
                                            <label id="errorSelected" style="font-size:15px"> </label>
                                        </div>
                                    </div>

                                    <!-- Remove reason field-->
                                    <div class="form-group">
                                        <label for="removeReason" class="control-label col-xs-3"> Reason To Remove </label>
                                        <div class="col-xs-9">
                                            <input type="text" class="form-control" id="reasonToRemove" name="reasonToRemove" placeholder="Reason"  />
                                            <label id="errorResontoRemove" style="font-size:10px"> </label>
                                        </div>
                                    </div>

                                    <!-- -Remove method radio buttons-->
                                    <div class="form-group" >
                                        <label for="removeMethod" class="control-label col-xs-3"> Method To Remove </label>
                                        <div class="col-xs-9" id="errorRemoveMethode">
                                            <input type="radio" name="removeMethod" id="removeMethod1" value="Blacklist" /> Blacklist
                                            <input type="radio" name="removeMethod" id="removeMethod2" value="Hidden" /> Hidden
                                        </div>
                                    </div>

                                    <!-- Submit buttons-->
                                    <div class="form-group">
                                        <div class="col-xs-offset-3 col-xs-9">
                                            <button type="submit" class="btn btn-default"> Ok </button>
                                            <button type="reset" class="btn btn-default"> Cancel </button>
                                        </div>
                                    </div>

                                </form>
                                <!-- End of Remove vendor account form-->
                            </div>
                        </div>                                
                        <!-- End of Remove vendor account panel-->

                        <%
                            List<BlacklistVendors> SearchResultsFromBlacklist = (List<BlacklistVendors>) session.getAttribute("BlackListVendors");
                            if (SearchResultsFromBlacklist.size() > 0) {
                        %>
                        <!-- Start of Blacklisted vendor list-->
                        <div class="panel panel-default">

                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                <strong> Blacklisted Vendors </strong> 
                            </div>

                            <br/>

                            <!-- Start of Blacklisted vendor form-->
                            <form action="${pageContext.request.contextPath}/HandleBlackListVendors" method="POST" class="form-horizontal" onsubmit="return(validateNoSelect1())">

                                <!-- Blacklisted vendor list-->
                                <div class="form-group col-xs-10">
                                    <ul style="list-style:none;">
                                        <%
                                            for (BlacklistVendors vendor : SearchResultsFromBlacklist) {
                                        %>

                                        <li> <input type="radio" id="blackListVendorName" name="blackListVendorName" value="<%=vendor.getVendorID()%>"> <%out.print(vendor.getVendorName());%> </li>

                                        <%
                                            }
                                        %>                                    
                                    </ul>
                                </div>

                                <!-- Buttons to undo blacklist, hidden or view details-->
                                <div class="form-group">
                                    <div class="col-xs-offset-1 col-xs-10">
                                        <button name="blackList" value="undoBlackList" type="submit" class="btn btn-default"> Undo Blacklist </button>
                                        <button name="blackList" value="hidden"  type="submit" class="btn btn-default"> Hidden </button>
                                        <button name="blackList" value="view"  type="submit" class="btn btn-default"> View Details </button>
                                    </div>
                                </div>

                            </form>
                            <!-- End of Blacklisted vendor form-->
                        </div>
                        <!-- End of Blacklisted vendor list-->
                        <%
                            }
                        %>


                        <%
                            List<HiddenVendors> SearchResultsFromHiddenList = (List<HiddenVendors>) session.getAttribute("HiddenVendors");
                            if (SearchResultsFromHiddenList.size() > 0) {
                        %>

                        <!-- Start of Hidden vendor list-->
                        <div class="panel panel-default">

                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                <strong> Hidden Vendors </strong> 
                            </div>

                            <br/>

                            <!-- Start of Hidden vendor list form-->
                            <form action="${pageContext.request.contextPath}/HandleRemoveVendors" method="POST" class="form-horizontal" onsubmit="return(validateNoSelect2())">

                                <!-- Hidden vendor list-->
                                <div class="form-group col-xs-10">
                                    <ul style="list-style:none;">
                                        <%
                                            for (HiddenVendors vendor : SearchResultsFromHiddenList) {
                                        %>
                                        <li> <input type="radio" id="hiddenVendorName" name="hiddenVendorName" value="<%=vendor.getVendorID()%>"> <%out.print(vendor.getVendorName()); %> </li>
                                            <%
                                                }
                                            %>         
                                    </ul>
                                </div>

                                <!-- Buttons to un-hide vendors or view details-->
                                <div class="form-group">
                                    <div class="col-xs-offset-1 col-xs-10">
                                        <button type="submit" class="btn btn-default" name="hiddenList" value="unhide"> Unhide </button>
                                        <button type="submit" class="btn btn-default" name="hiddenList" value="viewHide"> View Details </button>
                                    </div>
                                </div>

                            </form>
                            <!-- End of Hidden vendor list form-->
                        </div>
                        <!-- End of Hidden vendor list-->

                        <%
                            }
                        %>
                    </div>
                </div>
                <!-- End of Remove vendor-->
            </div>
            <!-- End of Remove vendor content-->
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
            function validateNoSelect1() {
                if (document.getElementById("blackListVendorName").checked) {
                    return true;
                } else {
                    document.getElementById("errorHead").innerHTML = "Empty Selection";
                    document.getElementById("errorMsg").innerHTML = "Please select a vendor name and click on submit";
                    $('#errorModal').modal('show');
                    return false;
                }
            }

            function validateNoSelect2() {
                if (document.getElementById("hiddenVendorName").checked) {
                    return true;
                } else {
                    document.getElementById("errorHead").innerHTML = "Empty Selection";
                    document.getElementById("errorMsg").innerHTML = "Please select a vendor name and click on submit";
                    $('#errorModal').modal('show');
                    return false;
                }
            }

            function validateForm() {
                errors = [];

                if (!validateName("reasonToRemove", "errorResontoRemove")) {
                    errors.push("errorResontoRemove");
                }

                var group = document.getElementsByName("removeMethod");
                if (!(validateRadio(group, "errorRemoveMethode"))) {
                    errors.push("errorRemoveMethode");
                }
                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }
            }

            function validateName(text, errorLbl) {
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }

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

        </script>

        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.combobox').combobox();
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
