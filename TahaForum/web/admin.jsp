<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>Admin Page</title>
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
            <!--Start Admin Aside-->
            <%@include file="admin_aside.jsp" %>
            <!--End Admin Aside-->

            <div id="colorlib-main">
                <section class="ftco-section ftco-no-pt ftco-no-pb">
                    <div class="container">
                        <div class="row d-flex">
                            <!--Start Admin Article Body-->

                            <div class="col-xl-8 py-5 px-md-5">
                                <div class="row pt-md-4">
                                    <div>
                                        <h3 class="mb-2">${requestScope.SEARCH_MESSAGE}</h3>
                                    </div>

                                    <div class="text" style="margin-bottom: 0.5rem">
                                        <h3><font color="green">${requestScope.APPROVE_ARTICLE_MESSAGE}</font></h3>
                                        <h3><font color="green">${requestScope.DELETE_ARTICLE_MESSAGE}</font></h3>
                                        <h3><font color="red">${requestScope.APPROVE_ARTICLE_ERROR}</font></h3>
                                        <h3><font color="red">${requestScope.DELETE_ARTICLE_ERROR}</font></h3>
                                    </div>

                                    <c:if test="${requestScope.LIST_ARTICLE != null}">
                                        <c:if test="${not empty requestScope.LIST_ARTICLE}">
                                            <c:if test="${requestScope.LIST_ARTICLE.size() > 0}">
                                                <c:forEach var="article" items="${requestScope.LIST_ARTICLE}">
                                                    <c:url var="article_detail" value="MainController">
                                                        <c:param name="action" value="Admin_View_Article_Details"/>
                                                        <c:param name="article_ID" value="${article.ID}"/>
                                                    </c:url>
                                                    <div class="col-md-12">
                                                        <div class="blog-entry ftco-animate d-md-flex">
                                                            <div class="text text-2 pl-md-4">
                                                                <h3 class="mb-2"><a href="${article_detail}">${article.title}</a></h3>
                                                                <div class="meta-wrap">
                                                                    <p class="meta">
                                                                        <span><i class="icon-calendar mr-2"></i>${article.date}</span>
                                                                        <span><i class="icon-person"></i>${article.authorName}</span>
                                                                        <span><i class="icon-comment2 mr-2"></i>${article.comments.size()} Comment</span>
                                                                    </p>
                                                                </div>
                                                                <p class="mb-4">${article.shortDescription}</p>
                                                                <p>
                                                                    <a href="${article_detail}" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span>
                                                                    </a>
                                                                </p>
                                                                <form action="MainController">
                                                                    <c:if test="${article.status eq 'New'}">
                                                                        <button class="btn btn-success" name="action" value="Admin_Approve_Article">Approve</button>
                                                                    </c:if>

                                                                    <c:if test="${article.status ne 'Deleted'}">
                                                                        <button class="btn btn-danger" name="action" value="Admin_Delete_Article">Delete</button>
                                                                    </c:if>

                                                                    <input type="hidden" name="txtArticleID" value="${article.ID}">
                                                                </form>

                                                            </div>
                                                        </div>

                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </c:if>
                                    </c:if>


                                </div>
                                <!-- END-->
                                <div class="row">
                                    <div class="col">
                                        <div class="block-27">
                                            <ul>
                                                <c:if test="${requestScope.NB_PAGE.size() > 1}">
                                                    <li>
                                                        <c:url var="pageFrist" value="AdminArticlePaginationController">
                                                            <c:param name="page" value="1"/>
                                                        </c:url>
                                                        <a href="${pageFrist}">&lt;</a>
                                                    </li>
                                                    <c:forEach var="page" varStatus="counter" items="${requestScope.NB_PAGE}">

                                                        <c:url var="pageNumber" value="AdminArticlePaginationController">
                                                            <c:param name="page" value="${page}"/>
                                                        </c:url>

                                                        <li><a href="${pageNumber}">${counter.count}</a></li>

                                                    </c:forEach>
                                                    <li>
                                                        <c:url var="pageLast" value="AdminArticlePaginationController">
                                                            <c:param name="page" value="${requestScope.NB_PAGE.size()}"/>
                                                        </c:url>
                                                        <a href="${pageLast}">&gt;</a>
                                                    </li>
                                                </c:if>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--End Admin Article Body-->


                            <!--Start Admin Side Bar-->
                            <%@include file="admin_sidebar.jsp" %>
                            <!--End Admin Side Bar-->

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
