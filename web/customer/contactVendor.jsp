<%@page import="classes.User"%>
<%@page import="classes.Vendor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Contact Vendor | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <!--travel page CSS-->
        <link href="../static/css/vendor_travel.css" rel="stylesheet">
        
         <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>        
        <!-- bootstrap js -->
        <script src="../static/js/bootstrap.min.js"></script>
      

        <style type="text/css">
            #subHeader{
                background-color: #000;
                color: #fff;
                font-style: italic;
                padding-bottom: -10px;
                padding-top: -10px;
            }
        </style>

    </head>

    <body id="vendors">
        <!-- Including Header Page-->
        <%
            //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-cache");

            //Directs caches not to store the page under any circumstance
            response.setHeader("Cache-Control", "no-store");

            //Causes the proxy cache to see the page as "stale"
            response.setDateHeader("Expires", 0);

            //HTTP 1.0 backward compatibility
            response.setHeader("Pragma", "no-cache");
        %>
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

        <jsp:include page="header.jsp" />

        <%
            String vendorID = request.getParameter("selectedVendorId");
            HttpSession session1 = request.getSession();
            session1.setAttribute("selectedVendorId", vendorID);

        %>
        <!-- Start of  Content-->
        <section>
            <div class="row" >
                <div class="col-sm-12  col-lg-12">
                    <div class="panel panel-default" style="margin-top: 10px; margin-left: 15px;margin-right: 15px;">
                        <div class="panel-body">
                            <!--content-->
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >

                                <div class="container" >
                                    <div class="col-xs-10 col-xs-offset-2 col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-3  col-lg-5 col-lg-offset-3" >
                                        <div class="panel panel-default" style="margin-top: 10px;">
                                            <!--panel Topic-->
                                            <div class="panel-heading" style="background-color: #71C671;">
                                                <div class="row">
                                                    <p class="panel-title col-xs-8" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> Contact Vendor </p>
                                                    <a href="vendorProfile.jsp"> <button type="submit" class="btn btn-default" style="background-color: #C1FFC1;">Back</button></a>
                                                </div>
                                            </div>
                                            <!--panel Body-->


                                            <div class="panel-body">  
                                                <form class="form-horizontal" id="contactAdmin" action="${pageContext.request.contextPath}/ContactVendor" method="POST" role="form" onsubmit="return(validateForm())" novalidate>
                                                    <!--Message-->
                                                    <!--<label for="message"  style="display: inline-block; text-align: left">Enter your message &nbsp;</label>-->
                                                    <div >
                                                        <table style="width:400px;">
                                                            <tr >

                                                                <td><label class="control-label required" for="customerName"  style="display: inline-block; text-align: left">Name &nbsp;</label></td>
                                                                <td style="width: 200px;"><input class="form-control" type="text" name="customerName" id="customerName" placeholder="Enter Your Name"/> 
                                                                <td style="padding-left: 5px;"> <label id="errorCustomerName" style="font-size:10px"> </label></td>


                                                            </tr>
                                                            <tr>
                                                                <td><div style="height: 10px;"></div></td>
                                                                <td style="width: 200px;"><div style="height: 10px;"></div></td>
                                                                <td style="padding-left: 5px;"><div style="height: 10px;"></div></td>
                                                            </tr>
                                                            <tr>
                                                                <td><label for="contact"  style="display: inline-block; text-align: left">Contact Number &nbsp;</label></td>
                                                                <td style="width: 200px;"><input class="form-control" type="text" name="contact" id="contact" placeholder="Enter Your Contact Number" maxlength="10"/> 
                                                                <td style="padding-left: 5px;"><label id="errorContact" style="font-size:10px"> </label></td>

                                                            </tr>

                                                            <tr>
                                                                <td><div style="height: 10px;"></div></td>
                                                                <td style="width: 200px;"><div style="height: 10px;"></div></td>
                                                                <td style="padding-left: 5px;"><div style="height: 10px;"></div></td>
                                                            </tr>

                                                            <tr>
                                                                <td><label for="email"  style="display: inline-block; text-align: left">Email Address &nbsp;</label></td>
                                                                <td style="width: 200px;"><input class="form-control" type="text" name="email" id="email" placeholder="Enter Your Email Address"/> 
                                                                <td style="padding-left: 5px;"> <label id="errorEmail" style="font-size:10px"> </label></td>


                                                            </tr>
                                                            <tr>
                                                                <td><div style="height: 10px;"></div></td>
                                                                <td style="width: 200px;"><div style="height: 10px;"></div></td>
                                                                <td style="padding-left: 5px;"><div style="height: 10px;"></div></td>
                                                            </tr>

                                                            <tr>
                                                                <td><label for="message"  style="display: inline-block; text-align: left">Message &nbsp;</label></td>
                                                                <td style="width: 200px;"><textarea class="form-control" id="message" name="message" placeholder="Enter Your message"></textarea>
                                                                <td style="padding-left: 5px;"><label id="errorMessage" style="font-size:10px"> </label></td>

                                                            </tr>
                                                            <tr>
                                                                <td><div style="height: 10px;"></div></td>
                                                                <td style="width: 200px;"><div style="height: 10px;"></div></td>
                                                                <td style="padding-left: 5px;"><div style="height: 10px;"></div></td>

                                                            </tr>
                                                            <tr>
                                                                <td></td>
                                                                <td style="width: 200px;"><button type="submit" class="btn btn-default col-md-offset-5 " > <strong> Send </strong> </button></td>
                                                                <td style="padding-left: 5px;"></td>
                                                            </tr>

                                                        </table>
                                                    </div> 
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


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

        <%@include file="footer.jsp" %>

        <script type="text/javascript">

            function validateForm() {
                var errors = [];

                var name = document.getElementById("customerName").value;
                var contactNumber = document.getElementById("contact").value;
                var meaasge = document.getElementById("message").value;
                var email = document.getElementById("email").value;

                
                    //name validation

                    if (!validateName()) {
                        errors.push("errorCustomerName");
                    }

                    //contact validation

                    if (!validateMobileNumber(contactNumber)) {
                        errors.push("errorContact");
                    }

                    //email validation
                    if (!validateEmail(email)) {
                        errors.push("errorEmail");
                    }


                    //message validation
                    if (!validateMessage()) {
                        errors.push("errorMessage");
                    }


                    if (errors.length > 0) {
                        return false;
                    }
                    else {
                        return true;
                    }
                }
            

            function validateName() {
                var messageText = document.getElementById("customerName").value;
                if ((messageText == "" || messageText == null)) {
                    document.getElementById("customerName").focus();
                    document.getElementById("customerName").style.borderColor = "red";
                    document.getElementById("errorCustomerName").innerHTML = "required";
                    document.getElementById("errorCustomerName").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("customerName").style.borderColor = "green";
                    document.getElementById("errorCustomerName").innerHTML = "";
                    return true;
                }
            }

            function validateMessage() {
                var messageText = document.getElementById("message").value.trim();
                if ((messageText == "" || messageText == null)) {
                    document.getElementById("message").focus();
                    document.getElementById("message").style.borderColor = "red";
                    document.getElementById("errorMessage").innerHTML = "required";
                    document.getElementById("errorMessage").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("message").style.borderColor = "green";
                    document.getElementById("errorMessage").innerHTML = "";
                    return true;
                }
            }
            //validate email
            function validateEmail(text) {
                var pattern = /^[a-z0-9._-]+@[a-z]+.[a-z.]{2,5}$/i;
                if (text == "" || text == null) {
                    document.getElementById("email").focus();
                    document.getElementById("email").style.borderColor = "red";
                    document.getElementById("errorEmail").innerHTML = "required";
                    document.getElementById("errorEmail").style.color = "red"
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
            
            //validate mobile number
            function validateMobileNumber(text) {
                var pattern = /^([+0-9]{1,3})?([0-9]{10,11})$/i;
                if (text == null || text == "") {
                    document.getElementById("contact").focus();
                    document.getElementById("contact").style.borderColor = "red";
                    document.getElementById("errorContact").innerHTML = "required";
                    document.getElementById("errorContact").style.color = "red";
                    return false;
                }
                else if ((pattern.test(text)) == false || text.length < 10) {
                    document.getElementById("contact").focus();
                    document.getElementById("contact").style.borderColor = "red";
                    document.getElementById("errorContact").innerHTML = "invalid type";
                    document.getElementById("errorContact").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("contact").style.borderColor = "green";
                    document.getElementById("errorContact").innerHTML = "";
                    return true;
                }
            }

        </script>


        
        <script src="../static/js/bootstrap-submenu.min.js"></script>

        <script>
            $('.dropdown-submenu > a').submenupicker();
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
    </body>
</html>