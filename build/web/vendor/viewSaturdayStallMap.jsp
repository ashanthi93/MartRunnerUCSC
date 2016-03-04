<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>View Saturday Satll Assignment | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <style type="text/css">
            #h4{
                font-weight: bold; 
                font-family: lucida bright;; 
                color:#218868;
                background-color: #C1FFC1;
                padding: 5px;
            }
        </style>
    </head>

    <body>

        <!--Including Header Page-->
        <%@include file="header_sub.jsp" %>

        <section>
            <div class="container" >
                <div class="row">

                    <!--Start of Side Bar-->
                    <div class=" col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 
                                        <!--Side Bar Topic-->
                                        <label style="color: #000000; padding-top:19px; font-size:22px;"> Stall Assignment </label>  
                                        <br/><br/>

                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#EE2C2C; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width: auto;" href="vendorHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br><br>

                                        <!--Thursday Stall Assignment Icon-->
                                        <span class="glyphicon glyphicon-edit" style="font-size:75px; color:#104E8B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto;" href="viewThursdayStallMap.jsp"> <strong> Thursday <br/> Stall Assignment </strong></a>

                                        <br><br> 

                                        <!--Saturday Stall Assignment Icon-->
                                        <span class="glyphicon glyphicon-cog" style="font-size:75px; color:#8B1C62; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default active" style="width:auto;" href="viewSaturdayStallMap.jsp"> <strong> Saturday <br/> Stall Assignment </strong></a>

                                        <br/><br/>
                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>

                    <!-- Start of View Stall Assignment Form-->
                    <div class="container">
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">

                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Saturday Stall Assignment </p>
                                </div>

                                <!--Form Body-->
                                <div class="panel-body">

                                    <div STYLE=" height:400px; width:auto; overflow: auto;">
                                        <img src="../static/images/SaturdayStallAssigment/out.jpg" style="height: auto; width: auto;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="footer_sub.jsp" %>

        <!--scripts-->

        <script>
            function myDateFunction() {
                var d = new Date();
                var weekday = new Array(7);
                weekday[0] = "Sunday";
                weekday[1] = "Monday";
                weekday[2] = "Tuesday";
                weekday[3] = "Wednesday";
                weekday[4] = "Thursday";
                weekday[5] = "Friday";
                weekday[6] = "Saturday";

                var n = weekday[d.getDay()];
                document.getElementById("mapDate").innerHTML = n;
            }

        </script>
        
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>

    </body>
</html>
