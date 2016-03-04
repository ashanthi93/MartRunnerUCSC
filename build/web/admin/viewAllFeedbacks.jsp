<%@page import="classes.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>View Older Feedbacks Home | Mart Runner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/bootstrap-submenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

    </head>
    <body>
        <jsp:include page="/LoadAllFeedbacks" />
        <%@include file="header_sub.jsp" %>


        <section>
            <div class="container" >
                <div class="row col-xs-12 col-sm-12 col-sm-12 col-lg-12 ">

                    <!--View Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <div class="row">
                                        <p class="panel-title col-xs-11" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> View Older Customer Feedbacks </p>
                                        <a href="viewCustomerMessages.jsp"> <button type="submit" class="btn btn-default" style="background-color: #C1FFC1;">Back</button></a>
                                    </div>
                                </div>
                                <div class="panel-body">


                                    <%                                        List<Customer> messagelist = (List<Customer>) session.getAttribute("messagelist");
                                        if (messagelist != null) {
                                            for (int i = 0; i < messagelist.size(); i++) {
                                                Customer temp = new Customer();
                                                temp = messagelist.get(i);

                                                out.println("<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6' >");
                                                out.println("<div class='panel panel-default'>");
                                                out.println("<p class='panel-title' style='color:#218868; background-color: #C1FFC1; font-weight: bold; padding-left: 5px; font-family: lucida bright;'>");
                                                out.println(temp.getCustomername());
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
                                                out.println("<textarea  class='form-control' id='feedback' name='feedback' disabled='disabled' rows='4'>");
                                                out.println(temp.getFeedback());
                                                out.println("</textarea");
                                                out.println("</br>");
                                                out.println("</br>");

                                                out.println("</form>");
                                                out.println("</form>");
                                                out.println("</div>");
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
                            <!--End of View payment-->
                        </div>
                    </div>

                    </section>
                    <br><br><br><br><br><br><br><br><br>
                    <%@include file="footer_sub.jsp" %>
                    </body>
                    </html>
