<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> View Payment By Date | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="../static/css/datepicker.css">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <style>
            #h4{
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
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> View Payment Reports </label>  
                                        <br/><br/> 
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> <br/><br/>


                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>

                    <!--start of  Form-->
                    <div class="container">
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> View Paid vendors by Date </p>
                                </div>
                                <!--Form Body-->
                                <div class="panel-body">
                                    <form action="${pageContext.request.contextPath}/ReportViewPaymentByDate" class="form-horizontal" id="changevendorprofile" method="POST"  role="form" onsubmit="return(validateForm())" novalidate>



                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Market Type-->
                                                <label for="marketType" class="control-label col-xs-3 col-xs-offset-1  required" style="display: inline-block; text-align: left;"> Select Market Day </label>
                                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
                                                    <span>
                                                        <label style="font-weight: normal;"> <input type="radio" name="marketDay" id="marketDay" value="SA"/> Saturday Market</label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="marketDay" id="marketDaye" value="TH"/> Thursday Market</label> <br/>
                                                    </span>
                                                    <label id="errorMarketDay" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- add date-->
                                        <div class="row">
                                            <div class="form-group ">
                                                <label  class="control-label col-xs-3 col-xs-offset-1 required" style="display: inline-block; text-align: left;"> Select Start Day </label>
                                                <div class="hero-unit col-xs-4 ">
                                                    <input  type="text" class="form-control" placeholder="click to add a date"  name="date" id="date">
                                                </div>
                                                <label id="errorDate" style="font-size:10px"> </label>
                                            </div>
                                        </div>


                                        <br><br><br>
                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-5 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> Submit </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>
                                        <br>

                                    </form>
                                </div>

                            </div>
                            <!--End of Form-->
                            <br> 


                        </div>
                    </div>

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
                               
                    <br><br><br><br>
        <!-- footer of the page-->
        <%@include file="footer_sub.jsp" %>

        <!-- script foe data validation-->
        <script type="text/javascript">

            //function for validate form
            function validateForm() {
                var errors = [];


                var group = document.getElementsByName("marketDay");
                if (!(validateRadio(group, "errorMarketDay"))) {
                    errors.push("errorMarketDay");
                }


                if (!(validateDate("date", "errorDate"))) {
                    errors.push("errorDate");
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
                        document.getElementById("errorMarketDay").innerHTML = "";
                        document.getElementById("errorMarketDay").style.color = "green";
                        return true;
                    }
                }
                document.getElementById("errorMarketDay").innerHTML = "required";
                document.getElementById("errorMarketDay").style.color = "red";
                return false;
            }

            //validate dates
            function validateDate(text, errorLabel) {
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLabel).innerHTML = "required";
                    document.getElementById(errorLabel).style.color = "red";
                    return false;
                }
                else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLabel).innerHTML = "";
                    return true;
                }
            }



        </script>

        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>

        <!-- Load jQuery and bootstrap datepicker scripts -->
        <script src="../static/js/bootstrap-datepicker.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>
        
        <!-- script for datepicker-->
        <script type="text/javascript">
            $(document).ready(function () {

                $('#date').datepicker({
                    format: "yyyy-mm-dd"
                });

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
