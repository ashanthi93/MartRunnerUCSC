<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Admin | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <style type="text/css">
            h5{
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

        <!--Including Header Page-->
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
            <!-- Start of create admin account content-->
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
                                    <label style="color:#000; padding-top:15px; font-size:25px;"> Admin Handling </label>  

                                    <br/><br/>

                                    <!-- Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="adminHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Create admin icon-->
                                    <span class="fa fa-user-plus" style="font-size:75px; color: #d58512; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/> 
                                    <a class="btn btn-default active" style="width:auto" href="createNew_Admin.jsp">
                                        <strong>Create Admin</strong>
                                    </a>
                                    <br/><br/>

                                    <!-- Remove admin icon-->
                                    <span class="glyphicon glyphicon-remove-sign" style="font-size:75px; color: red; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="removeAdmin.jsp"> 
                                        <strong> Remove Admin </strong> 
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

                <!-- Start of Create admin account-->
                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">

                        <label id="welcome"> </label>

                        <div class="panel panel-default" style="margin-top: 10px;">

                            <!-- Start of Header of Create admin account-->
                            <div class="panel-heading" style="background-color:#71C671;">
                                <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Create New Admin </div>
                            </div>
                            <!-- End of Header of Create admin account-->

                            <!-- Start of Body of Create admin account-->
                            <div class="panel-body">
                                <form action="${pageContext.request.contextPath}/InsertAdmin" class="form-horizontal" method="POST" role="form" name="createVendor" onsubmit="return(validateForm())" novalidate>

                                    <!-- Start of personal details-->
                                    <div id="personalDetails">
                                        <h5> Personal Details </h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">

                                                <!-- First Name-->
                                                <label for="firstName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> First Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter first name"/>
                                                    <label id="errorFirstName" style="font-size:10px"> </label>
                                                </div>

                                                <!-- Last Name-->
                                                <label for="lastName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Last Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name"/>
                                                    <label id="errorLastName" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- NIC Number-->
                                                <label for="nicNumber" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> NIC Number </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="nicNumber" name="nicNumber" placeholder="Enter NIC" maxlength="10"/>
                                                    <label id="errorNicNumber" style="font-size:10px"> </label>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of personal details-->

                                    <!-- Start of contact details-->
                                    <div id="contactDetails">
                                        <h5> Contact Details </h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Mobile number-->
                                                <label for="mobileNumber" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Mobile Number </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Enter mobile number" maxlength="10"/>
                                                    <label id="errorMobileNumber" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Email-->
                                                <label for="email" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Email Address </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email"/>
                                                    <label id="errorEmail" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of contact details-->

                                    <div class="form-group">
                                        <span class="text-muted"><em><span style="color:red;">*</span> Indicates required field</em></span>
                                    </div>

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
                            <!-- End of Other Details-->

                        </div>
                        <!-- End of Body of Create admin account-->
                    </div>
                </div>

            </div>
            <!-- End of Create admin account-->

            <!-- End of create admin account content-->
        </section>

        <!-- Modal Error -->
        <div class="modal" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="color: red;">                        
                        <h3 class="modal-title" id="myModalLabel"> <% out.println(errorHead);%> </h3>
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
                        <h4 class="modal-title" id="myModalLabel"> <% out.println(successHead);%> </h4>
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

        <!--Include Footer page-->
        <%@include file="footer_sub.jsp" %>

        <!-- Data validation-->
        <script type="text/javascript">
            function validateForm() {
                var errors = [];

                //Start of personal detail validate
                if (!validateName("firstName", "errorFirstName")) {
                    errors.push("errorFirstName");
                }

                if (!validateName("lastName", "errorLastName")) {
                    errors.push("errorLastName");
                }

                var nicNumber = document.getElementById("nicNumber").value;
                if (!validateNicNumber(nicNumber)) {
                    errors.push("errorNicNumber");
                }
                //End of personal detail validate

                //Start of contact detail validate
                var mobileNumber = document.getElementById("mobileNumber").value;
                if (!validateMobileNumber(mobileNumber)) {
                    errors.push("errorMobileNumber");
                }

                var email = document.getElementById("email").value;
                if (!validateEmail(email)) {
                    errors.push("errorEmail");
                }

                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }
            }

            function validateName(text, errorLbl) {
                var pattern = /^[a-zA-Z]+$/;
                var name = document.getElementById(text).value;
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    if (pattern.test(name) == false) {
                        document.getElementById(text).style.borderColor = "red";
                        document.getElementById(errorLbl).innerHTML = "Name can contain only alphabetic characters";
                        document.getElementById(errorLbl).style.color = "red";
                        return true;
                    } else {
                        document.getElementById(text).style.borderColor = "green";
                        document.getElementById(errorLbl).innerHTML = "";
                        return true;
                    }
                }
            }

            function validateNicNumber(text) {
                var pattern = /^[0-9]{9}(V|v){1}/;
                if (text == "" || text == null) {
                    document.getElementById("nicNumber").focus();
                    document.getElementById("nicNumber").style.borderColor = "red";
                    document.getElementById("errorNicNumber").innerHTML = "required";
                    document.getElementById("errorNicNumber").style.color = "red";
                    return false;
                }
                else if ((pattern.test(text)) == false || text.length < 10) {
                    document.getElementById("nicNumber").focus();
                    document.getElementById("nicNumber").style.borderColor = "red";
                    document.getElementById("errorNicNumber").innerHTML = "invalid type";
                    document.getElementById("errorNicNumber").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("nicNumber").style.borderColor = "green";
                    document.getElementById("errorNicNumber").innerHTML = "";
                    return true;
                }
            }

            function validateMobileNumber(text) {
                var pattern = /^([+0-9]{1,3})?([0-9]{10,11})$/i;
                if (text == null || text == "") {
                    document.getElementById("mobileNumber").focus();
                        document.getElementById("mobileNumber").style.borderColor = "red";
                    document.getElementById("errorMobileNumber").innerHTML = "required";
                    document.getElementById("errorMobileNumber").style.color = "red";
                    return false;
                }
                else if ((pattern.test(text)) == false || text.length < 10) {
                    document.getElementById("mobileNumber").focus();
                    document.getElementById("mobileNumber").style.borderColor = "red";
                    document.getElementById("errorMobileNumber").innerHTML = "invalid type";
                    document.getElementById("errorMobileNumber").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("mobileNumber").style.borderColor = "green";
                    document.getElementById("errorMobileNumber").innerHTML = "";
                    return true;
                }
            }

            function validateEmail(text) {
                var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                if (text == "" || text == null) {
                    document.getElementById("email").focus();
                    document.getElementById("email").style.borderColor = "red";
                    document.getElementById("errorEmail").innerHTML = "required";
                    document.getElementById("errorEmail").style.color = "red";
                    return false;
                }
                else if ((pattern.test(text)) == false) {
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

        <!--Java Scripts-->
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