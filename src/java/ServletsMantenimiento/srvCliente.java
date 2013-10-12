/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsMantenimiento;

import BeanMantenimiento.BeanCliente;
import DBConnections.cConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JonathanDaniel
 */
public class srvCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Connection cnn = cConnection.conectar_ds();
            PreparedStatement psta;
            String Nombre = request.getParameter("txtNombre");
            String SegundoNombre = request.getParameter("txtSegundoNombre");
            String PrimerApellido = request.getParameter("txtPrimerApellido");
            String SegundoApellido = request.getParameter("txtSegundoApellido");
            String ApellidoCasada = request.getParameter("txtApellidoCasada");
            int Genero = Integer.parseInt(request.getParameter("cmbGenero"));
            int TipoDocumento = Integer.parseInt(request.getParameter("cmbTipoDocumento"));
            String NumeroDocumento = request.getParameter("txtNumeroDocumento");
            String NIT = request.getParameter("txtNIT");
            String NRC = request.getParameter("txtNRC");
            String Telefono = request.getParameter("txtTelefono");
            int Departamento = Integer.parseInt(request.getParameter("cmbDepartamento"));
            int Municipio = Integer.parseInt(request.getParameter("cmbMunicipio"));
            String Direccion = request.getParameter("txtDireccion");
            String Email = request.getParameter("txtEmail");
            String Usuario = request.getParameter("txtUsuario");
            String Clave = request.getParameter("txtClave");
            try {
                psta = cnn.prepareStatement(BeanMantenimiento.BeanCliente.insertar);
                psta.setString(1, Nombre);
                psta.setString(2, SegundoNombre);
                psta.setString(3, PrimerApellido);
                psta.setString(4, SegundoApellido);
                psta.setString(5, ApellidoCasada);
                psta.setInt(6, Genero);
                psta.setInt(7, TipoDocumento);
                psta.setString(8, NumeroDocumento);
                psta.setString(9, NIT);
                psta.setString(10, NRC);
                psta.setString(11, Telefono);
                psta.setInt(12, Departamento);
                psta.setInt(13, Municipio);
                psta.setString(14, Direccion);
                psta.setString(15, Email);
                psta.setString(16, Usuario);
                psta.setString(17, Clave);
                psta.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(srvCliente.class.getName()).log(Level.SEVERE, null, ex);
            }
            //REDIRIGIENDO
            String route = this.getServletContext().getContextPath() + "/WebPagesMantenimiento/wformCliente.jsp";
            String url = response.encodeRedirectURL(route);
            response.sendRedirect(url);

        } finally {
            out.close();
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
