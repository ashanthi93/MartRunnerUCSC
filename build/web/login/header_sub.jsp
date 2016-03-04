<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="../static/css/headerStyles.css" rel="stylesheet">
    </head>

    <body>
        
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
                                <li> <a href="#"> Good Market Shop </a> </li>
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
        
    </body>
</html>
