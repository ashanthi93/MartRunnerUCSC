<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title> Reset Password | MartRunner </title>

        <!-- Bootstrap CSS -->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom CSS -->
        <style type="text/css">
            .panel-primary{
                border-color: #090;
            }
            .panel-primary  > .panel-heading{
                background-color: #090;
            }
            label.error{
                font-size: 10px;
                color: red;
            }
        </style>
        
        <script type="text/javascript">
            window.history.forward();
            function noBack() {
                window.history.forward();
            }
        </script>
    </head>
    
    <body>
        
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
        
        <%@include file="header_sub.jsp" %>

        <br/>

        <div class="container">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                
                <!-- Start of panel-->
                <div class="panel panel-primary">
                    
                    <!-- Start of panel heading-->
                    <div class="panel-heading"> 
                        <div class="panel-title"> <h4> MartRunner Reset Password </h4> </div> 
                    </div>
                    <!-- End of panel heading-->
                    
                    <!-- Start of panel body-->
                    <div class="panel-body">
                        
                        <!-- Proceed message -->
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                Please enter your username and new password to reset your password.
                            </div>
                        </div>
                        
                        <!-- Start of form to reset password -->
                        <form method="POST" action="${pageContext.request.contextPath}/ResetPassword" accept-charset="UTF-8" onsubmit="return(loginValidation())" novalidate>
                            
                            <div class="row">
                                
                                <!-- Form group to input username-->
                                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <label for="username" class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> Username </label>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <input type="text" placeholder="Username" id="username" name="username" autocomplete="off" maxlength="6"/>
                                        <label id="errorName" class="error"> </label>
                                    </div>
                                </div>
                                
                                <!-- Form group to input password-->
                                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <label for="password" class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> New Password </label>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <input type="password" placeholder="Password" id="password" name="password" />
                                        <label id="errorPassword" class="error"> Password must be more than 8 characters long </label>
                                    </div>
                                </div>
                                
                                <!-- Form group to confirm password-->
                                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <label for="cnfrmPassword" class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> Confirm Password </label>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <input type="password" placeholder="Confirm Password" id="cnfrmPassword" name="cnfrmPassword" />
                                        <label id="errorCnfrmPassword" class="error"> </label>
                                    </div>
                                </div>
                                
                            </div>
                            
                            <div class="row">
                                
                                <!-- Sign in or Cancel button -->
                                <div class="form-group">
                                    <div class="col-xs-offset-4 col-xs-8">
                                        <button type="submit" class="btn btn-default"> Sign In </button>
                                        <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                    </div> 
                                </div>
                                
                            </div>
                            
                        </form>
                        <!-- End of form to reset login-->
                            
                    </div>
                    <!-- End of panel body-->
                    
                </div>
                <!-- End of panel-->
                
            </div>
        </div>
                        
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

        <script type="text/javascript">
            /* validate login*/
            function loginValidation(){
                var errors = [];
                
                var username = document.getElementById("username").value;
                var pattern = /^(u){1}[0-9]{5}/;
                if (username == "" || username == null) {
                    document.getElementById("username").style.borderColor = "red";
                    document.getElementById("errorName").innerHTML = "Please enter your username";
                    errors.push("error");
                }else if(pattern.test(username)==false){
                    document.getElementById("errorHead").innerHTML = "Invalid User";
                    document.getElementById("errorMsg").innerHTML = "Your username is incorrect!";
                    $('#errorModal').modal('show');
                    document.getElementById("username").style.borderColor = "red";
                    errors.push("error");
                    return false;
                }else{
                    document.getElementById("username").style.borderColor = "green";
                    document.getElementById("errorName").innerHTML = "";
                }

                var password = document.getElementById("password").value;
                if (password == "" || password == null) {
                    document.getElementById("password").style.borderColor = "red";
                    document.getElementById("errorPassword").innerHTML = "Please enter your password";
                    errors.push("error");
                }else if(password.length < 8){
                    document.getElementById("password").style.borderColor = "red";
                    document.getElementById("errorHead").innerHTML = "Invalid Password";
                    document.getElementById("errorMsg").innerHTML = "Password can't be less than 8 characters.";
                    $('#errorModal').modal('show');
                    document.getElementById("errorPassword").innerHTML = "minimum length is 8 characters";
                    errors.push("error");
                }else{
                    document.getElementById("password").style.borderColor = "green";
                    document.getElementById("errorPassword").innerHTML = "";
                }
                
                var cnfrmPassword = document.getElementById("cnfrmPassword").value;
                if (cnfrmPassword == "" || cnfrmPassword == null){
                    document.getElementById("cnfrmPassword").style.borderColor = "red";
                    document.getElementById("errorCnfrmPassword").innerHTML = "Please re enter new password";
                    errors.push("error");
                }else if(password !== cnfrmPassword){
                    document.getElementById("cnfrmPassword").style.borderColor = "red";
                    document.getElementById("errorCnfrmPassword").innerHTML = "";
                    document.getElementById("password").style.borderColor = "red";
                    document.getElementById("errorPassword").innerHTML = "";
                    document.getElementById("errorHead").innerHTML = "Invalid Password";
                    document.getElementById("errorMsg").innerHTML = "New Password and Confirm password do not match.";
                    $('#errorModal').modal('show');
                    errors.push("error");
                }else{
                    document.getElementById("cnfrmPassword").style.borderColor = "green";
                    document.getElementById("errorCnfrmPassword").innerHTML = "";
                }

                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }
            }
            
        </script>
        
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
        
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
