<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title> Apply | MartRunner </title>

        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
        <link href="../static/css/applyStyles.css" rel="stylesheet">
        <style type="text/css">
            #subHeader{
                background-color: #000;
                color: #fff;
                font-style: italic;
                padding-bottom: -10px;
                padding-top: -10px;
            }
            .imagecss{
                /*position: relative;*/
                height: 325px;
                width: 300px;
                margin-left: -25px;
                padding: 25px 35px 5px 25px;
                margin-top: -20px;
                
                
                

            }
        </style>

    </head>

    <body id="apply">

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
            <br>
            <center>
                <div class="row container">
                    <div class=" panel panel-primary col-xs-10 col-xs-offset-1 col-lg-10 ">
                        <p class="contenttext"> 
                        <div class="row panel panel-default">
                            
                            <div class= "col-xs-8" > 
                                <p class="contentheader">Procedure </p>
                                <br>
                                <p class="content5" style="text-align: justify;">The Good Market is Curated event.All vendors go through an application and review process to ensure they meet Good Market Standards.</p>


                                <p class="content5" style="text-align: justify;">
                                    The Good Market Commitee meets every Saturday evening to review new Applications by email or online Applications shouldbe filled and submitted before 3PM on Friday.paper Applicationshould be submitted at the Good Market Information Stall before 3PM on Saturday feedback from the commitee is should by the following Monday. 
                                </p >


                                <p class="content5 " style="text-align: justify;">The Committee prioritizes application that are at a higher level Good Market standards and have a clear social or environmental impact.please make sure you read the standards before completing an application form.including as much detailas possible on the application form makes the review process faster and easier.If you need help or have any question,contact Melani by e-mail or at 0770 208 642.

                                </p>
                                
                            </div>
                            <div class="col-xs-4">
                                <img src="../static/images/standards/standrads_main.jpg" class="imagecss"/>
                            </div>
                            

                        </div> 

                        <div class="row ">
                            <div class="col-xs-12">
                                <p class="contentheader2">Stall Reservation </p>
                                <p class="content6">
                                    Good Market events are set up to be sustainable, but not profit-making.  Stall fees are kept as low as possible to reduce the entry barrier for rural producers, small enterprises, and new businesses that are socially and environmentally responsible.  Stall payments are used to cover canopy rental, set-up, and take-down, electrical wiring, entertainment, promotional materials, bookkeeping, common facilities, metered electricity and water, and transport and communication expenses. </p>

                                <p class="content6">Good Market approved vendors can reserve stalls by pre-paying for either 4 consecutive weeks or 12 consecutive weeks. A full stall is 10 feet by 20 feet.  A half stall is 5 feet by 20 feet.  Rates include stall electricity, but do not include table and chair rental.  There is no vehicle access during market hours.  A refundable Rs. 1,000 security deposit is required for each venue.  Pre-payments can be made by cash, check or bank deposit.   </p><br>

                            </div>


                        </div>
                        <div class="row"> 
                            <div class="col-sm-6">         
                                <p class="content7" id="thus">Thursday Good Market </p>
                                <p class="content7">Venue:Diyatha Uyana market stall,Waters Edge,Battaramull</p>
                                <p class="content7">Open: 1PM to 9PM every ThursDay(Rain Or Shine)</p>
                                <p class="content7">Half Stall for 4 Thursday: Payment Due Rs 3,600(Rs. 900 per Thursday)</p>
                                <p class="content7">Full Stall for 4 Thursday:Payment Due Rs 7,200(Rs. 1,800 per Thursday)</p>
                                <p class="content7">Full Stall for 12 Thursday:Payment Due Rs 18,000(Rs. 1,500 per Thursday)</p>
                            </div>
                            <div class="col-sm-6">
                                <p class="content8" id="satu">Saturday Good Market </p>
                                <p class="content8">Venue:Nuga Tree car park,Colombo RaceCourse ,Colombo 7</p>
                                <p class="content8">Open: 10AM to 6PM every Saturday(Rain Or Shine)</p>
                                <p class="content8">Half Stall for 4 Saturday: Payment Due Rs 6,000(Rs. 1,500 per Saturday)</p>
                                <p class="content8">Full Stall for 4 Saturday:Payment Due Rs 11,200(Rs. 2,800 per Saturday)</p>
                                <p class="content8">Full Stall for 12 Saturday:Payment Due Rs 30,000(Rs. 2,500 per Saturday)</p>
                            </div>
                        </div>

                        <p class="contentheader3">Application Form </p>
                        <div class="row">
                            <div class="col-sm-6"> 
                                <h1 class="organic">Organic Products</h1>
                                <p class="content9">If you have tea, spices, coconut, rice, legumes, vegetables, fruit, plants, other farm products, or other organic products, please use the form for Organic Products.   </p>


                                <p> <a href="static/pdf/s_good_market_application_organic_products.pdf"> 
                                        <img src="../static/images/download.jpg" height="10" width="10">
                                    </a>
                                </p>

                                <h1 class="organic">Natural Food</h1>
                                <p class="content9">If you have packaged or ready-to-eat food and drink that is not made from 100% organic certified ingredients, please use the form for Natural Foods. </p>

                                <p> <a href="static/pdf/s_good_market_application_natural_foods.pdf">
                                        <img src="../static/images/download.jpg" height="10" width="10">
                                    </a>
                                </p>

                                <h1 class="organic">Natural Body & Home</h1>
                                <p class="content9">If you have personal care products or household cleaners, please use the form for Natural Body & Home. </p>

                                <p> <a href="static/pdf/s_good_market_application_natural_body_and_home.pdf">
                                        <img src="../static/images/download.jpg" height="10" width="10">
                                    </a>
                                </p>

                            </div>

                            <div class="col-sm-6">
                                <h1 class="organic">Arts & Handicrafts </h1>
                                <p class="content9">If you have artwork, clothing, accessories, housewares, or other handicrafts, please use the form for Arts & Handicrafts.</p>

                                <p> <a href="../static/pdf/s_good_market_application_arts_and_handicrafts.pdf">
                                        <img src="../static/images/download.jpg" height="10" width="10">
                                    </a>
                                </p>

                                <h1 class="organic">Travel</h1>
                                <p class="content9">If you provide tourism related services, please use the form for Travel.</p>

                                <p> <a href="../static/pdf/s_good_market_application_travel.pdf">
                                        <img src="../static/images/download.jpg" height="10" width="10">
                                    </a>
                                </p>

                                <h1 class="organic">General</h1>
                                <p class="content9">If you have products or services that are good for environment, for communities, or for health, but do not fit in one of the above product categories, please use the General application form.</p>  

                                <p> <a href="../static/pdf/s_good_market_application_general.pdf">
                                        <img src="../static/images/download.jpg" height="10" width="10">
                                    </a>
                                </p>

                            </div>             

                        </div>
                    </div>
                </div>
            </center>

        </section>

        <%@include file="footer.jsp" %>

        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>
    </body>
</html>


