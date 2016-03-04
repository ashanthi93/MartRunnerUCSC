<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Natural Body & Home Standards | MartRunner </title>

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
                        <center> <strong> Natural Body & Home Products </strong> </center>
                    </div>
                    <br/>
                    <div class="panel-body">
                        <center>

                            <div class="imagediv">
                                <img src="../static/images/standards/natural.png"/>

                            </div>

                            <h3>Level 1 </h3> <hr class="hr-stand">  <h3 style="margin: 5px 300px 5px 300px">  Natural Colors and Fragrances </h3>

                            <p>No artificial colors or fragrances</p>

                            <div class="imagediv">
                                <img src="../static/images/standards/natural.png"/>
                                <img src="../static/images/standards/natural.png"/>
                            </div>

                            <h3>Level 2 </h3>  <hr class="hr-stand"> <h3 style="margin: 5px 300px 5px 300px">  All Natural </h3>

                            <p>No artificial colors, fragrances, synthetic preservatives or any other additives. All ingredients from natural, renewable materials. </p>


                            <div class="imagediv">
                                <img src="../static/images/standards/natural.png"/>
                                <img src="../static/images/standards/natural.png"/>
                                <img src="../static/images/standards/natural.png"/>
                            </div>


                            <h3>Level 3 </h3>  <hr class="hr-stand"> <h3 style="margin: 5px 300px 5px 300px">  All Natural and Sustainably Sourced </h3>

                            <p> No artificial colors, fragrances, synthetic preservatives or any other additives. All ingredients from natural, renewable materials. 
                                Priority given to local ingredients that are traceable to their primary source and meet Good Market standards.</p>
                        </center>
                    </div>
                </div>
            </div>





        </section>

        <%@include file="footer.jsp" %>

        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
    </body>
</html>

