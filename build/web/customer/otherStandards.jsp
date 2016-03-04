<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Other Standards | MartRunner </title>

        <link href="../static/css/bootstrap.min.css" rel="stylesheet">


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
                        <center> <strong> Social Impact </strong> </center>
                    </div>
                    <br/>
                    <div class="panel-body">
                        <center>
                            <div class="imagediv">
                                <img src="../static/images/standards/other.png"/>
                            </div>

                            <h3>Level 1 </h3> <hr class="hr-stand">  <h3 style="margin: 5px 300px 5px 300px">  Benefits Society </h3>

                            <p>Effort made to benefit society by preferentially creating opportunities for disadvantaged groups, paying fair prices, providing 
                                social services,</p>

                            <div class="imagediv">
                                <img src="../static/images/standards/other.png"/>
                                <img src="../static/images/standards/other.png"/>
                            </div>

                            <h3>Level 2 </h3>  <hr class="hr-stand"> <h3 style="margin: 5px 300px 5px 300px">  Monitors and Reports Social Benefit </h3>

                            <p> Effort to benefit society is monitored and reported </p>


                            <div class="imagediv">
                                <img src="../static/images/standards/other.png"/>
                                <img src="../static/images/standards/other.png"/>
                                <img src="../static/images/standards/other.png"/>
                            </div>


                            <h3>Level 3 </h3>  <hr class="hr-stand"> <h3 style="margin: 5px 300px 5px 300px">  Certified Social Benefit </h3>

                            <p> Benefits to society have been independently verified by an accredited certifying body</p>
                        </center>  
                    </div>
                </div>
            </div>

        </section>

        <section>    
            <br>
            <div class="row container">
                <div class=" panel panel-default col-xs-10 col-xs-offset-2 col-lg-10 ">
                    <div class="panel-title header">
                        <center> <strong> Environmental Impact </strong> </center>
                    </div>
                    <br/>
                    <div class="panel-body">
                        <center>
                            <div class="imagediv">
                                <img src="../static/images/standards/other.png"/>

                            </div>

                            <h3>Level 1 </h3> <hr class="hr-stand">  <h3 style="margin: 5px 300px 5px 300px">  Benefits Environment </h3>

                            <p>Effort made to benefit the environment by minimizing energy use, resource use, and pollution, contributing to conservation </p>

                            <div class="imagediv">
                                <img src="../static/images/standards/other.png"/>
                                <img src="../static/images/standards/other.png"/>
                            </div>

                            <h3>Level 2 </h3>  <hr class="hr-stand"> <h3 style="margin: 5px 300px 5px 300px">  Monitors and Reports Environmental Benefit </h3>

                            <p>Effort to benefit the environment is monitored and reported </p>


                            <div class="imagediv">
                                <img src="../static/images/standards/other.png"/>
                                <img src="../static/images/standards/other.png"/>
                                <img src="../static/images/standards/other.png"/>
                            </div>


                            <h3>Level 3 </h3>  <hr class="hr-stand"> <h3 style="margin: 5px 300px 5px 300px">  Certified Environmental Benefit </h3>

                            <p> Environmental benefits have been independently verified by an accredited certifying body</p>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </center>
</section>

<%@include file="footer.jsp" %>

<script src="../static/js/jquery.js"></script>
<script src="../static/js/bootstrap.min.js"></script>
</body>
</html>
