<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Remove Payment | Admin | MartRunner</title>

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
                                        <label style="color: #000000; padding-top:20px; font-size:22px;font-family: lucida bright;"> Payment Handling </label>  
                                        <br/><br/> 
                                        <!--End of Side Bar Topic-->

                                        <!--Start of Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> 
                                        <!--End of Dashboard Icon-->

                                        <!--Start of Remove Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#EE0000; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>  
                                            <span class="glyphicon glyphicon-remove" style="font-size:20px; color:#EE0000; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>
                                        </div> <br> 
                                        <a class="btn btn-default active" style="width:auto" href="removePayment_Admin.jsp"> <strong>Remove Payment</strong></a>
                                        <br/><br/> 
                                        <!--End of Remove Payment Icon-->
                                    </center>
                                </div>
                            </div>
                        </div> 
                    </div>
                    <!--End of side bar-->


                    <!--Start of Remove Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Start of Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> Remove Payment </p>
                                </div>
                                <!--End of Form Topic-->
                                
                                <!--Start of Form Body-->
                                <div class="panel-body" align="center" style="height: 380px;">
                                    <p style="color: #EE0000; font-size:18px;padding-top:20px;font-family: lucida bright;"><strong> Remember that you cannot undone the changes once you click  "Remove" !!! </strong></p>
                                    <%  
                                        //retreiving passingValues list from the session
                                        List<String[]> passingValues = (List<String[]>) session.getAttribute("passingValues");
                                        String[] s = passingValues.get(0);

                                    %>    
                                    <!--Setting values to the table-->
                                    <label for="vendorname" style="color: #66512c;padding-top:20px;font-size:20px;font-family: lucida bright;">Vendor Name: </label>
                                    <label for="vendorname" style="color: #66512c;padding-top:20px;font-size:20px;font-family: lucida bright;"><%=s[0]%></label>
                                    <!--Start of the table-->
                                    <table  border="1" style="margin-top:20px;font-family: lucida bright;">
                                        <tr style="height:30px;">
                                            <th style="width: 100px;padding-left: 5px;">Start Date</th>
                                            <th style="width: 100px;padding-left: 5px;">Market Day</th>
                                            <th style="width: 100px;padding-left: 5px;">Stall Type</th>
                                            <th style="width: 100px;padding-left: 5px;">End Date</th>
                                            <th style="width: 100px;padding-left: 5px;"></th>
                                        </tr>
                                        <!--Start of Setting values to the table-->
                                        <%
                                            for (String[] val : passingValues) {
                                        %>
                                        
                                        <tr style="height:30px;">
                                            <td style="padding-left: 5px;"><%=val[1]%> </td>
                                            <td style="padding-left: 5px;"><%=val[2]%> </td>
                                            <td style="padding-left: 5px;"><%=val[3]%> </td>
                                            <td style="padding-left: 5px;"><%=val[4]%> </td>
                                            <td style="padding-left: 5px;"><a href="../../MartRunner/RemovePayment?name=<%=val[0]%>&day=<%=val[2]%>&stall=<%=val[3]%>"> Remove</a></td>
                                        </tr>
                                        <%    }

                                        %>
                                         <!--End of Setting values to the table-->
                                    </table>
                                    <!--End of the table-->
                                </div>
                                <!--End of Form Body-->
                            </div>



                            <br> 


                        </div>


                    </div>
                    <!--End of remove Payment Form-->
                </div>
            </div>
        </section>
        <%@include file="footer_sub.jsp" %>

        <!--Validation scripts-->
        <script type="text/javascript">
            function validateForm() {
                var errors = [];

                //Vendor name validation                
                if (!validateName("vendorName", "errorVendorName")) {
                    errors.push("errorVendorName");
                }

                // Stall type validation
                var stallType = document.getElementsByName("stallType");
                if (!validateStallType(stallType)) {
                    errors.push("errorStallType");
                }

                //Market day validation
                var marketDay = document.getElementsByName("marketDay");
                if (!validateMarketDay(marketDay)) {
                    errors.push("errorMarketDay");
                }


                if (errors.length > 0) {
                    return false;
                } else {
                    return true;
                }
            }
            
            //Vendor name validation function
            function validateName(text, errorLbl) {
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                } else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }

            //Stall type validation function
            function validateStallType(group) {
                var isChecked;
                for (var i = 0; i < group.length; i++) {
                    if (group[i].checked) {
                        document.getElementById("errorStallType").style.borderColor = "green";
                        isChecked = true;
                    }
                }
                if (!isChecked) {
                    document.getElementById("errorStallType").focus();
                    document.getElementById("errorStallType").style.borderColor = "red";
                    isChecked = false;
                }
                return isChecked;
            }
            
            //Market day validation function
            function validateMarketDay(group) {
                if ((group[0].checked || group[1].checked)) {
                    document.getElementById("errorMarketDay").style.borderColor = "green";
                    return true;
                } else {
                    document.getElementById("errorMarketDay").focus();
                    document.getElementById("errorMarketDay").style.borderColor = "red";
                    return false;
                }
            }


        </script>

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
