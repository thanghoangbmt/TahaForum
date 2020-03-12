<!DOCTYPE html>
<html lang="en">
    <head>
        <title>${requestScope.ARTICLE_DETAILS.title} - Article Details</title>
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
                            <div class="col-lg-8 px-md-5 py-5">
                                <div class="row pt-md-4">
                                    <div class="text text-2 pl-md-4">
                                        <!--Titile:--> 
                                        <h1 class="mb-3">${requestScope.ARTICLE_DETAILS.title}</h1> <br/>
                                        <div class="meta-wrap">
                                            <p class="meta">
                                                <span><i class="icon-calendar mr-2"></i>${requestScope.ARTICLE_DETAILS.date}</span>
                                                <span><i class="icon-person"></i>${requestScope.ARTICLE_DETAILS.authorName}</span>
                                            </p>
                                        </div>

                                        <h4 class="mb-3">${requestScope.ARTICLE_DETAILS.shortDescription}</h4>

                                        <p>${requestScope.ARTICLE_DETAILS.content}</p>
                                    </div>


                                    <div class="pt-5 mt-5">
                                        <h3 class="mb-5 font-weight-bold">${requestScope.ARTICLE_DETAILS.comments.size()} Comments</h3>

                                        <ul class="comment-list">

                                            <c:forEach var="comment" items="${requestScope.ARTICLE_DETAILS.comments}">
                                                <li class="comment">
                                                    <div class="comment-body">
                                                        <h3>${comment.commentatorName}</h3>
                                                        <div class="meta">${comment.commentDate}</div>
                                                        <p>${comment.content}</p>
                                                    </div>
                                                </li>
                                            </c:forEach>

                                        </ul>
                                        <!-- END comment-list -->

                                        <div class="comment-form-wrap pt-5">
                                            <h3 class="mb-5">Leave a comment</h3>
                                            <font color="green">${requestScope.POST_COMMENT_MESSAGE}</font>
                                            <font color="red">${requestScope.POST_COMMENT_ERROR}</font>
                                            <form action="MainController" class="p-3 p-md-5 bg-light">
                                                <div class="form-group">
                                                    <label for="message">Message</label>
                                                    <textarea name="txtContent" id="message" cols="55" rows="10" class="form-control" required="true" onblur="this.value = myTrim(this.value)"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <button type="submit" value="Post_Comment" name="action" class="btn py-3 px-4 btn-primary">Post Comment</button>
                                                </div>

                                                <input type="hidden" name="commentatorEmail" value="${sessionScope.USER.email}">
                                                <input type="hidden" name="article_ID" value="${requestScope.ARTICLE_DETAILS.ID}">
                                            </form>
                                        </div>
                                    </div>
                                </div><!-- END-->
                            </div>

                            <%@include file="sidebar.jsp" %>

                        </div>
                    </div>
                </section>
            </div><!-- END COLORLIB-MAIN -->
        </div><!-- END COLORLIB-PAGE -->

        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


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

        <script>
                                                        function myTrim(x) {
                                                            return x.replace(/^\s+|\s+$/gm, '');
                                                        }
        </script>

    </body>
</html>