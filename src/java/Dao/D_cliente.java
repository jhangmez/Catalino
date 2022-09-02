/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Bean.B_cliente;
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
public class D_cliente {

    Conexion cn;
    Connection con;
    B_cliente c;
    private PreparedStatement pst;
    private ResultSet rs;

    public D_cliente() throws SQLException {
        this.cn = new Conexion();
    }

    public List BuscarCliente_Nick(String Nick) throws SQLException {
        String sql = "call usuario_s_nick(?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, Nick);
            rs = pst.executeQuery();
            List<B_cliente> lista = new ArrayList<>();
            while (rs.next()) {

                c = new B_cliente();
                c.setCod_usuario(rs.getInt(1));
                c.setNombres(rs.getString(2));
                c.setAp_pat(rs.getString(3));
                c.setAp_mat(rs.getString(4));
                c.setFec_nac(rs.getString(5));
                c.setNick(rs.getString(6));
                c.setClave(rs.getString(7));
                c.setCorreo(rs.getString(8));
                c.setEliminado(rs.getInt(9));
                lista.add(c);
            }
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }
    
    
    public List BuscarClienteTodos() throws SQLException {
        String sql = "call usuario_s_todos";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            List<B_cliente> lista = new ArrayList<>();

            while (rs.next()) {
                c = new B_cliente();
                c.setCod_usuario(rs.getInt(1));
                c.setNombres(rs.getString(2));
                c.setAp_pat(rs.getString(3));
                c.setAp_mat(rs.getString(4));
                c.setFec_nac(rs.getString(5));
                c.setNick(rs.getString(6));
                c.setClave(rs.getString(7));
                c.setCorreo(rs.getString(8));
                c.setEliminado(rs.getInt(9));
                lista.add(c);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public List BuscarCliente_Nick_Clave(String nick, String clave) throws SQLException {
        String sql = "call usuario_s_nick_clave(?, ?)";

        try {

            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, nick);
            pst.setString(2, clave);
            rs = pst.executeQuery();

            List<B_cliente> Lista = new ArrayList<>();

            while (rs.next()) {

               c = new B_cliente();
                c.setCod_usuario(rs.getInt(1));
                c.setNombres(rs.getString(2));
                c.setAp_pat(rs.getString(3));
                c.setAp_mat(rs.getString(4));
                c.setFec_nac(rs.getString(5));
                c.setNick(rs.getString(6));
                c.setClave(rs.getString(7));
                c.setCorreo(rs.getString(8));
                c.setEliminado(rs.getInt(9));
                Lista.add(c);
            }

            rs.close();
            pst.close();
            con.close();

            return Lista;

        } catch (SQLException e) {
            throw e;

        }
    }

    public List BuscarCliente_Nick_Correo(String nick, String correo) throws SQLException {
        String sql = "call usuario_s_nick_correo(?, ?)";

        try {

            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, nick);
            pst.setString(2, correo);
            rs = pst.executeQuery();

            List<B_cliente> Lista = new ArrayList<>();

            while (rs.next()) {

                c = new B_cliente();
                c.setCod_usuario(rs.getInt(1));
                c.setNombres(rs.getString(2));
                c.setAp_pat(rs.getString(3));
                c.setAp_mat(rs.getString(4));
                c.setFec_nac(rs.getString(5));
                c.setNick(rs.getString(6));
                c.setClave(rs.getString(7));
                c.setCorreo(rs.getString(8));
                c.setEliminado(rs.getInt(9));
                Lista.add(c);
            }

            rs.close();
            pst.close();
            con.close();

            return Lista;

        } catch (SQLException e) {
            throw e;
        }
    }

    public int ContarCliente() throws SQLException {
        int t = 0;
        String sql = "call usuario_s_contar";

        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();

            if (rs.next()) {
                t = rs.getInt(1);
            }
        } catch (SQLException e) {
            throw e;
        }
        return t;
    }

    public void RegistrarCliente(B_cliente c) throws SQLException {
        try {
            String sql = "call usuario_i(?, ?, ?, ?, ?, ?, ?, ?, ?)";

            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            
            pst.setInt(1, c.getCod_usuario());
            pst.setString(2, c.getNombres());
            pst.setString(3, c.getAp_pat());
            pst.setString(4, c.getAp_mat());
            pst.setString(5, c.getFec_nac());
            pst.setString(6, c.getNick());
            pst.setString(7, c.getClave());
            pst.setString(8, c.getCorreo());
            pst.setInt(9, c.getEliminado());
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public void CambiarContraCliente(String nick1, String clave1, String correo1) throws SQLException {
        try {
            String sql = "call usuario_u_clave(?, ?, ?)";

            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, nick1);
            pst.setString(2, correo1);
            pst.setString(3, clave1);
            pst.executeUpdate();
            pst.close();
            con.close();

        } catch (SQLException e) {
            throw e;
        }
    }

    public int BuscarCliente_usuario_clave(String usuario, String clave) throws SQLException {
        List<B_cliente> lista = new ArrayList<>();
        int t = 0;
        try {
            String sql = "call usuario_s_nick_clave(?, ?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs = pst.executeQuery();

            while (rs.next()) {
                c = new B_cliente();
                c.setCod_usuario(rs.getInt(1));
                c.setNombres(rs.getString(2));
                c.setAp_pat(rs.getString(3));
                c.setAp_mat(rs.getString(4));
                c.setFec_nac(rs.getString(5));
                c.setNick(rs.getString(6));
                c.setClave(rs.getString(7));
                c.setCorreo(rs.getString(8));
                c.setEliminado(rs.getInt(9));
                lista.add(c);
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

    public void ModificarCliente_Codigo(B_cliente c) throws SQLException {
        String sql = "call usuario_u(?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, c.getCod_usuario());
            pst.setString(2, c.getNombres());
            pst.setString(3, c.getAp_pat());
            pst.setString(4, c.getAp_mat());
            pst.setString(5, c.getFec_nac());
            pst.setString(6, c.getNick());
            pst.setString(7, c.getClave());
            pst.setString(8, c.getCorreo());
            pst.setInt(9, c.getEliminado());
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }

    }

    public List BuscarCliente_Codigo(String codigo) throws SQLException {
        String sql = "call usuario_s_codigo (?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, codigo);
            rs = pst.executeQuery();
            List<B_cliente> lista = new ArrayList<>();
            while (rs.next()) {
                
               c = new B_cliente();
                c.setCod_usuario(rs.getInt(1));
                c.setNombres(rs.getString(2));
                c.setAp_pat(rs.getString(3));
                c.setAp_mat(rs.getString(4));
                c.setFec_nac(rs.getString(5));
                c.setNick(rs.getString(6));
                c.setClave(rs.getString(7));
                c.setCorreo(rs.getString(8));
                c.setEliminado(rs.getInt(9));
                lista.add(c);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }
}
