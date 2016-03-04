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
        <title> View Customer Messages | MartRunner</title>

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

        <%@include file="header_sub.jsp" %>
        <jsp:include page="/ViewMessages_Customer" />
        <%            ArrayList<Customer> messageList = (ArrayList<Customer>) session.getAttribute("custMessageList");
            int num = messageList.size();

            if (num == 0) {
                session.setAttribute("error", 1);
                session.setAttribute("errorHead", "No Messages !");
                session.setAttribute("errorMsg", "No new messages to view");
                response.sendRedirect("vendorHomePage.jsp");
                /*
                out.println("<script type=\"text/javascript\">");
                out.println("alert('No new messages to view!');");
                out.println("location='vendorHomePage.jsp';");
                out.println("</script>");
                        */
            } else if (num > 0) {

        %>
        <section>
            <div class="container" >

                <!-- start of view vendor messages panel-->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
                    <div class="panel panel-default" style="margin-top: 10px;">
                        <!--panel Topic-->
                        <div class="panel-heading" style="background-color: #71C671;">
                            <div class="row">
                                <p class="panel-title col-xs-8" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> Customer Messages </p>
                                <a href="viewAllCustomerMessages.jsp"> <button type="submit" class="btn btn-default" style="background-color: #C1FFC1;">Message History</button></a>
                            </div>
                        </div>
                        <!--panel Body-->

                        <div class="panel-body">
                            <%                                    Customer customer = new Customer();
                                if (!(messageList.isEmpty())) {
                                    for (Customer messageCustomer : messageList) {
                                        String cName = messageCustomer.getCustomername();

                                        out.println("<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6' >");
                                        out.println("<div class='panel panel-default'>");
                                        out.println("<p class='panel-title' style='color:#218868; background-color: #C1FFC1; font-weight: bold; padding-left: 5px; font-family: lucida bright;'>");
                                        out.println(cName);
                                        out.println("<span class='badge' style='font-size: 8px; background-color: red;'>");
                                        out.println("New");
                                        out.println("</span>");
                                        out.println("&nbsp;&nbsp;&nbsp;");
                                        out.println("<label>");
                                        out.println(messageCustomer.getMessageTime());
                                        out.println("</label>");
                                        out.println("</p>");
                                        out.println("<div class='panel-body'>");
                                        out.println("<form   action='../ViewFullMessage_Customer' class='form-horizontal' id='viewVendorMessage' method='POST'  role='form'>");

                                        out.println("<label>");
                                        out.println("Email Address:");
                                        out.println("</label >");
                                        out.println("<label  id='email' name='email'  >");
                                        out.println(messageCustomer.getCustomeremail());
                                        out.println("</label >");
                                        out.println("<br/>");

                                        out.println("<label >");
                                        out.println("Contact Number:");
                                        out.println("</label >");
                                        out.println("<label id='contact' name='contact'  >");
                                        out.println(messageCustomer.getContactno());
                                        out.println("</label >");

                                        out.println("<textarea rows=4 class='form-control' id='message' name='message'  readonly>");
                                        out.println(messageCustomer.getMessage());
                                        out.println("</textarea");
                                        out.println("</br>");
                                        out.println("</br>");
                                        out.println("<button type='submit' name='formsubmit' id='formsubmit' value='" + messageCustomer.getId() + "' class='btn btn-default col-xs-2 col-xs-offset-8'>");
                                        out.println("ok");
                                        out.println("</button");

                                        out.println("</form>");
                                        out.println("</form>");
                                        out.println("</div>");
                                        out.println("</div>");
                                        out.println("</div>");

                            %>



                            <%}
                                    }%>        


                        </div>
                    </div>
                    <%
                                        }%>
                </div>


                <!-- end of view vendor messages panel-->
        </section>
        <br><br><br>
        <%@include file="footer_sub.jsp" %>



    </body>
</html>
