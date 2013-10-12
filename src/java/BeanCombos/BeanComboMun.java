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
public class BeanComboMun {

    public static String seleccionar = "select id_mun, mun, id_dep from municipio ORDER BY mun ASC";
    private int id_mun;
    private String mun;
    private int id_dep;

    public int getId_mun() {
        return id_mun;
    }

    public void setId_mun(int id_mun) {
        this.id_mun = id_mun;
    }

    public String getMun() {
        return mun;
    }

    public void setMun(String mun) {
        this.mun = mun;
    }

    public int getId_dep() {
        return id_dep;
    }

    public void setId_dep(int id_dep) {
        this.id_dep = id_dep;
    }

    public List<BeanComboMun> getListado() {
        List<BeanComboMun> lista = new ArrayList<BeanComboMun>(0);
        try {
            Connection cnn = cConnection.conectar_ds();
            ResultSet rset = null;
            Statement sta = cnn.createStatement();
            rset = sta.executeQuery(BeanComboMun.seleccionar);

            while (rset.next()) {
                BeanComboMun current = new BeanComboMun();
                current.setId_mun(rset.getInt("id_mun"));
                current.setMun(rset.getString("mun"));
                current.setId_dep(rset.getInt("id_dep"));
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
