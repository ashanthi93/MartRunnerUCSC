<%@page import="classes.Vendor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> View Payment | Admin | MartRunner</title>

        <!-- Bootstrap Core CSS -->
        <link href="../static/css/bootstrap.min.css" rel="stylesheet">
       

        
        <!-- font awesome -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
        
        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>        
        <!-- bootstrap js -->
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>
        

    </head>

    <body>
        <!--Load all vendors from the servlet-->
        <jsp:include page="/paymentGetVendors" />
        <!--Header of the page-->
        <%@include file="header_sub.jsp" %>
        <%
            /* To handle error messages or success messages */
            String errorMsg = "";
            String errorHead = "";
            int error = 0;

            if (session.getAttribute("error") != null) {

                error = (Integer) session.getAttribute("error");
                if (error == 1) {
                    errorHead = (String) session.getAttribute("errorHead");
                    errorMsg = (String) session.getAttribute("errorMsg");
                }
            }


        %>

        <section>
            <div class="container" >
                <div class="row col-xs-12 col-sm-12 col-sm-12 col-lg-12 ">
                    <!--Start of Side Bar-->
                    <div class=" col-sm-3 col-md-3 col-lg-3 hidden-xs hidden-sm" >
                        <div class="panel panel-default" style="margin-top: 10px;">
                            <div class="panel-body">
                                <div  style="width:auto; height:auto;background-color:#71C671; border-radius:5px; margin-top:0px;"> 

                                    <center> 
                                        <!--Side Bar Topic-->
                                        <label style="color: #000000; padding-top:20px; font-size:22px;"> Payment Handling </label>  
                                        <br/><br/> 
                                        <!--Dashboard Icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:90px;width:90px; background-color: whitesmoke; padding: 10px;"></span> <br/><br/> 
                                        <a class="btn btn-default" style="width:auto" href="adminHomePage.jsp"> <strong> Dashboard</strong></a>
                                        <br/><br/> 

                                        <!--Add Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#EEC900; border-radius: 5px; height:80px;width:80px; background-color: whitesmoke; padding: 10px;"></span>  
                                            <span class="glyphicon glyphicon-plus" style="font-size:20px; color:#EEC900; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>
                                        </div> <br> 
                                        <a class="btn btn-default" style="width:auto;" href="addPayment_Admin.jsp"> <strong> Add Payment</strong></a>

                                        <br><br> 

                                        <!--Update Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#008B45; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-edit" style="font-size:20px; color:#008B45; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default" style="width:auto" href="updatePayment_Admin.jsp"> <strong> Update Payment</strong></a>
                                        <br><br>  

                                        <!--View Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#8B1C62; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>
                                            <span class="glyphicon glyphicon-eye-open" style="font-size:20px; color:#8B1C62; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>  
                                        </div><br/>
                                        <a class="btn btn-default active" style="width:auto" href="viewPayment_Admin.jsp"> <strong> View Payment</strong></a>

                                        <br><br>  
                                        <!--Remove Payment Icon-->
                                        <div class="row">
                                            <span class="glyphicon glyphicon-usd" style="font-size:60px; color:#EE0000; border-radius: 5px; height:80px;width:80px; background-color:whitesmoke; padding: 10px;"></span>  
                                            <span class="glyphicon glyphicon-remove" style="font-size:20px; color:#EE0000; border-radius: 5px; height:40px;width:40px; background-color:whitesmoke; padding: 10px;"></span>
                                        </div> <br> 
                                        <a class="btn btn-default " style="width:auto" href="removePayment_Admin.jsp"> <strong>Remove Payment</strong></a>

                                        <br/><br/> 
                                    </center>

                                </div>
                            </div>
                        </div> 
                    </div>
                    <!--End of Side Bar-->

                    <!--View Payment Form-->
                    <div class="container">

                        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9" >
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <!--Form Topic-->
                                <div class="panel-heading" style="background-color: #71C671;">
                                    <p class="panel-title" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright;"> View Payment </p>
                                </div>


                                <div class="panel-body">
                                    <form action="${pageContext.request.contextPath}/viewPayment_Admin" class="form-horizontal" id="viewPayment" method="post"  role="form" onsubmit="return(validateForm())" novalidate>

                                        <!--Vendor name-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <label for="vendorname" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-4 required" style="display: inline-block; text-align: left;">Vendor Name</label>
                                                <div class="col-xs-6">
                                                    <select class="combobox form-control" name="vendorName" id="vendorName">
                                                        <option name="vendorName" value="" selected="selected">Select vendor name</option>
                                                        <%                                                    List<Vendor> VendorList = (List<Vendor>) session.getAttribute("vendorList");
                                                            if (VendorList != null) {
                                                                for (Vendor vendor : VendorList) {
                                                        %>
                                                        <option name="vendorName" value="<%=vendor.getVendorID()%>" > <%out.print(vendor.getVendorName());%> </option>
                                                        <%
                                                                }
                                                            }
                                                        %>
                                                    </select>
                                                    <label id="errorVendorName" style="font-size:10px"> </label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Market Type-->
                                        <div class="row">
                                            <div class="form-group col-lg-12 col-md-12 col-sm-12">
                                                <!-- Market Type-->
                                                <label for="marketType" class="control-label col-xs-5 col-sm-5 col-md-4 col-md-offset-1 col-lg-4 required" style="display: inline-block; text-align: left;"> Select Market Day </label>
                                                <div class="col-xs-4 col-sm-3 col-md-3 col-lg-3">
                                                    <div class="panel panel-default" id="errorMarketDay">
                                                        <div class="panel-body">
                                                            <span>
                                                                <label style="font-weight: normal;"> <input type="radio" name="marketDay" id="marketDay" value="Th"/>  Thursday</label> <br/>
                                                                <label style="font-weight: normal;"> <input type="radio" name="marketDay" id="marketDay" value="Sa"/>  Saturday</label> <br/>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br> <br>
                                        <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-3 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> Submit </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                            </div>

                            <!--End of View payment-->

                            <!--Add Payment Form-->
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                    <strong> Add Payment </strong> 
                                </div><br/>
                                <!--Form Body-->
                                <div class="panel-body">
                                    <form class="form-horizontal" id="changevendorprofile" method="post" action="" role="form">

                                        <!--Vendor name-->
                                        <div class="row">
                                            <div class="form-group ">
                                                <label for="vendorname" class="col-xs-5  col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label"  style="text-align:left;">Vendor Name</label>
                                                <div class="col-xs-5 col-sm-4  col-md-4 col-lg-4">
                                                    <input type="text" class="form-control" id="vendorname" placeholder="Enter Vendor Name" disabled="disabled"/> 
                                                </div>
                                            </div>
                                        </div>

                                        <!--Market Day-->
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="markettype" class="col-xs-5  col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label" style="text-align:left;">Select Market Day</label>
                                                <!--Market Day radio-->
                                                <div class="row">
                                                    <div class="radio col-xs-5 col-xs-offset-0 col-sm-offset-0 col-lg-6">

                                                        <label>
                                                            <input type="radio" name="markettype" id="type1" value="t1" disabled="disabled"/> Saturday &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                                                        </label> 
                                                        <br>
                                                        <label>
                                                            <input type="radio" name="markettype" id="type2" value="t2" disabled="disabled"/> Thursday &nbsp; &nbsp;
                                                        </label>
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>

                                        <br> 
                                        <!--Stall Type-->
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="stalltype" class="col-xs-5  col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label" style="text-align:left;">Select Stall Type</label>
                                                <!--Market Day radio-->
                                                <div class="row">
                                                    <div class="radio col-xs-5 col-xs-offset-0 col-sm-offset-0 col-lg-6">

                                                        <label>
                                                            <input type="radio" name="stalltype" id="type1" value="t1" disabled="disabled"/> Half Stall &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                                                        </label> 
                                                        <br>
                                                        <label>
                                                            <input type="radio" name="stalltype" id="type2" value="t2" disabled="disabled"/> Full Stall &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                                                        </label>
                                                        <br>
                                                        <label>
                                                            <input type="radio" name="stalltype" id="type1" value="t1" disabled="disabled"/> Two Stalls 
                                                        </label> 
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>

                                        <br>

                                        <!--Payment Start Date-->
                                        <div class="row">
                                            <div class="form-group ">
                                                <label for="startdate" class="col-xs-5  col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label" style="text-align:left;">Payment Start Date</label>
                                                <div class="row">
                                                    <div class="col-xs-5 col-xs-offset-0 col-sm-3  col-md-3 col-lg-3">

                                                        <input type="text" class="form-control" id="date" placeholder="dd | mm | year" style="text-align: center" disabled="disabled"/>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>


                                        <!--Stall Type-->
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="duration" class="col-xs-5 col-sm-5 col-md-offset-1 col-md-4 col-lg-4 control-label" style="text-align:left;">Select Payment Duration</label>
                                                <!--Market Day radio-->
                                                <div class="row">
                                                    <div class="radio col-xs-5 col-xs-offset-0 col-sm-offset-0 col-lg-5">

                                                        <label>
                                                            <input type="radio" name="duration" id="type1" value="t1" disabled="disabled"/> One Day  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                                                        </label> 
                                                        <br>

                                                        <label>
                                                            <input type="radio" name="duration" id="type2" value="t2" disabled="disabled"/> One Month  &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                                                        </label>
                                                        <br>

                                                        <label>
                                                            <input type="radio" name="duration" id="type3" value="t1" disabled="disabled"/> Quarter 
                                                        </label> 
                                                    </div>  
                                                </div>
                                            </div>
                                        </div>
                                        <br> <br>
                                         <!-- Submit, cancel button-->
                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-xs-offset-4 col-xs-9">
                                                    <button type="submit" class="btn btn-default"> OK </button>
                                                    <button type="reset" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                                </div>
                                            </div>
                                        </div>


                                    </form>
                                </div>

                            </div>
                            <!--End of Add Payment Form-->


                        </div>

                    </div>

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

                    <!--Footer of the page-->                             
                    <%@include file="footer_sub.jsp" %>

                    <!-- script for data validation-->
                    <script type="text/javascript">
                        //function for validate form
                        function validateForm() {
                            var errors = [];


                            if (!validateVendorName()) {
                                errors.push("errorVendorName");
                            }
                            var group = document.getElementsByName("marketDay");
                            if (!(validateRadio(group, "errorMarketDay"))) {
                                errors.push("errorMarketDay");
                            }


                            if (errors.length > 0) {
                                return false;
                            }
                            else {
                                return true;
                            }

                        }

                        //validate vendor name
                        function validateVendorName() {
                            var option = document.getElementById("vendorName").value;
                            if (option == "") {
                                document.getElementById("vendorName").focus();
                                document.getElementById("vendorName").style.borderColor = "red";
                                document.getElementById("errorVendorName").innerHTML = "required";
                                document.getElementById("errorVendorName").style.color = "red";
                                return false;
                            }
                            else {
                                document.getElementById("vendorName").style.borderColor = "green";
                                document.getElementById("errorVendorName").innerHTML = "";
                                return true;
                            }
                        }

                        //validate Radio Buttons
                        function validateRadio(group, errorLbl) {
                            for (var i = 0; i < group.length; i++) {
                                if (group[i].checked) {
                                    document.getElementById(errorLbl).style.borderColor = "green";
                                    return true;
                                }
                            }
                            document.getElementById(errorLbl).focus();
                            document.getElementById(errorLbl).style.borderColor = "red";
                            return false;
                        }
                    </script>


                    <!--script for vendor name combo box-->
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('.combobox').combobox();
                        });
                    </script>
                    <!--script for prompt error message-->
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

                        
                    </script>

                    </body>
                    </html>
