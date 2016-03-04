<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Upload Stall Assignment | Admin </title>

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

        <section>
            <!-- Start of Upload stall assignment content-->
            <div class="row">
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
                                        <label style="color:#000; padding-top:15px; font-size:25px;"> Stall Assignments </label>  

                                        <br/><br/>

                                        <!-- Dashboard icon-->
                                        <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                        <br/><br/>
                                        <a class="btn btn-default" style="width:auto;" href="adminHomePage.jsp">
                                            <strong> Dashboard </strong> 
                                        </a>

                                        <br/><br/><br/>

                                        <!-- Update stall assignment icon-->
                                        <span class="fa fa-map-marker" style="font-size:75px; color:#ff0; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                        <br/><br/> 
                                        <a class="btn btn-default active" style="width:auto;" href="uploadStallAssignment.jsp">
                                            <strong> Upload Stall <br/> Assignment </strong> 
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

                    <!-- Start of Uplod Stall Assignment-->
                    <div class="container">
                        <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">

                            <!-- Start of Header of upload Stall Assignment-->
                            <div class="panel panel-default" style="margin-top: 10px;">
                                <div class="panel-heading" style="background-color:#71C671;">
                                    <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Upload Stall Assignment </div>
                                </div>
                            </div>
                            <!-- End of Header of upload Stall assignment-->

                            <br/>

                            <!-- Start of Upload stall map panel-->
                            <div class="panel panel-default" id="ReserveStalls">                            
                                <!-- Panel title-->
                                <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;"> 
                                    <strong> Upload Thursday Stall Assignment </strong> 
                                </div>

                                <div class="panel-body">
                                    <div class="container col-lg-12 col-md-12 col-sm-12 hidden-xs" id="imageScroller">
                                        <center> <h3 style="font-weight: bold;"> Stall Map </h3> </center>
                                        <div STYLE=" height:auto; width:auto; overflow: auto">
                                            <img style="width: 800px;height: 400px" src="../static/images/ThursdayStallAssigment/out.jpg">
                                        </div>
                                    </div>

                                    <!-- Start of update stall assignment form-->

                                    <form class="form-horizontal" action="${pageContext.request.contextPath}/UploadThursdayStallAssigmentSevlet" enctype="multipart/form-data" method="POST" onsubmit="return Validate(this);">

                                        <!-- Upload Stall Assignment icon-->
                                        <div class="form-group">
                                            <label for="uploadStall Assignment" class="control-label col-xs-3" style="padding-top: 25px;"> Upload Stall Assignment </label>
                                            <div class="col-xs-9">

                                                <input type="file" name="stallAssignmentImg" style="border-color:white; padding-top: 25px;"/>
                                                <label for="uploadStall Assignment" class="control-label col-xs-10" style="padding-top: 25px;"> Only Upload [".jpg", ".jpeg", ".bmp", ".gif", ".png"] images</label>    

                                            </div>
                                        </div>

                                        <!-- Submit, cancel button-->
                                        <div class="form-group">
                                            <div class="col-xs-offset-3 col-xs-9">
                                                <button type="submit" class="btn btn-default"> Upload </button>
                                                <button type="submit" class="btn btn-default"> Cancel </button>
                                            </div>
                                        </div>

                                    </form>
                                    <!-- End of update stall assignment form-->
                                </div>

                            </div>
                            <!-- End of Upload Stall map panel-->

                            <!-- Start of Upload stall map panel-->
                            <div class="panel panel-default" id="ReserveStalls">                            
                                <!-- Panel title-->
                                <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;"> 
                                    <strong> Upload Saturday Stall Assignment </strong> 
                                </div>

                                <div class="panel-body">
                                    <div class="container col-lg-12 col-md-12 col-sm-12 hidden-xs" id="imageScroller">
                                        <center> <h3 style="font-weight: bold;"> Stall Map </h3> </center>
                                        <div STYLE="height:auto; width:auto; overflow: auto">
                                            <img style="width: 800px;height: 400px;" src="../static/images/SaturdayStallAssigment/out.jpg">
                                        </div>
                                    </div>

                                    <!-- Start of update stall assignment form-->
                                    <form class="form-horizontal" action="${pageContext.request.contextPath}/UploadSaturdayStallAssigmentSevlet" enctype="multipart/form-data" method="POST" onsubmit="return Validate(this);">

                                        <!-- Upload Stall Assignment icon-->
                                        <div class="form-group"">
                                            <label for="uploadStall Assignment" class="control-label col-xs-3" style="padding-top: 25px;"> Upload Stall Assignment </label>
                                            <div class="col-xs-9">
                                                <input type="file" name="stallAssignmentImg" style="border-color:white; padding-top: 25px;"/>
                                                <label for="uploadStall Assignment" class="control-label col-xs-10" style="padding-top: 25px;"> Only Upload [".jpg", ".jpeg", ".bmp", ".gif", ".png"] images</label>    
                                            </div>
                                        </div>

                                        <!-- Submit, cancel button-->
                                        <div class="form-group">
                                            <div class="col-xs-offset-3 col-xs-9">
                                                <button  type="submit" class="btn btn-default"> Upload </button>
                                                <button type="submit" class="btn btn-default"> Cancel </button>
                                            </div>
                                        </div>

                                    </form>
                                    <!-- End of update stall assignment form-->
                                </div>

                            </div>
                            <!-- End of Upload Stall map panel-->
                        </div>
                    </div>
                    <!-- End of Upload Stall Assignment-->
                </div>
                <!-- End of upload stall assignment content-->
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

        <!-- Footer fie of page -->
        <%@include file="footer_sub.jsp"%>

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
