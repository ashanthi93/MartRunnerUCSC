<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Products | Mart Runner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/bootstrap-submenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
       
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        
         <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>        
        <!-- bootstrap js -->
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>
        <script src="../static/js/bootstrap-datepicker.js"></script>
        <script src="../static/js/bootstrap-submenu.min.js"></script>


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


        <%            if (!(username == null)) {
        %>

        <br/>            

        <section>

            <div class="container" >
                <div class="row">

                    <!--Start of Side Bar-->
                    <div class=" col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            
                            <!--Start of panel body-->
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 
                                    <center> 
                                        <br>
                                        
                                        <!--Start of Side Bar Topic-->
                                        <label style="color: #000000; padding-top:35px; font-size:22px;"> Add Products </label>  
                                        <!--End of Side Bar Topic-->
                                        
                                        <br/><br/> <br>
                                        
                                        <!--Start of Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#EE2C2C; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width: auto;" href="vendorHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br><br> 
                                        <!--End of Dashboard Icon-->
                                    </center>

                                </div>
                            </div>
                            <!--End of panel body-->
                        </div> 
                    </div>
                     <!--End of Side Bar-->
                     
                     <!--Start of product content-->
                    <div class="container" >
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            
                            <!--Start of panel-->
                            <div class="panel panel-default" style="margin-top: 10px;">
                                
                                <!--Start of panel Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <div class="row">
                                        <p class="panel-title col-xs-9" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> Add Products </p>

                                    </div>
                                </div>
                                 <!--End of panel Topic-->
                                 
                                <!--Start of panel Body-->
                                <div class="panel-body" style="height: 300px;font-family: lucida bright; ">
                                    
                                    <!--Start of form-->
                                    <form class="form-horizontal" id="addProducts" method="POST" role="form" action="${pageContext.request.contextPath}/AddProducts" onsubmit="return(validateForm())" novalidate>
                                        
                                        <!--Start of Product name-->
                                        <div class="row">
                                            <label for="productName" class="col-xs-5  col-sm-offset-0 col-sm-3 col-md-3 col-lg-3 control-label" style="display: inline-block; text-align: left">Product Name &nbsp;</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control" id="productName" name="productName" placeholder="Product Name" />
                                                <label id="errorProductName" style="font-size:10px"> </label>
                                            </div>
                                        </div>
                                        <!--End of Product name-->

                                        <!--Start of product description-->
                                        <div class="row">
                                            <label for="description" class="col-xs-5  col-sm-offset-0 col-sm-3 col-md-3 col-lg-3 control-label" style="display: inline-block; text-align: left">Product Description &nbsp;</label>
                                            <div class="col-xs-6 ">
                                                <textarea class="form-control" id="description" name="description" placeholder="Product Description" cols="30" rows="4"></textarea>
                                                <label id="errorDescription" style="font-size:10px"> </label>
                                            </div>
                                        </div>
                                        <!--End of product description-->
                                        
                                        <!-- Start of request,cancel buttons-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-4 col-xs-9">
                                                    
                                                    <!-- Start of request button-->
                                                    <button type="submit" class="btn btn-default"> Request Approval </button>
                                                    <!-- End of request button-->
                                                    
                                                    <!-- Start of cancel button-->
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                    <!-- End of cancel button-->
                                                </div>
                                            </div>
                                        </div>
                                        <!-- End of request,cancel buttons-->
                                         
                                    </form>
                                    <!--End of form-->
                                        
                                </div>
                                <!--End of panel Body-->
                                
                            </div>
                            <!--End of panel-->
                            
                        </div>
                    </div>
                    <!--End of product content-->
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

        <%
            }
        %>                                                               
        <br><br><br><br>

        <%@include file="footer_sub.jsp" %>


        <script type="text/javascript">

            //function for validate form
            function validateForm() {
                var errors = [];
                
                //product name validation
                if (!validateProductName()) {
                    errors.push("errorProductName");
                }
                
                //product description validation
                if (!validateDescription()) {
                    errors.push("errorDescription");
                }

                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }

            }
            //Product description validation function
            function validateDescription() {
                var messageText = document.getElementById("description").value.trim();
                if ((messageText == "" || messageText == null)) {
                    document.getElementById("description").focus();
                    document.getElementById("description").style.borderColor = "red";
                    document.getElementById("errorDescription").innerHTML = "Description cannot be empty";
                    document.getElementById("errorDescription").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("description").style.borderColor = "green";
                    document.getElementById("errorDescription").innerHTML = "";
                    return true;
                }
            }


            //Product name validation function
            function validateProductName() {
                var option = document.getElementById("productName").value;
                if (option == "" || option == null) {
                    document.getElementById("productName").focus();
                    document.getElementById("productName").style.borderColor = "red";
                    document.getElementById("errorProductName").innerHTML = "required";
                    document.getElementById("errorProductName").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("productName").style.borderColor = "green";
                    document.getElementById("errorProductName").innerHTML = "";
                    return true;
                }
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

        <script>
            $('.dropdown-submenu > a').submenupicker();
        </script>
    </body>
</html>