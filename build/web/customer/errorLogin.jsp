<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title> Login | MartRunner </title>

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
        </style>
        
        <script type="text/javascript">
            window.history.forward();
            function noBack() {
                window.history.forward();
            }
        </script>
    </head>
    
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        
        <%@include file="header.jsp" %>

        <br/>

        <div class="container">
            <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-3">
                
                <!-- Start of panel-->
                <div class="panel panel-primary">
                    
                    <!-- Start of panel heading-->
                    <div class="panel-heading"> 
                        <div class="panel-title"> <h4> MartRunner Login </h4> </div> 
                    </div>
                    <!-- End of panel heading-->
                    
                    <!-- Start of panel body-->
                    <div class="panel-body">
                        
                        <!-- Error message-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">
                                The username or password you entered is incorrect. Please re-enter your username and password. (Make sure your Caps-Lock in off)
                            </div>
                        </div>
                        
                        <!-- Start of form to re attempt login-->
                        <form method="POST" action="${pageContext.request.contextPath}/login" accept-charset="UTF-8" onsubmit="return(loginValidation())" novalidate>
                            
                            <div class="row">
                                
                                <!-- Form group to input username-->
                                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <label for="username" class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> Username </label>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <input type="text" placeholder="Username" id="username" name="username" autocomplete="off"/>
                                    </div>
                                </div>
                                
                                <!-- Form group to input password-->
                                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <label for="password" class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> Password </label>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <input type="password" placeholder="Password" id="password" name="password" />
                                    </div>
                                </div>
                                
                            </div>
                            
                            <div class="row">
                                
                                <!-- Sign in or Forgot password button -->
                                <div class="form-group">
                                    <div class="col-xs-offset-4 col-xs-8">
                                        <button type="submit" class="btn btn-default"> Sign In </button>
                                        <button type="reset" class="btn btn-link" onclick="return(resetBtn())"> Forgot your password? </button>
                                    </div> 
                                </div>
                                
                            </div>
                            
                        </form>
                        <!-- End of form to re attempt login-->
                            
                    </div>
                    <!-- End of panel body-->
                    
                </div>
                <!-- End of panel-->
                
            </div>
        </div>

        <script type="text/javascript">
            /* validate login*/
            function loginValidation(){
                var errors = [];
                
                var username = document.getElementById("username").value;
                if (username == "" || username == null) {
                    document.getElementById("username").style.borderColor = "red";
                    errors.push("error");
                }

                var password = document.getElementById("password").value;
                if (password == "" || password == null) {
                    document.getElementById("password").style.borderColor = "red";
                    errors.push("error");
                }

                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }
            }
            /* redirect to forgot password page when click on forgot button*/
            function resetBtn(){
                window.location.pathname = "MartRunner/customer/forgotPassword.jsp";
            }
        </script>
        
        <!-- inlcude footer -->
        <%@include file="footer_sub.jsp" %>
        
        <!-- jquery -->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/main.js"></script>
    </body>
</html>
