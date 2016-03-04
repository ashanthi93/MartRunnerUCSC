<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> View Payment | Vendor | MartRunner</title>
        
        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        
        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
         <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>        
        <!-- bootstrap js -->
        <script src="../static/js/bootstrap.min.js"></script>
        
        <style>
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
            <div class="container" >
                <div class="row col-xs-12 col-sm-12 col-sm-12 col-lg-12 ">
                    <!--Start of Side Bar-->
                    <div class=" col-sm-3 col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 
                                        <!--Side Bar Topic-->
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> Payment Handling </label>  
                                        <br/><br/> 
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="vendorHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> 

                                        <!--View Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#8B1C62; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-eye-open" style="font-size:20px; color:#8B1C62; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default active" style="width:auto" href="viewPayment_Vendor.jsp"> <strong> View Payment</strong></a>

                                        <br><br>  
                                        
                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>
                    <!--End of Side Bar-->

                    <!--View Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> View Payment </p>
                                </div>


                                <div class="panel-body">
                                    <form action="${pageContext.request.contextPath}/viewPayment_Vendor" class="form-horizontal" id="viewPayment" method="post"  role="form" onsubmit="return(validateForm())" novalidate>

                                        <!-- Market Type-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Market Type-->
                                                <label for="marketType" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-4 required" style="display: inline-block; text-align: left;"> Select Market Day </label>
                                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="panel panel-default" id="errorMarketDay">
                                                        <div class="panel-body">
                                                            <span>
                                                                <label style="font-weight: normal;"> <input type="radio" name="marketDay" id="marketDay" value="Th"/>  Thursday</label> <br/>
                                                                <label style="font-weight: normal;"> <input type="radio" name="marketDay" id="marketDay" value="Sa"/>  Saturday</label> <br/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br> <br>
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

                            </div>

                            <!--End of View payment-->

                            


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
                    <%@include file="footer_sub.jsp" %>

                    <!-- script for data validation-->
                    <script type="text/javascript">
                        //function for validate form
                        function validateForm() {
                            var errors = [];
                            
                            var group = document.getElementsByName("marketDay");
                            if (!(validateRadio(group, "errorMarketDay"))) {
                                errors.push("errorMarketDay");
                            }


                            if (errors.length > 0) {
                                return false;
                            }
                            else {
                                return true;
                            }

                        }
                        //validate Radio Buttons
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
                    
                     <!--script for prompt error messages-->
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
            </script>
    
    </body>
</html>
