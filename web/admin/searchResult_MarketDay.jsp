<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <!-- Start of head -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Search Result | MartRunner </title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font-awesome css -->
        <link type="text/css" href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">

        <style>
            a:link{
                text-decoration-line: none;
                text-decoration-line: none;
                text-decoration: none;
                text-decoration-color: skyblue;
            }
            a:visited{
                text-decoration-color: #337ab7;
            }
            a:hover {
                color: green;
            }
            #pageHeader{
                font-size: 25px;
                color: #71C671;
                font-family:new century schoolbook;
                font-weight:bold;
            }
        </style>
    </head>
    <!-- End of head -->

    <!-- Start of body -->
    <body>

        <!-- Include header file -->
        <%@include file="header_sub.jsp" %>

        <section>
            <div class="container">

                <!-- Start of side bar-->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">

                    <!-- Start of panel-->
                    <div class="panel panel-default hidden-xs hidden-sm" style="margin-top: 10px; width:auto;">
                        <div class="panel-body">
                            <center>

                                <!-- Start of inner body of start bar-->
                                <div style="width:auto; height:auto; background-color:#71C671; margin-top:10px;"> 

                                    <!-- Side bar title-->
                                    <label style="color:#000; padding-top:15px; font-size:25px;"> Search Vendors </label>  

                                    <br/><br/>

                                    <!-- Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="adminHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>

                                    <br/><br/>

                                    <!-- search by market day icon-->
                                    <span class="fa fa-search" style="font-size:75px; color: #d58512; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto" href="searchMarket_Admin.jsp">
                                        <strong> Search by <br/> Market</strong>
                                    </a>
                                    <br/><br/>

                                </div>
                                <!-- End of inner body of start bar-->
                            </center>
                        </div>

                    </div>
                    <!-- End of panel-->

                </div>
                <!-- End of side bar-->

                <!-- Start of Search results panel-->
                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-9" style="padding-top: 10px;">

                        <div class="panel panel-default" >

                            <br/>

                            <%                                String maretDays[] = (String[]) session.getAttribute("marketDaysSelected");
                            %>

                            <!--header-->

                            <%
                                if (maretDays.length == 3) {
                            %>

                            <div id="pageHeader">
                                <center> <p> Vendors on <% out.println(maretDays[0]); %> , <% out.println(maretDays[1]); %> & <% out.println(maretDays[2]); %> </p></center>
                            </div>

                            <%
                            } else if (maretDays.length == 2) {
                            %>

                            <div id="pageHeader">
                                <center> <p> Vendors on <% out.println(maretDays[0]); %> & <% out.println(maretDays[1]); %>  </p></center>
                            </div>

                            <% } else { %>

                            <div id="pageHeader">
                                <center> <p> Vendors on <% out.println(maretDays[0]); %> </p></center>
                            </div>

                            <% } %>

                            <div class="panel-body" style="font-size: medium;">

                                <!-- Start of printing vendor list -->
                                <div class="row"> 

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >

                                        <div class="panel-body" style="font-size: medium;">

                                            <ul>
                                                <%                                                List<Vendor> SearchResults = (List<Vendor>) session.getAttribute("SearchResults");

                                                    int looplengthLeft;
                                                    int looplengthRight;

                                                    if (SearchResults.size() % 2 == 0) {
                                                        looplengthLeft = SearchResults.size() / 2;
                                                        looplengthRight = SearchResults.size() / 2;
                                                    } else {
                                                        looplengthLeft = SearchResults.size() / 2 + 1;
                                                        looplengthRight = SearchResults.size() / 2;
                                                    }

                                                    if (SearchResults != null) {
                                                        for (int i = 0; i < looplengthLeft; i++) {
                                                            Vendor vendor = new Vendor();
                                                            vendor = SearchResults.get(i);
                                                %>
                                                <li> <a href="../../MartRunner/CreateVendorProfile?param=<%=vendor.getVendorID()%>"> <%= vendor.getVendorName()%> </a> <br/> </li>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" >

                                        <div class="panel-body" style="font-size: medium;">
                                            <ul>
                                                <%
                                                    if (SearchResults != null && SearchResults.size() > 1) {
                                                        for (int i = looplengthRight; i < SearchResults.size(); i++) {
                                                            Vendor vendor = new Vendor();
                                                            vendor = SearchResults.get(i);
                                                %>
                                                <li> <a href="../../MartRunner/CreateVendorProfile?param=<%=vendor.getVendorID()%>"> <%= vendor.getVendorName()%> </a> <br/> </li>
                                                    <%
                                                            }
                                                        }
                                                    %>
                                            </ul>
                                        </div>
                                            
                                    </div>
                                </div>     
                                <!-- End of printing vendor list -->

                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Search results panel-->
            </div>
        </section>

        <!-- Include footer file -->
        <%@include file="footer_sub.jsp"%>

        <!-- jquery -->
        <script src="../static/js/jquery.js"></script>

    </body>
    <!-- End of body -->
</html>
