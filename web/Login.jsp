<%-- 
    Document   : Login
    Created on : May 23, 2024, 9:37:59 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            [class*="fontawesome-"]:before {
                font-family: 'FontAwesome', sans-serif;
            }

            body {
                background: linear-gradient(to left, #272838, #2b2d41, #393549, #433545);
                font-family: 'Raleway', sans-serif;
            }

            form#login-form {
                background: #fff;
                width: 40em;
                margin: 2em auto;
                overflow: hidden;
                position: relative;
                border-radius: 0.3em;
                box-shadow: 0 0 0.2em #000;
            }

            form#login-form div.heading {
                background: #f85f24;
                color: #fff;
                text-align: center;
                text-transform: uppercase;
                font-weight: bold;
                padding: 1.5em;
                font-size: 1.1em;
            }

            form#login-form div.left,
            form#login-form div.right {
                width: 50%;
                float: left;
                padding: 1.7em 1.5em 2.5em 1.5em;
                box-sizing: border-box;
            }

            form#login-form:before,
            form#login-form:after {
                position: absolute;
                top: 0;
                right: 0;
                left: 0;
                bottom: 0;
                margin: auto;
            }

            form#login-form:before {
                content: 'or';
                color: gray;
                height: 0.5em;
                width: 0.5em;
                top: 1.75em;
            }

            form#login-form:after {
                content: '';
                background: rgba(128, 128, 128, 0.3);
                height: 8em;
                width: 0.12em;
                top: -7em;
                left: 0.5em;
                z-index: 900;
                box-shadow: 0 9.6em 0 0 rgba(128, 128, 128, 0.3);
            }

            div.left label {
                display: inline-block;
                color: gray;
                font-size: 1.1em;
                margin-top: 0.6em;
            }

            div.left input[type="email"],
            div.left input[type="password"] {
                border: 0.1em solid #d6d6d6;
                padding: 1em;
                margin: 0.6em 0;
                width: 90%;
                border-radius: 0.3em;
                box-shadow: 0 0 0.2em rgba(214, 214, 214, 0.2);
                transition: 0.15s all ease-in-out;
            }

            div.left input[type="email"]:focus,
            div.left input[type="password"]:focus {
                outline: none;
                border: 0.1em solid #9c9c9c;
            }

            div.left input[type="submit"] {
                background: #f85f64;
                color: #fff;
                outline: none;
                text-transform: uppercase;
                padding: 1.2em;
                overflow: hidden;
                border: none;
                letter-spacing: 0.1em;
                margin: 0.5em 0;
                font-weight: bold;
                border-radius: 0.4em;
                transition: 0.15s all ease-in-out;
            }

            div.left input[type="submit"]:hover {
                background: rgba(248, 95, 100, 0.8);
            }

            .btn-register {
                display: inline-block;
                background: #f85f64;
                color: #fff;
                text-transform: uppercase;
                padding: 1.2em 1.5em;
                text-decoration: none;
                border-radius: 0.4em;
                font-weight: bold;
                transition: 0.15s all ease-in-out;
                margin: 1em 0;
                cursor: pointer;
                border: none; /* Remove border to match other buttons */
            }

            .btn-register:hover {
                background: rgba(248, 95, 100, 0.8);
            }

            div.right div.connect {
                color: gray;
                font-size: 1.1em;
                text-align: center;
            }

            div.right a {
                display: inline-block;
                font-size: 1.5em;
                text-decoration: none;
                color: white;
                width: 9em;
                padding: 0.55em 0.3em;
                clear: both;
                text-align: center;
                margin: 0.5em 1em;
                border-radius: 0.3em;
            }

            div.right a.facebook {
                background: #3a589a;
                margin-top: 0.8em;
                transition: 0.15s all ease-in-out;
            }

            div.right a.facebook:hover {
                background: rgba(58, 88, 154, 0.8);
            }

            div.right a.twitter {
                background: #4099ff;
                transition: 0.15s all ease-in-out;
            }

            div.right a.twitter:hover {
                background: rgba(64, 153, 255, 0.8);
            }

            div.right a.google-plus {
                background: #e9544f;
                transition: 0.15s all ease-in-out;
            }

            div.right a.google-plus:hover {
                background: rgba(233, 84, 79, 0.8);
            }

        </style>
        <script>
            function redirectToRegister() {
                window.location.href = "Register";
            }
        </script>
    </head>
    <body>
        <form action="login" method="post" id="login-form">
            <div class="heading">Login to </div>
            <div class="left">
                <label for="email">Email</label> <br />
                <input type="email" name="email" id="email" /> <br />
                <label for="password">Password</label> <br />
                <input type="password" name="password" id="pass" /> <br />
                <input type="submit" value="Login" />
                <input type="button" class="btn-register" value="Register" onclick="redirectToRegister()">
            </div>
            <div class="right">
                <div class="connect">Connect with</div>
                <!--                <a href="" class="facebook">
                                           <span class="fontawesome-facebook"></span> 
                                    <i class="fa fa-facebook" aria-hidden="true"></i>
                                </a> <br />
                                <a href="" class="twitter">
                                           <span class="fontawesome-twitter"></span> 
                                    <i class="fa fa-twitter" aria-hidden="true"></i>
                                </a> <br />-->
                <a href="" class="google-plus">
                    <!--       <span class="fontawesome-google-plus"></span> -->
                    <i class="fa fa-google-plus" aria-hidden="true"></i>
                </a>
            </div>
        </form>
    </body>
</html>
