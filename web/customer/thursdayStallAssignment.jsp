<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title> Thursday Stall Assignment | MartRunner </title>

        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">
        
    </head>
    
    <body id="visit"> 
        
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
            <br/>
            <div class="container">
                <div class="panel panel-default col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="panel-heading">
                        <div class="panel-title"> <h4 style="color: #008B45; font-weight: bolder;"> Thursday Stall Assignment </h4> </div>
                    </div>

                    <div class="panel-body">
                        <center>
                            <div class="panel panel-default col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <img src="../static/images/ThursdayStallAssigment/out.jpg" style="width:auto; height: auto;">
                            </div>
                        </center>

                        <div class="row">
                            <div class="col-lg-6"><a href="visitThursday.jsp" style="float: left;"> <b><font size="3px" color="#069"> Back to Visit </font></b></a></div>
                            <div class="col-lg-6"><a href="contactUs.jsp" style="float: right;"> <b><font size="3px" color="#069"> Find Location </font></b></a></div>
                        </div>

                    </div>
                </div>
            </div>

        </section>

        <%@include file="footer.jsp" %>

        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/main.js"></script>
    </body>
</html>
