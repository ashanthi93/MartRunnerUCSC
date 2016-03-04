<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Vendor Application Organic Products | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../static/css/martRunner.css" rel="stylesheet">

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
            }.travelheader{

                font-size: 45px;
                color: #6B8E23;
                font-family:new century schoolbook;
                text-shadow:4px 4px 6px #CDCDC1;
                font-weight:bold;
            }
        </style>
    </head>

    <body>

        <!--Including Header Page-->
        <%@include file="header.jsp" %>

        <section>
            <!-- Start of vendor application account-->
            <div class="container">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                    <br/>

                    <!--header-->
                    <div class="travelheader" style="font-size: 40px">
                        <center> <p style="font-size:35px"> GOOD MARKET VENDOR APPLICATION: Organic Products </p></center>
                    </div>

                    <div class="panel panel-default" style="margin-top: 10px;">

                        <!-- Start of Body of vendor application-->
                        <div class="panel-body">

                            <p style="font-family: inherit; font-style: italic;"> Thank you for your interest in the Good Market!  If you have tea, spices, coconut, rice, legumes, vegetables, fruit, plants, other farm products, or other organic products, please use this form.  For other packaged and ready-to-eat food and drink, please use the Prepared Foods form.
                                Please read the Good Market Standards and Vendor Information before completing the application form.  The Good Market is a curated event.  Vendors are prioritized according to Good Market Standards.  If you have any questions, contact Melani at melani@goodmarket.lk or 0770 208 642.
                            </p>

                            <form action="${pageContext.request.contextPath}/OrganicProductsApplicationPDFConverter" class="form-horizontal" method="POST" role="form" name="createVendor" novalidate>

                                <!-- Start of personal details-->
                                <div id="basicDetails">
                                    <h5 id="subHeading"> Basic Information </h5>

                                    <div class="row">
                                        <!-- Stall name-->
                                        <label for="stallName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Proposed Stall Name </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <input type="text" class="form-control" id="stallName" name="stallName" placeholder="Enter proposed stall name"/>
                                            <label id="errorSatllName" style="font-size:10px"> </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Contact Person -->
                                        <label for="ownerName" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Primary Contact Person </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <input type="text" class="form-control" id="ownerName" name="ownerName" placeholder="Enter primary contact person"/>
                                            <label id="errorOwnerName" style="font-size:10px"> </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Address -->
                                        <label for="address" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Address </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <textarea class="form-control" id="address" name="address" placeholder="Enter address"></textarea>
                                            <label id="errorAddress" style="font-size:10px"> </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Phone No -->
                                        <label for="phoneNo" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Phone Number </label>
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                            <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter phone number" maxlength="10"/>
                                            <label id="errorPhoneNo" style="font-size:10px"> </label>
                                        </div>

                                        <!-- Email-->
                                        <label for="email" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left;"> Enter Email Address </label>
                                        <div class="col-xs-6 col-sm-3 col-md-3 col-lg-3">
                                            <input type="email" class="form-control" id="email" name="email" placeholder="Enter email"/>
                                            <label id="errorEmail" style="font-size:10px"> </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <!-- Facebook id-->
                                        <label for="urlLink" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3" style="display: inline-block; text-align: left;"> Enter Website/Facebook Page </label>
                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-6">
                                            <input type="url" class="form-control" id="urlLink" name="urlLink" placeholder="Enter Website/ Facebook link" />
                                            <label id="errorUrlLink" style="font-size:10px"> </label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <label class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Preferred Method To Involve </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <div class="panel panel-default" id="errorVendorType">
                                                <div class="panel-body">
                                                    <span>
                                                        <label style="font-weight: normal;"> <input type="checkbox" name="vendorType" id="vendorType" value="1"/> I would like to be a Good Market approved vendor. I do not need a stall at this time. </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="checkbox" name="vendorType" id="vendorType" value="2"/> I would like to reserve a SATURDAY HALF stall for 1 month (4 consecutive Saturdays) Rs.6,000 </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="checkbox" name="vendorType" id="vendorType" value="3"/> I would like to reserve a SATURDAY FULL stall for 1 month (4 consecutive Saturdays) Rs.11,200 </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="checkbox" name="vendorType" id="vendorType" value="4"/> I would like to reserve a SATURDAY FULL stall for 1 quarter (12 consecutive Saturdays) Rs.30,000 </label>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- End of personal details-->

                                <!-- Start of Product details-->
                                <div id="productDetails">
                                    <h5 id="subHeading">Product Information </h5>

                                    <!--products-->
                                    <div class="row">
                                        <label for="productsTxt" class="col-xs-6  col-sm-3 col-md-3 col-lg-3 control-label required" style="display: inline-block; text-align: left;"> I plan to promote the following products: <br/> (Include all) </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <textarea  class="form-control" id="productsTxt" name="productsTxt"></textarea>
                                        </div>
                                        <label id="errorProduct" style="font-size: 10px;"> </label>
                                    </div>
                                    <br/>

                                    <!--description-->
                                    <div class="row">
                                        <label for="descriptionTxt" class="col-xs-6  col-sm-3 col-md-3 col-lg-3 control-label" style="display: inline-block; text-align: left;"> The products are organically grown at the following sites: <br/> (Include village, district, country) </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <textarea class="form-control" id="descriptionTxt" name="descriptionTxt"></textarea>
                                        </div>
                                    </div>
                                    <br/>

                                    <!-- Certification -->
                                    <div class="row">
                                        <label for="certification" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Certification </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <div class="panel panel-default" id="errorCertification">
                                                <div class="panel-body">
                                                    <span>
                                                        <label style="font-weight: normal;"> <input type="radio" name="certification" id="certification" value="1"/> <b> Level 1: </b> Organically Grown I have been following organic standards for more than 1 year and I would like to register under the Good Market Organic Participatory Guarantee System.  I understand that I have 4 weeks from this date to prepare for and complete the farm visit. (Attach completed and signed PGS Producer Promise) </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="certification" id="certification" value="2"/> <b> Level 2: </b> Organic PGS I have been approved under an Organic Participatory Guarantee System (Attach copy of latest PGS Certificate) </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="certification" id="certification" value="3"/> <b> Level 3: </b> Organic Certified I am certified organic by an accredited third-party certifying body (Attach copy of latest organic certificate with scope certificate indicating all certified products) </label> <br/>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <!-- End of product details-->

                                <!-- Start of pkg Details-->
                                <div id="pkgDetails">
                                    <h5 id="subHeading" > PACKAGING </h5>

                                    <div class="row">
                                        <label for="packaging" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Select a packaging level </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <div class="panel panel-default" id="errorPackaging">
                                                <div class="panel-body">
                                                    <span>
                                                        <label style="font-weight: normal;"> <input type="radio" name="packaging" id="packaging" value="1"/> <b> Good Market Minimum: </b> No Styrofoam. No plastic shopping bags. No single-use plastic bottles, plastic cups, plastic containers, etc. (Required) </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="packaging" id="packaging" value="2"/> <b> All Packaging Biodegradable or Reusable or Recyclable: </b> Packaging can decompose and leave no toxic residue (e.g. leaves, paper, clay) OR packaging can be resealed and is safely reusable (e.g. glass, #5 plastic) OR packaging is not made from compound materials and can be easily recycled in Sri Lanka  </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="packaging" id="packaging" value="3"/> <b> Sustainably Sourced: </b> Packaging is made from recycled materials or has a social benefit </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="packaging" id="packaging" value="3"/> <b> Extended Responsibility: </b> Packaging is collected by vendor for reuse or recycling </label>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--packaging details -->
                                    <div class="row">
                                        <label for="pkgTxt" class="col-xs-6  col-sm-3 col-md-3 col-lg-3 control-label required" style="display: inline-block; text-align: left;"> If any special package features, describe below </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <textarea  class="form-control" id="pkgTxt" name="pkgTxt"></textarea>
                                        </div>
                                        <label id="errorPkgText" style="font-size: 10px;"> </label>
                                    </div>
                                    
                                    <br/>
                                    
                                </div>
                                
                                <div id="vendorInformation">
                                    
                                    <h5 id="subHeading" > VENDOR INFORMATION </h5>
                                    
                                    <div class="row">
                                        <label for="vendorType" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Select vendor type </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <div class="panel panel-default" id="errorType">
                                                <div class="panel-body">
                                                    <span>
                                                        <label style="font-weight: normal;"> <input type="radio" name="vendorType" id="vendorType" value="1"/> <b> Non-profit organization </b> trying to increase financial Sustainability </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="vendorType" id="vendorType" value="2"/> <b> Social enterprise </b> that was founded for a specific social or environmental mission and has a self-financing business model</label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="vendorType" id="vendorType" value="3"/> <b> Responsible business </b> trying to increase social or environmental benefits </label> 
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <!--mission details -->
                                    <div class="row">
                                        <label for="mission" class="col-xs-6  col-sm-3 col-md-3 col-lg-3 control-label required" style="display: inline-block; text-align: left;"> Mission </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <textarea  class="form-control" id="mission" name="mission"> </textarea>
                                        </div>
                                        <label id="errorMission" style="font-size: 10px;"> </label>
                                    </div>
                                    
                                    <br/>
                                    
                                    <!--service details -->
                                    <div class="row">
                                        <label for="service" class="col-xs-6  col-sm-3 col-md-3 col-lg-3 control-label required" style="display: inline-block; text-align: left;"> We make a special effort to benefit society and / or the environment in the following ways </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <textarea  class="form-control" id="serivce" name="serivce"> </textarea>
                                        </div>
                                        <label id="errorService" style="font-size: 10px;"> </label>
                                    </div>
                                    
                                    <br/>
                                    
                                    <div class="row">
                                        <label for="level" class="control-label col-xs-6 col-sm-3 col-md-3 col-lg-3 required" style="display: inline-block; text-align: left;"> Select your level </label>
                                        <div class="col-xs-6 col-sm-9 col-md-9 col-lg-9">
                                            <div class="panel panel-default" id="errorLevel">
                                                <div class="panel-body">
                                                    <span>
                                                        <label style="font-weight: normal;"> <input type="radio" name="level" id="level" value="1"/> <b> Level 1:  </b> Communicates We are able to explain our social / environmental services to the public </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="level" id="level" value="2"/> <b> Level 2: </b> Monitors and Reports: We have social / environmental indicators and monitor our impact </label> <br/>
                                                        <label style="font-weight: normal;"> <input type="radio" name="vendorType" id="vendorType" value="3"/> <b> Level 3: </b> Third-Party Certified: Our social and / or environmental impact has been independently verified by the following accredited certifying body </label> 
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <br/>
                                    
                                </div>
                                
                                <div>
                                    
                                    <p style="font-family: inherit; font-style: italic;" > I verify that all of the information in this application is correct.  I certify that I have read and understood fully the Good Market Standards. I certify that as a vendor I will only bring products to the Good Market that comply with these Standards. I understand that the Good Market organizing committee may visit production facilities or request additional information to verify that my products and/or services comply with Good Market Standards. </p>
                                    
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
            <!-- End of vendor application-->
        </section>

        <!-- Data validation-->
        <script type="text/javascript">
            function validateForm() {
                var errors = [];

                
                
            }

            function validateName(text, errorLbl) {
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

            function validateEmail(text) {
                var pattern = /^[a-z0-9._-]+@[a-z]+.[a-z.]{2,5}$/i;
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

            function validateURL(text, errorLbl) {
                var pattern = /^[http://]+[www]?.[0-9a-z_.]+.[a-z.]{2,5}$/i;
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

        <!--Bootstrap Java Scripts-->
        <script src="../static/js/jquery.js"></script>
        <script src="../static/js/bootstrap.min.js"></script>

        <!--Include Footer page-->
        <%@include file="footer_sub.jsp" %>
    </body>
</html>