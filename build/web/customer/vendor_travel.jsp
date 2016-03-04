<%@page import="classes.Vendor"%>
<%@page import="classes.ResultList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Travel Vendors | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <!--travel page CSS-->
        <link href="../static/css/vendor_travel.css" rel="stylesheet">

        <style type="text/css">
            #subHeader{
                background-color: #000;
                color: #fff;
                font-style: italic;
                padding-bottom: -10px;
                padding-top: -10px;
            }
        </style>

    </head>

    <body id="vendors">

        <jsp:include page="/searchVendorTravel" />
        <!-- Including Header Page-->
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

        <!-- Start of Vendor Travel Page Content-->
        <section>
            <div class="row" >
                <div class="col-sm-12  col-lg-12">
                    <div class="panel panel-default" style="margin-top: 10px; margin-left: 15px;margin-right: 15px;">
                        <div class="panel-body">
                            <!--content-->
                            <div class="col-xs-10 col-xs-offset-2 col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-1  col-lg-5 col-lg-offset-1">
                                <!--header-->
                                <div class="travelheader" >
                                    <p style="font-size: 35px"> Good Market Travel Vendors</p>
                                </div>

                                <!-- start of description-->
                                <div class="row">
                                    <div class="panel col-lg-11 col-md-11 col-sm-11" >
                                        <center><p style="font-size:16px">Good Market Travel vendors provide you facilities to visit all over Sri Lanka.Contact them  feel the freedom and the beauty of Sri Lanka and explore new experiences.</p></center>
                                    </div>
                                </div>
                                <!-- end of description-->
                                <br><br>

                                <!--Vendor List-->
                                 <div class="panel col-lg-6 col-md-6 col-sm-6" >
                                        <div  style="font-size: medium;">
                                            <ul>
                                            <%
                                                List<Vendor> SearchResults = (List<Vendor>) session.getAttribute("SearchResults");
                                                int looplengthLeft;
                                                int looplengthRight;
                                                                                               
                                                if(SearchResults.size()%2==0){
                                                    looplengthLeft = SearchResults.size()/2;
                                                    looplengthRight = SearchResults.size()/2;
                                                }else{
                                                    looplengthLeft = SearchResults.size()/2 + 1;
                                                    looplengthRight = SearchResults.size()/2;
                                                }

                                                if (SearchResults != null) {
                                                    for (int i = 0; i < looplengthLeft; i++) {
                                                        Vendor temp = new Vendor();
                                                        temp = SearchResults.get(i);
                                            %>
                                            <li> <a href="../../MartRunner/CreateVendorProfile?param=<%=temp.getVendorID()%>"> <%= temp.getVendorName() %> </a> <br/> </li>
                                                        <% 
                                                    }
                                                } else {
                                                    System.out.println("No match found");
                                                }

                                            %>
                                            </ul>
                                        </div>
                                    </div>


                                    <div class="panel col-lg-6 col-md-6 col-sm-6">
                                        <div  style="font-size: medium;">
                                            <ul>
                                            <%
                                                if (SearchResults != null && SearchResults.size()>1) {
                                                    
                                                    for (int i = looplengthRight; i < SearchResults.size(); i++) {
                                                        Vendor temp = new Vendor();
                                                        temp = SearchResults.get(i);
                                            %>
                                            <li> <a href="../../MartRunner/CreateVendorProfile?param=<%=temp.getVendorID()%>"> <%= temp.getVendorName() %> </a> <br/> </li>
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

                            <!--carousel-->	
                            <div class=" hidden-xs  col-sm-5   col-sm-offset-3 col-md-offset-1 col-md-5 col-lg-5 col-lg-offset-1">

                                <div class="carouselmargin">
                                    <div id="myCarousel" class="carousel slide">
                                        <!-- Carousel indicators -->
                                        <ol class="carousel-indicators">
                                            <li data-target="#myCarousel" data-slide-to="0"  class="active"></li>
                                            <li data-target="#myCarousel" data-slide-to="1" ></li>
                                            <li data-target="#myCarousel" data-slide-to="2" ></li>
                                            <li data-target="#myCarousel" data-slide-to="3" ></li>
                                            <li data-target="#myCarousel" data-slide-to="4" ></li>
                                            <li data-target="#myCarousel" data-slide-to="5" ></li>
                                            <li data-target="#myCarousel" data-slide-to="6" ></li>

                                        </ol> 
                                        <!-- Carousel items -->
                                        <div class="carousel-inner" >
                                            <div class="item active"> 
                                                <img class="carouselimage" src="../static/images/travel/polonnaruwa.jpg" alt="fourth slide">
                                                <div class="carousel-caption" >Gal Viharaya, Polonnaruwa</div>

                                            </div>

                                            <div class="item"> 
                                                <img class="carouselimage" src="../static/images/travel/beach.jpg" alt="Second slide"> 
                                                <div class="carousel-caption">Nilaveli Beach, Trinkomalee</div>
                                            </div>

                                            <div class="item">
                                                <img class="carouselimage" src="../static/images/travel/dalada.jpg"> 
                                                <div class="carousel-caption">Temple of Tooth, Kandy</div>

                                            </div>

                                            <div class="item"> 
                                                <img class="carouselimage" src="../static/images/travel/elephant.jpg" alt="Third slide"> 
                                                <div class="carousel-caption">Elephant Orphanage, Pinnawala</div>
                                            </div>

                                            <div class="item">
                                                <img class="carouselimage" src="../static/images/travel/tea.jpg" alt="fourth slide">
                                                <div class="carousel-caption">Mackwood Tea Estate, NuwaraEliya</div>
                                            </div>

                                            <div class="item"> 
                                                <img class="carouselimage" src="../static/images/travel/tiger.jpg" alt="fourth slide"> 
                                                <div class="carousel-caption">National Park, Wasgamuwa</div>
                                            </div>

                                            <div class="item"> 
                                                <img class="carouselimage" src="../static/images/travel/waterfall.jpg" alt="fourth slide"> 
                                                <div class="carousel-caption">Nelugolla Fall, Sinharaja</div>
                                            </div>
                                            <!-- Carousel nav --> 
                                            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                                            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <%@include  file="footer.jsp" %>

        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>

        <script>
            $("#myCarousel").carousel({interval: 2500});
        </script>
    </body>
</html>
