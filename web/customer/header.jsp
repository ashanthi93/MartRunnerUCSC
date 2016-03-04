<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- custom css -->
        <link href="../static/css/headerStyles.css" rel="stylesheet">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

    </head>

    <body>

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
                        <li> <a href="../index.jsp"> Home </a> </li>

                        <!-- customer nav -->
                        <li> <a href="about.jsp"> About </a> </li>

                        <!-- standards nav -->
                        <li class="dropdown"> 
                            <a href="standards.jsp" class="dropdown-toggle disabled" data-toggle="dropdown"> Standards <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="organicStandards.jsp"> Organic Products </a> </li>
                                <li> <a href="farmStandards.jsp"> Animal Based Farm Products </a> </li>
                                <li> <a href="foodStandards.jsp"> Prepared Foods </a> </li>
                                <li> <a href="bodyStandards.jsp"> Natural Body & Home </a> </li>
                                <li> <a href="artStandards.jsp"> Art & Handicrafts  </a> </li>
                                <li> <a href="pkgStandards.jsp"> Packaging  </a> </li>
                                <li> <a href="otherStandards.jsp"> Other Standards </a> </li>
                            </ul>
                        </li>

                        <!-- vendors nav -->
                        <li class="dropdown"> 
                            <a class="dropdown-toggle disabled" data-toggle="dropdown"> Vendors <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="vendor_organic.jsp"> Organic Products </a> </li>
                                <li> <a href="vendor_animal.jsp"> Animal Based Farm Products </a> </li>
                                <li> <a href="vendor_prepared.jsp"> Prepared Foods </a> </li>
                                <li> <a href="vendor_natural.jsp"> Natural Body & Home </a> </li>
                                <li> <a href="vendor_art.jsp"> Art & Handicrafts  </a> </li>
                                <li> <a href="vendor_travel.jsp"> Travel  </a> </li>
                                <li> <a href="vendor_service.jsp"> Service Providers  </a> </li>
                            </ul>
                        </li>

                        <!-- visit nav -->
                        <li class="dropdown"> 
                            <a class="dropdown-toggle disabled" data-toggle="dropdown" data-target="#"> Visit <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="visitThursday.jsp"> Thursday Good Market </a> </li>
                                <li> <a href="visitSaturday.jsp"> Saturday Good Market </a> </li>
                                <li> <a href="visitShop.jsp"> Good Market Shop </a> </li>
                            </ul>
                        </li>

                        <!-- apply nav -->
                        <li> <a href="apply.jsp"> Apply </a> </li>

                        <!-- contact us nav -->
                        <li> <a href="contactUs.jsp"> Contact Us </a> </li>

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
                <a href="../admin/adminHomePage.jsp" data-toggle="tooltip" title="Dashboard"> <button type="button" class="btn-default fa fa-tachometer" style="border-style: hidden; font-size:45px; color: #009900; background-color: black;"> </button> </a>
            <% } else if (prv == 2) {%>
            <a href="../vendor/vendorHomePage.jsp" data-toggle="tooltip" title="Dashboard"> <button type="button" class="btn-default fa fa-tachometer" style="border-style: hidden; font-size:45px; color: #009900; background-color: black;"> </button> </a>
            <% }%>
            </div>

            <!-- logout icon with welcome message -->
            <div class="col-lg-11 col-md-11 col-sm-11 hidden-xs">
                <form action="${pageContext.request.contextPath}/logout" method="POST">
                    <div class="form-group" style="float: right;">
                        <label> Welcome <%=username%>, Love to see you back. </label>
                        &nbsp; &nbsp; &nbsp;
                        <input type="submit" class="btn" value="Logout"  style="border-style: hidden; color: black; font-style: normal; margin-top: 5px;"/>
                        &nbsp;
                    </div>
                </form>
            </div>

            <div class="col-xs-11 hidden-lg hidden-md hidden-sm">
                <form action="${pageContext.request.contextPath}/logout" method="POST">
                    <div class="form-group" style="float: right;">
                        <label> Welcome <%=username%>. </label>
                        &nbsp;
                        <input type="submit" class="btn" value="Logout"  style="border-style: hidden; color: black; font-style: normal; margin-top: 5px;"/>
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
                }

                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }
            }

            function resetBtn() {
                window.location.pathname = "MartRunner/customer/forgotPassword.jsp";
            }
        </script>
    </body>
</html>
