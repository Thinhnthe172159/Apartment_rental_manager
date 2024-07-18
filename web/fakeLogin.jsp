<%-- 
    Document   : fakeLogin
    Created on : Jul 17, 2024, 10:21:13 AM
    Author     : thinh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>

    <head>
        <title>Click me if you can</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <style>
            html,
            body {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                width: 100%;
                height: 100%;
                margin: 0;
                font-family: sans-serif;
                font-size: 18px;
            }

            body {
                max-width: 400px;
                padding: 1rem;
                box-sizing: border-box;
            }

            button {
                display: block;
                padding: 0.75rem 1.25rem;
                border: 0;
                border-radius: 4px;
                background-color: hsl(218deg 92% 57%);
                color: #fff;
                user-select: none;
                font-size: 1rem;
                transform-style: preserve-3d;
            }

            button:before,
            button:after {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                z-index: -1;
                border-radius: 4px;
                background-color: hsl(218deg 92% 35%);
                transform: translateZ(-5px);
            }

            button:after {
                background-color: hsl(218deg 92% 20%);
                transform: translateZ(-10px);
            }

            .button-wrapper {
                position: relative;
                perspective: 400px;
                align-self: flex-start;
            }

            hgroup {
                width: 100%;
                margin: 0 0 2rem 0;
            }

            h1 {
                font-size: 1.5rem;
                font-weight: 600;
                margin: 0 0 1rem 0;
            }

            h3 {
                font-size: 1rem;
                font-weight: 500;
                margin: 0 0 0.5rem 0;
                display: flex;
                justify-content: space-between;
                align-items: center;
                color: #888;
            }

            a {
                color: inherit;
                text-decoration: none;
            }
        </style>
        <script>
            function redirectToRegister() {
                window.location.href = "Register";
            }
        </script>
    </head>

    <body>


        <form class="row" action="Login" method="post">
            <h1>Login</h1><div><br></div>
            <c:if test="${message != null}">
                <div class="" role="alert" style="color: red">
                    ${message}
                </div>
            </c:if>
            <input class="form-control col-md-4" type="text" name="email"  placeholder="email@examp.com"><br>
            <div><br></div>
            <input class="form-control col-md-4" type="password" name="password"  placeholder="password"><br>
            <div><br></div><div><br></div><div><br></div><div><br></div>
            <div class="button-wrapper col-md-12 flex-active row">
                <button class="justify-content-center col-md-6" type="submit">Login</button>
                <input type="button" class="btn btn-register justify-content-center col-md-6" style="background: hsl(218deg 92% 57%);color: white;border-radius: 4px" value="Register" onclick="redirectToRegister()">
                <div><br></div>
                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile email&redirect_uri=http://localhost:9999/SWP391_Apartment_rental_management_system/LoginByGoogle&response_type=code&client_id=369413613183-srjd8p76m1hr9b21s70gjl8ooebf0t1f.apps.googleusercontent.com&approval_prompt=force" class="btn btn-primary google-plus col-md-12" style="background: hsl(218deg 92% 57%);color: white;border-radius: 4px">
                    <!--       <span class="fontawesome-google-plus"></span> -->
                    <i class="fa fa-google" aria-hidden="true"></i>Google
                </a>
            </div>
        </form>




        <script>
            const button = document.querySelector('button');

            const distanceBetween = (p1x, p1y, p2x, p2y) => {
                const dx = p1x - p2x;
                const dy = p1y - p2y;
                return Math.sqrt(dx * dx + dy * dy);
            };

            document.addEventListener('mousemove', event => {
                const radius = Math.max(button.offsetWidth * 0.75, button.offsetHeight * 0.75, 100);

                const bx = button.parentNode.offsetLeft + button.offsetLeft + button.offsetWidth / 2;
                const by = button.parentNode.offsetTop + button.offsetTop + button.offsetHeight / 2;

                const dist = distanceBetween(event.clientX, event.clientY, bx, by);
                const angle = Math.atan2(event.clientY - by, event.clientX - bx);

                const ox = -1 * Math.cos(angle) * Math.max((radius - dist), 0);
                const oy = -1 * Math.sin(angle) * Math.max((radius - dist), 0);

                const rx = oy / 2;
                const ry = -ox / 2;

                button.style.transition = 'all 0.1s ease';
                button.style.transform = 'translate(' + ox + 'px, ' + oy + 'px) rotateX(' + rx + 'deg) rotateY(' + ry + 'deg)';
                button.style.boxShadow = '0px ' + Math.abs(oy) + 'px ' + (Math.abs(oy) / radius * 40) + 'px rgba(0,0,0,0.15)';
            });

            const nocheat = () => button.textContent = 'No cheating';
            const notouch = () => button.textContent = 'This thing doesn\'t work with touch';

            button.addEventListener('click', event => button.textContent = 'You win');
            button.addEventListener('keydown', event => {
                event.preventDefault();
                nocheat();
            });
            button.click = nocheat;

            if (navigator.userAgent.match(/Android|iPhone|iPad|iPod/i))
                notouch();
            window.addEventListener('touchstart', notouch);
        </script>


    </body>

</html>
