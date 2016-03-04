<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/contact.css" rel="stylesheet">
        <link href="../static/css/martRunner.css" rel="stylesheet">

        <script
            src="http://maps.googleapis.com/maps/api/js">
        </script>

        <script>
            /* function toggleBounce() {
             marker.setAnimation(google.maps.Animation.BOUNCE);
             }*/
            function initialize() {
                var myLatLng = {lat: 6.906532, lng: 79.863419};

                var map = new google.maps.Map(document.getElementById('googleMap'), {
                    zoom: 18,
                    center: myLatLng
                });

                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                    animation: google.maps.Animation.DROP,
                    title: 'Saturday market @ Racecourse Ground!'
                });
                // marker.addListener('click', toggleBounce);
            }

            function initializer() {
                var myLatLng = {lat: 6.9044815, lng: 79.9098249};

                var map = new google.maps.Map(document.getElementById('googleMap1'), {
                    zoom: 18,
                    center: myLatLng
                });

                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                    title: 'Thursday market @ Diyatha Uyana!!',
                    animation: google.maps.Animation.DROP
                });
                //  marker.addListener('click', toggleBounce);
            }

            function initializer1() {
                var myLatLng = {lat: 6.9058213, lng: 79.8630867};

                var map = new google.maps.Map(document.getElementById('googleMap2'), {
                    zoom: 18,
                    center: myLatLng
                });

                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                    animation: google.maps.Animation.DROP,
                    title: 'Good Market Shop!'
                });
                // marker.addListener('click', toggleBounce);
            }

            google.maps.event.addDomListener(window, 'load', initialize);
            google.maps.event.addDomListener(window, 'load', initializer);
            google.maps.event.addDomListener(window, 'load', initializer1);
        </script>

        <style type="text/css">
            label.required:after {
                content: "*";
                color: red;
            }
        </style>

    </head>

    <body id="contact">

        <jsp:include page="header.jsp" />   

        <%
            //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-cache");

            //Directs caches not to store the page under any circumstance
            response.setHeader("Cache-Control", "no-store");

            //Causes the proxy cache to see the page as "stale"
            response.setDateHeader("Expires", 0);

            //HTTP 1.0 backward compatibility
            response.setHeader("Pragma", "no-cache");

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

        <div class="container">
            <h2 id="header1">Location</h2>
            <div>
                <div>
                    <div class="col-lg-4">
                        <p class="places">Saturday Good Market </p>
                        <div id="googleMap" style="width:325px;height:250px;"></div>
                    </div>
                    <div class="col-lg-4">
                        <p class="places">Thursday Good market</p>
                        <div id="googleMap1" style="width:325px;height:250px;"></div>
                    </div>

                    <div class="col-lg-4">
                        <p class="places">Good Market Shop</p>
                        <div id="googleMap2" style="width:350px;height:250px;"></div>
                    </div>
                </div>

                <div>
                    <div class="col-lg-3">
                        <h2 id="contactus">Contact Us</h2>
                        <address id="address">
                            <strong >Good market Shop,</strong><br>
                            Lakpahana Grounds,<br>
                            No-14 Read Avenue,<br>
                            Colombo-7<br>
                        </address>
                        <strong>Tel:-</strong> +94 915 560 001-5<br>
                        <strong> Fax:-</strong> +94 914 383 243 1<br>
                        <strong >E-mail:-</strong> web@goodmarket.lk
                    </div >
                    <div class="col-lg-1">
                        <a href="https://www.facebook.com/goodmarketlk?fref=ts"><img id="imagelogo" src="../static/images/fb.jpg"></a>
                        <a href="https://plus.google.com/u/0/102418816498481398190/about"> <img id="imagelogo2" src="../static/images/gPlus.png"></a>
                        <a href="https://twitter.com/GoodMarketSL"><img id="imagelogo3" src="../static/images/twter.png"></a>
                    </div>

                    <% if (session.getAttribute("User") == null) { %>

                    <div class="col-lg-3">
                        <img id="imagelogo4" src="../static/images/feed.jpg">
                        <div style="padding-left: 50px;">
                            <!-- Button trigger modal -->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                Send Feedback
                            </button>
                        </div>
                        <!-- pop up model -->
                        <div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog modal-md" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="myModalLabel"> Send Feedback </h4>
                                    </div>
                                    <br>
                                    <div class="model-body">
                                        <form action="${pageContext.request.contextPath}/feedbackCustomer" method="POST" role="form" name="feedback" onsubmit="return(validateForm())" novalidate>

                                            <!-- name-->
                                            <div class="row">
                                                <label for="Name" class="col-xs-3   control-label required" style="display: inline-block; text-align: left; margin-left: 8px;">Full name</label>
                                                <div class="col-xs-6 " style="padding-top: 5px;">
                                                    <input type="text" class="form-control" id="Name" name="Name"/>
                                                    <label id="errorName" style="font-size:10px"> </label>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <label for="email" class="col-xs-3   control-label required" style="display: inline-block; text-align: left;margin-left: 8px;">Customer email</label>
                                                <div class="col-xs-6 col-sm-6" style="padding-top: 5px;">
                                                    <input type="text" class="form-control" id="email" name="email"/>
                                                    <label id="errorEmail" style="font-size:10px"> </label>
                                                </div>
                                            </div>


                                            <div class="row">
                                                <label for="contact" class="col-xs-3   control-label required" style="display: inline-block; text-align: left; margin-left: 8px;">Contact No</label>
                                                <div class="col-xs-6 " style="padding-top: 5px;">
                                                    <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" maxlength="10"/>
                                                    <label id="errorMobileNumber" style="font-size:10px"> </label>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <label for="feedback" class="col-xs-3  control-label required" style="display: inline-block; text-align: left; margin-left: 8px;">Feedback</label>
                                                <div class="col-xs-6" style="padding-top: 5px;">
                                                    <textarea class="form-control" id="feedback" name="feedback"  rows="4" ></textarea>
                                                    <label id="errorFeedback" style="font-size:10px"> </label>
                                                </div>
                                            </div>

                                            <br>
                                            <div class="modal-footer">

                                                <button type="submit" class="btn btn-primary" >Send</button>
                                                <button type="reset" class="btn btn-primary" data-dismiss="modal">Close</button>
                                            </div>
                                        </form>        

                                    </div>


                                </div>


                            </div>

                        </div>

                    </div>

                    <% } %>

                    <div class="col-lg-5">
                        <img id="imageid" src="../static/images/good.jpg" />
                    </div>
                </div>
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


        <script type="text/javascript">
            $('#myModal').on('shown.bs.modal', function () {
                $('#myInput').focus()
            })
        </script>

        <script type="text/javascript">

            function validateForm() {
                var errors = [];

                //Start of personal detail validate
                if (!validateName("Name", "errorName")) {
                    errors.push("errorName");
                }
                var email = document.getElementById("email").value;
                if (!validateEmail(email)) {
                    errors.push("errorEmail");
                }
                var mobileNumber = document.getElementById("mobileNumber").value;
                if (!validateMobileNumber(mobileNumber)) {
                    errors.push("errorMobileNumber");
                }
                if (!validateName("feedback", "errorFeedback")) {
                    errors.push("errorName");
                }


                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }

            }
            //validate name
            function validateName(text, errorLbl) {
                var pattern = /^[a-zA-Z]+$/;
                var name = document.getElementById(text).value;
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    if (pattern.test(name) == false) {
                        document.getElementById(text).style.borderColor = "red";
                        document.getElementById(errorLbl).innerHTML = "Name can contain only alphabetic characters";
                        document.getElementById(errorLbl).style.color = "red";
                        return true;
                    } else {
                        document.getElementById(text).style.borderColor = "green";
                        document.getElementById(errorLbl).innerHTML = "";
                        return true;
                    }
                }
            }
            //validate email
            function validateEmail(text) {
                var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
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
                    document.getElementById("mobileNumber").focus();
                    document.getElementById("mobileNumber").style.borderColor = "red";
                    document.getElementById("errorMobileNumber").innerHTML = "required";
                    document.getElementById("errorMobileNumber").style.color = "red";
                    return false;
                }
                else if ((pattern.test(text)) == false || text.length < 10) {
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



        </script>

        <%@include file="footer_sub.jsp" %>

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
