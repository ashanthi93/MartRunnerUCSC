<%@page import="java.util.ArrayList"%>
<%@page import="java.time.Instant"%>
<%@page import="java.util.Date"%>
<%@page import="classes.Vendor"%>
<%@page import="org.joda.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Attendance Report Of A Day </title>

        <!-- Bootstrap Core CSS -->
        <link href="../../static/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body{
                font-family: serif;
            }
            .panel-default > .panel-heading {
                background-color:white;
            }

            table { 
                table-layout: fixed; 
            }
            table th, table td { 
                overflow: hidden; 
            }
            #subHead{
                text-decoration: underline; 
                margin-top: 20px; 
                margin-bottom: 20px; 
                font-style: italic; 
                font-size: large;
            }
        </style>

    </head>

    <body>

        <%
            List<Vendor> vendorList = new ArrayList();

            vendorList = (List<Vendor>) session.getAttribute("vendorList");

            //market day
            String day = (String) session.getAttribute("day");
            //admin
            String username = (String) session.getAttribute("User");
            //selected day
            String selectedDate = (String) session.getAttribute("selectedDate");
            //today
            LocalDate currentDate = LocalDate.now();

            
        %>

        <br/>

        <section>
            <div class="container">
                <div class="panel panel-default">

                    <div class="panel-heading">
                        <!-- start of report header -->
                        <div class="row">
                            <div class="col-sm-12">
                                <!-- logo -->
                                <div class="col-xs-2">
                                    <img src="../../static/images/logo.png">
                                </div>
                                <!-- topic of the report -->
                                <div class="col-sm-7">
                                    <h1 style="text-align: center;"> Vendor Attendance Report </h1>
                                </div>
                                <!--download and back buttons-->
                                <div class="col-sm-3">
                                    <button class="btn btn-primary hidden-print" onClick="window.print();">Download report</button>
                                    <a href="../reportViewAttendanceDate.jsp"><button class="btn btn-primary hidden-print" >Back</button></a>

                                </div>
                            </div>
                            <!--sub topic-->
                            <div class="row">
                                <div class="col-sm-12">
                                    <h3 style="text-align: center;"> (Attendance Report of Vendors on <% out.println(selectedDate); %>) </h3>
                                </div>
                            </div>

                            <!-- report generation details date and admin -->
                            <div class="row">
                                <div class="col-sm-12">
                                    <h4 id="left" style="float: left; margin-left: 10px;"> Generated By : <% out.println(username); %>  </h4>
                                    <h4 id="right" style="float: right; margin-right: 10px;"> Generated Date : <% out.println(currentDate);%> </h4>
                                </div>
                            </div>
                        </div>                   

                        <hr>
                        <div class="panel-body">
                            <!-- sub topic according to market day -->

                            <% if (day.equals("TH")) { %>

                            <h3 style="font-weight: bold; font-style: oblique;"> Attendance on <% out.println(selectedDate); %> - Thursday Market </h3>

                            <% } else { %>

                            <h3 style="font-weight: bold; font-style: oblique;"> Attendance on <% out.println(selectedDate); %> - Saturday Market </h3>

                            <% } %>

                            <div class="col-xs-12">
                                <!-- content table -->
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="width: 10%;"> Vendor Name </th>

                                            <th style="width: 10%; font-size: 12px;"> Attendance Status </th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <%
                                            for (Vendor v : vendorList) {
                                        %>
                                        <tr>

                                            <td> <% out.println(v.getVendorName()); %> </td>

                                            <%
                                                String status = v.getAttendance();
                                                if (status.equals("1")) {
                                            %>

                                            <td align="center"> <%out.println("<span class='glyphicon glyphicon-ok' style=''></span>");%> </td>

                                            <% } else { %>

                                            <td align="center"> <% out.println("<span style='font-size:25px;'>-</span>");%> </td>


                                            <%
                                                }
                                            %>

                                        </tr>

                                        <%
                                            }
                                        %>

                                    </tbody>
                                </table> 
                            </div>

                            <label> <i> This is an auto generated report from MartRunner. </i> </label>

                        </div>
                    </div>
                    </section>

                    <!-- jQuery -->
                    <script src="../static/js/jquery.js"></script>

                    <!-- Bootstrap Core JavaScript -->
                    <script src="../static/js/bootstrap.min.js"></script>

                    </body>
                    </html>
