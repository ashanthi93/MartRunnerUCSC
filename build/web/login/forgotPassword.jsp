<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title> Login | MartRunner </title>

        <!-- Bootstrap CSS -->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS-->
        <style type="text/css">
            .panel-primary{
                border-color: #090;
            }
            .panel-primary  > .panel-heading{
                background-color: #090;
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

                    <!-- Start of Panel heading -->
                    <div class="panel-heading"> 
                        <div class="panel-title"> <h4> MartRunner Login </h4> </div> 
                    </div>
                    <!-- End of Panel heading -->

                    <!-- Start of Panel body -->
                    <div class="panel-body">

                        <!-- How to proceed message-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                Enter your valid username and click on search. An email will be sent to your mail to reset your password.
                            </div>
                        </div>

                        <!-- Start of forgot password form-->
                        <form method="POST" action="${pageContext.request.contextPath}/ForgotPassword" accept-charset="UTF-8" onsubmit="return(userNameValidation())" novalidate>

                            <!-- Form group to input username-->
                            <div class="row">
                                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <label for="username" class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> Username </label>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <input type="text" placeholder="Username" id="username" name="username" maxlength="6"/>
                                    </div>
                                </div>
                            </div>

                            <!-- Search or Cancel button-->
                            <div class="row">
                                <div class="form-group">
                                    <div class="col-xs-offset-4 col-xs-8">
                                        <button type="submit" class="btn btn-default"> Search </button>
                                        <button type="reset" class="btn btn-default" onclick="return(resetBtn())"> Cancel </button>
                                    </div> 
                                </div>
                            </div>

                        </form>
                        <!-- End of forgot password form -->

                    </div>
                    <!-- End of Panel body -->

                </div>
                <!-- End of Panel -->
            </div>
        </div>

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
                        <h4 class="modal-title" id="successMsg"> <% out.println(successHead);%> </h4>
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

        <script type="text/javascript">
            /*validate username*/
            function userNameValidation() {

                var username = document.getElementById("username").value;
                var pattern = /^(u){1}[0-9]{5}/;
                if (username == "" || username == null) {
                    document.getElementById("username").style.borderColor = "red";
                    return false;
                } else if (pattern.test(username) == false) {
                    document.getElementById("errorHead").innerHTML = "Invalid User";
                    document.getElementById("errorMsg").innerHTML = "Your username is incorrect";
                    $('#errorModal').modal('show');
                    return false;
                } else {
                    document.getElementById("username").style.borderColor = "green";
                    return true;
                }
            }

            /*redirect to index page when click cancel button*/
            function resetBtn() {
                window.location.pathname = "MartRunner/index.jsp";
            }
        </script>

        <!-- jquery -->
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
