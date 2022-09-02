/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Bean.B_trabajador;
import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Airth
 */
public class D_trabajador {

    Conexion cn;
    Connection con;
    B_trabajador tb;
    private PreparedStatement pst;
    private ResultSet rs;

    public D_trabajador() throws SQLException {
        this.cn = new Conexion();
    }

    public List TrabajadorTodos() throws SQLException {
        String sql = "call administrador_s_todos";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            List<B_trabajador> lista = new ArrayList<>();

            while (rs.next()) {
                tb = new B_trabajador();
                tb.setCod_admin(rs.getInt(1));
                tb.setAd_nombres(rs.getString(2));
                tb.setAd_ap_pat(rs.getString(3));
                tb.setAd_ap_mat(rs.getString(4));
                tb.setAd_nick(rs.getString(5));
                tb.setAd_clave(rs.getString(6));
                tb.setAd_correo(rs.getString(7));
                lista.add(tb);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public List Trabajador_nick_clave(String nick, String clave) throws SQLException {
        String sql = "call administrador_s_nick_clave(?,?)";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, nick);
            pst.setString(2, clave);
            rs = pst.executeQuery();
            List<B_trabajador> lista = new ArrayList<>();

            while (rs.next()) {
                tb = new B_trabajador();
                tb.setCod_admin(rs.getInt(1));
                tb.setAd_nombres(rs.getString(2));
                tb.setAd_ap_pat(rs.getString(3));
                tb.setAd_ap_mat(rs.getString(4));
                tb.setAd_nick(rs.getString(5));
                tb.setAd_clave(rs.getString(6));
                tb.setAd_correo(rs.getString(7));
                lista.add(tb);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public void CambiarContraTrabajador(String nick1, String correo1, String clave1) throws SQLException {
        String sql = "call administrador_u_clave(?,?,?)";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, nick1);
            pst.setString(2, correo1);
            pst.setString(3, clave1);
            rs = pst.executeQuery();

            pst.close();
            rs.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public int BuscarTrabajador_usuario_clave(String usuario, String clave) throws SQLException {
        List<B_trabajador> lista = new ArrayList<>();
        int t = 0;
        try {
            String sql = "call administrador_s_nick_clave(?, ?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs = pst.executeQuery();

            while (rs.next()) {
                tb = new B_trabajador();
                tb.setCod_admin(rs.getInt(1));
                tb.setAd_nombres(rs.getString(2));
                tb.setAd_ap_pat(rs.getString(3));
                tb.setAd_ap_mat(rs.getString(4));
                tb.setAd_nick(rs.getString(5));
                tb.setAd_clave(rs.getString(6));
                tb.setAd_correo(rs.getString(7));
                lista.add(tb);
            }
            t = lista.size();
            rs.close();
            pst.close();
            con.close();

        } catch (SQLException e) {
            throw e;
        }
        return t;
    }

}
