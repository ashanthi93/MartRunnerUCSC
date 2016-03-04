<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> View Payment Results | Vendor | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">
        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <style>
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

        <%@include file="header_sub.jsp" %>

        <section>
            <div class="container" >
                <div class="row col-xs-12 col-sm-12 col-sm-12 col-lg-12 ">
                    <!--Start of Side Bar-->
                    <div class=" col-sm-3 col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 
                                        <!--Side Bar Topic-->
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> View Payment </label>  
                                        <br/><br/> 
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="vendorHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> 

                                        <!--View Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#8B1C62; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-eye-open" style="font-size:20px; color:#8B1C62; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default active" style="width:auto" href="viewPayment_Vendor.jsp"> <strong> View Payment</strong></a>

                                        <br><br>  

                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>
                    <!--End of Side Bar-->

                    <!-- view payment results form body-->
                    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <!--Form Topic-->
                            <div class="panel-heading" style="background-color: #71C671;">
                                <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; text-align: center;">  Payment Details </p> 
                            </div>
                            <!-- view payment results form content-->
                            <div class="panel-body">
                                <form action="" class="form-horizontal" id="viewPaymentresult" method="post"  role="form" onsubmit="" novalidate>

                                    <label for="paidDate" class="col-xs-5  col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label" style="text-align:left;">Paid Date</label>
                                    <label for="paidDate" class="col-xs-4  col-sm-4 col-md-offset-0 col-md-3 col-lg-3 control-label" style="text-align:left;"><%= session.getAttribute("paiddate")%></label>
                                    <label for="expiredDate" class="col-xs-5  col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label" style="text-align:left;">Expire Date </label>
                                    <label for="paidDate" class="col-xs-4  col-sm-4 col-md-offset-0 col-md-3 col-lg-3 control-label" style="text-align:left;"><%= session.getAttribute("expireddate")%></label>    

                                </form>
                            </div>
                        </div>
                                    
                                    <br> <br>

                        


                    </div>

                </div>
            </div>
        </section>



        <%@include file="footer_sub.jsp" %>
    </body>
</html>

