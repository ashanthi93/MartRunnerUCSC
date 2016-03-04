<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- start of head -->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- title -->
        <title>Search vendor| Admin</title>

        <!-- bootstrap css-->
        <link type="text/css" href="../static/css/bootstrap.min.css" rel="stylesheet">

        <!-- font-awesome css -->
        <link href="../static/font-awesome-4.3.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <!-- end of head -->

    <!-- start of body -->
    <body>

        <!-- include header file -->
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
                                    <label style="color:#000; padding-top:15px; font-size:25px;"> Search Vendors </label>  

                                    <br/><br/>

                                    <!-- Dashboard icon-->
                                    <span class="glyphicon glyphicon-dashboard " style="font-size:75px; color:#68228B; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span>
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto;" href="adminHomePage.jsp">
                                        <strong> Dashboard</strong> 
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Search by market icon-->
                                    <span class="fa fa-search" style="font-size:75px; color: #d58512; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/>
                                    <a class="btn btn-default" style="width:auto" href="searchMarket_Admin.jsp">
                                        <strong> Search by <br/> Market</strong>
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Search by main category icon-->
                                    <span class="fa fa-search" style="font-size:75px; color:#009; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/> 
                                    <a class="btn btn-default" style="width:auto;" href="searchMainCategory_Admin.jsp" >
                                        <strong> Search by <br/> Main Category </strong> 
                                    </a>

                                    <br/><br/><br/>

                                    <!-- Search by product category icon-->
                                    <span class="fa fa-search" style="font-size:75px; color:red; border-radius: 5px; height:100px;width:100px; background-color: whitesmoke; padding: 10px;"></span> 
                                    <br/><br/>
                                    <a class="btn btn-default active" style="width:auto;" href="searchSubCategory_Admin.jsp"> 
                                        <strong> Search by <br/> Product Category </strong> 
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

                <div class="container">
                    <div class="col-lg-9 col-md-9 col-sm-9" style="padding-top: 10px;">

                        <!-- Start of search by product category panel -->
                        <div class="panel panel-default">

                            <!-- panel title -->  
                            <div class="panel-heading" style="background-color:#71C671; ">
                                <div class="panel-title" style="color:#000; font-weight:bold; font-size: 20px;"> Search by Product Category </div>
                            </div>

                            <br/>

                            <!-- start of form -->
                            <form action="${pageContext.request.contextPath}/searchVendorByProductCatg" method="POST" class="form-horizontal" onsubmit="return(validateSearch())">

                                <!-- radio button to select product category -->
                                <div class="form-group col-xs-10">
                                    <label class="col-md-12"> Select Product Category </label>
                                    <ul style="list-style:none;">
                                        <li> <input type="radio" id="productCategory" name="productCategory" value="OP"/> Organic Products </li>
                                        <li> <input type="radio" id="productCategory" name="productCategory" value="AF"/> Animal based Farm Products </li>
                                        <li> <input type="radio" id="productCategory" name="productCategory" value="PF"/> Prepared Foods </li>
                                        <li> <input type="radio" id="productCategory" name="productCategory" value="NB"/> Natural Body & Home </li>
                                        <li> <input type="radio" id="productCategory" name="productCategory" value="AH"/> Art & Handicrafts </li>
                                        <li> <input type="radio" id="productCategory" name="productCategory" value="TR"/> Travel </li>
                                        <li> <input type="radio" id="productCategory" name="productCategory" value="SP"/> Service Providers </li>
                                    </ul>
                                </div>

                                <!-- Submit, Cancel button -->
                                <div class="form-group">
                                    <div class="form-group">
                                        <div class="col-xs-offset-3 col-xs-9">
                                            <button type="submit" class="btn btn-default"> Ok </button>
                                            <button type="submit" class="btn btn-default" onclick="window.location.reload()"> Cancel </button>
                                        </div>
                                    </div>
                                </div>

                            </form>
                            <!-- end of form -->

                        </div>
                        <!-- End of search by product category panel -->

                        <!-- Start of Search by market panel -->
                        <div class="panel panel-default">

                            <!-- panel title -->    
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                <strong> Search by Market </strong> 
                            </div><br/>

                            <!-- start of form -->
                            <form action="${pageContext.request.contextPath}/searchVendorByMarket" method="POST" class="form-horizontal" onsubmit="return(validateSearch())">

                                <!-- checkbox to select market days -->
                                <div class="form-group col-xs-10">
                                    <label class="col-md-12"> Select Market Day </label>
                                    <ul style="list-style:none;">
                                        <li> <input type="checkbox" name="marketDay" id="marketDay" value="TH" disabled="disabled"/> Thursday Market </li>
                                        <li> <input type="checkbox" name="marketDay" id="marketDay" value="SA" disabled="disabled"/> Saturday Market </li>
                                        <li> <input type="checkbox" name="marketDay" id="marketDay" value="GM" disabled="disabled"/> Good Market Shop </li>
                                    </ul>
                                </div>

                                <!-- Submit, cancel button -->
                                <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <button type="submit" class="btn btn-default" disabled="disabled"> Ok </button>
                                        <button type="reset" class="btn btn-default" onclick="window.location.reload()" disabled="disabled"> Cancel </button>
                                    </div>
                                </div>

                            </form>
                            <!-- end of form -->    

                        </div> 
                        <!-- End of Search by market panel -->

                        <!-- Start of search by main category panel -->
                        <div class="panel panel-default" >

                            <!-- panel title -->    
                            <div class="panel-title" style="font-size:16px; font-weight:bold; color:#218868; background-color: #C1FFC1; padding: 5px;">
                                <strong> Search by Main Category </strong> 
                            </div><br/>

                            <!-- start of form -->
                            <form action="${pageContext.request.contextPath}/searchVendorByMainCatg" method="POST" class="form-horizontal" onsubmit="return(validateSearch())">

                                <!-- radio button to select main category -->
                                <div class="form-group col-xs-10">
                                    <label class="col-md-12"> Select Main Category </label>
                                    <ul style="list-style:none;">
                                        <li> <input type="radio" name="mainCatg" id="mainCatg" value="RP" disabled="disabled"/> Rural Producers </li>
                                        <li> <input type="radio" name="mainCatg" id="mainCatg" value="SE" disabled="disabled"/> Social Enterprise </li>
                                        <li> <input type="radio" name="mainCatg" id="mainCatg" value="RB" disabled="disabled"/> Responsible Business </li>
                                    </ul>
                                </div>

                                <!-- Submit, cancel button -->
                                <div class="form-group">
                                    <div class="col-xs-offset-3 col-xs-9">
                                        <button type="submit" class="btn btn-default" disabled="disabled"> Ok </button>
                                        <button type="reset" class="btn btn-default" onclick="window.location.reload()" disabled="disabled"> Cancel </button>
                                    </div>
                                </div>
                            </form>
                            <!-- end of form -->

                        </div>
                        <!-- End of search by main category panel -->

                    </div>
                </div>
            </div>>
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

        <!-- Include footer file -->
        <%@include file="footer_sub.jsp"%>

        <script type="text/javascript">
            function validateSearch() {
                var product = document.getElementsByName("productCategory");
                if (!(product[0].checked || product[1].checked || product[2].checked || product[3].checked || product[4].checked || product[5].checked || product[6].checked)) {
                    document.getElementById("errorHead").innerHTML = "Empty Selection";
                    document.getElementById("errorMsg").innerHTML = "Please select a category and click on search !";
                    $('#errorModal').modal('show');
                    return false;
                }
                return true;
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
    <!-- End of body -->
</html>

