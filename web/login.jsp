<%-- 
    Document   : login
    Created on : Oct 5, 2013, 12:53:58 AM
    Author     : JonathanDaniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Empresa</title>
        <link rel="stylesheet" href="css/login.css">
    </head>
    <body>
        <header>
            <h1>Óptica Especial</h1>
        </header>
        <section>
            <form method="POST" action="servletSesion" class="loginform">
                <p>
                    <label for="username">Usuario:</label>
                    <input type="text" name="username" id="username" value="" required="">
                </p>
                <p>
                    <label for="password">Contraseña:</label>
                    <input type="password" name="password" id="password" value="" required="">
                </p>
                <p class="login-submit">
                    <button type="submit" class="login-button">Login</button>
                </p>
                <p class="forgot-password"><a href="login.jsp">Olvidé mi Contraseña?</a></p>
            </form>
        </section>
        <footer>
            <p>Todos Los Derechos Reservados</p>
        </footer>
    </body>
</html>
