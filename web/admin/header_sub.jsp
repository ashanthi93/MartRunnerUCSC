<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- custom css -->
        <link href="../static/css/headerStyles.css" rel="stylesheet">

        <!-- font awesome css -->
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

            String username = null;
            int privilage;

            if (session.getAttribute("User") == null) {
                response.sendRedirect("../index.jsp");              //noback after login
            } else {
                username = (String) session.getAttribute("User");
                privilage = (Integer) session.getAttribute("privilage");

                if (privilage != 1) {            //user logout if unauthorized user change url path and try to log
                    response.sendRedirect("../logout");
                }
            }

            /* error message if session has expired */
            /*if (username == null) {
             out.println("<script type=\"text/javascript\">");
             out.println("alert('Session has expired. Please Login again');");
             out.println("location='../index.jsp';");
             out.println("</script>");
             } else if (privilage != 1) {            //error message if unauthorized user change url path and try to log
             out.println("<script type=\"text/javascript\">");
             out.println("alert('This is not a valid page for you');");
             out.println("location='../index.jsp';");
             out.println("</script>");
             }*/
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

                    <a class="navbar-brand" href="../index.jsp"> MartRunner <small> Good Market Event Assist System </small> </a>
                </div> 
                <!-- end of navbar-header -->

                <!-- start of navbar-collapse -->
                <div class="collapse navbar-collapse" id="martrunner-navbar-collapse">

                    <!-- start of navbar-nav list-->
                    <ul class="nav navbar-nav navbar-right">

                        <!-- index nav -->
                        <li> <a href="../index.jsp"> Home </a> </li>

                        <!-- customer nav -->
                        <li> <a href="../customer/about.jsp"> About </a> </li>

                        <!-- standards nav -->
                        <li class="dropdown"> 
                            <a href="../customer/standards.jsp" class="dropdown-toggle disabled" data-toggle="dropdown"> Standards <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="../customer/organicStandards.jsp"> Organic Products </a> </li>
                                <li> <a href="../customer/farmStandards.jsp"> Animal Based Farm Products </a> </li>
                                <li> <a href="../customer/foodStandards.jsp"> Prepared Foods </a> </li>
                                <li> <a href="../customer/bodyStandards.jsp"> Natural Body & Home </a> </li>
                                <li> <a href="../customer/artStandards.jsp"> Art & Handicrafts  </a> </li>
                                <li> <a href="../customer/pkgStandards.jsp"> Packaging  </a> </li>
                                <li> <a href="../customer/otherStandards.jsp"> Other Standards </a> </li>
                            </ul>
                        </li>

                        <!-- vendors nav -->
                        <li class="dropdown"> 
                            <a class="dropdown-toggle disabled" data-toggle="dropdown"> Vendors <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="../customer/vendor_organic.jsp"> Organic Products </a> </li>
                                <li> <a href="../customer/vendor_animal.jsp"> Animal Based Farm Products </a> </li>
                                <li> <a href="../customer/vendor_prepared.jsp"> Prepared Foods </a> </li>
                                <li> <a href="../customer/vendor_natural.jsp"> Natural Body & Home </a> </li>
                                <li> <a href="../customer/vendor_art.jsp"> Art & Handicrafts  </a> </li>
                                <li> <a href="../customer/vendor_travel.jsp"> Travel  </a> </li>
                                <li> <a href="../customer/vendor_service.jsp"> Service Providers  </a> </li>
                            </ul>
                        </li>

                        <!-- visit nav -->
                        <li class="dropdown"> 
                            <a class="dropdown-toggle disabled" data-toggle="dropdown" data-target="#"> Visit <b class="caret"> </b> </a>
                            <ul class="dropdown-menu dropdown-menu-left" role="menu">
                                <li> <a href="../customer/visitThursday.jsp"> Thursday Good Market </a> </li>
                                <li> <a href="../customer/visitSaturday.jsp"> Saturday Good Market </a> </li>
                                <li> <a href="../customer/visitShop.jsp"> Good Market Shop </a> </li>
                            </ul>
                        </li>

                        <!-- apply nav -->
                        <li> <a href="../customer/apply.jsp"> Apply </a> </li>

                        <!-- contact us nav -->
                        <li> <a href="../customer/contactUs.jsp"> Contact Us </a> </li>

                    </ul> 
                    <!-- end of navbar-nav list-->

                </div> 
                <!-- end of navbar-collapse -->
            </nav> 
            <!-- end of navbar -->
        </header>

        <!-- start of sub header -->
        <%            if (!(username == null)) {
        %>

        <!-- logout icon with welcome message -->
        <div class="container col-lg-12 col-md-12 col-sm-12 col-xs-12" id="subHeader">
            <div class="col-lg-1 col-md-1 col-lg-sm-1 col-xs-1">
                <a href="adminHomePage.jsp" data-toggle="tooltip" title="Dashboard"> <button type="button" class="btn-default fa fa-tachometer" style="border-style: hidden; font-size:45px; color: #009900; background-color: black;"> </button> </a>
            </div>

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

        <%
            }
        %>
        <!-- end of sub header -->

    </body>
</html>
