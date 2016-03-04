<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title> Update Vendor Profile | Admin </title>

        <!-- Bootstrap style sheets-->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="../static/css/bootstrap-combobox.css" rel="stylesheet">

        <!-- Font awesome style sheets for some icons-->
        <link type="text/css" href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>

    <body>

        <jsp:include page="/UpdateDetails_Vendor" />

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
            <!-- Start of Update vendor profile content-->
            <div class="container">

                <!-- Start of side bar-->
                <div class="col-lg-3 col-md-3 hidden-xs hidden-sm">

                    <!-- Start of panel-->
                    <div class="panel panel-default" style="margin-top: 10px; width:auto;">
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

                                    <!-- Update vendor profile icon-->
                                    <span class="glyphicon glyphicon-edit" style="font-size:75px; color:#009; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/> 
                                    <a class="btn btn-default active" style="width:auto;" href="updateVendorProfile_Admin.jsp" >
                                        <strong> Update Vendor <br/> Profile</strong> 
                                    </a>

                                    <br/><br/><br/><br/><br/><br/><br/>
                                </div>
                                <!-- End of inner body of start bar-->
                            </center>
                        </div>
                    </div>
                    <!-- End of panel-->
                </div>
                <!-- End of side bar-->

                <!-- Start of Update vendor profile-->
                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">

                        <!-- Start of Header of Update vendor profile-->
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-heading" style="background-color:#71C671;">
                                <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Update Vendor Profile </div>
                            </div>
                        </div>
                        <!-- End of Header of Update vendor profile-->

                        <br/>

                        <!-- Start of change vendor type panel-->
                        <div class="panel panel-default">
                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;"> 
                                <strong> Change Vendor Type </strong> 
                            </div> 

                            <div class="panel-body">
                                <!-- Start of change vendor type form-->
                                <form class="form-horizontal" method="POST" onsubmit="return(validateEmptyField())" action="${pageContext.request.contextPath}/ChangeVendorType" novalidate>

                                    <!-- A label-->
                                    <div class="form-group">
                                        <label class="col-xs-12"> Need to change vendor type? Type vendor name, email address and click on submit </label>
                                    </div>

                                    <!-- Local language vendor name field-->
                                    <div class="form-group">
                                        <label for="inputVendorName" class="control-label col-xs-3"> Local Language Vendor Name </label>
                                        <div class="col-xs-6">
                                            <select class="combobox form-control" name="localLVendorName" id="localLVendorName">
                                                <option value="" selected="selected">Select local language vendor name</option>
                                                <% List<Vendor> LLVendorList = (List<Vendor>) session.getAttribute("LLVendorList");
                                                    if (LLVendorList != null) {
                                                        for (Vendor vendor : LLVendorList) {
                                                %>
                                                <option name="localLVendorName" value="<%=vendor.getVendorID()%>" > <%out.print(vendor.getVendorName());%> </option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Email Address field-->
                                    <div class="form-group">
                                        <label for="inputEmail" class="control-label col-xs-3"> Email Address </label>
                                        <div class="col-xs-6">
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email"/>
                                            <label id="errorEmail" style="font-size:10px"> </label>
                                        </div>
                                    </div>

                                    <!-- Submit, cancel button-->
                                    <div class="form-group">
                                        <div class="col-xs-offset-3 col-xs-9">
                                            <button type="submit" class="btn btn-default"> Submit </button>
                                            <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                        </div>
                                    </div>

                                </form>
                                <!-- End of change vendor type form-->
                            </div>
                        </div>
                        <!-- End of change vendor type panel-->

                        <!-- Start of Edit vendor details panel-->
                        <div class="panel panel-default">
                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;"> 
                                <strong> Edit Vendor Details </strong> 
                            </div> 

                            <div class="panel-body">
                                <!-- Start of edit vendor details form-->
                                <form class="form-horizontal" method="POST" onsubmit="return(validateNoSelect())" action="${pageContext.request.contextPath}/LoadVendorDetails" novalidate>
                                    <!-- A label-->
                                    <div class="form-group">
                                        <label class="col-xs-12"> Need to edit Vendor Details? Type vendor name and click on edit. </label>
                                    </div>

                                    <!-- Vendor name field-->
                                    <div class="form-group">
                                        <label for="inputVendorName" class="control-label col-xs-3"> Vendor Name </label>
                                        <div class="col-xs-6">
                                            <select class="combobox form-control" name="vendorName" id="vendorName">
                                                <option name="vendorName" value="" selected="selected">Select vendor name</option>
                                                <%
                                                    List<Vendor> VendorList = (List<Vendor>) session.getAttribute("vendorList");
                                                    if (VendorList != null) {
                                                        for (Vendor vendor : VendorList) {
                                                %>
                                                <option name="vendorName" value="<%=vendor.getVendorID()%>" > <%out.print(vendor.getVendorName());%> </option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>

                                    <!-- Edit, Cancel button-->
                                    <div class="form-group">
                                        <div class="col-xs-offset-3 col-xs-9">
                                            <button type="submit" class="btn btn-default"> Edit </button>
                                            <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                        </div>
                                    </div>

                                </form>
                                <!-- End of edit vendor details form-->
                            </div>
                        </div>
                        <!-- End of Edit vendor details panel-->

                    </div>
                </div>
                <!-- End of Update vendor profile-->
            </div>
            <!-- End of Update vendor profile content-->
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
            function validateBtnClick() {
                var option = document.getElementById("llVendorName").value;
                if (option == "") {
                    document.getElementById("errorHead").innerHTML = "Empty Selection";
                    document.getElementById("errorMsg").innerHTML = "Please select a vendor name and click on submit";
                    $('#errorModal').modal('show');
                    return false;
                } else {
                    return true;
                }
            }

            function validateEmptyField() {
                var option = document.getElementById("localLVendorName").value;
                if (!(option == "")) {
                    return(validateEmail());
                } else {
                    document.getElementById("errorHead").innerHTML = "Empty Selection";
                    document.getElementById("errorMsg").innerHTML = "Please select a vendor name and click on submit";
                    $('#errorModal').modal('show');
                    return false;
                }
            }

            function validateNoSelect() {
                var option = document.getElementById("vendorName").value;
                if (option == "") {
                    document.getElementById("errorHead").innerHTML = "Empty Selection";
                    document.getElementById("errorMsg").innerHTML = "Please select a vendor name and click on submit";
                    $('#errorModal').modal('show');
                    return false;
                } else {
                    return true;
                }
            }

            function validateEmail() {
                var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                var email = document.getElementById("email").value;
                if (email === "" || email === null) {
                    document.getElementById("email").focus();
                    document.getElementById("email").style.borderColor = "red";
                    document.getElementById("errorEmail").innerHTML = "please enter email address";
                    document.getElementById("errorEmail").style.color = "red";
                    return false;
                }
                else if ((pattern.test(email)) == false) {
                    document.getElementById("email").focus();
                    document.getElementById("email").style.borderColor = "red";
                    document.getElementById("errorEmail").innerHTML = "invalid email";
                    document.getElementById("errorEmail").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("email").style.borderColor = "green";
                    document.getElementById("errorEmail").innerHTML = "";
                    return true;
                }
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
