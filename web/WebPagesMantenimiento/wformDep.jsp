<%-- 
    Document   : wformDep
    Created on : Oct 10, 2013, 12:37:20 PM
    Author     : JonathanDaniel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<%@include file="../elementos_codigo.jspf" %>
<html>
    <!--HEAD-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Departamento</title>
        <!--ESTILOS, JAVASCRIPTS, JQUERYS Y AJAX-->
        <link rel="stylesheet" href="../css/MainStyle.css" type="text/css"/>  
        <script>
            function getvalor(codigo, departamento) {
                //alert(id+'-'+dep);
                txtIdDep.value = codigo;
                txtDep.value = departamento;
            }
        </script>       
    </head>
    <!--HEAD END-->
    <body>
        <!--CONTENEDOR DE TODA LA PÁGINA WEB (TODO ESTA DENTRO)-->
        <div class="contenedor">
            <!--ENCABEZADO-->
            <div class="encabezado">
                <div class="login"><a href="../login.jsp" class="button-bevel orange"> <span class="flag"></span> Cerrar Sesión </a></div>
                <a href="#"><img src="../img/gafas.jpg" class="logo" name="logo"  /></a> 
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
                <jsp:useBean id="menu" scope="request" class="BeanCombos.BeanMenuPagina" />
                <ul class="menuUL">
                    <c:forEach items="${menu.listado}" var="lista"> 
                        <li><a href="${lista.url}" class="button-bevel orange" <span class="refresh"></span>${lista.nom_pag}</a></li>
                            </c:forEach>                            
                    <!-- The class names that are assigned to the links correspond to name of the shape that is shown on hover: -->                                       
                </ul>
                <!--MENU END-->
            </div>
            <!--BARRA LATERAL IZQUIERDA END-->
            <!--FORMULARIO-->
            <div class="formularios">
                <br>
                <fieldset class="action">
                    <div class="submenu">
                        <center>
                            <jsp:useBean id="menu2" scope="request" class="BeanCombos.BeanMenuPagina2" />
                            <c:forEach items="${menu2.listado}" var="lista2"> 
                                <a href="${lista2.url}" class="button-bevel black" <span class="flag"></span>${lista2.nom_pag}</a>
                            </c:forEach>                                                              
                        </center>                    
                    </div>
                </fieldset>
                <form id="form1" class="niceform" name="form1" method="post" action="${pageContext.servletContext.contextPath}/srvCliente"> 
                    <table class="tableform">
                        <tr>
                            <td colspan="2">
                        <legend>Administración de Departamentos del País</legend>
                        </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br><label>Llena el Siguiente formulario para agregar a un nuevo cliente, Recuerda que el (*) significa Obligatorio</label>
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td><label>ID de Departamento (No Modificar):</label></td>
                            <td><input  type="text" name="txtIdDep" id="txtIdDep" readonly="true"/></td>
                        </tr>
                        <tr>
                            <td><label>Nombre del Departamento:</label></td>
                            <td><input type="text" name="txtDep" id="txtDep" /></td>
                        </tr>
                    </table>
                    <!--BOTONES DE ACCION-->
                    <fieldset class="action">
                        <input type="submit" accesskey="l" id="inscribirbttn" name="INSCRIBIR" class="button-bevel orange" value="Agregar" /> 
                        <input type="submit" accesskey="2" id="modificarbttn" name="MODIFICAR" class="button-bevel green" value="Modificar" /> 
                        <input type="submit" accesskey="2" id="eliminarbttn" name="ELIMINAR" class="button-bevel green" value="Eliminar" /> 
                        <input type="reset" accesskey="2" id="clearbttn" name="LIMPIAR" class="button-bevel green" value="Limpiar" /> 
                    </fieldset>
                    <!--BOTONES DE ACCION END-->
                    <br><br><br><br>
                    <!--LISTADO-->
                    <jsp:useBean id="categoria" scope="request" class="BeanMantenimiento.BeanDep" />
                    <c:set var="lista" scope="request" value="${categoria.listado}"/>
                    <display:table name="lista" export="true" id="fila" >                        
                        <display:setProperty name="export.rtf.filename" value="example.rtf"/>
                        <display:column property="id_dep" title="ID Departamento"/>
                        <display:column property="dep" title="Nombre Departamento"/>                        
                        <display:setProperty name="export.pdf" value="true" />                        
                        <display:column title="Editar">
                            <a href="javascript:getvalor(${fila.id_dep}, '${fila.dep}')"> Seleccionar</a>
                        </display:column>
                    </display:table>
                    <!--LISTADO END-->  
                </form>
            </div>
            <!--FORMULARIO END-->           
            <br><br><br><br>
            <div class="footer">
                <p>All Copyrights Reserved.</p>
                <p>El presente proyecto ha sido creado para la administración y control del sistema de ventas e inventario de la Óptica Especial, En la Ciudad de San Salvador</p>
            </div>
        </div>
        <!--CONTENEDOR END-->
    </body>
</html>
