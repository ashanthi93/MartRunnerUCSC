<%@page import="java.io.*" %>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Add Posts | Mart Runner </title>

        <!-- Bootstrap style sheets-->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font awesome style sheets for some icons-->
        <link type="text/css" href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

        <!-- Basic styles sheet-->
        <link type="text/css" href="../static/css/martRunner.css" rel="stylesheet">
        <!-- Java Script file-->
        <script src="../static/js/jquery.js"></script>        
        <!-- bootstrap js -->
        <script src="../static/js/bootstrap.min.js"></script>
        <script src="../static/js/bootstrap-combobox.js"></script>
        <script src="../static/js/main.js"></script>
    </head>

    <body>
        <!-- Header file of page -->
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
            <!-- Start of Page content-->
            <div class="container">

                <!-- Start of side bar-->
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">

                    <!-- Start of panel-->
                    <div class="panel panel-default hidden-xs hidden-sm" style="margin-top: 10px; width:auto;">
                        <div class="panel-body">
                            <center>

                                <!-- Start of inner body of start bar-->
                                <div style="width:auto; height:auto; background-color:#71C671; margin-top:10px;"> 

                                    <!-- Start of Side bar title-->
                                    <label style="color:#000; padding-top:15px; font-size:25px;"> Posts </label>  
                                    <!-- End of Side bar title-->


                                    <br/><br/>

                                    <!-- Start of Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="vendorHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>
                                    <!-- End of Dashboard icon-->

                                    <br/><br/><br/>


                                </div>
                                <!-- End of inner body of start bar-->
                            </center>
                        </div>
                    </div>
                    <!-- End of panel-->
                </div>
                <!-- End of side bar-->

                <!-- Start of content of Post page-->
                <div class="container">
                    <div class="col-sm-9">
                        <br/>

                        <!-- Start of Post panel-->
                        <div class="panel panel-default"> 

                            <!-- Start of Panel title-->
                            <div class="panel-heading" style="background-color: #71C671;">
                                <div class="row">
                                    <p class="panel-title col-xs-9" style="color: black; font-weight: bold; padding-left: 5px; font-family: lucida bright; font-size: 20px;"> Add Posts </p>

                                </div>
                            </div>
                            <!-- End of Panel title-->

                            <!-- Start of Panel body-->
                            <div class="panel-body" style="height: 250px;">    

                                <!-- Start of form-->
                                <form class="form-horizontal"  name="uploadForm1" action="${pageContext.request.contextPath}/AddPosts" onsubmit="return Validate(this);" method="POST" enctype="multipart/form-data">

                                    <!-- Start of uploading post content -->
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="control-label col-xs-5" style="font-family: lucida bright; margin-left:-100px;font-size: 15px;">Add Your Promotions</label>
                                            <div class="col-xs-7">
                                                <input type="file" name="file" style="font-family: lucida bright;"/>
                                            </div>
                                        </div>
                                        <div class="col-xs-9 col-xs-offset-3" >
                                            <p style="font-size: 12px;font-family: lucida bright;color:#843534 ; padding-top: 5px; margin-left:30px;">(Please upload <strong>500*375</strong> size image)</p>
                                        </div>
                                    </div>
                                    <!-- End of uploading post content -->

                                    <!-- Start of button div -->
                                    <div class="form-group">
                                        <div class="col-xs-offset-4 col-xs-11">
                                            <!-- Start of request button-->
                                            <button type="submit" name="submit" id="submit"  class="btn btn-default" style="width: 75px;font-family: lucida bright; "> Request </button>
                                            <!-- End of request button-->

                                            <!-- Start of cancel button-->
                                            <button type="reset" class="btn btn-default" style="font-family: lucida bright; "> Cancel </button>
                                            <!-- End of cancel button-->

                                        </div>
                                    </div>
                                    <!-- End of button div -->

                                </form>
                                <!-- End of form-->

                            </div>
                            <!-- End of Panel body-->    

                        </div>
                        <!-- End of Post panel-->
                    </div>
                </div>
                <!-- End of content of Post page-->

            </div>
            <!-- End of Page content-->
        </section>
        <br/><br/><br/><br/><br/><br/><br/>
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

        <script>
            var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif", ".png"];
            function Validate(oForm) {
                var arrInputs = oForm.getElementsByTagName("input");
                for (var i = 0; i < arrInputs.length; i++) {
                    var oInput = arrInputs[i];
                    if (oInput.type == "file") {
                        var sFileName = oInput.value;
                        if (sFileName.length > 0) {
                            var blnValid = false;
                            for (var j = 0; j < _validFileExtensions.length; j++) {
                                var sCurExtension = _validFileExtensions[j];
                                if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                                    blnValid = true;
                                    break;
                                }
                            }

                            if (!blnValid) {
                                document.getElementById("errorHead").innerHTML = "Invalid File Format";
                                document.getElementById("errorMsg").innerHTML = "Sorry, " + sFileName + " is invalid, allowed extensions are: " + _validFileExtensions.join(", ");
                                $('#errorModal').modal('show');
                                return false;
                            }
                        }
                    }
                }

                return true;
            }
        </script>

        <!--script for prompt error messages-->
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
        <!-- Footer fie of page -->
        <%@include file="footer_sub.jsp"%>


    </body>

</html>