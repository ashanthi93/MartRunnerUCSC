<%@page import="classes.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Profile Admin | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <style type="text/css">
            #h4{
                font-weight: bold; 
                font-family: lucida bright;; 
                color:#218868;
                background-color: #C1FFC1;
                padding: 5px;
            }
        </style>
    </head>

    <body>

        <jsp:include page="/EditDetailsAdmin"/>

        <!-- Header file of page -->
        <%@include file="header_sub.jsp" %>

        <%            Admin admin = (Admin) session.getAttribute("admin");

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
                <div class="row">

                    <!--Start of Side Bar-->
                    <div class=" col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 
                                        <!--Side Bar Topic-->
                                        <label style="color: #000000; padding-top:19px; font-size:22px;"> Edit Profile </label>  
                                        <br/><br/>
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#EE2C2C; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width: auto;" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br><br>

                                        <!--Edit Vendor Profile Icon-->
                                        <span class="glyphicon glyphicon-edit" style="font-size:75px; color:#104E8B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default active" style="width:auto;" href="editProfile_Admin.jsp"> <strong> Edit Profile</strong></a>

                                        <br/><br/>
                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>

                    <!-- Start of Edit Admin Profile Form-->
                    <div class="container">
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">

                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Edit Profile </p>
                                </div>

                                <!--Form Body-->
                                <div class="panel-body">
                                    <form class="form-horizontal" id="changevendorprofile" method="POST" action="${pageContext.request.contextPath}/editProfileAdmin" role="form" onsubmit="return(checkChange())" novalidate>

                                        <h5 id="h4">Change Personal Details</h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">

                                                <!--First name-->
                                                <label for="firstname" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left"> Change First Name</label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="firstname" name="firstname" placeholder="<%=admin.getUserFirstname()%>" value="<%=admin.getUserFirstname()%>" onchange="markChange()">
                                                    <label id="errorFirstname" style="font-size:10px"> </label>
                                                </div>

                                                <!--Last name-->
                                                <label for="lastname" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left"> Change Last Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="lastname" name="lastname" placeholder="<%=admin.getUserLastName()%>" value="<%=admin.getUserLastName()%>" onchange="markChange()">
                                                    <label id="errorLastname" style="font-size:10px"> </label>
                                                </div>                                               

                                            </div>
                                        </div> 

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">

                                                <!--NIC-->
                                                <label for="nicNumber" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left"> Change NIC Number </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="nicNumber" name="nicNumber" placeholder="<%=admin.getUserNIC()%>" value="<%=admin.getUserNIC()%>" onchange="markChange()" maxlength="10">
                                                    <label id="errorNicNumber" style="font-size:10px"> </label>
                                                </div>

                                            </div>
                                        </div>

                                        <h5 id="h4">Contact Details</h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">

                                                <!--Mobile Number-->
                                                <label for="mobileNumber" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left">Change Mobile Number</label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="<%=admin.getUserContactNo()%>" value="<%=admin.getUserContactNo()%>" onchange="markChange()">
                                                    <label id="errorMobileNumber" style="font-size:10px"> </label>
                                                </div>

                                                <!--Email Address-->
                                                <label for="email" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left">Change Email Address &nbsp;</label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="email" class="form-control" id="email" name="email" placeholder="<%=admin.getUserEmail()%>" value="<%=admin.getUserEmail()%>" onchange="markChange()">
                                                    <label id="errorEmail" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Change Password-->            
                                        <h5 id="h4">Change Password </h5>            
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
                                                    <input type="password" class="form-control" id="prvPassword" name="prvPassword" placeholder="Enter old password">
                                                    <label id="errorPrvPassword" style="font-size:10px"> </label>
                                                </div>
                                                <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
                                                    <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Enter new password">
                                                    <label id="errorNewPassword" style="font-size:10px"> </label>
                                                </div>
                                                <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
                                                    <input type="password" class="form-control" id="cnfrmPassword" name="cnfrmPassword" placeholder="Re-enter new password">
                                                    <label id="errorCnfrmPassword" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>            

                                        <!--Submit,cancel Buttons-->
                                        <div class="row">
                                            <!--Submit Button-->
                                            <center>
                                                <div class="col-xs-2 col-xs-offset-3 col-sm-offset-4 col-sm-2 col-md-2 col-lg-2 ">
                                                    <button type="submit" class="btn btn-default"> <strong> Submit </strong> </button>
                                                </div>

                                                <!--Cancel Button-->

                                                <div class="col-xs-2 col-xs-offset-2 col-sm-offset-0 col-sm-2 col-md-2 col-lg-2 ">
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> <strong>Cancel</strong></button>
                                                </div>
                                            </center>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End of Edit Admin Profile Form-->

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

        <%@include file="footer_sub.jsp" %>

        <!-- Data validation-->
        <script type="text/javascript">

            var changes = [];
            var errors = [];

            //push into changes if value is change in a field
            function markChange() {
                changes.push(1);
            }

            //validate form
            function checkChange() {
                if (changes.length == 0) {
                    var prvPassword = document.getElementById("prvPassword").value;
                    var newPassword = document.getElementById("newPassword").value;
                    var cnfrmPassword = document.getElementById("cnfrmPassword").value;

                    if (prvPassword == "" & newPassword == "" & cnfrmPassword == "") {
                        document.getElementById("errorHead").innerHTML = "Empty Submission";
                        document.getElementById("errorMsg").innerHTML = "There are no changes to submit !";
                        $('#errorModal').modal('show');
                        return false;
                    } else {

                        var errors = [];

                        if (!((prvPassword == "" || prvPassword == null) && (newPassword == "" || newPassword == null))) {
                            if (!validatePassword()) {
                                errors.push("errorPassword");
                            }
                        }

                        if (errors.length > 0) {
                            return false;
                        } else {
                            return true;
                        }
                    }
                } else {

                    var validationError = [];

                    //firstname validation
                    if (!validateFirstName()) {
                        validationError.push(1);
                    }

                    //lastname valiation
                    if (!validateLastname()) {
                        validationError.push(1);
                    }

                    //mobile validation
                    var mobile = document.getElementById("mobileNumber").value;
                    if (!validateMobileNumber(mobile)) {
                        validationError.push(1);
                    }

                    //email valiation
                    var email = document.getElementById("email").value;
                    if (!validateEmail(email)) {
                        validationError.push(1);
                    }

                    //nic validation
                    var nic = document.getElementById("nicNumber").value;
                    if (!validateNicNumber(nic)) {
                        validationError.push(1);
                    }

                    //Start of password change
                    var prvPass = document.getElementById("prvPassword").value;
                    var newPass = document.getElementById("newPassword").value;
                    var cnfrmPass = document.getElementById("cnfrmPassword").value;
                    if (prvPass != "" || newPass != "" || cnfrmPass != "") {
                        if (!validatePassword()) {
                            validationError.push(1);
                        }
                    }

                    if (validationError.length > 0) {
                        return false;
                    } else {
                        return true;
                    }
                }
            }

            //method to validate name field is empty or not and charachters
            function validateFirstName() {
                var pattern = /^[a-zA-Z]+$/;
                var firstname = document.getElementById("firstname").value;
                if (document.getElementById("firstname").value == "" || document.getElementById("firstname").value == null) {
                    document.getElementById("firstname").focus();
                    document.getElementById("firstname").style.borderColor = "red";
                    document.getElementById("errorFirstname").innerHTML = "required";
                    document.getElementById("errorFirstname").style.color = "red";
                    return false;
                }
                else {
                    if (pattern.test(firstname) == false) {
                        document.getElementById("firstname").style.borderColor = "red";
                        document.getElementById("errorFirstname").innerHTML = "Name can contain only alphabetic characters";
                        document.getElementById("errorFirstname").style.color = "red";
                        return false;
                    } else {
                        document.getElementById("firstname").style.borderColor = "green";
                        document.getElementById("errorFirstname").innerHTML = "";
                        document.getElementById("errorFirstname").style.color = "red";
                        return true;
                    }
                }
            }

            function validateLastname() {
                var pattern = /^[a-zA-Z]+$/;
                var lastname = document.getElementById("lastname").value;
                if (document.getElementById("lastname").value == "" || document.getElementById("lastname").value == null) {
                    document.getElementById("lastname").focus();
                    document.getElementById("lastname").style.borderColor = "red";
                    document.getElementById("errorLastname").innerHTML = "required";
                    document.getElementById("errorLastname").style.color = "red";
                    return false;
                }
                else {
                    if (pattern.test(lastname) == false) {
                        document.getElementById("lastname").style.borderColor = "red";
                        document.getElementById("errorLastname").innerHTML = "Name can contain only alphabetic characters";
                        document.getElementById("errorLastname").style.color = "red";
                        return false;
                    } else {
                        document.getElementById("lastname").style.borderColor = "green";
                        document.getElementById("errorLastname").innerHTML = "";
                        document.getElementById("errorLastname").style.color = "red";
                        return true;
                    }
                }
            }

            //method to validate password
            function validatePassword() {
                var prvPass = document.getElementById("prvPassword").value;
                var newPass = document.getElementById("newPassword").value;
                var cnfrmPass = document.getElementById("cnfrmPassword").value;

                if (prvPass == "") {
                    document.getElementById("errorHead").innerHTML = "Password Reset Error";
                    document.getElementById("errorMsg").innerHTML = "Please enter your old password !";
                    $('#errorModal').modal('show');
                    document.getElementById("prvPassword").focus();
                    document.getElementById("prvPassword").style.borderColor = "red";
                    document.getElementById("errorPrvPassword").innerHTML = "Enter old password";
                    document.getElementById("errorPrvPassword").style.color = "red";
                    return false;
                }
                else if (prvPass != "" && newPass == "") {
                    if (prvPass.length < 8) {
                        document.getElementById("errorHead").innerHTML = "Password Reset Error";
                        document.getElementById("errorMsg").innerHTML = "Your current password is wrong & enter new password !";
                        $('#errorModal').modal('show');
                        document.getElementById("prvPassword").style.borderColor = "red";
                        document.getElementById("errorPrvPassword").innerHTML = "Re-enter current password";
                    } else {
                        document.getElementById("errorHead").innerHTML = "Password Reset Error";
                        document.getElementById("errorMsg").innerHTML = "Please enter new password !";
                        $('#errorModal').modal('show');
                        document.getElementById("prvPassword").style.borderColor = "green";
                        document.getElementById("errorPrvPassword").innerHTML = "";
                    }

                    document.getElementById("newPassword").focus();
                    document.getElementById("newPassword").style.borderColor = "red";
                    document.getElementById("cnfrmPassword").focus();
                    document.getElementById("cnfrmPassword").style.borderColor = "red";
                    document.getElementById("errorNewPassword").innerHTML = "Enter new password"
                    document.getElementById("errorNewPassword").style.color = "red";
                    document.getElementById("errorCnfrmPassword").innerHTML = "Re-enter new password"
                    document.getElementById("errorCnfrmPassword").style.color = "red";
                    return false;
                }
                else if (newPass != "" && cnfrmPass == "") {
                    if (prvPass.length < 8) {
                        document.getElementById("errorHead").innerHTML = "Password Reset Error";
                        document.getElementById("errorMsg").innerHTML = "Your current password is wrong & confirm new password !";
                        $('#errorModal').modal('show');
                        document.getElementById("prvPassword").style.borderColor = "red";
                        document.getElementById("errorPrvPassword").innerHTML = "Re-enter current password";
                    } else {
                        document.getElementById("errorHead").innerHTML = "Password Reset Error";
                        document.getElementById("errorMsg").innerHTML = "Please confirm your new password !";
                        $('#errorModal').modal('show');
                        document.getElementById("prvPassword").style.borderColor = "green";
                        document.getElementById("errorPrvPassword").innerHTML = "";
                    }

                    document.getElementById("cnfrmPassword").focus();
                    document.getElementById("cnfrmPassword").style.borderColor = "red";
                    document.getElementById("errorCnfrmPassword").innerHTML = "Re-enter new password"
                    document.getElementById("errorCnfrmPassword").style.color = "red";
                    return false;
                }
                else if (newPass != cnfrmPass) {
                    if (prvPass.length < 8) {
                        document.getElementById("errorHead").innerHTML = "Password Reset Error";
                        document.getElementById("errorMsg").innerHTML = "Your new password & confrim password don't match & your old password is wrong !";
                        $('#errorModal').modal('show');
                        document.getElementById("prvPassword").style.borderColor = "red";
                        document.getElementById("errorPrvPassword").innerHTML = "Re-enter current password";
                    } else {
                        document.getElementById("errorHead").innerHTML = "Password Reset Error";
                        document.getElementById("errorMsg").innerHTML = "Your new password & confirm password don't match !";
                        $('#errorModal').modal('show');
                        document.getElementById("prvPassword").style.borderColor = "green";
                        document.getElementById("errorPrvPassword").innerHTML = "";
                    }

                    document.getElementById("newPassword").value = "";
                    document.getElementById("cnfrmPassword").value = "";
                    document.getElementById("newPassword").focus();
                    document.getElementById("newPassword").style.borderColor = "red";
                    document.getElementById("errorCnfrmPassword").innerHTML = ""
                    document.getElementById("cnfrmPassword").focus();
                    document.getElementById("cnfrmPassword").style.borderColor = "red";
                    document.getElementById("errorNewPassword").innerHTML = ""
                    return false;
                }
                else {
                    if (newPass.length < 8) {
                        document.getElementById("errorHead").innerHTML = "Password Reset Error";
                        document.getElementById("errorMsg").innerHTML = "Your new password must contain 8 characters at least !";
                        $('#errorModal').modal('show');
                        document.getElementById("newPassword").style.borderColor = "red";
                        document.getElementById("errorNewPassword").innerHTML = "Password must be minimum 8 characters";
                        document.getElementById("cnfrmPassword").style.borderColor = "red";
                        document.getElementById("errorCnfrmPassword").innerHTML = "Password must be minimum 8 characters";
                        return false;
                    } else if (prvPass.length < 8) {
                        document.getElementById("errorHead").innerHTML = "Password Reset Error";
                        document.getElementById("errorMsg").innerHTML = "Your old password is wrong !";
                        $('#errorModal').modal('show');
                        document.getElementById("prvPassword").style.borderColor = "red";
                        document.getElementById("errorPrvPassword").innerHTML = "Re-enter current password";
                        return false;
                    }
                    document.getElementById("prvPassword").style.borderColor = "green";
                    document.getElementById("errorPrvPassword").innerHTML = "";
                    document.getElementById("newPassword").style.borderColor = "green";
                    document.getElementById("errorNewPassword").innerHTML = "";
                    document.getElementById("cnfrmPassword").style.borderColor = "green";
                    document.getElementById("errorCnfrmPassword").innerHTML = "";
                    return true;
                }
            }

            //method to validate mobile number
            function validateMobileNumber(text) {
                var pattern = /^([+0-9]{1,3})?([0-9]{10,11})$/i;
                if ((pattern.test(text)) == false || text.length < 10) {
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

            //method to validate email
            function validateEmail(text) {
                var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                if ((pattern.test(text)) == false) {
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

            //method to validate nic
            function validateNicNumber(text) {
                var pattern = /^[0-9]{9}(V|v){1}/;
                if ((pattern.test(text)) == false || text.length < 10) {
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

        </script>

        <!--scripts-->
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
