<%@page import="classes.Vendor"%>
<%@page import="java.util.Calendar"%>
<%@page import="classes.ResultList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> VisitSaturday Good Market | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <!--travel page CSS-->
        <link href="../static/css/vendor_travel.css" rel="stylesheet">

    </head>

    <body id="vendors">
        
        <!--Include VisitSaturday_Vendor servlet -->
        <jsp:include page="/VisitSaturday_Vendor" />
        
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

        <!-- Start of Customer visit Page Content-->
        <section>
            <div class="row" >
                <div class="col-sm-12  col-lg-12">
                    <div class="panel panel-default" style="margin-top: 10px; margin-left: 15px;margin-right: 15px;">
                        <div class="panel-body">
                            <!--content-->
                            <div class="col-xs-10 col-xs-offset-2 col-sm-6 col-sm-offset-3  col-md-5 col-md-offset-1  col-lg-5 col-lg-offset-1">
                                <!--header-->
                                <div class="travelheader" style="font-size: 40px">
                                    <center> <p style="font-size:35px"><marquee direction="left"> Welcome to Saturday Good Market</marquee> </p></center>
                                </div>
                                
                                <p>&nbsp;<b style="color: #006400">Location</b>: Nuga Tree car park at the <strong style="color: #009900">Racecource</strong> in colombo 07</p>
                                <p>&nbsp;<b style="color: #006400">Venue</b>: Saturday from <b style="color: #009900">10 AM to 6 PM</b>(rain or shine)</p>
                            <!--<h3>&nbsp;&nbsp;Attending Vendors on Saturday Good Market</h3>-->
                            <div class="travelheader" >
                                <p style="font-size:25px; color: #000"> Attending Vendors on Saturday Good Market</p>
                            </div>
    <!--___________________________________________________________________________________________________________________________________________-->
                                <!--Vendor List of Attending Vendors-->
                                <div class="panel col-lg-6 col-md-6 col-sm-6" >
                                        <div  style="font-size: medium;">
                                            <ul>
                                            <%
                                                List<Vendor> SearchResults = (List<Vendor>) session.getAttribute("sat");
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


                                    <div class="panel col-lg-6 col-md-6 col-sm-6" >
                                        <div  style="font-size: medium;">
                                            <ul>
                                            <%                                              
                                                System.out.println("size:" + SearchResults.size());
                                                

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
                                    <!--end of Attending vendor List-->   
    <!--______________________________________________________________________________________________________________________________________-->
                                    <!--Vendor List of Other Saturday vendors-->        
                                    <div class="travelheader" >
                                        <p style="font-size:25px; color: #000"> Other Vendors on Saturday Good Market</p>
                                    </div>
                                    <div class="panel col-lg-6 col-md-6 col-sm-6" >
                                        <div  style="font-size: medium;">
                                            <ul>
                                            <%
                                                List<Vendor> SearchResults1 = (List<Vendor>) session.getAttribute("remainSat");
                                                int looplengthLeft1;
                                                int looplengthRight1;
                                                                                               
                                                if(SearchResults1.size()%2==0){
                                                    looplengthLeft1 = SearchResults1.size()/2;
                                                    looplengthRight1 = SearchResults1.size()/2;
                                                }else{
                                                    looplengthLeft1 = SearchResults1.size()/2 + 1;
                                                    looplengthRight1 = SearchResults1.size()/2;
                                                }

                                                if (SearchResults1 != null) {
                                                    for (int i = 0; i < looplengthLeft1; i++) {
                                                        Vendor temp = new Vendor();
                                                        temp = SearchResults1.get(i);
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


                                    <div class="panel col-lg-6 col-md-6 col-sm-6" >
                                        <div  style="font-size: medium;">
                                            <ul>
                                            <%                                              
                                                System.out.println("size:" + SearchResults1.size());
                                                

                                                if (SearchResults1 != null && SearchResults1.size()>1) {
                                                    for (int i = looplengthRight1; i < SearchResults1.size(); i++) {
                                                        Vendor temp = new Vendor();
                                                        temp = SearchResults1.get(i);
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
                                <!--end of other vendors list-->
    <!--______________________________________________________________________________________________________________________________________________-->
                                            
                          <!-- <div id="other_set" style="font-size: medium;">-->
                              
                                    <!--Link for stall assignment & contact us pages-->
                                    <div class="panel col-lg-12 col-md-12 col-sm-12" >
                                        <div class="panel col-lg-6 col-md-6 col-sm-6" ><a href="saturdayStallAssignment.jsp"><i class="fa fa-map-marker fa-3x"></i><b>stall map</b></a></div>
                                        <div class="panel col-lg-6 col-md-6 col-sm-6" ><a href="contactUs.jsp"><i class="fa fa-location-arrow fa-3x"></i><b>Find location</b></a></div>
                                                
                                    </div>
                                          

                       <!-- </div>-->
                     </div>
                    
    <!--_____________________________________________________________________________________________________________________________________________-->
                    
                            <!--get day of week-->
                            <%
                                                Calendar cal=Calendar.getInstance();
                                                int dayOfweek=cal.get(Calendar.DAY_OF_WEEK);
                                                
                                                
                            %>
                            
                            <!--If day is Friday or Saturday show promotional image-->
                            <% if(dayOfweek==6 || dayOfweek==7){ %>
                            <div class=" hidden-xs  col-sm-5   col-sm-offset-3 col-md-offset-1 col-md-5 col-lg-5 col-lg-offset-1">
                                <div><marquee direction="up" onmouseover="this.stop();" onmouseout="this.start();" style="width:400px;height:550px;"><img class="carouselimage"  style="width:400px;height:1200px;" src="../static/images/PromotionalPost/out.jpg"></marquee> </div>
                            <% }else{ %>
                            
                            <!--else show the image slider-->
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
                                                <img class="carouselimage" src="../static/images/visit/visit4.jpg">
                                            </div>

                                            <div class="item"> 
                                                <img class="carouselimage" src="../static/images/visit/visit6.jpg"> 
                                            </div>

                                            <div class="item">
                                                <img class="carouselimage" src="../static/images/visit/visit3.jpg">
                                            </div>

                                            <div class="item"> 
                                                <img class="carouselimage" src="../static/images/visit/visit7.jpg"> 
                                            </div>

                                            <div class="item">
                                                <img class="carouselimage" src="../static/images/visit/visit2.jpg">                                            </div>

                                            <div class="item"> 
                                                <img class="carouselimage" src="../static/images/visit/visit5.jpg">                                                
                                            </div>

                                            <div class="item"> 
                                                <img class="carouselimage" src="../static/images/visit/visit1.jpg">                                                
                                            </div>
                                            <!-- Carousel nav --> 
                                            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                                            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>

                                        </div>
                                    </div>
                                </div> 
                             </div>
                                     <% } %>
                            </div>
    <!--_______________________________________________________________________________________________________________________________________-->
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
