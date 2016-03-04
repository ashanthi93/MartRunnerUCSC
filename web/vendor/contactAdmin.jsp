<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Contact Administrator | Mart Runner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/bootstrap-submenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

    </head>

    <body>
        <%@include file="header_sub.jsp" %>

        <%            /* To handle error messages or success messages */
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
        %>

        <br/>            

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
                                        <br>
                                        <label style="color: #000000; padding-top:35px; font-size:22px;"> Contact Administrator </label>  
                                        <br/><br/> <br>
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#EE2C2C; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width: auto;" href="vendorHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br><br> 



                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>
                    <div class="container" >
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <div class="row">
                                        <p class="panel-title col-xs-9" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> Contact Administrator </p>
                                        <a href="../../MartRunner/ViewMessageHistory"> <button type="submit" class="btn btn-default" style="background-color: #C1FFC1;">Message History</button></a>
                                    </div>
                                </div>
                                <!--Form Body-->
                                <div class="panel-body" style="height: 300px;">
                                    <form class="form-horizontal" id="contactAdmin" method="POST" action="${pageContext.request.contextPath}/ContactAdministrator" role="form" onsubmit="return(validateMessage())" novalidate>
                                        <div class="row">
                                            <!--Message-->
                                            <label for="message" class="col-xs-5  col-sm-offset-0 col-sm-3 col-md-3 col-lg-3 control-label" style="display: inline-block; text-align: left">Enter your message &nbsp;</label>
                                            <div class="col-xs-6 ">
                                                <textarea class="form-control" id="message" name="message" placeholder="Enter message" cols="30" rows="4">
                                                </textarea>
                                                <label id="errorMessage" style="font-size:10px"> </label>
                                            </div>
                                        </div>
                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-4 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> Ok </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </section>
        <%
            }
        %>                                                               
        <br><br><br><br>

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

        <script type="text/javascript">


            function validateMessage() {
                var messageText = document.getElementById("message").value.trim();
                if ((messageText == "" || messageText == null)) {
                    document.getElementById("message").focus();
                    document.getElementById("message").style.borderColor = "red";
                    document.getElementById("errorMessage").innerHTML = "Message cannot be empty";
                    document.getElementById("errorMessage").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("message").style.borderColor = "green";
                    document.getElementById("errorMessage").innerHTML = "";
                    return true;
                }
            }
        </script>


        <!-- jQuery -->
        <script src="../static/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-submenu.min.js"></script>

        <script>
            $('.dropdown-submenu > a').submenupicker();
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