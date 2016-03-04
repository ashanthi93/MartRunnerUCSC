<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title> About | MartRunner </title>

        <!-- bootstrap css -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- custom css -->
        <link href="../static/css/backgroundStyles.css" rel="stylesheet">
    </head>

    <body id="about">
        
        <!-- include header file -->
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
        %>
        
        <br/><br/>

        <!-- about page content -->
        <section id="about-content"> 
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="row">
                        <div class="col-sm-6" id="about-main" align="center">
                            <p> 
                                The Good Market was started as a mission-driven social enterprise to promote products and services that are "good for the planet, good for the country, and good for you."
                            </p>
                        </div>

                        <div class="col-sm-6" align="left">
                            <img src="../static/images/pic8.jpg" height="300" width="500" alt="aboutImage">
                        </div>
                    </div>
                </div>

                <marquee id="about-marquee"> Visit Good Market once & Feel the difference. Thursday @ Diyatha Uyana, Saturday @ Racecourse Nuga car park, Everyday @ Lakpahana Courtyard </marquee>

                <div class="panel-heading">
                    <h1 class="panel-title"> Mission </h1>
                </div>

                <div class="panel-body">
                    <p> 
                        The Good Market is based on the idea that we create the world we live in. We make decisions every day that affect our health, our loved ones, our community, and our environment. If we stop and think about the consequences of our actions, we have the opportunity to make better choices and create a better world.
                        <br>
                        <br>
                        The Good Market wants to make it easier and more fun to “do good” and make better choices for our planet, our communities, and our health. It is a platform where socially and environmentally responsible producers, services providers, and consumers can come together.
                        <br>
                        <br>
                        Sri Lanka has many organic farmers, social enterprises, and responsible businesses that are creating products and services that are eco-friendly, socially responsible, and healthy. It also has many well-educated consumers that want to feed their families natural and organic food and choose products and services that match their values. The Good Market is a place for these groups to meet.
                    </p>
                </div>

                <div class="panel-heading">
                    <h1 class="panel-title"> Organization </h1>
                </div>

                <div class="panel-body">
                    <p> 
                        The Good Market is registered as a Guarantee Limited company and operates as a mission-driven social enterprise.  It has a self-financing model and is not dependent on grant funding.
                        <br>
                        <br>
                        Good Market events are not profit making.  Stall fees are kept as low as possible to reduce the entry barrier for rural producers, small enterprises, and new businesses.  The events are structured to cover costs so that the market is sustainable.
                        <br>
                        <br>
                        As a Guarantee Limited company, the Good Market does not have shareholders.  All profits from Good Market trade activities and other initiatives are reinvested to support the Good Market’s social and environmental mission.
                    </p>
                </div>

            </div>
        </section>

        <!-- include footer file -->
        <%@include file="footer.jsp" %>

        <!-- jQuery -->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
    </body>
</html>
