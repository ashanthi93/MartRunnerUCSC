<%@page import="classes.Vendor"%>
<%@page import="classes.MessageVendor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Vendor Messages | Mart Runner</title>
        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/bootstrap-submenu.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header_sub.jsp" %>
        <jsp:include page="/ViewMessages_Vendor" />
        <%            if (!(username == null)) {
        %>
        <br/>            
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
                                        <label style="color: #000000; padding-top:35px; font-size:22px;"> Vendor Messages </label>  
                                        <br/><br/> 
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#EE2C2C; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width: auto;" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br><br> 
                                        
                                       <span class="glyphicon glyphicon-envelope " style="font-size:75px; color:#FFCC00; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default active" style="width: auto;" href="viewVendorMessages.jsp"> <strong> View New Messages</strong></a>
                                        <br><br> 
                                        
                                        <span class="glyphicon glyphicon-eye-open " style="font-size:75px; color:#009900; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width: auto;" href="viewAllVendorMessages.jsp"> <strong> View All Messages</strong></a>
                                        <br><br> 
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container" >
                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--panel Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Vendor Messages </p>
                                </div>
                                <!--panel Body-->
                                <div class="panel-body">
                                <%
                                    ArrayList<MessageVendor> messageList = (ArrayList<MessageVendor>) session.getAttribute("messageList");
                                    Vendor vendor = new Vendor();
                                    if(!(messageList.isEmpty())){
                                        for(MessageVendor messageVendor:messageList){
                                            vendor.setVendorID(messageVendor.getVendorId());
                                            String vName=vendor.getVendornameByVendorID();
                                            
                                            out.println("<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6' >");
                                            out.println("<div class='panel panel-default'>");
                                            out.println("<p class='panel-title' style='color:#218868; background-color: #C1FFC1; font-weight: bold; padding-left: 5px; font-family: lucida bright;'>");
                                            out.println(vName);
                                            out.println("<br/>");
                                            
                                            out.println("<label>");
                                            out.println(messageVendor.getMessageTime());
                                            out.println("</label>");
                                            out.println("</p>");
                                            out.println("<div class='panel-body'>");
                                            out.println("<form action='../ViewFullMessage_Vendor' class='form-horizontal' id='viewVendorMessage' method='POST'  role='form'>");
                                            out.println("<textarea rows=4 class='form-control' id='message' name='message'  readonly>");
                                            out.println(messageVendor.getMessage());
                                            out.println("</textarea");
                                            out.println("</br>");
                                            out.println("</br>");
                                            out.println("<button type='submit' name='formsubmit' id='formsubmit' value='" + messageVendor.getId()+ "' class='btn btn-default col-xs-2 col-xs-offset-8'>");
                                            out.println("ok");
                                            out.println("</button");

                                            out.println("</form>");
                                            out.println("</form>");
                                            out.println("</div>");
                                            out.println("</div>");
                                            out.println("</div>");
                                %>
                               

                               
                                <%}}%>        
                                
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%
            }
        %>                                                               
        <%@include file="footer_sub.jsp" %>
        <!-- jQuery -->
        <!--<script src="static/js/jquery.js"></script> dropdown won't work for this -->
        <script src="../static/js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-submenu.min.js"></script>
        <script>
            $('.dropdown-submenu > a').submenupicker();
        </script>
    </body>
</html>