<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Register Page</title>
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
            <div class="row pt-5">
                <aside class="col-sm-4">
                </aside>
                <aside class="col-sm-4">
                    <div class="card">
                        <article class="card-body">
                            <a href="login.jsp" class="float-right btn btn-outline-primary">Sign In</a>
                            <h4 class="card-title mb-4 mt-1">Sign Up</h4>
                            <form action="MainController" method="POST">
                                <div class="form-group">
                                    <label>Your name</label>
                                    <input name="txtName" class="form-control" placeholder="Name" type="text" required="true">
                                </div> <!-- form-group// -->

                                <div class="form-group">
                                    <label>Your email</label>
                                    <input name="txtEmail" class="form-control" placeholder="Email" type="email" required="true">
                                    <font color="red">${requestScope.REGISTERERROR.emailError}</font>
                                </div> <!-- form-group// -->

                                <div class="form-group">
                                    <label>Password</label>
                                    <input name="txtPassword" id="txtPassword" class="form-control" placeholder="******" type="password" required="true">
                                </div> <!-- form-group// --> 

                                <div class="form-group">
                                    <label>Confirm password</label>
                                    <input name="txtConfirmPassword" id="txtConfirmPassword" class="form-control" placeholder="******" type="password" required="true">
                                </div> <!-- form-group// --> 

                                <div class="form-group">
                                    <button type="submit" class="btn btn-primary btn-block" name="action" value="Register" onclick="return ValidatePassword()"> Register </button>
                                </div> <!-- form-group// -->     
                                <a href="IndexController" class="float-left btn btn-outline-info" style="margin-right: 0.2rem">Back to Home</a>
                            </form>
                        </article>
                    </div> <!-- card.// -->
                </aside> <!-- col.// -->

                <aside class="col-sm-4">
                </aside>
            </div>
        </div>

        <script type="text/javascript">
            function ValidatePassword() {
                var password = document.getElementById("txtPassword").value;
                var confirmPassword = document.getElementById("txtConfirmPassword").value;
                if (password != confirmPassword) {
                    alert("Passwords do not match!");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>