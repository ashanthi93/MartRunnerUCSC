<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title> Home | MartRunner </title>

        <!-- Bootstrap css -->
        <link type="text/css" href="static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font-awesome css -->
        <link href="static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom css -->
        <link type="text/css" href="static/css/mainSliderStyles.css" rel="stylesheet">
        <link type="text/css" href="static/css/headerStyles.css" rel="stylesheet">
        <link type="text/css" href="static/css/footerStyles.css" rel="stylesheet">

    </head>

    <body id="home">

        <%
            //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-cache");

            //Directs caches not to store the page under any circumstance
            response.setHeader("Cache-Control", "no-store");

            //Causes the proxy cache to see the page as "stale"
            response.setDateHeader("Expires", 0);

            //HTTP 1.0 backward compatibility
            response.setHeader("Pragma", "no-cache");

            String username = (String) session.getAttribute("User");

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

        <header id="header">    
            <nav class="navbar navbar-inverse" role="navigation">

                <!-- Start of navbar-header -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#martrunner-navbar-collapse">
                        <span class="sr-only"> Toggle Naviagtion </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                        <span class="icon-bar"> </span>
                    </button>

                    <a class="navbar-brand" href="index.jsp"> MartRunner <small> Good Market Event Assist System </small> </a>
                </div> 
                <!-- end of navbar-header -->

                <!-- start of navbar-collapse -->
                <div class="collapse navbar-collapse" id="martrunner-navbar-collapse">

                    <!-- start of navbar-nav list-->
                    <ul class="nav navbar-nav navbar-right">

                        <!-- index nav -->
                        <li> <a href="index.jsp"> Home </a> </li>

                        <!-- customer nav -->
                        <li> <a href="customer/about.jsp"> About </a> </li>

                        <!-- standards nav -->
                        <li class="dropdown"> 
                            <a href="customer/standards.jsp" class="dropdown-toggle disabled" data-toggle="dropdown"> Standards <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="customer/organicStandards.jsp"> Organic Products </a> </li>
                                <li> <a href="customer/farmStandards.jsp"> Animal Based Farm Products </a> </li>
                                <li> <a href="customer/foodStandards.jsp"> Prepared Foods </a> </li>
                                <li> <a href="customer/bodyStandards.jsp"> Natural Body & Home </a> </li>
                                <li> <a href="customer/artStandards.jsp"> Art & Handicrafts  </a> </li>
                                <li> <a href="customer/pkgStandards.jsp"> Packaging  </a> </li>
                                <li> <a href="customer/otherStandards.jsp"> Other Standards </a> </li>
                            </ul>
                        </li>

                        <!-- vendors nav -->
                        <li class="dropdown"> 
                            <a class="dropdown-toggle disabled" data-toggle="dropdown"> Vendors <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="customer/vendor_organic.jsp"> Organic Products </a> </li>
                                <li> <a href="customer/vendor_animal.jsp"> Animal Based Farm Products </a> </li>
                                <li> <a href="customer/vendor_prepared.jsp"> Prepared Foods </a> </li>
                                <li> <a href="customer/vendor_natural.jsp"> Natural Body & Home </a> </li>
                                <li> <a href="customer/vendor_art.jsp"> Art & Handicrafts  </a> </li>
                                <li> <a href="customer/vendor_travel.jsp"> Travel  </a> </li>
                                <li> <a href="customer/vendor_service.jsp"> Service Providers  </a> </li>
                            </ul>
                        </li>

                        <!-- visit nav -->
                        <li class="dropdown"> 
                            <a class="dropdown-toggle disabled" data-toggle="dropdown" data-target="#"> Visit <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="customer/visitThursday.jsp"> Thursday Good Market </a> </li>
                                <li> <a href="customer/visitSaturday.jsp"> Saturday Good Market </a> </li>
                                <li> <a href="customer/visitShop.jsp"> Good Market Shop </a> </li>
                            </ul>
                        </li>

                        <!-- apply nav -->
                        <li> <a href="customer/apply.jsp"> Apply </a> </li>

                        <!-- contact us nav -->
                        <li> <a href="customer/contactUs.jsp"> Contact Us </a> </li>

                        <!-- sign in nav -->
                        <%
                            //show if there is no user logged in
                            if (username == null) {
                        %>

                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> Sign In <b class="caret"> </b> </a>
                            <div class="dropdown-menu dropdown-menu-right" style="padding: 15px; padding-bottom: 5px;">
                                <form method="POST" action="${pageContext.request.contextPath}/login" accept-charset="UTF-8" onsubmit="return(loginValidation())" novalidate>
                                    <input style="margin-bottom: 15px; color: #000;" type="text" placeholder="Username" id="username" name="username" maxlength="6">
                                    <input style="margin-bottom: 15px; color: #000;" type="password" placeholder="Password" id="password" name="password" min="8">
                                    <input class="btn btn-default" type="submit" id="sign-in" value="Sign In">
                                    <button type="reset" class="btn btn-link" onclick="return(resetBtn())"> Forgot your password? </button>
                                </form>
                            </div>
                        </li>

                        <% } %>

                    </ul> 
                    <!-- end of navbar-nav list-->

                </div> 
                <!-- end of navbar-collapse -->
            </nav> 
            <!-- end of navbar -->
        </header>

        <!-- start of sub header -->
        <%
            //show sub header if a user logged in
            if (!(username == null)) {
                int prv = (Integer) session.getAttribute("privilage");
        %>

        <div class="container col-lg-12 col-md-12 col-sm-12 col-xs-12" id="subHeader">

            <!-- add dashboard icon according to user privilage -->
            <div class="col-lg-1 col-md-1 col-lg-sm-1 col-xs-1">
                <% if (prv == 1) {%>
                <a href="admin/adminHomePage.jsp"> <button type="button" class="btn-default fa fa-tachometer" style="border-style: hidden; font-size:35px; color: #009900;"> </button> </a>
                <% } else if (prv == 2) {%>
                <a href="vendor/vendorHomePage.jsp"> <button type="button" class="btn-default fa fa-tachometer" style="border-style: hidden; font-size:35px; color: #009900;"> </button> </a>
                <% }%>
            </div>

            <!-- logout icon with welcome message -->
            <div class="col-lg-11 col-md-11 col-sm-11 hidden-xs">
                <form action="${pageContext.request.contextPath}/logout" method="POST">
                    <div class="form-group" style="float: right;">
                        <label> Welcome <%=username%>, Love to see you back. </label>
                        &nbsp; &nbsp; &nbsp;
                        <input type="submit" value="Logout" class="btn-default" style="border-style: hidden;"/>
                        &nbsp;
                    </div>
                </form>
            </div>           
                        
                        <div class="col-xs-11 hidden-lg hidden-md hidden-sm">
                <form action="${pageContext.request.contextPath}/logout" method="POST">
                    <div class="form-group" style="float: right;">
                        <label> Welcome <%=username%>. </label>
                        &nbsp;
                        <input type="submit" value="Logout" class="btn-default" style="border-style: hidden;"/>
                        &nbsp;
                    </div>
                </form>
            </div>

        </div>   

        <br/><br/>    

        <%
            }
        %>
        <!-- end of sub header -->

        <!-- start of image slider -->
        <section id="mainImageSlider" class="no-margin">
            <div id="homeSlider" class="carousel slide">

                <!-- Carousel Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#homeSlider" data-slide-to="0" class="active"> </li>
                    <li data-target="#homeSlider" data-slide-to="1"> </li>
                    <li data-target="#homeSlider" data-slide-to="2"> </li>
                    <li data-target="#homeSlider" data-slide-to="3"> </li>
                    <li data-target="#homeSlider" data-slide-to="4"> </li>
                    <li data-target="#homeSlider" data-slide-to="5"> </li>
                    <li data-target="#homeSlider" data-slide-to="6"> </li>
                </ol>
                <!-- End of Carousel Indicators -->

                <!-- Carousel Inner -->
                <div class="carousel-inner">
                    <div class="item active" style="background-image:url(static/images/back4.png); width:1400px; height:555px;">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="main-text"> Welcome To Good Market</h1>
                                        <h2 class="sub-text"> Good Market is "Good for Planet, Good for Country & Good for You"</h2>
                                        <button type="button" class="btn btn-info"> <a href="customer/about.jsp"> Find More </a> </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item" style="background-image:url(static/images/organicFood.jpg); width:1400px; height:555px;">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="main-text"> Varieties of Organic Products</h1>
                                        <h2 class="sub-text"> Fresh Vegetables, Fruits & ..... </h2>
                                        <button type="button" class="btn btn-info"> <a href="customer/vendor_organic.jsp"> Find More </a> </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item" style="background-image:url(static/images/backPrepared_Food.jpg); width:1400px; height:555px;">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="main-text"> Varieties of Prepared Foods </h1>
                                        <h2 class="sub-text"> Traditional Foods, Western Foods, Fresh Juices, Achcharu & ..... </h2>
                                        <button type="button" class="btn btn-info"> <a href="customer/vendor_prepared.jsp"> Find More </a> </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item" style="background-image:url(static/images/backAnimal_Farm%203.jpg); width:1400px; height:555px;">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="main-text"> Varieties of Animal Based Farm Products </h1>
                                        <h2 class="sub-text"> Yogurt, Curd, Cheese & .... </h2>
                                        <button type="button" class="btn btn-info"> <a href="customer/vendor_animal.jsp"> Find More </a> </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item" style="background-image:url(static/images/backBody_Home.jpg); width:1400px; height:555px;">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="main-text"> Varieties of Personal Care & Household Products </h1>
                                        <h2 class="sub-text"> Bath & Body, Health care , Household & .... </h2>
                                        <button type="button" class="btn btn-info"> <a href="customer/vendor_natural.jsp"> Find More </a> </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item" style="background-image:url(static/images/backArt_Handi.jpg); width:1400px; height:555px; background-repeat:no-repeat">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="main-text"> Varieties of Art & Handicrafts </h1>
                                        <h2 class="sub-text"> Mehendi designs, Arts & .... </h2>
                                        <button type="button" class="btn btn-info"> <a href="customer/vendor_art.jsp"> Find More </a> </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="item" style="background-image:url(static/images/backZumba.jpg); width:1400px; height:555px;">
                        <div class="container">
                            <div class="row slide-margin">
                                <div class="col-sm-6">
                                    <div class="carousel-content">
                                        <h1 class="main-text"> Spend Leisure time & join special events each week</h1>
                                        <h2 class="sub-text"> Have Fun, Happy & Good for You  </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Carousel Inner -->

                <!-- Carousel Nav -->
                <a class="carousel-control left" href="#homeSlider" data-slide="prev"> 
                    <i class="glyphicon glyphicon-chevron-left"> </i>
                </a>
                <a class="carousel-control right" href="#homeSlider" data-slide="next"> 
                    <i class="glyphicon glyphicon-chevron-right"> </i> 
                </a>
                <!-- End of Carousel Nav -->
            </div>
        </section>
        <!-- end of image slider -->

        <!-- Modal Error -->
        <div class="modal" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header" style="color: red;">                        
                        <h3 class="modal-title" id="myModalLabel"> <% out.println(errorHead);%> </h3>
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
                        <h4 class="modal-title" id="myModalLabel"> <% out.println(successHead);%> </h4>
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

        <!-- start of footer -->
        <footer id="footer">
            <div class="container" id="footer-bottom">
                <div class="row">
                    <div class="col-sm-6">
                        All Copyrights Reserved by The Good Market Ltd - &copy; 2015
                    </div>
                    <div class="col-sm-6" style="text-align:right;">
                        Website Designed & Developed by UCSC
                    </div>
                </div>
            </div>
        </footer>
        <!-- end of footer -->

        <!-- Data validation -->
        <script type="text/javascript">

            //method to validate login
            function loginValidation() {
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
                } else if (password.length < 8) {
                    document.getElementById("password").style.borderColor = "red";
                    document.getElementById("errorHead").innerHTML = "Invalid Password";
                    document.getElementById("errorMsg").innerHTML = "Password can not be less than 8 characters";
                    $('#errorModal').modal('show');
                    errors.push("error");
                }

                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }
            }

            function resetBtn() {
                window.location.pathname = "MartRunner/login/forgotPassword.jsp";
            }
        </script>

        <!-- jquery js -->
        <script src="static/js/jquery.js"></script>

        <!-- bootstrap js -->
        <script src="static/js/bootstrap.min.js"></script>

        <!-- custom js -->
        <script src="static/js/main.js"></script>

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
