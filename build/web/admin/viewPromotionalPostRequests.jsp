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
        <title> Post Requests | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="../static/css/bootstrap-combobox.css" rel="stylesheet">

        
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

        <!-- including the servlet, in which the list of new post requests send by the vendors, is set to the session-->
        <jsp:include page="/ViewPromotionalPostRequests_Vendor" />
        <section>

            <%  
                String errorMsg = "", successMsg = "";
                String errorHead = "", successHead = "";
                int error = 0, success = 0;

                if (session.getAttribute("error") != null) {

                    error = (Integer) session.getAttribute("error");
                    if (error == 1) {
                        errorHead = (String) session.getAttribute("errorHead");
                        errorMsg = (String) session.getAttribute("errorMsg");
                    }
                }

                if (session.getAttribute("success") != null) {

                    success = (Integer) session.getAttribute("success");
                    if (success == 1) {
                        successHead = (String) session.getAttribute("successHead");
                        successMsg = (String) session.getAttribute("successMsg");
                    }
                }

                //retrieving the new post request list from the session
                ArrayList<Vendor> requestList = (ArrayList<Vendor>) session.getAttribute("postRequestList");
                //obtaining the count of the new post requests
                int postRequestCount = requestList.size();

                //alert when there are no new post requests to view
                if (postRequestCount == 0) {

                    session.setAttribute("error", 1);
                    session.setAttribute("errorHead", "No New post requests !");
                    session.setAttribute("errorMsg", "No post requests to view!");
                    response.sendRedirect("adminHomePage.jsp");

                    //When there are new post requests to view
                } else if (postRequestCount > 0) {

            %>
            <div class="container" >

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >

                    <!-- start of view promotional post requests panel-->
                    <div class="panel panel-default" style="margin-top: 10px;">

                        <!--start of panel Topic-->
                        <div class="panel-heading" style="background-color: #71C671;">
                            <div class="row">
                                <p class="panel-title col-xs-8" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> Post Requests </p>
                            </div>
                        </div>
                        <!--end of panel Topic-->

                        <!--start of panel Body-->
                        <div class="panel-body">
                            <%                                Vendor vendor = new Vendor();
                                if (!(requestList.isEmpty())) {
                                    for (Vendor requestVendor : requestList) {

                                        //Retriving name of the requested vendor
                                        String vName = requestVendor.getVendornameByVendorID();

                                        out.println("<div class='col-xs-6 col-sm-6 col-md-6 col-lg-6' >");

                                        //start of panel
                                        out.println("<div class='panel panel-default'>");

                                        //start of panel title
                                        out.println("<p class='panel-title' style='color:#218868; background-color: #C1FFC1; font-weight: bold; padding-left: 5px; font-family: lucida bright;'>");
                                        out.println(vName);
                                        out.println("<span class='badge' style='font-size: 8px; background-color: red;'>");
                                        out.println("New");
                                        out.println("</span>");
                                        out.println("&nbsp;&nbsp;&nbsp;");
                                        out.println("<label style='font-family: lucida bright;'>");
                                        out.println(requestVendor.getMessageTime());
                                        out.println("</label>");
                                        out.println("</p>");
                                        //end of panel title

                                        //start of panel body
                                        out.println("<div class='panel-body'>");

                                        //start of form
                                        out.println("<form action='../ApprovePostRequests_Vendor' class='form-horizontal' id='postRequests' method='POST'  role='form'>");

                                        //start of image div
                                        out.println("<div  id='image' name='image' align='center'>");
                                        // out.println("static/images/PromotionalPost/"+requestVendor.getVendorID()+".jpg");
                                        out.println("<img src='../static/images/VendorPromotionalPost/" + requestVendor.getVendorID() + ".jpg' style='width: 300px; height: 300px;'>");
                                        out.println("</div >");
                                        //end of image div

                                        out.println("<br/>");
                                        out.println("<br/>");

                                        //start of approve button
                                        out.println("<button type='submit' name='formsubmit' id='formsubmit'style='font-family: lucida bright;' value='" + requestVendor.getRequestId() + "' class='btn btn-default col-xs-2 col-xs-offset-4' >");
                                        out.println("Approve");
                                        out.println("</button>");
                                        //end of approve button

                                        //start of reject button
                                        out.println("<button type='submit' name='formsubmitReject' id='formsubmitReject' style='font-family: lucida bright;' value='" + requestVendor.getRequestId() + "' class='btn btn-default col-xs-2 col-xs-offset-1'>");
                                        out.println("Reject");
                                        out.println("</button>");
                                        //end of reject button

                                        out.println("</form>");
                                        //end of form

                                        out.println("</div>");
                                        //end of panel body

                                        out.println("</div>");
                                        //End of panel

                                        out.println("</div>");

                            %>



                            <%}
                                }%>        


                        </div>
                        <!--end of panel Body-->

                    </div>
                    <!-- end of view promotional post requests panel-->

                </div>
            </div>

            <!-- Modal Error -->
            <div class="modal" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="color: red;">                        
                            <h4 class="modal-title" id="errorHead"> <% out.println(errorHead);%> </h4>
                        </div>
                        <div class="modal-body">
                            <p id="errorMsg" style="font-weight: normal;"> <% out.println(errorMsg);%> </p>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger" data-dismiss="modal"> OK </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Success -->
            <div class="modal" id="successModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header" style="color: green;">                        
                            <h4 class="modal-title" id="successHead"> <% out.println(successHead);%> </h4>
                        </div>
                        <div class="modal-body">
                            <p id="successMsg" style="font-weight: normal;"> <% out.println(successMsg);%> </p>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-success" data-dismiss="modal"> OK </button>
                        </div>
                    </div>
                </div>
            </div>
            <%}%>


        </section>
        <br><br><br>
        <!--Footer -->
        <%@include file="footer_sub.jsp" %>

        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/main.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>

        <!-- To handle modal -->
        <script>
            var error = '<%= error%>';

            if (error == 1) {

                $(window).load(function () {
                    $('#errorModal').modal('show');
                });

            <%
                session.removeAttribute("error");
                session.removeAttribute("errorHead");
                session.removeAttribute("errorMsg");
            %>
            }

            var success = '<%= success%>';

            if (success == 1) {

                $(window).load(function () {
                    $('#successModal').modal('show');
                });

            <%
                session.removeAttribute("success");
                session.removeAttribute("successHead");
                session.removeAttribute("successMsg");
            %>
            }

        </script>

    </body>
</html>
