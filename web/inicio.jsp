<%-- 
    Document   : admingrupos
    Created on : 03-07-2013, 01:22:22 PM
    Author     : Jon
--%>

<%
    try {
        String user = (String) session.getAttribute("usuario_usu");
        String clave = (String) session.getAttribute("clave_usu");

        if (user == null || clave == null) {
            response.sendRedirect("login.jsp");
        }
    } catch (java.lang.NullPointerException e) {
        response.sendRedirect("login.jsp");
    }

    java.util.Calendar cal = java.util.Calendar.getInstance(java.util.Locale.US);
    java.util.Date date = cal.getTime();
    java.text.DateFormat formateadorHora = java.text.DateFormat.getTimeInstance(java.text.DateFormat.FULL);
    java.text.DateFormat formateadorFecha = java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL);

%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<html>
    <!--HEAD-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <!--ESTILOS, JAVASCRIPTS, JQUERYS Y AJAX-->
        <link rel="stylesheet" href="css/MainStyle.css" type="text/css"/>
    </head>
    <!--HEAD END-->

    <body>
        <!--CONTENEDOR DE TODA LA PÁGINA WEB (TODO ESTA DENTRO)-->
        <div class="contenedor">
            <!--ENCABEZADO-->
            <div class="encabezado">
                <div class="login"><a href="cerrarsession.jsp" class="button-bevel orange"> <span class="flag"></span> Cerrar Sesión </a></div>
                <a href="#"><img src="img/gafas.jpg" class="logo" name="logo"  /></a> 
                <!-- end .header -->
                <br>
                <h1>Optica Especial</h1>
                <h2>Sistema de Control e inventario</h2>
                <p>Usuario: <%= session.getAttribute("usuario_usu")%>. <br/> 
                   Nombre: <%= session.getAttribute("empleado.nombre_emp")%>.</p>                
            </div>
            <!--ENCABEZADO END-->
            <hr id="header_stripe"/> <!--BARRA DEBAJO DEL ENCABEZADO-->
            <!--BARRA LATERAL IZQUIERDA-->
            <div class="barralateral">
                <!--MENU-->
                <ul class="menuUL">
                    <!-- The class names that are assigned to the links correspond to name of the shape that is shown on hover: -->
                    <li><a href="inicio.jsp" class="button-bevel orange" <span class="refresh"></span> Inicio</a></li>
                    <li><a href="WebPagesMantenimiento/wformCliente.jsp" class="button-bevel orange" <span class="flag"></span>Clientes</a></li>
                    <li><a href="empleado.jsp" class="button-bevel orange" <span class="refresh"></span> Empresa</a></li>
                    <li><a href="proveedor.jsp" class="button-bevel orange" <span class="refresh"></span> Proveedores</a></li>
                    <li><a href="venta.jsp" class="button-bevel orange" <span class="refresh"></span> Ventas</a></li>
                    <li><a href="adminhorarios.jsp" class="button-bevel orange" <span class="refresh"></span> ?</a></li>
                    <li><a href="admininstructores.jsp" class="button-bevel orange" <span class="refresh"></span> ?</a></li>
                    <li><a href="adminmaterias.jsp" class="button-bevel orange" <span class="refresh"></span> ?</a></li>
                </ul>
                <!--MENU END-->
            </div>
            <!--BARRA LATERAL IZQUIERDA END-->
            <!--FORMULARIO-->
            <div class="formularios">
                <form id="form1" class="niceform" name="form1" method="post" action="${pageContext.servletContext.contextPath}/srvAlumno">
                    <table class="tableform">
                        <tr>
                            <td colspan="2">
                        <legend>Inicio</legend>
                        </td>
                        </tr>
                        <tr>
                            <td><h1 id="tittleinicio">Seleccione una Opción...</h1></td>
                        </tr>
                    </table>                   
                </form>
            </div>
            <!--FORMULARIO END-->
            <br>            
            <br>
            <br>            
            <br>
            <div class="footer">
                <p>All Copyrights Reserved.</p>
                <p>El presente proyecto ha sido creado para la administración y control del sistema de ventas e inventario de la Óptica Especial</p>
            </div>
        </div>
        <!--CONTENEDOR END-->
    </body>
</html>