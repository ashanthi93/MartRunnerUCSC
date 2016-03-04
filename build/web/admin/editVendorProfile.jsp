<%@page import="classes.Vendor"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Edit Vendor Profile | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <style type="text/css">
            h5{
                font-weight: bold; 
                font-family: lucida bright; 
                color:#218868;
                background-color: #C1FFC1;
                padding: 5px;
            }
            label.required:after {
                content: "*";
                color: red;
            }
        </style>
    </head>

    <body>

        <!--Including Header Page-->
        <%@include file="header_sub.jsp" %>

        <%            Vendor vendor = (Vendor) session.getAttribute("vendor");

            /* To handle error messages or success messages */
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
        %>

        <section>
            <!-- Start of create vendor account content-->
            <div class="container">

                <!-- Start of side bar-->
                <div class="col-lg-3 col-md-3 hidden-xs hidden-sm">

                    <!-- Start of panel-->
                    <div class="panel panel-default" style="margin-top: 10px; width:auto;">
                        <div class="panel-body">
                            <center>

                                <!-- Start of inner body of start bar-->
                                <div style="width:auto; height:auto; background-color:#71C671; margin-top:10px;"> 

                                    <!-- Side bar title-->
                                    <label style="color:#000; padding-top:15px; font-size:25px;"> Vendor Handling </label>  

                                    <br/><br/>

                                    <!-- Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="adminHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Create vendor icon-->
                                    <span class="fa fa-user-plus" style="font-size:75px; color: #d58512; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/> 
                                    <a class="btn btn-default" style="width:auto" href="createVendor_Admin.jsp">
                                        <strong>Create Vendor</strong>
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Update vendor profile icon-->
                                    <span class="glyphicon glyphicon-edit" style="font-size:75px; color:#009; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/> 
                                    <a class="btn btn-default active" style="width:auto;" href="updateVendorProfile_Admin.jsp" >
                                        <strong> Update Vendor <br/> Profile</strong> 
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Remove vendor icon-->
                                    <span class="glyphicon glyphicon-remove-sign" style="font-size:75px; color: red; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="removeVendorProfile_Admin.jsp"> 
                                        <strong> Remove Vendor </strong> 
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

                <!-- Start of Create vendor account-->
                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">

                        <label id="welcome"> </label>

                        <div class="panel panel-default" style="margin-top: 10px;">

                            <!-- Start of Header of Create vendor account-->
                            <div class="panel-heading" style="background-color:#71C671;">
                                <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Edit Vendor Profile </div>
                            </div>
                            <!-- End of Header of Create vendor account-->

                            <!-- Start of Body of Create vendor account-->
                            <div class="panel-body">
                                <form action="${pageContext.request.contextPath}/EditProfile" class="form-horizontal" method="POST" role="form" name="createVendor" onsubmit="return(checkChange())" novalidate>

                                    <!-- Start of personal details-->
                                    <div id="personalDetails">
                                        <h5> Personal Details </h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">

                                                <!-- First Name-->
                                                <label for="firstName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> First Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="<%=vendor.getUserFirstname()%>" value="<%=vendor.getUserFirstname()%>" onchange="markChange()"/>
                                                    <label id="errorFirstName" style="font-size:10px"> </label>
                                                </div>

                                                <!-- Last Name-->
                                                <label for="lastName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Last Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="<%=vendor.getUserLastName()%>" value="<%=vendor.getUserLastName()%>" onchange="markChange()"/>
                                                    <label id="errorLastName" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Vendor Name-->
                                                <label for="vendorName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Vendor Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="vendorName" name="vendorName" placeholder="<%=vendor.getVendorName()%>" value="<%=vendor.getVendorName()%>" onchange="markChange()"/>
                                                    <label id="errorVendorName" style="font-size:10px"> </label>
                                                </div>

                                                <!-- NIC Number-->
                                                <label for="nicNumber" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> NIC Number </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="nicNumber" name="nicNumber" placeholder="<%=vendor.getUserNIC()%>" value="<%=vendor.getUserNIC()%>" maxlength="10" onchange="markChange()"/>
                                                    <label id="errorNicNumber" style="font-size:10px"> </label>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- End of personal details-->

                                    <!-- Start of contact details-->
                                    <div id="contactDetails">
                                        <h5> Contact Details </h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Address-->
                                                <label for="address" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Address </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <textarea class="form-control" id="address" name="address" placeholder="<%=vendor.getAddress()%>" onchange="markChange()"> <% out.print(vendor.getAddress());%></textarea>
                                                    <label id="errorAddress" style="font-size:10px"> </label>
                                                </div>

                                                <!-- Mobile number-->
                                                <label for="mobileNumber" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Mobile Number </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="<%=vendor.getUserContactNo()%>" value="<%=vendor.getUserContactNo()%>" maxlength="10" onchange="markChange()"/>
                                                    <label id="errorMobileNumber" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Fixed Line-->
                                                <label for="fixedLine" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left;"> Fixed Line </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="tel" class="form-control" id="fixedLine" name="fixedLine" placeholder="<%=vendor.getFixedLine()%>" value="<%=vendor.getFixedLine()%>" maxlength="10" onchange="markChange()"/>
                                                    <label id="errorFixedLine" style="font-size:10px"> </label>
                                                </div>

                                                <% if (!vendor.getUserEmail().equals("")) {%>    
                                                <!-- Email-->
                                                <label for="email" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left;"> Email Address </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="email" class="form-control" id="email" name="email" placeholder="<%=vendor.getUserEmail()%>" value="<%=vendor.getUserEmail()%>" onchange="markChange()"/>
                                                    <label id="errorEmail" style="font-size:10px"> </label>
                                                </div>

                                                <% }%>
                                            </div>
                                        </div>

                                        <!-- Start of Social Links-->
                                        <div class="row">
                                            <div class="form-group">
                                                <!-- Facebook id-->
                                                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                                    <div class="social-icons control-label col-lg-2 col-lg-offset-10 col-md-2 col-md-offset-3 col-sm-2 col-sm-offset-3 hidden-xs">
                                                        <i class="fa fa-facebook-square" style="color: #1C0374;"></i>
                                                    </div>
                                                    <label for="fbID" class="visible-xs col-xs-6 col-xs-offset-0"> Facebook Link </label>
                                                    <div class="col-lg-12 col-lg-offset-6 col-md-12 col-sm-12 col-xs-6 col-xs-offset-0">
                                                        <input type="url" class="form-control hidden-xs" id="fbID" name="fbID" placeholder="<%=vendor.getFbLink()%>" value="<%=vendor.getFbLink()%>" onchange="markChange()"/>
                                                        <input type="url" class="form-control visible-xs" id="fbID" name="fbID" placeholder="<%=vendor.getFbLink()%>" value="<%=vendor.getFbLink()%>" onchange="markChange()"/>
                                                        <label id="errorFB" style="font-size:10px"> </label>
                                                    </div>
                                                </div>

                                                <!-- Google plus id-->
                                                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                                    <div class="social-icons control-label col-lg-2 col-lg-offset-10 col-md-2 col-md-offset-3 col-sm-2 col-sm-offset-3 hidden-xs">
                                                        <i class="fa fa-google-plus-square" style="color: #BC2312;"></i>
                                                    </div>
                                                    <label for="gPlusD" class="visible-xs col-xs-6 col-xs-offset-0"> Google Plus Link </label>
                                                    <div class="col-lg-12 col-lg-offset-6 col-md-12 col-sm-12 col-xs-6 col-xs-offset-0">
                                                        <input type="url" class="form-control hidden-xs" id="gPlusID" name="gPlusID" placeholder="<%=vendor.getgPlus()%>" value="<%=vendor.getgPlus() %>" onchange="markChange()"/>
                                                        <input type="url" class="form-control visible-xs" id="gPlusID" name="gPlusID" placeholder="<%=vendor.getgPlus()%>" value="<%=vendor.getgPlus() %>" onchange="markChange()"/>
                                                        <label id="errorGPlus" style="font-size:10px"> </label>
                                                    </div>
                                                </div>

                                                <!-- Tweeter id-->
                                                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                                    <div class="social-icons control-label col-lg-2 col-lg-offset-10 col-md-2 col-md-offset-3 col-sm-2 col-sm-offset-3 hidden-xs">
                                                        <i class="fa fa-twitter-square" style="color: #0066CC;"></i>
                                                    </div>
                                                    <label for="tweeterID" class="visible-xs col-xs-6 col-xs-offset-0"> Tweeter Link </label>
                                                    <div class="col-lg-12 col-lg-offset-6 col-md-12 col-sm-12 col-xs-6 col-xs-offset-0">
                                                        <input type="url" class="form-control hidden-xs" id="tweeterID" name="tweeterID" placeholder="<%=vendor.getTweeter()%>" value="<%=vendor.getTweeter()%>" onchange="markChange()"/>
                                                        <input type="url" class="form-control visible-xs" id="tweeterID" name="tweeterID" placeholder="<%=vendor.getTweeter()%>" value="<%=vendor.getTweeter()%>" onchange="markChange()"/>
                                                        <label id="errorTweeter" style="font-size:10px"> </label>
                                                    </div>
                                                </div>   

                                            </div>
                                        </div>
                                        <!-- End of Social links-->

                                    </div>
                                    <!-- End of contact details-->

                                    <!-- Start of Category details-->
                                    <div id="categoryDetails">
                                        <h5> Category Details </h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Main Category-->
                                                <label for="mainCategory" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Main Category </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="mainCategory" name="mainCategory" onchange="markChange()">
                                                        <% if (vendor.getMainCatg().equals("SE")) {%>
                                                        <option id="mainCategory" name="mainCategory" value="SE" selected="selected"> Social Enterprise</option> 
                                                        <option id="mainCategory" name="mainCategory" value="RP"> Rural Producers</option> 
                                                        <option id="mainCategory" name="mainCategory" value="RB"> Responsible Business</option>
                                                        <%} else if (vendor.getMainCatg().equals("RP")) {%>
                                                        <option id="mainCategory" name="mainCategory" value="RP" selected="selected"> Rural Producers</option>
                                                        <option id="mainCategory" name="mainCategory" value="SE"> Social Enterprise</option> 
                                                        <option id="mainCategory" name="mainCategory" value="RB"> Responsible Business</option>
                                                        <%} else {%>
                                                        <option id="mainCategory" name="mainCategory" value="RB" selected="selected"> Responsible Business</option>
                                                        <option id="mainCategory" name="mainCategory" value="RP"> Rural Producers</option>
                                                        <option id="mainCategory" name="mainCategory" value="SE"> Social Enterprise</option>
                                                        <%} %>
                                                    </select>
                                                    <label id="errorMain" style="font-size:10px;"></label>
                                                </div>

                                                <!-- Packaging level-->
                                                <label for="pkgLevel" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Packaging Level </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="pkgLevel" name="pkgLevel" onchange="markChange()"> 
                                                        <% if (vendor.getPkgLevel() == 1) {%>
                                                        <option id="pkgLevel" name="pkgLevel" value="1" selected="selected">Level 1</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="2">Level 2</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="3">Level 3</option>
                                                        <% } else if (vendor.getPkgLevel() == 2) {%>
                                                        <option id="pkgLevel" name="pkgLevel" value="1">Level 1</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="2" selected="selected">Level 2</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="3">Level 3</option>
                                                        <% } else {%>
                                                        <option id="pkgLevel" name="pkgLevel" value="1">Level 1</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="2">Level 2</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="3" selected="selected">Level 3</option>
                                                        <% } %>
                                                    </select>
                                                    <label id="errorPkg" style="font-size: 10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Product Category-->
                                                <label for="productCategory" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Product Category </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="productCategory" name="productCategory" onchange="markChange()"> 
                                                        <% if (vendor.getProductCatgID().equals("AF")) {%>
                                                        <option id="productCategory" name="productCategory" value="OP">Organic Products</option>
                                                        <option id="productCategory" name="productCategory" value="AF" selected="selected">Animal based Farm Products</option>
                                                        <option id="productCategory" name="productCategory" value="PF">Prepared Food</option>
                                                        <option id="productCategory" name="productCategory" value="NB">Natural Body & Home</option> 
                                                        <option id="productCategory" name="productCategory" value="AH">Art & Handicraft</option>
                                                        <option id="productCategory" name="productCategory" value="TR">Travel</option> 
                                                        <option id="productCategory" name="productCategory" value="SP">Service Providers</option>
                                                        <% } else if (vendor.getProductCatgID().equals("AH")) {%>
                                                        <option id="productCategory" name="productCategory" value="OP">Organic Products</option>
                                                        <option id="productCategory" name="productCategory" value="AF">Animal based Farm Products</option>
                                                        <option id="productCategory" name="productCategory" value="PF">Prepared Food</option>
                                                        <option id="productCategory" name="productCategory" value="NB">Natural Body & Home</option> 
                                                        <option id="productCategory" name="productCategory" value="AH" selected="selected">Art & Handicraft</option>
                                                        <option id="productCategory" name="productCategory" value="TR">Travel</option> 
                                                        <option id="productCategory" name="productCategory" value="SP">Service Providers</option>
                                                        <% } else if (vendor.getProductCatgID().equals("NB")) {%>
                                                        <option id="productCategory" name="productCategory" value="OP">Organic Products</option>
                                                        <option id="productCategory" name="productCategory" value="AF">Animal based Farm Products</option>
                                                        <option id="productCategory" name="productCategory" value="PF">Prepared Food</option>
                                                        <option id="productCategory" name="productCategory" value="NB" selected="selected">Natural Body & Home</option> 
                                                        <option id="productCategory" name="productCategory" value="AH">Art & Handicraft</option>
                                                        <option id="productCategory" name="productCategory" value="TR">Travel</option> 
                                                        <option id="productCategory" name="productCategory" value="SP">Service Providers</option>
                                                        <% } else if (vendor.getProductCatgID().equals("OP")) {%>
                                                        <option id="productCategory" name="productCategory" value="OP" selected="selected">Organic Products</option>
                                                        <option id="productCategory" name="productCategory" value="AF">Animal based Farm Products</option>
                                                        <option id="productCategory" name="productCategory" value="PF">Prepared Food</option>
                                                        <option id="productCategory" name="productCategory" value="NB">Natural Body & Home</option> 
                                                        <option id="productCategory" name="productCategory" value="AH">Art & Handicraft</option>
                                                        <option id="productCategory" name="productCategory" value="TR">Travel</option> 
                                                        <option id="productCategory" name="productCategory" value="SP">Service Providers</option>
                                                        <% } else if (vendor.getProductCatgID().equals("PF")) {%>
                                                        <option id="productCategory" name="productCategory" value="OP">Organic Products</option>
                                                        <option id="productCategory" name="productCategory" value="AF">Animal based Farm Products</option>
                                                        <option id="productCategory" name="productCategory" value="PF" selected="selected">Prepared Food</option>
                                                        <option id="productCategory" name="productCategory" value="NB">Natural Body & Home</option> 
                                                        <option id="productCategory" name="productCategory" value="AH">Art & Handicraft</option>
                                                        <option id="productCategory" name="productCategory" value="TR">Travel</option> 
                                                        <option id="productCategory" name="productCategory" value="SP">Service Providers</option>
                                                        <% } else if (vendor.getProductCatgID().equals("SP")) {%>
                                                        <option id="productCategory" name="productCategory" value="OP">Organic Products</option>
                                                        <option id="productCategory" name="productCategory" value="AF">Animal based Farm Products</option>
                                                        <option id="productCategory" name="productCategory" value="PF">Prepared Food</option>
                                                        <option id="productCategory" name="productCategory" value="NB">Natural Body & Home</option> 
                                                        <option id="productCategory" name="productCategory" value="AH">Art & Handicraft</option>
                                                        <option id="productCategory" name="productCategory" value="TR">Travel</option> 
                                                        <option id="productCategory" name="productCategory" value="SP" selected="selected">Service Providers</option>
                                                        <% } else {%>
                                                        <option id="productCategory" name="productCategory" value="OP">Organic Products</option>
                                                        <option id="productCategory" name="productCategory" value="AF">Animal based Farm Products</option>
                                                        <option id="productCategory" name="productCategory" value="PF">Prepared Food</option>
                                                        <option id="productCategory" name="productCategory" value="NB">Natural Body & Home</option> 
                                                        <option id="productCategory" name="productCategory" value="AH">Art & Handicraft</option>
                                                        <option id="productCategory" name="productCategory" value="TR" selected="selected">Travel</option> 
                                                        <option id="productCategory" name="productCategory" value="SP">Service Providers</option>
                                                        <% }%>
                                                    </select>
                                                    <label id="errorProductCatg" style="font-size: 10px;"> </label>
                                                </div>

                                                <!-- Social Impact level-->
                                                <label for="socialImpactLevel" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Social Impact Level </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="socialImpactLevel" name="socialImpactLevel" onchange="markChange()">
                                                        <% if (vendor.getSiLevel() == 1) {%>
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="1" selected="selected">Level 1</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="2">Level 2</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="3">Level 3</option>
                                                        <% } else if (vendor.getSiLevel() == 2) {%>
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="1">Level 1</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="2" selected="selected">Level 2</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="3">Level 3</option>
                                                        <% } else {%>
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="1">Level 1</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="2">Level 2</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="3" selected="selected">Level 3</option>
                                                        <% } %>
                                                    </select>
                                                    <label id="errorSocial" style="font-size: 10px;"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="productLevel" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Product Level </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="productLevel" name="productLevel" onchange="markChange()">
                                                        <% if (vendor.getProductLevel() == 1) {%>
                                                        <option id="productLevel" name="productLevel" value="1" selected="selected">Level 1</option> 
                                                        <option id="productLevel" name="productLevel" value="2">Level 2</option> 
                                                        <option id="productLevel" name="productLevel" value="3">Level 3</option>
                                                        <% } else if (vendor.getProductLevel() == 2) {%>
                                                        <option id="productLevel" name="productLevel" value="1">Level 1</option> 
                                                        <option id="productLevel" name="productLevel" value="2" selected="selected">Level 2</option> 
                                                        <option id="productLevel" name="productLevel" value="3">Level 3</option>
                                                        <% } else {%>
                                                        <option id="productLevel" name="productLevel" value="1">Level 1</option> 
                                                        <option id="productLevel" name="productLevel" value="2">Level 2</option> 
                                                        <option id="productLevel" name="productLevel" value="3" selected="selected">Level 3</option>
                                                        <% } %>
                                                    </select>
                                                    <label id="errorLevel" style="font-size: 10px"> </label>
                                                </div>

                                                <!-- Environmental Impact level-->
                                                <label for="envImpactLevel" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Environmental Impact Level </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="envImpactLevel" name="envImpactLevel" onchange="markChange()">
                                                        <% if (vendor.getEiLevel() == 1) {%>
                                                        <option id="envImpactLevel" name="envImpactLevel" value="1" selected="selected">Level 1</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="2">Level 2</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="3">Level 3</option>
                                                        <% } else if (vendor.getEiLevel() == 2) {%>
                                                        <option id="envImpactLevel" name="envImpactLevel" value="1">Level 1</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="2" selected="selected">Level 2</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="3">Level 3</option>
                                                        <% } else {%>
                                                        <option id="envImpactLevel" name="envImpactLevel" value="1">Level 1</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="2">Level 2</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="3" selected="selected">Level 3</option>
                                                        <% }%>
                                                    </select>
                                                    <label id="errorEnv" style="font-size: 10px;"> </label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- End of Category details-->

                                    <!-- Start of Product details-->
                                    <div id="productDetails">
                                        <h5>Product Details</h5>

                                        <!--products-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="productsTxt" class="col-xs-2  col-sm-2 col-md-2 col-lg-2 control-label required" style="display: inline-block; text-align: left;">Products</label>
                                                <div class="col-xs-8 col-xs-offset-1 col-sm-8 col-md-8 col-lg-8">
                                                    <textarea  class="form-control" id="productsTxt" name="productsTxt" placeholder="<%= vendor.getProducts()%>" onchange="markChange()" > <%out.println(vendor.getProducts());%> </textarea>
                                                </div>
                                                <label id="errorProduct" style="font-size: 10px;"> </label>
                                            </div>
                                        </div>
                                        <br/>

                                        <!--description-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="descriptionTxt" class="col-xs-2  col-sm-2 col-md-2 col-lg-2 control-label" style="display: inline-block; text-align: left;">Description</label>
                                                <div class="col-xs-8 col-xs-offset-1 col-sm-8 col-md-8 col-lg-8">
                                                    <textarea class="form-control" id="descriptionTxt" name="descriptionTxt" placeholder="<%= vendor.getDescription()%>" onchange="markChange()" > <%out.println(vendor.getDescription());%> </textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <br/>

                                        <!--Restrictions-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="restrictionsTxt" class="col-xs-2  col-sm-2 col-md-2 col-lg-2 control-label" style="display: inline-block; text-align: left;">Restrictions</label>
                                                <div class="col-xs-8 col-xs-offset-1 col-sm-8 col-md-8 col-lg-8">
                                                    <textarea class="form-control" id="restrictionsTxt" name="restrictionsTxt" placeholder="<%= vendor.getRestriction()%>" onchange="markChange()" > <%out.println(vendor.getRestriction());%> </textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <br/>

                                        <!--Social Impact-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="sImpactTxt" class="col-xs-2  col-sm-2 col-md-2 col-lg-2 control-label" style="display: inline-block; text-align: left;">Social Impact</label>
                                                <div class="col-xs-8 col-xs-offset-1 col-sm-8 col-md-8 col-lg-8">
                                                    <textarea class="form-control" id="sImpactTxt" name="sImpactTxt" placeholder="<%= vendor.getSiImpact()%>" onchange="markChange()" > <%out.println(vendor.getSiImpact());%> </textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <br/>

                                        <!--Environmental Impact-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="envImpactTxt" class="col-xs-2  col-sm-2 col-md-2 col-lg-2 control-label" style="display: inline-block; text-align: left;">Environmental <br>Impact</label>
                                                <div class="col-xs-8 col-xs-offset-1 col-sm-8 col-md-8 col-lg-8">
                                                    <textarea class="form-control" id="envImpactTxt" name="envImpactTxt" placeholder="<%= vendor.getEnvImpact()%>" onchange="markChange()" > <%out.println(vendor.getEnvImpact());%> </textarea>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- End of product details-->

                                    <div>
                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-3 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> Submit </button>
                                                    <button type="reset" class="btn btn-default" onclick="location.href = 'http://localhost:8080/MartRunner/admin/updateVendorProfile_Admin.jsp';" > Cancel </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </form>
                            </div>
                            <!-- End of Body of Edit vendor account-->

                        </div>
                    </div>

                </div>
                <!-- End of Edit vendor account-->

            </div>
            <!-- End of Edir vendor account content-->
        </section>

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

        <!--Include Footer page-->
        <%@include file="footer_sub.jsp" %>

        <!-- Data validation-->
        <script type="text/javascript">

            var changes = [];
            
            //push into changes if value is change in a field
            function markChange() {
                changes.push(1);
            }

            //validate form
            function checkChange() {
                if (changes.length == 0) {
                    document.getElementById("errorHead").innerHTML = "Empty Submission";
                    document.getElementById("errorMsg").innerHTML = "There are no changes to submit";
                    $('#errorModal').modal('show');
                    return false;
                } else {
                    var errors = [];
            
                    //Start of personal detail validate
                    if (!validateFirstName()) {
                        errors.push(1);
                    }

                    if (!validateLastname()) {
                        errors.push(1);
                    }

                    if (!validateVendorName("vendorName", "errorVendorName")) {
                        errors.push(1);
                    }

                    var nicNumber = document.getElementById("nicNumber").value;
                    if (!validateNicNumber(nicNumber)) {
                        errors.push(1);
                    }
                    //End of personal detail validate

                    //Start of contact detail validate
                    if (!validateAddress("address", "errorAddress")) {
                        errors.push(1);
                    }

                    var mobileNumber = document.getElementById("mobileNumber").value;
                    if (!validateMobileNumber(mobileNumber)) {
                        errors.push(1);
                    }

                    var fixedLine = document.getElementById("fixedLine").value;
                    if (!validateFixedLine(fixedLine)) {
                        errors.push(1);
                    }

                    var checkEmail = '<%= vendor.getUserEmail()%>';
                    var email = document.getElementById("email").value;
                    if (checkEmail != "") {
                        if (!validateEmail(email)) {
                            errors.push(1);
                        }
                    }

                    if (!validateURL("fbID", "errorFB")) {
                        errors.push(1);
                    }

                    if (!validateURL("gPlusID", "errorGPlus")) {
                        errors.push(1);
                    }

                    if (!validateURL("tweeterID", "errorTweeter")) {
                        errors.push(1);
                    }
                    //End of contact detail validate

                    //Start of category detail validate
                    if (!validateCategory("mainCategory", "errorMain")) {
                        errors.push(1);
                    }

                    if (!validateCategory("productCategory", "errorProductCatg")) {
                        errors.push(1);
                    }

                    if (!validateCategory("productLevel", "errorLevel")) {
                        errors.push(1);
                    }

                    if (!validateCategory("pkgLevel", "errorPkg")) {
                        errors.push(1);
                    }

                    if (!validateCategory("socialImpactLevel", "errorSocial")) {
                        errors.push(1);
                    }

                    if (!validateCategory("envImpactLevel", "errorEnv")) {
                        errors.push(1);
                    }
                    //End of category detail validate

                    //Start of product detail validate
                    if (!validateField("productsTxt", "errorProduct")) {
                        errors.push(1);
                    }
                    //End of product detail validate

                    if (errors.length > 0) {
                        return false;
                    } else {
                        return true;
                    }
                }
            }

            //method to validate name field is empty or not
            function validateFirstName() {
                var pattern = /^[a-zA-Z]+$/;
                var firstname = document.getElementById("firstName").value;
                if (document.getElementById("firstName").value == "" || document.getElementById("firstName").value == null) {
                    document.getElementById("firstName").focus();
                    document.getElementById("firstName").style.borderColor = "red";
                    document.getElementById("errorFirstName").innerHTML = "required";
                    document.getElementById("errorFirstName").style.color = "red";
                    return false;
                }
                else {
                    if (pattern.test(firstname) == false) {
                        document.getElementById("firstName").style.borderColor = "red";
                        document.getElementById("errorFirstName").innerHTML = "Name can contain only alphabetic characters";
                        document.getElementById("errorFirstName").style.color = "red";
                        return false;
                    } else {
                        document.getElementById("firstName").style.borderColor = "green";
                        document.getElementById("errorFirstName").innerHTML = "";
                        document.getElementById("errorFirstName").style.color = "red";
                        return true;
                    }
                }
            }

            function validateLastname() {
                var pattern = /^[a-zA-Z]+$/;
                var lastname = document.getElementById("lastName").value;
                if (document.getElementById("lastName").value == "" || document.getElementById("lastName").value == null) {
                    document.getElementById("lastName").focus();
                    document.getElementById("lastName").style.borderColor = "red";
                    document.getElementById("errorLastName").innerHTML = "required";
                    document.getElementById("errorLastName").style.color = "red";
                    return false;
                }
                else {
                    if (pattern.test(lastname) == false) {
                        document.getElementById("lastName").style.borderColor = "red";
                        document.getElementById("errorLastName").innerHTML = "Name can contain only alphabetic characters";
                        document.getElementById("errorLastName").style.color = "red";
                        return false;
                    } else {
                        document.getElementById("lastName").style.borderColor = "green";
                        document.getElementById("errorLastName").innerHTML = "";
                        document.getElementById("errorLastName").style.color = "red";
                        return true;
                    }
                }
            }
            
            function validateName(text, errorLbl) {
                var pattern = /^[a-zA-Z]+$/;
                var name = document.getElementById(text).value;
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    if (pattern.test(name) == false) {
                        document.getElementById(text).style.borderColor = "red";
                        document.getElementById(errorLbl).innerHTML = "Name can contain only alphabetic characters";
                        document.getElementById(errorLbl).style.color = "red";
                        return true;
                    } else {
                        document.getElementById(text).style.borderColor = "green";
                        document.getElementById(errorLbl).innerHTML = "";
                        return true;
                    }
                }
            }
            
            //method to check vendor name
            function validateVendorName(text, errorLbl) {
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }
            
            //method to validate nic number
            function validateNicNumber(text) {
                var pattern = /^[0-9]{9}(V|v){1}/;
                if (text == "" || text == null) {
                    document.getElementById("nicNumber").focus();
                    document.getElementById("nicNumber").style.borderColor = "red";
                    document.getElementById("errorNicNumber").innerHTML = "required";
                    document.getElementById("errorNicNumber").style.color = "red";
                    return false;
                }
                else if ((pattern.test(text)) == false || text.length < 10) {
                    document.getElementById("nicNumber").focus();
                    document.getElementById("nicNumber").style.borderColor = "red";
                    document.getElementById("errorNicNumber").innerHTML = "invalid type";
                    document.getElementById("errorNicNumber").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("nicNumber").style.borderColor = "green";
                    document.getElementById("errorNicNumber").innerHTML = "";
                    return true;
                }
            }

            //method to validate mobile number
            function validateMobileNumber(text) {
                var pattern = /^([+0-9]{1,3})?([0-9]{10,11})$/i;
                if (text == null || text == "") {
                    document.getElementById("mobileNumber").focus();
                    document.getElementById("mobileNumber").style.borderColor = "red";
                    document.getElementById("errorMobileNumber").innerHTML = "required";
                    document.getElementById("errorMobileNumber").style.color = "red";
                    return false;
                }
                else if ((pattern.test(text)) == false || text.length < 10) {
                    document.getElementById("mobileNumber").focus();
                    document.getElementById("mobileNumber").style.borderColor = "red";
                    document.getElementById("errorMobileNumber").innerHTML = "invalid type";
                    document.getElementById("errorMobileNumber").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("mobileNumber").style.borderColor = "green";
                    document.getElementById("errorMobileNumber").innerHTML = "";
                    return true;
                }
            }

            //method to validate fixed line 
            function validateFixedLine(text) {
                var pattern = /^([+0-9]{1,3})?([0-9]{10,11})$/i;
                if (text == "" || text == null) {
                    document.getElementById("errorFixedLine").innerHTML = "";
                    return true;
                }
                else if ((pattern.test(text)) == false || text.length < 10) {
                    document.getElementById("fixedLine").focus();
                    document.getElementById("fixedLine").style.borderColor = "red";
                    document.getElementById("errorFixedLine").innerHTML = "invalid type";
                    document.getElementById("errorFixedLine").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("fixedLine").style.borderColor = "green";
                    document.getElementById("errorFixedLine").innerHTML = "";
                    return true;
                }
            }

            //method to validate email address
            function validateEmail(text) {
                var pattern = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
                if (text == "" || text == null) {
                    document.getElementById("errorEmail").innerHTML = "";
                    return true;
                }
                else if ((pattern.test(text)) == false) {
                    document.getElementById("email").focus();
                    document.getElementById("email").style.borderColor = "red";
                    document.getElementById("errorEmail").innerHTML = "invalid email";
                    document.getElementById("errorEmail").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("email").style.borderColor = "green";
                    document.getElementById("errorEmail").innerHTML = "";
                    return true;
                }
            }
            
            //method to addresss
            function validateAddress(text, errorLbl) {
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }

            //method to validate a url
            function validateURL(text, errorLbl) {
                var pattern = /^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i;
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
                else if ((pattern.test(document.getElementById(text).value)) == false) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "invalid Fb link";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }

            //method to validate a category is selected or not
            function validateCategory(text, errorLbl) {
                if (document.getElementById(text).value == "") {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "please select a value";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }
            
            function validateField(text, errorLbl) {
                if (document.getElementById(text).value == "" || document.getElementById(text).value == null) {
                    document.getElementById(text).focus();
                    document.getElementById(text).style.borderColor = "red";
                    document.getElementById(errorLbl).innerHTML = "required";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }
            
        </script>

        <!--Bootstrap Java Scripts-->
        <script src="../static/js/jquery.js"></script>
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