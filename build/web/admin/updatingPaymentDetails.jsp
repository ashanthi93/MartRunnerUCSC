<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Update Payment | Admin | MartRunner</title>

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

    <body >

        <%@include file="header_sub.jsp" %>
        <jsp:include page="/LoadPaidVendors" />

        <section>
            <div class="container" >
                <div class="row col-xs-12 col-sm-12 col-sm-12 col-lg-12 ">
                    
                    <!--Start of Side Bar-->
                    <div class=" col-sm-3 col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 
                                        <!--Start of Side Bar Topic-->
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> Payment Handling </label>  
                                        <br/><br/> 
                                        <!--End of Side Bar Topic-->
                                        
                                        <!--Start of Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> 
                                        <!--End of Dashboard Icon-->
                                        
                                        <!--Start of Update Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#008B45; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-edit" style="font-size:20px; color:#008B45; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default active" style="width:auto" href="updatePayment_Admin.jsp"> <strong> Update Payment</strong></a>
                                        <br><br>  
                                         <!--End of Update Payment Icon-->
                                       
                                    </center>
                                </div>
                            </div>
                        </div> 
                    </div>
                    <!--End of Side Bar-->

                    <!--Start of Update Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Start of Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> Update Payment </p>
                                </div>
                                <!--End of Form Topic-->
                                
                                <!--Start of Form Body-->
                                <div class="panel-body" align="center" style="height: 380px;">
                                    
                                    
                                    <%
                                        //Obtaining payments done by the selected vendor 
                                        List<String[]> passingValues=(List<String[]>)session.getAttribute("passingValues");
                                        String[] s=passingValues.get(0);
                                         
                                    %> 
                                    
                                    <!--Start of vendor name-->
                                    <label for="vendorname" style="padding-top:20px;font-size:20px;font-family: lucida bright;">Vendor Name: </label>
                                    <label for="vendorname"style="padding-top:20px;font-size: 20px;font-family: lucida bright;" ><%=s[0]%></label>
                                    <!--End of vendor name-->
                                    
                                    <!--Start of vendor payment details table-->
                                    <table  border="1" style="margin-top:20px;font-family: lucida bright;">
                                        <tr style="height:30px;">
                                            <th style="width: 100px;padding-left: 5px;">Start Date</th>
                                            <th style="width: 100px;padding-left: 5px;">Market Day</th>
                                            <th style="width: 100px;padding-left: 5px;">Stall Type</th>
                                            <th style="width: 100px;padding-left: 5px;">End Date</th>
                                            <th style="width: 100px;padding-left: 5px;"></th>
                                        </tr>
                                    <%
                                        for(String[] val:passingValues){
                                    %>
                                    <tr style="height:30px;">
                                        <td style="padding-left: 5px;"><%=val[1]%> </td>
                                        <td style="padding-left: 5px;"><%=val[2]%> </td>
                                        <td style="padding-left: 5px;"><%=val[3]%> </td>
                                        <td style="padding-left: 5px;"><%=val[4]%> </td>
                                        <td style="padding-left: 5px;"><a href="../../MartRunner/UpdatePayment_Final?name=<%=val[0]%>&day=<%=val[2]%>&stall=<%=val[3]%>"> Update</a></td>
                                    </tr>
                                    <%    }
                                    
                                    %>
                                    </table>
                                    <!--End of vendor payment detail table-->
                                    
                                </div>
                                <!--End of Form Body-->
                            </div>
                            <br/> 
                        </div>
                    </div>
                    <!--End of Update Payment Form-->

        </section>
        <!-- Start of footer-->                           
        <%@include file="footer_sub.jsp" %>
        <!-- End of footer--> 
        
        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/main.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('.combobox').combobox();
            });
        </script>
        
        
    </body>
</html>
