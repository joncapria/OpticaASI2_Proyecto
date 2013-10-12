/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package BeanMantenimiento;

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
public class BeanCliente {

    // Sentencias SQL
    public static String insertar = "INSERT INTO cliente (nom_cli, segnom_cli, primape_cli, segape_cli, casape_cli, gen_cli, id_tipdoc, numdoc_cli, nit_cli, nrc_cli, tel_cli, id_dep, id_mun, dir_cli, email_cli, usu_cli, clave_cli) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    public static String modificar = "";
    public static String eliminar = "";
    public static String seleccionar = "SELECT id_cli, nom_cli, segnom_cli, primape_cli, segape_cli, casape_cli, cliente.id_tipdoc, tipo_documento.id_tipdoc, tipdoc, numdoc_cli, nit_cli, nrc_cli, tel_cli, cliente.id_dep, departamento.id_dep, dep, cliente.id_mun, municipio.id_mun, mun, dir_cli, email_cli, usu_cli, clave_cli FROM cliente, tipo_documento, departamento, municipio WHERE cliente.id_tipdoc = tipo_documento.id_tipdoc AND cliente.id_dep = departamento.id_dep AND cliente.id_mun = municipio.id_mun";
    private int id_cli;
    private String nom_cli;
    private String segnom_cli;
    private String primape_cli;
    private String segape_cli;
    private String casape_cli;
    private int id_tipdoc;
    private String numdoc_cli;
    private String nit_cli;
    private String nrc_cli;
    private String tel_cli;
    private int id_dep;
    private int id_mun;
    private String dir_cli;
    private String email_cli;
    private String usu_cli;
    private String clave_cli;
    
    private String tipdoc;
    private String dep;
    private String mun;
    
    public int getId_cli() {
        return id_cli;
    }

    public void setId_cli(int id_cli) {
        this.id_cli = id_cli;
    }

    public String getNom_cli() {
        return nom_cli;
    }

    public void setNom_cli(String nom_cli) {
        this.nom_cli = nom_cli;
    }

    public String getSegnom_cli() {
        return segnom_cli;
    }

    public void setSegnom_cli(String segnom_cli) {
        this.segnom_cli = segnom_cli;
    }

    public String getPrimape_cli() {
        return primape_cli;
    }

    public void setPrimape_cli(String primape_cli) {
        this.primape_cli = primape_cli;
    }

    public String getSegape_cli() {
        return segape_cli;
    }

    public void setSegape_cli(String segape_cli) {
        this.segape_cli = segape_cli;
    }

    public String getCasape_cli() {
        return casape_cli;
    }

    public void setCasape_cli(String casape_cli) {
        this.casape_cli = casape_cli;
    }

    public int getId_tipdoc() {
        return id_tipdoc;
    }

    public void setId_tipdoc(int id_tipdoc) {
        this.id_tipdoc = id_tipdoc;
    }

    public String getNumdoc_cli() {
        return numdoc_cli;
    }

    public void setNumdoc_cli(String numdoc_cli) {
        this.numdoc_cli = numdoc_cli;
    }

    public String getNit_cli() {
        return nit_cli;
    }

    public void setNit_cli(String nit_cli) {
        this.nit_cli = nit_cli;
    }

    public String getNrc_cli() {
        return nrc_cli;
    }

    public void setNrc_cli(String nrc_cli) {
        this.nrc_cli = nrc_cli;
    }

    public String getTel_cli() {
        return tel_cli;
    }

    public void setTel_cli(String tel_cli) {
        this.tel_cli = tel_cli;
    }

    public int getId_dep() {
        return id_dep;
    }

    public void setId_dep(int id_dep) {
        this.id_dep = id_dep;
    }

    public int getId_mun() {
        return id_mun;
    }

    public void setId_mun(int id_mun) {
        this.id_mun = id_mun;
    }

    public String getDir_cli() {
        return dir_cli;
    }

    public void setDir_cli(String dir_cli) {
        this.dir_cli = dir_cli;
    }

    public String getEmail_cli() {
        return email_cli;
    }

    public void setEmail_cli(String email_cli) {
        this.email_cli = email_cli;
    }

    public String getUsu_cli() {
        return usu_cli;
    }

    public void setUsu_cli(String usu_cli) {
        this.usu_cli = usu_cli;
    }

    public String getClave_cli() {
        return clave_cli;
    }

    public void setClave_cli(String clave_cli) {
        this.clave_cli = clave_cli;
    }

    public String getTipdoc() {
        return tipdoc;
    }

    public void setTipdoc(String tipdoc) {
        this.tipdoc = tipdoc;
    }

    public String getDep() {
        return dep;
    }

    public void setDep(String dep) {
        this.dep = dep;
    }

    public String getMun() {
        return mun;
    }

    public void setMun(String mun) {
        this.mun = mun;
    }

    
    
    public List<BeanCliente> getListado() {
        List<BeanCliente> lista = new ArrayList<BeanCliente>(0);
        try {
            Connection cnn = cConnection.conectar_ds();
            ResultSet rset = null;
            Statement sta = cnn.createStatement();
            rset = sta.executeQuery(BeanCliente.seleccionar);

            while (rset.next()) {
                BeanCliente current = new BeanCliente();
                current.setId_cli(rset.getInt("id_cli"));
                current.setNom_cli(rset.getString("nom_cli"));
                current.setSegnom_cli(rset.getString("segnom_cli"));
                current.setPrimape_cli(rset.getString("primape_cli"));
                current.setSegape_cli(rset.getString("segape_cli"));
                current.setCasape_cli(rset.getString("casape_cli"));
                current.setId_tipdoc(rset.getInt("id_tipdoc"));
                current.setNumdoc_cli(rset.getString("numdoc_cli"));
                current.setNit_cli(rset.getString("nit_cli"));
                current.setNrc_cli(rset.getString("nrc_cli"));
                current.setTel_cli(rset.getString("tel_cli"));
                current.setId_dep(rset.getInt("id_dep"));
                current.setId_mun(rset.getInt("id_mun"));
                current.setDir_cli(rset.getString("dir_cli"));
                current.setEmail_cli(rset.getString("email_cli"));
                current.setUsu_cli(rset.getString("usu_cli"));
                current.setClave_cli(rset.getString("clave_cli"));
                current.setTipdoc(rset.getString("tipdoc"));
                current.setDep(rset.getString("dep"));
                current.setMun(rset.getString("mun"));

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
