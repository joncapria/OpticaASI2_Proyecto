/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ServletsSession;

import BeanSession.BeanSession;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Emanuel
 */
@WebServlet(name = "servletSesion", urlPatterns = {"/servletSesion"})
public class servletSesion extends HttpServlet {

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

            /* TODO output your page here
             out.println("<html>");
             out.println("<head>");
             out.println("<title>Servlet servletSesion</title>");  
             out.println("</head>");
             out.println("<body>");
             out.println("<h1>Servlet servletSesion at " + request.getContextPath () + "</h1>");
             out.println("</body>");
             out.println("</html>");
             */

            String usuario = request.getParameter("username");
            String password = request.getParameter("password");

            // realizamos acceso a la base de datos
            String[] datos = BeanSession.getFila("SELECT id_usu, usu, "
                    + "clave_usu, usuario.id_emp, empleado.id_emp, empleado.nom_emp FROM usuario, empleado "
                    + "WHERE usu ='" + usuario + "' AND clave_usu='" + password + "' "
                    + "AND usuario.id_emp = empleado.id_emp");
            //String [] dat=beanSesion.getFila("Select codigo_per from personal where usuario = '" +usuario+"'");

            if (datos == null) {

                //nos mostrara esto en caso del usuario no sea encontrado

                out.println("<html>");
                out.println("<head>");
                out.println("<title> :::AUTENTICACION FALLIDA!::: </title>");
                out.println("</head>");
                out.println("<body bgcolor='#DDEEFF'>");
                out.println("<table border='0' width='50%' align='center'>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("</br>");
                out.println("<tr>");
                out.println("<td align='center'> <font face='Courier New, Courier, monospace' color='#FF0000' size='2'>Autenticación erronea! Verifique que Usuario y Contraseña sean válidos. <a href='login.jsp'>Regresar>></a></font></p></td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("</body>");
                out.println("</html>");

            } else {
                //capturamos las variables a mostrar
                int id1 = Integer.parseInt(datos[0]);
                String usuario1 = datos[1];
                String password1 = datos[2];
                int empleado1 = Integer.parseInt(datos[3]);
                int empleado2 = Integer.parseInt(datos[4]);
                String nombreempleado1 = datos[5];   
                
                //creamos nuestra sesion
                HttpSession session = request.getSession(true);

                //obtenemos los objetos a guardar en sesion
                session.setAttribute("id_usu", id1);
                session.setAttribute("usuario_usu", usuario1);
                session.setAttribute("clave_usu", password1);                
                session.setAttribute("usuario.EMPLEADO_id_emp", empleado1);
                session.setAttribute("empleado.id_emp", empleado2);
                session.setAttribute("empleado.nombre_emp", nombreempleado1);

                //pagina donde se enviara la pagina                
                response.sendRedirect("inicio.jsp");

            }

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
