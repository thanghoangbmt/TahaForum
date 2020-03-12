<%-- 
    Document   : create_post
    Created on : Jan 31, 2020, 9:45:12 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Create Post Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div id="colorlib-page">
            <%@include file="aside.jsp" %>

            <div id="colorlib-main">
                <section class="ftco-section ftco-no-pt ftco-no-pb">
                    <div class="container">
                        <div class="row d-flex">
                            <div class="col-xl-8 py-5 px-md-5">
                                <font color="green">${requestScope.POST_ARTICLE_MESSAGE}</font>
                                <font color="red">${requestScope.POST_ARTICLE_ERROR}</font>

                                <form action="MainController">
                                    <div class="form-group">
                                        <label style="font-weight: bold; color: #70acec">Title</label>
                                        <textarea name="txtTitle" class="form-control" placeholder="Title" type="text" required="true" maxlength="100"></textarea>
                                    </div> <!-- form-group// -->

                                    <div class="form-group">
                                        <label style="font-weight: bold; color: #70acec">Short Description</label>
                                        <textarea name="txtShortDescription" class="form-control" placeholder="Short Description" type="text" required="true" maxlength="200"></textarea>
                                    </div> <!-- form-group// --> 

                                    <div class="form-group">
                                        <label style="font-weight: bold; color: #70acec">Content</label>
                                        <textarea name="txtContent" class="form-control" placeholder="Content" type="text" required="true" rows="8"></textarea>
                                    </div> <!-- form-group// --> 

                                    <div class="form-group" style="text-align: center">
                                        <button type="submit" class="btn btn-danger" style="width: 20rem" name="action" value="Post_New_Article">Post</button>
                                    </div> <!-- form-group// --> 
                                </form>
                            </div>
                            <%@include file="sidebar.jsp" %>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
