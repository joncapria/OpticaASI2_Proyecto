/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCombos;

import BeanMantenimiento.BeanDep;
import DBConnections.cConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author JonathanDaniel
 */
public class BeanMenuPagina2 {
    
    public static String seleccionar = "select id_pag, nom_pag, url, nivel_pag from pagina WHERE nivel_pag = 2";
    private int id_pag;
    private String nom_pag;
    private String url;
    private String nivel_pag;

    public int getId_pag() {
        return id_pag;
    }

    public void setId_pag(int id_pag) {
        this.id_pag = id_pag;
    }

    public String getNom_pag() {
        return nom_pag;
    }

    public void setNom_pag(String nom_pag) {
        this.nom_pag = nom_pag;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getNivel_pag() {
        return nivel_pag;
    }

    public void setNivel_pag(String nivel_pag) {
        this.nivel_pag = nivel_pag;
    }
         
    public List<BeanMenuPagina2> getListado() {
        List<BeanMenuPagina2> lista = new ArrayList<BeanMenuPagina2>(0);
        try {
            Connection cnn = cConnection.conectar_ds();
            ResultSet rset = null;
            Statement sta = cnn.createStatement();
            rset = sta.executeQuery(BeanMenuPagina2.seleccionar);

            while (rset.next()) {
                BeanMenuPagina2 current = new BeanMenuPagina2();
                current.setId_pag(rset.getInt("id_pag"));
                current.setNom_pag(rset.getString("nom_pag"));      
                current.setUrl(rset.getString("url"));      
                current.setNivel_pag(rset.getString("nivel_pag"));      
                lista.add(current);
            }
            rset.close();
            sta.close();
            cnn.close();

        } catch (Exception ex) {            
        } finally {
            return lista;
        }
    }
    
    
}
