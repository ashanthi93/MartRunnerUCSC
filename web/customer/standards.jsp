<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Standards | MartRunner </title>

        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/standards.css" rel="stylesheet">

        <style type="text/css">
            .header{
                font-size: 45px;
                color: #6B8E23;
                font-family:new century schoolbook;
                text-shadow:4px 4px 6px #CDCDC1;
                font-weight:bold;
            }
        </style>

    </head>

    <body id="standards">

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

        <section>
            <br>
            <div class="row container">
                <div class=" panel panel-default col-xs-10 col-xs-offset-2 col-lg-10 ">
                    <div class="panel-title header">
                        <center> <strong> Good Market Standards </strong> </center>
                    </div>
                    <br/>
                    <div class="panel-body">


                        <div class="imagediv"> 
                            <img src="../static/images/standards/standrads_main.jpg" class="imagecss" /> 
                        </div>
                        <p style="font-size: 16px; text-align:left; ">
                            The Good Market is a curated market, which means all vendors have to go through an application and review process, and only vendors that meet the Good Market standards are approved. 
                            <br/>These standards are what set the Good Market apart from other markets.  
                            <br/>
                            <br/>


                            The Good Market standards have different levels.  <br/>Every product in the market must at least meet the minimum level (Level 1) standards for its product category. 
                            Products that have are better for the environment, for society, or for health are at a higher level (e.g. Level 2 or Level 3) 
                            <br/>
                            <br/>

                            Good Market standards are refined and updated over time, and each vendor is encouraged to improve their standards.
                            <br/>
                            <br/>

                            Want to learn more about the Good Market standards for farm products? <br/> 
                            Visit the <a href="farmStandards.jsp">Farm Products </a>page.
                            <br>
                            <br>

                            Want to learn more about the Good Market standards for prepared foods?<br/>  
                            Visit the <a href="foodStandards.jsp">Prepared Foods</a> page.
                            <br>
                            <br>

                            Want to learn more about the Good Market standards for personal care products and household cleaners? <br> 
                            Visit the <a href="bodyStandards.jsp">Natural Body & Home</a> page.
                            <br>
                            <br>

                            Want to learn more about the Good Market standards for arts and handicrafts? <br> 
                            Visit the <a href="artStandards.jsp">Art & Handicrafts</a> page.
                            <br>
                            <br>

                            Want to learn more about the Good Market standards for packaging? <br> 
                            Visit the <a href="pkgStandards.jsp">Packaging</a> page.
                            <br>
                            <br>

                            Want to learn more about the Good Market standards for social and environmental impact? <br> 
                            Visit the <a href="otherStandards.jsp">Impact</a> page.
                            <br>
                            <br>
                        </p>

                    </div>
                </div>
            </div>


        </section>>

        <%@include file="footer.jsp" %>

        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
    </body>
</html>

