<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Reserve Stall Saturday | MartRunner </title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <style type="text/css">
            table{
                width: 90%;
                height: auto;
            }
            table, td, th {
                border: 1px solid black;
            }
            th{
                background-color:green;
                font-size: 18px;
            }
            td{
                padding: 5px;
            }
        </style>
        
    </head>

    <body>

        <!--Including Header Page-->
        <%@include file="header_sub.jsp" %>

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
            if (username == null) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Session has expired. Please Login again');");
                out.println("location='../index.jsp';");
                out.println("</script>");
            }
        %>

        <div class="container col-lg-12 col-md-12 col-sm-12 col-xs-12" id="subHeader">
            <div class="col-lg-11 col-md-11 col-sm-11 col-xs-11">
                <form action="${pageContext.request.contextPath}/logout" method="POST">
                    <div class="form-group" style="float: right;">
                        <label> Welcome <%=username%>, Love to see you back. </label>
                        &nbsp; &nbsp; &nbsp;
                        <input type="submit" value="Logout" class="btn-default" style="border-style: hidden;"/>
                        &nbsp;
                    </div>
                </form>
            </div>
            <div class="col-lg-1 col-md-1 col-lg-sm-1 col-xs-1">
                <a href="vendorHomePage.jsp"> <button type="button" class="btn-default" style="border-style: hidden;"> Dashboard </button> </a>
            </div>
        </div>

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
                                        <label style="color: #000000; padding-top:19px; font-size:22px;"> Reserve Stall </label>  
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
                                    <p class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Reserve Stall Saturday </p>
                                </div>

                                <!--Form Body-->
                                <div class="panel-body">

                                    

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include file="footer_sub.jsp" %>

        <!--scripts-->

        <script src="../static/js/jquery-1.9.1.min.js"> </script>
        <script src = "../static/js/jquery1.js" ></script>
        <script src="../static/js/bootstrap.min.js"></script>

    </body>
</html>
