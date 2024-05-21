<%-- 
    Document   : Register
    Created on : May 20, 2024, 6:54:16 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        * {
            box-sizing: border-box
        }

        /* Full-width input fields */
        input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
        }

        input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
        }

        hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
        }

        /*         Set a style for all buttons 
                button {
                    background-color: #04AA6D;
                    color: white;
                    padding: 14px 20px;
                    margin: 8px 0;
                    border: none;
                    cursor: pointer;
                    width: 100%;
                    opacity: 0.9;
                }
        
                button:hover {
                    opacity:1;
                }
        
                 Extra styles for the cancel button 
                .cancelbtn {
                    padding: 14px 20px;
                    background-color: #f44336;
                }
        
                 Float cancel and signup buttons and add an equal width 
                .cancelbtn, .signupbtn {
                    float: left;
                    width: 50%;
                }*/
        /* Restyle cancel button */
        .cancelbtn {
            background-color: #f44336; /* Red background */
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
        }

        /* Hover effect for cancel button */
        .cancelbtn:hover {
            background-color: #d32f2f; /* Darker shade of red */
        }

        /* Restyle sign up button */
        .signupbtn {
            background-color: #4CAF50; /* Green background */
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
        }

        /* Hover effect for sign up button */
        .signupbtn:hover {
            background-color: #45a049; /* Darker shade of green */
        }

        /* Adjust button width and margin */
        button {
            width: auto; /* Adjust width automatically */
            margin: 10px; /* Add margin for spacing */
        }

        /* Add padding to container elements */
        .container {
            padding: 16px;
        }

        .alert {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
        }
        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }

        /* Clear floats */
        .clearfix::after {
            content: "";
            clear: both;
            display: table;
            
        }

        /* Change styles for cancel button and signup button on extra small screens */
        @media screen and (max-width: 300px) {
            .cancelbtn, .signupbtn {
                width: 100%;
            }
        }
    </style>
    <body>

        <form action="Register" method="post" style="border:1px solid #ccc">
            <div class="container">
                <h1>Sign Up</h1>
                <p>Please fill in this form to create an account.</p>
                <span style="color:red;">*</span><span> Is required</span>
                <c:if test="${message != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message}
                    </div>
                </c:if>
                <hr>

                <label for="first-name"><b>First Name <span style="color:red;">*</span></b></label>
                <input type="text" placeholder="First Name" name="first-name" required>
                <c:if test="${message1 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message1}
                    </div>
                </c:if>

                <label for="last-name"><b>Last Name <span style="color:red;">*</span></b></label>
                <input type="text" placeholder="Last Name" name="last-name" required>
                <c:if test="${message2 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message2}
                    </div>
                </c:if>

                <label for="email"><b>Email <span style="color:red;">*</span></b></label>
                <input type="text" placeholder="Enter Email" name="email" required>
                <c:if test="${message3 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message3}
                    </div>
                </c:if>

                <label for="psw"><b>Password <span style="color:red;">*</span></b></label>
                <input type="password" placeholder="Enter Password" name="psw" required>
                <c:if test="${message4 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message4}
                    </div>
                </c:if>

                <label for="psw-repeat"><b>Repeat Password <span style="color:red;">*</span></b></label>
                <input type="password" placeholder="Repeat Password" name="psw-repeat" required>
                <c:if test="${message5 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message5}
                    </div>
                </c:if>

                <label for="dob"><b>Date of Birth <span style="color:red;">*</span></b></label>
                <input type="date" placeholder="Enter Date of Birth" name="dob" required>
                <c:if test="${message5 != null}">
                    <div class="alert alert-danger" role="alert">
                        ${message6}
                    </div>
                </c:if>

                <div class="clearfix">
                    <button type="button" class="cancelbtn">Cancel</button>
                    <button type="submit" class="signupbtn">Sign Up</button>
                </div>
            </div>
        </form>

    </body>
</html>
