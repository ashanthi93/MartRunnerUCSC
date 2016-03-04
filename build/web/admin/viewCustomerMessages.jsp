<%@page import="java.util.ArrayList"%>
<%@page import="classes.Customer"%>
<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> View Customer Feedbacks | Admin | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="../static/css/bootstrap-combobox.css" rel="stylesheet">

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
        <jsp:include page="/ViewCustomerMessages_Admin" />
        <jsp:include page="/ViewMessages_Vendor" />
        <%@include file="header_sub.jsp" %>
        <%            ArrayList<Vendor> messageList = (ArrayList<Vendor>) session.getAttribute("messageList");
            int num = messageList.size();
            int customercount = Integer.parseInt(session.getAttribute("customerfeedbackno") + "");
            int total = num + customercount;
            if (total == 0) {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "No New Messages !");
                session.setAttribute("errorMsg", "No new messages to view");
                response.sendRedirect("adminHomePage.jsp");
            }
            if (num > 0) {

        %>

        <section>
            <div class="container" >
                <div class="row col-xs-12 col-sm-12 col-sm-12 col-lg-12 ">

                    <!-- start of view vendor messages panel-->
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <!--panel Topic-->
                            <div class="panel-heading" style="background-color: #71C671;">
                                <div class="row">
                                    <p class="panel-title col-xs-8" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> Vendor Messages </p>
                                    <a href="viewAllVendorMessages.jsp"> <button type="submit" class="btn btn-default" style="background-color: #C1FFC1;">Message History</button></a>
                                </div>
                            </div>
                            <!--panel Body-->

                            <div class="panel-body">
                                <%                                    Vendor vendor = new Vendor();
                                    if (!(messageList.isEmpty())) {
                                        for (Vendor messageVendor : messageList) {
                                            vendor.setVendorID(messageVendor.getVendorID());
                                            String vName = vendor.getVendornameByVendorID();

                                            out.println("<div class='panel panel-default'>");
                                            out.println("<p class='panel-title' style='color:#218868; background-color: #C1FFC1; font-weight: bold; padding-left: 5px; font-family: lucida bright;'>");
                                            out.println(vName);
                                            out.println("<span class='badge' style='font-size: 8px; background-color: red;'>");
                                            out.println("New");
                                            out.println("</span>");
                                            out.println("&nbsp;&nbsp;&nbsp;");
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
                                            out.println("<button type='submit' name='formsubmit' id='formsubmit' value='" + messageVendor.getId() + "' class='btn btn-default col-xs-2 col-xs-offset-8'>");
                                            out.println("ok");
                                            out.println("</button");

                                            out.println("</form>");
                                            out.println("</form>");
                                            out.println("</div>");
                                            out.println("</div>");

                                %>



                                <%}
                                    }%>        


                            </div>
                        </div>
                    </div>


                    <!-- end of view vendor messages panel-->
                    <%
                         }%>


                    <%
                        if (customercount > 0) {

                    %>
                    <!--View customer mesages panel--> 
                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <!--Form Topic-->
                            <div class="panel-heading" style="background-color: #71C671;">
                                <div class="row">
                                    <p class="panel-title col-xs-8" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> View Customer Feedbacks </p>
                                    <a href="viewAllFeedbacks.jsp"> <button type="submit" class="btn btn-default" style="background-color: #C1FFC1;">Older Feedbacks</button></a>
                                </div>
                            </div>
                            <div class="panel-body">


                                <%                                        List<Customer> messagelist = (List<Customer>) session.getAttribute("messagelist");
                                    if (messagelist != null) {
                                        for (int i = 0; i < messagelist.size(); i++) {
                                            Customer temp = new Customer();
                                            temp = messagelist.get(i);

                                            out.println("<div class='panel panel-default'>");
                                            out.println("<p class='panel-title' style='color:#218868; background-color: #C1FFC1; font-weight: bold; padding-left: 5px; font-family: lucida bright;'>");
                                            out.println(temp.getCustomername());
                                            out.println("<span class='badge' style='font-size: 8px; background-color: red;'>");
                                            out.println("New");
                                            out.println("</span>");
                                            out.println("&nbsp");
                                            out.println("&nbsp");
                                            out.println("<label>");
                                            out.println(temp.getCustomeremail());
                                            out.println("</label>");
                                            out.println("&nbsp");
                                            out.println("<label>");
                                            out.println(temp.getContactno());
                                            out.println("</label>");
                                            out.println("</p>");
                                            out.println("<div class='panel-body'>");
                                            out.println("<form action='../viewCustomerMessageResults' class='form-horizontal' id='changevendorprofile' method='POST'  role='form'>");
                                            out.println("<textarea  rows=4 class='form-control' id='feedback' name='feedback' readonly>");
                                            out.println(temp.getFeedback());
                                            out.println("</textarea");
                                            out.println("</br>");
                                            out.println("</br>");
                                            out.println("<button type='submit' name='formsubmit' id='formsubmit' value='" + temp.getMessageID() + "' class='btn btn-default col-xs-2 col-xs-offset-8'>");
                                            out.println("ok");
                                            out.println("</button");

                                            out.println("</form>");
                                            out.println("</form>");
                                            out.println("</div>");
                                            out.println("</div>");

                                %>

                                <%}
                                    } else {
                                        System.out.println("No match found");
                                    }
                                %>
                            </div>
                        </div>
                        <%
                            }

                        %>

                        <!--End of View payment-->


                    </div>






                    </section>
                    <br><br><br>
                    <%@include file="footer_sub.jsp" %>



                    </body>
                    </html>
