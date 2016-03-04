<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Vendor | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom CSS -->
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

        <%
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
                                    <a class="btn btn-default active" style="width:auto" href="createVendor_Admin.jsp">
                                        <strong>Create Vendor</strong>
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Update vendor profile icon-->
                                    <span class="glyphicon glyphicon-edit" style="font-size:75px; color:#009; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/> 
                                    <a class="btn btn-default" style="width:auto;" href="updateVendorProfile_Admin.jsp" >
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
                                <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;" > Create Vendor Account </div>
                            </div>
                            <!-- End of Header of Create vendor account-->

                            <!-- Start of Body of Create vendor account-->
                            <div class="panel-body">
                                <form action="${pageContext.request.contextPath}/insertVendor" class="form-horizontal" method="POST" role="form" name="createVendor" onsubmit="return(validateForm())" novalidate>

                                    <!-- Start of personal details-->
                                    <div id="personalDetails">
                                        <h5> Personal Details </h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">

                                                <!-- First Name-->
                                                <label for="firstName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> First Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter first name"/>
                                                    <label id="errorFirstName" style="font-size:10px"> </label>
                                                </div>

                                                <!-- Last Name-->
                                                <label for="lastName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Last Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter last name"/>
                                                    <label id="errorLastName" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Vendor Name-->
                                                <label for="vendorName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Vendor Name </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="vendorName" name="vendorName" placeholder="Enter vendor name"/>
                                                    <label id="errorVendorName" style="font-size:10px"> </label>
                                                </div>

                                                <!-- NIC Number-->
                                                <label for="nicNumber" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> NIC Number </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="text" class="form-control" id="nicNumber" name="nicNumber" placeholder="Enter NIC" maxlength="10"/>
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
                                                    <textarea class="form-control" id="address" name="address" placeholder="Enter address"></textarea>
                                                    <label id="errorAddress" style="font-size:10px"> </label>
                                                </div>

                                                <!-- Mobile number-->
                                                <label for="mobileNumber" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Mobile Number </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" placeholder="Enter mobile number" maxlength="10"/>
                                                    <label id="errorMobileNumber" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Fixed Line-->
                                                <label for="fixedLine" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left;"> Fixed Line </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="tel" class="form-control" id="fixedLine" name="fixedLine" placeholder="Enter fixed line number" maxlength="10"/>
                                                    <label id="errorFixedLine" style="font-size:10px"> </label>
                                                </div>

                                                <!-- Email-->
                                                <label for="email" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left;"> Email Address </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <input type="email" class="form-control" id="email" name="email" placeholder="Enter email"/>
                                                    <label id="errorEmail" style="font-size:10px"> </label>
                                                </div>
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
                                                        <input type="url" class="form-control hidden-xs" id="fbID" name="fbID" placeholder="Enter Facebook link" />
                                                        <input type="url" class="form-control visible-xs" id="fbID" name="fbID" placeholder="Enter Facebook" />
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
                                                        <input type="url" class="form-control hidden-xs" id="gPlusID" name="gPlusID" placeholder="Enter Google+ link" />
                                                        <input type="url" class="form-control visible-xs" id="gPlusID" name="gPlusID" placeholder="Enter Google+" />
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
                                                        <input type="url" class="form-control hidden-xs" id="tweeterID" name="tweeterID" placeholder="Enter Tweeter link" />
                                                        <input type="url" class="form-control visible-xs" id="tweeterID" name="tweeterID" placeholder="Enter Tweeter" />
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
                                                    <select class="form-control" id="mainCategory" name="mainCategory">
                                                        <option id="mainCategory" name="mainCategory" value=""> ---------Select---------</option> 
                                                        <option id="mainCategory" name="mainCategory" value="SE"> Social Enterprise</option> 
                                                        <option id="mainCategory" name="mainCategory" value="RP"> Rural Producers</option> 
                                                        <option id="mainCategory" name="mainCategory" value="RB"> Responsible Business</option>
                                                    </select>
                                                    <label id="errorMain" style="font-size:10px;"></label>
                                                </div>

                                                <!-- Packaging level-->
                                                <label for="pkgLevel" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Packaging Level </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="pkgLevel" name="pkgLevel">
                                                        <option id="pkgLevel" name="pkgLevel" value="">---------Select---------</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="1">Level 1</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="2">Level 2</option> 
                                                        <option id="pkgLevel" name="pkgLevel" value="3">Level 3</option>
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
                                                    <select class="form-control" id="productCategory" name="productCategory">
                                                        <option id="productCategory" name="productCategory" value=""> ---------Select---------</option> 
                                                        <option id="productCategory" name="productCategory" value="OP">Organic Products</option>
                                                        <option id="productCategory" name="productCategory" value="AF">Animal based Farm Products</option>
                                                        <option id="productCategory" name="productCategory" value="PF">Prepared Food</option>
                                                        <option id="productCategory" name="productCategory" value="NB">Natural Body & Home</option> 
                                                        <option id="productCategory" name="productCategory" value="AH">Art & Handicraft</option>
                                                        <option id="productCategory" name="productCategory" value="TR">Travel</option> 
                                                        <option id="productCategory" name="productCategory" value="SP">Service Providers</option>
                                                    </select>
                                                    <label id="errorProductCatg" style="font-size: 10px;"> </label>
                                                </div>

                                                <!-- Social Impact level-->
                                                <label for="socialImpactLevel" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Social Impact Level </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="socialImpactLevel" name="socialImpactLevel">
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="">---------Select---------</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="1">Level 1</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="2">Level 2</option> 
                                                        <option id="socialImpactLevel" name="socialImpactLevel" value="3">Level 3</option>
                                                    </select>
                                                    <label id="errorSocial" style="font-size: 10px;"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="productLevel" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Product Level </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="productLevel" name="productLevel">
                                                        <option id="productLevel" name="productLevel" value="">---------Select---------</option> 
                                                        <option id="productLevel" name="productLevel" value="1">Level 1</option> 
                                                        <option id="productLevel" name="productLevel" value="2">Level 2</option> 
                                                        <option id="productLevel" name="productLevel" value="3">Level 3</option>
                                                    </select>
                                                    <label id="errorLevel" style="font-size: 10px"> </label>
                                                </div>

                                                <!-- Environmental Impact level-->
                                                <label for="envImpactLevel" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Environmental Impact Level </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <select class="form-control" id="envImpactLevel" name="envImpactLevel">
                                                        <option id="envImpactLevel" name="envImpactLevel" value="">---------Select---------</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="1">Level 1</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="2">Level 2</option> 
                                                        <option id="envImpactLevel" name="envImpactLevel" value="3">Level 3</option>
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
                                                    <textarea  class="form-control" id="productsTxt" name="productsTxt"></textarea>
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
                                                    <textarea class="form-control" id="descriptionTxt" name="descriptionTxt"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <br/>

                                        <!--Restrictions-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="restrictionsTxt" class="col-xs-2  col-sm-2 col-md-2 col-lg-2 control-label" style="display: inline-block; text-align: left;">Restrictions</label>
                                                <div class="col-xs-8 col-xs-offset-1 col-sm-8 col-md-8 col-lg-8">
                                                    <textarea class="form-control" id="restrictionsTxt" name="restrictionsTxt"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <br/>

                                        <!--Social Impact-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="sImpactTxt" class="col-xs-2  col-sm-2 col-md-2 col-lg-2 control-label" style="display: inline-block; text-align: left;">Social Impact</label>
                                                <div class="col-xs-8 col-xs-offset-1 col-sm-8 col-md-8 col-lg-8">
                                                    <textarea class="form-control" id="sImpactTxt" name="sImpactTxt"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <br/>

                                        <!--Environmental Impact-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="envImpactTxt" class="col-xs-2  col-sm-2 col-md-2 col-lg-2 control-label" style="display: inline-block; text-align: left;">Environmental <br>Impact</label>
                                                <div class="col-xs-8 col-xs-offset-1 col-sm-8 col-md-8 col-lg-8">
                                                    <textarea class="form-control" id="envImpactTxt" name="envImpactTxt"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- End of product details-->

                                    <!-- Start of Other Details-->
                                    <div id="otherDetails">
                                        <h5> Other Details </h5>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Market day-->
                                                <label for="marketDay" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Market Day </label>
                                                <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
                                                    <div class="panel panel-default" id="errorMarketDay">
                                                        <div class="panel-body">
                                                            <span>
                                                                <label style="font-weight: normal;"> <input type="checkbox" name="marketDay" id="marketDay" value="TH"/> Thursday Market </label> <br/>
                                                                <label style="font-weight: normal;"> <input type="checkbox" name="marketDay" id="marketDay" value="SA"/> Saturday Market </label> <br/>
                                                                <label style="font-weight: normal;"> <input type="checkbox" name="marketDay" id="marketDay" value="GM"/> Good Market Shop </label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Stall Type-->
                                                <label for="stallType" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left;"> Stall Type </label>
                                                <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="panel panel-default" id="errorStallType">
                                                        <div class="panel-body">
                                                            <span>
                                                                <label style="font-weight: normal;" > <input type="radio" name="stallType" id="stallType" value="hStall"/> Half Stall </label> <br/>
                                                                <label style="font-weight: normal;" > <input type="radio" name="stallType" id="stallType" value="fStall"/> Full Stall </label> <br/>
                                                                <label style="font-weight: normal;" > <input type="radio" name="stallType" id="stallType" value="tStall"/> Two Stalls </label> 
                                                            </span>
                                                            <!--<label style="font-size: 10px"></label>-->
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Vendor Type-->
                                                <label for="vendorType" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Vendor Type </label>
                                                <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">
                                                    <div class="panel panel-default" id="errorVendorType">
                                                        <div class="panel-body">
                                                            <span>
                                                                <label style="font-weight: normal;"> <input type="radio" name="vendorType" id="stallType" value="activeV"/> Normal Vendor </label> <br/>
                                                                <label style="font-weight: normal;"> <input type="radio" name="vendorType" id="stallType" value="deactiveV"/> Local Language Vendor </label> <br/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <span class="text-muted"><em><span style="color:red;">*</span> Indicates required field</em></span>
                                        </div>

                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-3 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> Submit </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- End of Other Details-->
                                </form>
                            </div>
                            <!-- End of Body of Create vendor account-->
                        </div>
                    </div>

                </div>
                <!-- End of Create vendor account-->

            </div>
            <!-- End of create vendor account content-->
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
            function validateForm() {
                var errors = [];

                //Start of personal detail validate
                if (!validateName("firstName", "errorFirstName")) {
                    errors.push("errorFirstName");
                }

                if (!validateName("lastName", "errorLastName")) {
                    errors.push("errorLastName");
                }

                if (!validateStallName("vendorName", "errorVendorName")) {
                    errors.push("errorVendorName");
                }

                var nicNumber = document.getElementById("nicNumber").value;
                if (!validateNicNumber(nicNumber)) {
                    errors.push("errorNicNumber");
                }
                //End of personal detail validate

                //Start of contact detail validate
                if (!validateAddress()) {
                    errors.push("errorAddress");
                }

                var mobileNumber = document.getElementById("mobileNumber").value;
                if (!validateMobileNumber(mobileNumber)) {
                    errors.push("errorMobileNumber");
                }

                var fixedLine = document.getElementById("fixedLine").value;
                if (!validateFixedLine(fixedLine)) {
                    errors.push("errorFixedLine");
                }

                var email = document.getElementById("email").value;
                if (!validateEmail(email)) {
                    errors.push("errorEmail");
                }

                if (!validateURL("fbID", "errorFB")) {
                    errors.push("errorFB");
                }

                if (!validateURL("gPlusID", "errorGPlus")) {
                    errors.push("errorGPlus");
                }

                if (!validateURL("tweeterID", "errorTweeter")) {
                    errors.push("errorTweeter");
                }
                //End of contact detail validate

                //Start of category detail validate
                if (!validateCategory("mainCategory", "errorMain")) {
                    errors.push("errorMainCategory");
                }

                if (!validateCategory("productCategory", "errorProductCatg")) {
                    errors.push("errorProductCategory");
                }

                if (!validateCategory("productLevel", "errorLevel")) {
                    errors.push("errorProductCatgLevel");
                }

                if (!validateCategory("pkgLevel", "errorPkg")) {
                    errors.push("errorPkgLevel");
                }

                if (!validateCategory("socialImpactLevel", "errorSocial")) {
                    errors.push("errorSiLevel");
                }

                if (!validateCategory("envImpactLevel", "errorEnv")) {
                    errors.push("errorEnvLevel");
                }
                //End of category detail validate

                //Start of product detail validate
                if (!validateFields("productsTxt", "errorProduct")) {
                    errors.push("errorProducts");
                }
                //End of product detail validate

                //Strat of other detail validate
                var marketDay = document.getElementsByName("marketDay");
                if (!validateMarketDay(marketDay)) {
                    errors.push("errorMarketDay");
                }

                var vendorType = document.getElementsByName("vendorType");
                if (!validateVendorType(vendorType)) {
                    errors.push("errorVendorType");
                }
                //End of other detail validate

                if (errors.length > 0) {
                    return false;
                }
                else {
                    return true;
                }
            }

            //method to validate name field is empty or not

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

            function validateStallName(text, errorLbl) {
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

            function validateAddress() {
                if (document.getElementById("address").value == "" || document.getElementById(text).value == null) {
                    document.getElementById("address").focus();
                    document.getElementById("address").style.borderColor = "red";
                    document.getElementById("errorAddress").innerHTML = "required";
                    document.getElementById("errorAddress").style.color = "red";
                    return false;
                }
                else {
                    document.getElementById("address").style.borderColor = "green";
                    document.getElementById("errorAddress").innerHTML = "";
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
                    document.getElementById(errorLbl).innerHTML = "invalid url";
                    document.getElementById(errorLbl).style.color = "red";
                    return false;
                }
                else {
                    document.getElementById(text).style.borderColor = "green";
                    document.getElementById(errorLbl).innerHTML = "";
                    return true;
                }
            }

            function validateFields(text, errorLbl) {
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

            //method to validate market day is selected or not
            function validateMarketDay(group) {
                if ((group[0].checked || group[1].checked) && !(validateStallType(document.getElementsByName("stallType")))) {
                    document.getElementById("errorMarketDay").style.borderColor = "green";
                    return true;
                }
                else if (group[0].checked || group[1].checked || group[2].checked) {
                    document.getElementById("errorMarketDay").style.borderColor = "green";
                    return true;
                }
                else {
                    document.getElementById("errorMarketDay").focus();
                    document.getElementById("errorMarketDay").style.borderColor = "red";
                    return false;
                }
            }

            //method to validate vendor type
            function validateVendorType(group) {
                if (group[0].checked) {
                    var email = document.getElementById("email").value;
                    if (email == "") {
                        document.getElementById("email").focus();
                        document.getElementById("email").style.borderColor = "red";
                        document.getElementById("errorEmail").innerHTML = "required for normal vendor";
                        document.getElementById("errorEmail").style.color = "red";
                        return false;
                    }
                    else {
                        document.getElementById("errorVendorType").style.borderColor = "green";
                        return(validateEmail(email));
                    }
                }
                else if (group[1].checked) {
                    document.getElementById("email").style.borderColor = "white";
                    document.getElementById("email").value = "";
                    document.getElementById("errorEmail").innerHTML = "";
                    document.getElementById("errorVendorType").style.borderColor = "green";
                    return true;
                }
                else {
                    document.getElementById("errorVendorType").style.borderColor = "red";
                    return false;
                }
            }

            //method to validate stall type
            function validateStallType(group) {
                for (var i = 0; i < group.length; i++) {
                    if (group[i].checked) {
                        document.getElementById("errorStallType").style.borderColor = "green";
                        return true;
                    }
                }
                document.getElementById("errorStallType").focus();
                document.getElementById("errorStallType").style.borderColor = "red";
                return false;
            }

        </script>

        <!-- jquery -->
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