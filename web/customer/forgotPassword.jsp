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
    
    <body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
        <%@include file="header.jsp" %>

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
                        <form method="POST" action="" accept-charset="UTF-8" onsubmit="return(userNameValidation())" novalidate>
                            
                            <!-- Form group to input username-->
                            <div class="row">
                                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
                                    <label for="username" class="col-lg-4 col-md-4 col-sm-4 col-xs-4"> Username </label>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <input type="text" placeholder="Username" id="username" name="username"/>
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

        <script type="text/javascript">
            /*validate username*/
            function userNameValidation(){
                
                var username = document.getElementById("username").value;
                if (username == "" || username == null) {
                    document.getElementById("username").style.borderColor = "red";
                    return false;
                }
                else{
                    return true;
                }
            }
            
            /*redirect to index page when click cancel button*/
            function resetBtn(){
                window.location.pathname = "MartRunner/customer/index.jsp";
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
