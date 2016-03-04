<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Visit | MartRunner </title>

        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/backgroundStyles.css" rel="stylesheet">
        <link href="../static/css/myvisitstyle.css" rel="stylesheet">
        <link href="../static/css/vendor_travel.css" rel="stylesheet">


    </head>
    <body>

        <jsp:include page="/VisitShop_Vendor" />
        <jsp:include page="header.jsp" /> 


        <%
            //Forces caches to obtain a new copy of the page from the origin server
            response.setHeader("Cache-Control", "no-cache");

            //Directs caches not to store the page under any circumstance
            response.setHeader("Cache-Control", "no-store");

            //Causes the proxy cache to see the page as "stale"
            response.setDateHeader("Expires", 0);

            //HTTP 1.0 backward compatibility
            response.setHeader("Pragma", "no-cache");
        %>

        <section>
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div id="left_side">
                            <div class="travelheader" style="font-size: 40px">
                                <center> <p style="font-size:35px"> Welcome to Good Market Shop </p></center>
                            </div>
                            <p>The Good Market organic and natural food shop is 
                                open everyday<b> <strong>from 8 AM to 8 PM</strong></b> <b>opposite</b> the Colombo <b>Racecourse</b> at 14 Reid Avenue, 
                                Colombo 7.  As you enter the Lakpahana gate, you'll see it on your left.</p>
                            <p>The shop has products from more than 65 Good Market approved vendors.  
                                It was started to complement the Thursday and Saturday events, strengthen 
                                organic supply chains and Good Market approved vendors, and make all-natural 
                                products more accessible and affordable. 
                                Profits are reinvested to support the Good Market mission.</p>


                        </div>
                        <!--____________________________________________________________________________________________________________________________________________-->
                        <!--Vendor list of good market shop vendors-->
                        <div>
                            <div class="travelheader" >
                                <p style="font-size:25px; color: #000"> Vendors on Good Market Shop</p>
                            </div>
                            <div class="form-group">

                                <div class="panel col-lg-4 col-md-4 col-sm-4 col-xs-offset-1" >
                                    <div  style="font-size: medium;">
                                        <ul>
                                        <%
                                            List<Vendor> SearchResults = (List<Vendor>) session.getAttribute("Mak");
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
                                                    Vendor temp = new Vendor();
                                                    temp = SearchResults.get(i);
                                        %>
                                        <li> <a href="../../MartRunner/CreateVendorProfile?param=<%=temp.getVendorID()%>"> <%= temp.getVendorName()%> </a> <br/> </li>
                                        <%
                                                }
                                            } else {
                                                System.out.println("No match found");
                                            }

                                        %>
                                        </ul>
                                    </div>
                                </div>


                                <div class="panel col-lg-4 col-md-4 col-sm-4 col-xs-offset-1" >



                                    <div  style="font-size: medium;">
                                        <ul>
                                        <%                                                System.out.println("size:" + SearchResults.size());

                                            if ((SearchResults != null) && (SearchResults.size() > 1)) {
                                                for (int i = looplengthRight; i < SearchResults.size(); i++) {
                                                    Vendor temp = new Vendor();
                                                    temp = SearchResults.get(i);
                                        %>
                                        <li> <a href="../../MartRunner/CreateVendorProfile?param=<%=temp.getVendorID()%>"> <%= temp.getVendorName()%> </a> <br/> </li>
                                        <%
                                                }
                                            } else {
                                                System.out.println("No match found");
                                            }

                                        %>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!--Image of Good market shop-->
                    <div class="col-lg-5">
                        <img src="../static/images/shop.jpg" alt="shop" style="PADDING-TOP: 40px">
                    </div>

                    <center><div class="panel col-lg-12 col-md-12 col-sm-12">

                            <div class="panel col-lg-6 col-md-6 col-sm-6" ><a href="contactUs.jsp"><i class="fa fa-location-arrow fa-3x"></i><b>Find location</b></a></div>

                        </div></center>

                </div>

            </div>

        </section>


        <%@include file="footer.jsp" %>

        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
    </body>
</html>
