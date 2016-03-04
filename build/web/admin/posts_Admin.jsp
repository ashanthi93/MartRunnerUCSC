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
        <title> Posts page | Admin </title>

        <!-- Bootstrap style sheets-->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font awesome style sheets for some icons-->
        <link type="text/css" href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">

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

        <br/><br/><br/><br/>

        <section>
            <!-- Start of Post Page content-->
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
                                    <label style="color:#000; padding-top:15px; font-size:25px;"> Posts </label>  

                                    <br/><br/>

                                    <!-- Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="adminHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>

                                    <br/><br/><br/>

                                </div>
                                <!-- End of inner body of start bar-->
                            </center>
                        </div>
                    </div>
                    <!-- End of panel-->
                </div>
                <!-- End of side bar-->

                <!-- Start of Post page Content-->
                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-9">
                        <br/>

                        <!-- Start of Post panel-->
                        <div class="panel panel-default">                            
                            <!-- Panel title-->
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;"> 
                                <strong> Promotional Page </strong> 
                            </div>

                            <div class="panel-body">    

                                <form class="form-horizontal"  name="uploadForm1" action="${pageContext.request.contextPath}/UploadPromotionalPostservlet" onsubmit="return Validate(this);" method="POST" enctype="multipart/form-data">

                                    <div class="form-group">
                                        <label class="control-label col-xs-3">Add Promotional Page</label>
                                        <div class="col-xs-9">

                                            <input type="file" name="file"/>

                                            <p style="font-size: 12px">(Please upload <strong>500*375</strong> size image)</p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-xs-offset-1 col-xs-11">
                                            <button type="submit" name="submit" id="submit" value = "1" class="btn btn-default" style="width: 75px"> Ok </button>
                                            <button type="reset" class="btn btn-default"> Cancel </button>
                                        </div>
                                    </div>

                                </form>

                            </div>

                        </div>

                    </div>
                </div>

            </div>
            <!-- End of Post Page content-->
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

        <br/><br/><br/><br/><br/>

        <!-- Footer fie of page -->
        <%@include file="footer_sub.jsp"%>

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

        <!-- Java Script file-->
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