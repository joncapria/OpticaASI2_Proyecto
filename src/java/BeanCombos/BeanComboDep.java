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
public class BeanComboDep {

    public static String seleccionar = "select id_dep, dep from departamento ORDER BY dep ASC";
    private int id_dep;
    private String dep;

    public int getId_dep() {
        return id_dep;
    }

    public void setId_dep(int id_dep) {
        this.id_dep = id_dep;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public List<BeanComboDep> getListado() {
        List<BeanComboDep> lista = new ArrayList<BeanComboDep>(0);
        try {
            Connection cnn = cConnection.conectar_ds();
            ResultSet rset = null;
            Statement sta = cnn.createStatement();
            rset = sta.executeQuery(BeanComboDep.seleccionar);

            while (rset.next()) {
                BeanComboDep current = new BeanComboDep();
                current.setId_dep(rset.getInt("id_dep"));
                current.setDep(rset.getString("dep"));
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
