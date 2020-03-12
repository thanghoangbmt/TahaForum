<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Verification Page</title>
        <!--Made with love by Mutiullah Samim -->

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
        <div class="container">
            <div class="row" style="padding-top: 10rem">
                <aside class="col-sm-4">
                </aside>
                <aside class="col-sm-4">
                    <div class="card">
                        <article class="card-body">

                            <h4 class="card-title mb-4 mt-1">Verification</h4>
                            <form action="MainController" method="POST">
                                <div class="form-group">
                                    <label>Verification Code</label>
                                    <input name="txtVerificationCode" class="form-control" placeholder="Verification Code" type="text" required="true">
                                    <font color="red">${requestScope.VERIFICATION_ERROR}</font>
                                </div> <!-- form-group// -->
                               
                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block" name="action" value="FinishRegister"> Finish </button>
                                </div> <!-- form-group// -->  

                            </form>
                        </article>
                    </div> <!-- card.// -->
                </aside> <!-- col.// -->

                <aside class="col-sm-4">
                </aside>
            </div>
        </div>
    </body>
</html>