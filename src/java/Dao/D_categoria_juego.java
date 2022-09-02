/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Bean.B_juego_categoria;
import Bean.B_categoria;
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
public class D_categoria_juego {

    Conexion cn;
    Connection con;
    B_juego_categoria jc, u;
    private PreparedStatement pst;
    private ResultSet rs;

    public D_categoria_juego() throws SQLException {
        this.cn = new Conexion();
    }

    public List BuscarJuegoNombre(String Nombre) throws SQLException {
        String sql = "call juego_s_nombre(?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, Nombre);
            rs = pst.executeQuery();
            List<B_juego_categoria> lista = new ArrayList<>();
            while (rs.next()) {
                jc = new B_juego_categoria();
                jc.setIdjuego(rs.getInt(1));
                jc.setCod_cat(rs.getInt(2));
                jc.setNom_cat(rs.getString(3));
                jc.setNombre(rs.getString(4));
                jc.setDescripcion(rs.getString(5));
                jc.setDistribuidor(rs.getString(6));
                jc.setFec_lanz(rs.getString(7));
                jc.setNombre_img(rs.getString(8));
                jc.setFoto(rs.getBytes(9));
                jc.setFoto_base64(rs.getString(10));
                jc.setEliminado(rs.getInt(11));
                lista.add(jc);
            }
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public List BuscarJuegoCategoria(String categoria) throws SQLException {
        String sql = "call juego_s_categoria(?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, categoria);
            rs = pst.executeQuery();
            List<B_juego_categoria> lista = new ArrayList<>();
            while (rs.next()) {
                jc = new B_juego_categoria();
                jc.setIdjuego(rs.getInt(1));
                jc.setCod_cat(rs.getInt(2));
                jc.setNom_cat(rs.getString(3));
                jc.setNombre(rs.getString(4));
                jc.setDescripcion(rs.getString(5));
                jc.setDistribuidor(rs.getString(6));
                jc.setFec_lanz(rs.getString(7));
                jc.setNombre_img(rs.getString(8));
                jc.setFoto(rs.getBytes(9));
                jc.setFoto_base64(rs.getString(10));
                jc.setEliminado(rs.getInt(11));
                lista.add(jc);
            }
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public void InsertarJuego(B_juego_categoria u) throws SQLException {
        try {
            String sql = "call juego_i(?,?, ?,?,?, ?, ?,?,?, ?,?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, u.getIdjuego());
            pst.setInt(2, u.getCod_cat());
            pst.setString(3, u.getNom_cat());
            pst.setString(4, u.getNombre());
            pst.setString(5, u.getDescripcion());
            pst.setString(6, u.getDistribuidor());
            pst.setString(7, u.getFec_lanz());
            pst.setString(8, u.getNombre_img());
            pst.setBytes(9, u.getFoto());
            pst.setString(10, u.getFoto_base64());
            pst.setInt(11, u.getEliminado());

            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }

    public List BuscarJuegoTodos() throws SQLException {
        String sql = "call juego_s_todos";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            List<B_juego_categoria> lista = new ArrayList<>();

            while (rs.next()) {
                jc = new B_juego_categoria();
                jc.setIdjuego(rs.getInt(1));
                jc.setCod_cat(rs.getInt(2));
                jc.setNom_cat(rs.getString(3));
                jc.setNombre(rs.getString(4));
                jc.setDescripcion(rs.getString(5));
                jc.setDistribuidor(rs.getString(6));
                jc.setFec_lanz(rs.getString(7));
                jc.setNombre_img(rs.getString(8));
                jc.setFoto(rs.getBytes(9));
                jc.setFoto_base64(rs.getString(10));
                jc.setEliminado(rs.getInt(11));
                lista.add(jc);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public List BuscarCategoriaTodos() throws SQLException {
        String sql = "call categoria_s_todos";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            List<B_juego_categoria> lista = new ArrayList<>();

            while (rs.next()) {
                jc = new B_juego_categoria();

                jc.setCod_cat(rs.getInt(1));
                jc.setNom_cat(rs.getString(2));

                lista.add(jc);
            }
            pst.close();
            rs.close();
            con.close();
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }

    public int BuscaridCategoriaNombre(String Nombre) throws SQLException {
        int t = 0;
        String sql = "call categoria_s(?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, Nombre);
            rs = pst.executeQuery();

            //List<B_juego_categoria> lista = new ArrayList<>();
            if (rs.next()) {
                t = rs.getInt(1);
            }

        } catch (SQLException e) {
            throw e;
        }
        return t;
    }

    public int ContarVideojuego() throws SQLException {
        int t = 0;
        String sql = "call juego_s_contar";

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
    
    public void ModificarJuego_Codigo(B_juego_categoria u) throws SQLException {
        String sql = "call juego_u(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, u.getIdjuego());
            pst.setInt(2, u.getCod_cat());
            pst.setString(3, u.getNom_cat());
            pst.setString(4, u.getNombre());
            pst.setString(5, u.getDescripcion());
            pst.setString(6, u.getDistribuidor());
            pst.setString(7, u.getFec_lanz());
            pst.setString(8, u.getNombre_img());
            pst.setBytes(9, u.getFoto());
            pst.setString(10, u.getFoto_base64());
            pst.setInt(11, u.getEliminado());
            
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }

    }
    
    public List BuscarJuego_Codigo(String codigo) throws SQLException {
        String sql = "call juego_s_codigo (?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, codigo);
            rs = pst.executeQuery();
            List<B_juego_categoria> lista = new ArrayList<>();
            while (rs.next()) {
                
              jc = new B_juego_categoria();
                jc.setIdjuego(rs.getInt(1));
                jc.setCod_cat(rs.getInt(2));
                jc.setNom_cat(rs.getString(3));
                jc.setNombre(rs.getString(4));
                jc.setDescripcion(rs.getString(5));
                jc.setDistribuidor(rs.getString(6));
                jc.setFec_lanz(rs.getString(7));
                jc.setNombre_img(rs.getString(8));
                jc.setFoto(rs.getBytes(9));
                jc.setFoto_base64(rs.getString(10));
                jc.setEliminado(rs.getInt(11));
                lista.add(jc);
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
