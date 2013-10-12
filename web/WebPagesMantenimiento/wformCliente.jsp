<%-- 
    Document   : admingrupos
    Created on : 03-07-2013, 01:22:22 PM
    Author     : Jon
--%>

<%@page import="BeanMantenimiento.BeanCliente"%>
<%
    try {
        String user = (String) session.getAttribute("usuario_usu");
        String clave = (String) session.getAttribute("clave_usu");

        if (user == null || clave == null) {
            response.sendRedirect("../login.jsp");
        }
    } catch (java.lang.NullPointerException e) {
        response.sendRedirect("../login.jsp");
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<!DOCTYPE html>
<%@include file="../elementos_codigo.jspf" %>
<html>
    <!--HEAD-->
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <!--ESTILOS, JAVASCRIPTS, JQUERYS Y AJAX-->
        <link rel="stylesheet" href="../css/MainStyle.css" type="text/css"/>       

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
                <!--MENU-->
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
                <form id="form1" class="niceform" name="form1" method="post" action="${pageContext.servletContext.contextPath}/srvCliente">

                    <table class="tableform">
                        <tr>
                            <td colspan="2">
                        <legend>Administración de Clientes</legend>
                        </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <br><label>Llena el Siguiente formulario para agregar a un nuevo cliente, Recuerda que el (*) significa Obligatorio</label>
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td><label>ID del Cliente (No Modificar):</label></td>
                            <td><input  type="text" name="txtId" value="" readonly="true" /></td>
                        </tr>
                        <tr>
                            <td><label>* Primer Nombre:</label></td>
                            <td><input  type="text" name="txtNombre" value=""/></td>
                        </tr>
                        <tr>
                            <td><label>Segundo Nombre:</label></td>
                            <td><input  type="text" name="txtSegundoNombre" value=""/></td>
                        </tr>
                        <tr>
                            <td><label>* Primer Apellido:</label></td>
                            <td><input  type="text" name="txtPrimerApellido" value=""/></td>
                        </tr>
                        <tr>
                            <td><label>Segundo Apellido:</label></td>
                            <td><input  type="text" name="txtSegundoApellido" value=""/></td>
                        </tr>
                        <tr>
                            <td><label>Apellido Casada:</label></td>
                            <td><input  type="text" name="txtApellidoCasada" value=""/></td>
                        </tr>
                        <tr>
                            <td><label>* Género:</label></td>
                            <td>
                                <select name="cmbGenero" size="1" id="desplegable">
                                    <option>SELECCIONAR</option>
                                    <option VALUE="m">Hombre</option>
                                    <option VALUE="f">Mujer</option>                                    
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td><label>* Tipo de Documento:</label></td>
                            <td>
                                <jsp:useBean id="tipodocumento" scope="request" class="BeanCombos.BeanComboTipodoc" />
                                <select name="cmbTipoDocumento" size="1" id=""> 
                                    <option>SELECCIONAR</option>
                                    <c:forEach items="${tipodocumento.listado}" var="lista">
                                        <option value="${lista.id_tipdoc}"><c:out value="${lista.tipdoc}"/></option>
                                    </c:forEach>
                                </select>    
                            </td>
                        </tr>
                        <tr>
                            <td><label>* Número de documento:</label></td>
                            <td><input  type="Text" name="txtNumeroDocumento" value=""/></td>
                        </tr>                                                
                        <tr>
                            <td><label>NIT:</label></td>
                            <td><input  type="text" name="txtNIT" value=""/></td>
                        </tr>
                        <tr>
                            <td><label>NRC:</label></td>
                            <td><input  type="text" name="txtNRC" value=""/></td>
                        </tr>
                        <tr>
                            <td><label>* Teléfono:</label></td>
                            <td><input  type="text" name="txtTelefono" value=""/></td>
                        </tr>
                        <tr>
                            <td><label>* Departamento:</label></td>
                            <td>
                                <jsp:useBean id="departamento" scope="request" class="BeanCombos.BeanComboDep" />
                                <select name="cmbDepartamento" size="1" id="">   
                                    <option>SELECCIONAR</option>
                                    <c:forEach var="lista" items="${departamento.listado}" >
                                        <option value="${lista.id_dep}"><c:out value="${lista.dep}"/></option>
                                    </c:forEach>
                                </select>    
                            </td>
                        </tr>
                        <tr>
                            <td><label>* Municipio:</label></td>
                            <td>
                                <jsp:useBean id="municipio" scope="request" class="BeanCombos.BeanComboMun" />
                                <select name="cmbMunicipio" size="1" id="">   
                                    <option>-----------</option>
                                    <c:forEach var="lista" items="${municipio.listado}" >
                                        <option value="${lista.id_mun}"><c:out value="${lista.mun}"/></option>                                        
                                    </c:forEach>
                                </select>  
                            </td>
                        </tr>
                        <tr>
                            <td><label>* Dirección:</label></td>
                            <td><input  type="text" name="txtDireccion" value=""/></td>
                        </tr>                                                                       
                        <tr>
                            <td><label>* E-mail:</label></td>
                            <td><input type="text" name="txtEmail" value=""/></td> 
                        </tr>
                        <tr>
                            <td><label>Usuario:</label></td>
                            <td><input type="text" name="txtUsuario" value=""/></td> 
                        </tr>
                        <tr>
                            <td><label>Clave:</label></td>
                            <td><input type="text" name="txtClave" value=""/></td> 
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
                    <jsp:useBean id="categoria" scope="request" class="BeanMantenimiento.BeanCliente" />
                    <c:set var="lista" scope="request" value="${categoria.listado}"/>
                    <display:table name="lista" export="true" id="order1" >                        
                        <display:setProperty name="export.rtf.filename" value="example.rtf"/>
                        <display:column property="id_cli" title="ID"/>
                        <display:column property="nom_cli" title="Nombre"/>
                        <display:column property="segnom_cli" title="Segundo Nombre"/>
                        <display:column property="primape_cli" title="Primer Apellido"/>
                        <display:column property="segape_cli" title="Segundo Apellido"/>
                        <display:column property="casape_cli" title="Apellido de Casada"/>
                        <display:column property="id_tipdoc" title="Tipo de Documento"/>
                        <display:column property="tipdoc" title="Tipo de Documento"/>
                        <display:column property="numdoc_cli" title="Numero de Documento"/>                       
                        <display:column property="nit_cli" title="NIT"/>
                        <display:column property="nrc_cli" title="NRC"/>
                        <display:column property="tel_cli" title="Teléfono"/>
                        <display:column property="id_dep" title="Departamento"/>
                        <display:column property="id_mun" title="Municipio"/>
                        <display:column property="dir_cli" title="Dirección"/>
                        <display:column property="email_cli" title="E-mail"/>
                        <display:column property="usu_cli" title="Usuario"/>
                        <display:column property="clave_cli" title="Clave"/>
                        <display:setProperty name="export.pdf" value="true" />                        
                        <display:column title="Editar">
                            <a href="javascript:enviar()">Enviar</a>
                        </display:column>
                    </display:table>
                    <!--LISTADO END-->  

                </form>
            </div>
            <!--FORMULARIO END-->           
            <br><br><br><br>

            <div class="footer">
                <p>All Copyrights Reserved.</p>
                <p>El presente proyecto ha sido creado para la administración y control del sistema de ventas e inventario de la Óptica Especial</p>
            </div>
        </div>
        <!--CONTENEDOR END-->
    </body>
</html>