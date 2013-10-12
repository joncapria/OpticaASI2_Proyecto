<%-- 
    Document   : cerrarSession
    Created on : 28-feb-2013, 11:15:55
    Author     : Emanuel
--%>

<%
    session.invalidate();//destruye la session
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sesión Cerrada</title>        
        <link rel="stylesheet" href="css/MainStyle.css" type="text/css"/>
    </head>
    <body>
        <img src="img/gafas.jpg" />
        <h1>Usted ha cerrado Sesión.</h1>
        <h1>Para regresar a la página principal haga click <a href="index.jsp"target="_self">Aqui</a></h1>
    </body>
</html>
