/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanCombos;

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
public class BeanComboTipodoc {
    
    public static String seleccionar = "select id_tipdoc, tipdoc from tipo_documento ORDER BY tipdoc ASC";
    private int id_tipdoc;
    private String tipdoc;

    public int getId_tipdoc() {
        return id_tipdoc;
    }

    public void setId_tipdoc(int id_tipdoc) {
        this.id_tipdoc = id_tipdoc;
    }

    public String getTipdoc() {
        return tipdoc;
    }

    public void setTipdoc(String tipdoc) {
        this.tipdoc = tipdoc;
    }        
    
    public List<BeanComboTipodoc> getListado() {
        List<BeanComboTipodoc> lista = new ArrayList<BeanComboTipodoc>(0);
        try {
            Connection cnn = cConnection.conectar_ds();
            ResultSet rset = null;
            Statement sta = cnn.createStatement();
            rset = sta.executeQuery(BeanComboTipodoc.seleccionar);

            while (rset.next()) {
                BeanComboTipodoc current = new BeanComboTipodoc();
                current.setId_tipdoc(rset.getInt("id_tipdoc"));
                current.setTipdoc(rset.getString("tipdoc"));                
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
