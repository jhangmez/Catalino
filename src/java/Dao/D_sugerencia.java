/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;


import Bean.B_sugerencia;
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
public class D_sugerencia {

    Conexion cn;
    Connection con;
    B_sugerencia sg;
    private PreparedStatement pst;
    private ResultSet rs;

    public D_sugerencia() throws SQLException {
        this.cn = new Conexion();
    }
    
    
    public List BuscarJuegoTodos() throws SQLException {
        String sql = "call sugerencia_s_todos";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            List<B_sugerencia> lista = new ArrayList<>();

            while (rs.next()) {
                sg = new B_sugerencia();
                sg.setIdSugerencia(rs.getInt(1));
                sg.setSug_id_cat(rs.getInt(2));
                sg.setSug_cat(rs.getString(3));
                sg.setSug_nombre(rs.getString(4));
                sg.setSug_descripcion(rs.getString(5));
                sg.setSug_distribuidor(rs.getString(6));
                sg.setSug_fecha(rs.getString(7));
                sg.setSug_nom_img(rs.getString(8));
                sg.setSug_fot(rs.getBytes(9));
                sg.setSug_base64(rs.getString(10));
                sg.setSug_eliminado(rs.getInt(11));
                lista.add(sg);
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
            List<B_sugerencia> lista = new ArrayList<>();

            while (rs.next()) {
                sg = new B_sugerencia();

                sg.setSug_id_cat(rs.getInt(1));
                sg.setSug_cat(rs.getString(2));

                lista.add(sg);
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
    
    public int ContarSugerencia() throws SQLException {
        int t = 0;
        String sql = "call sugerencia_s_contar";

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
    
      public void InsertarSugerencia(B_sugerencia sg) throws SQLException {
        try {
            String sql = "call sugerencia_i(?,?, ?,?,?, ?, ?,?,?, ?,?)";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, sg.getIdSugerencia());
            pst.setInt(2, sg.getSug_id_cat());
            pst.setString(3, sg.getSug_cat());
            pst.setString(4, sg.getSug_nombre());
            pst.setString(5, sg.getSug_descripcion());
            pst.setString(6, sg.getSug_distribuidor());
            pst.setString(7, sg.getSug_fecha());
            pst.setString(8, sg.getSug_nom_img());
            pst.setBytes(9, sg.getSug_fot());
            pst.setString(10, sg.getSug_base64());
            pst.setInt(11, sg.getSug_eliminado());

            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }  
    
      public List BuscarSugerenciaNombre(String Nombre) throws SQLException {
        String sql = "call sugerencia_s_juego(?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, Nombre);
            rs = pst.executeQuery();
            List<B_sugerencia> lista = new ArrayList<>();
            while (rs.next()) {
                sg = new B_sugerencia();
                sg.setIdSugerencia(rs.getInt(1));
                sg.setSug_id_cat(rs.getInt(2));
                sg.setSug_cat(rs.getString(3));
                sg.setSug_nombre(rs.getString(4));
                sg.setSug_descripcion(rs.getString(5));
                sg.setSug_distribuidor(rs.getString(6));
                sg.setSug_fecha(rs.getString(7));
                sg.setSug_nom_img(rs.getString(8));
                sg.setSug_fot(rs.getBytes(9));
                sg.setSug_base64(rs.getString(10));
                sg.setSug_eliminado(rs.getInt(11));
                lista.add(sg);
            }
            return lista;
        } catch (SQLException e) {
            throw e;
        }
    }
    
        public void ModificarSugerencia_Codigo(B_sugerencia u) throws SQLException {
        String sql = "call sugerencia_u(?,?,?,?,?,?,?,?,?,?,?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, u.getIdSugerencia());
            pst.setInt(2, u.getSug_id_cat());
            pst.setString(3, u.getSug_cat());
            pst.setString(4, u.getSug_nombre());
            pst.setString(5, u.getSug_descripcion());
            pst.setString(6, u.getSug_distribuidor());
            pst.setString(7, u.getSug_fecha());
            pst.setString(8, u.getSug_nom_img());
            pst.setBytes(9, u.getSug_fot());
            pst.setString(10, u.getSug_base64());
            pst.setInt(11, u.getSug_eliminado());
            
            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }
        
        public List Buscarsugerencia_Codigo(String codigo) throws SQLException {
        String sql = "call sugerencia_s_codigo(?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, codigo);
            rs = pst.executeQuery();
            List<B_sugerencia> lista = new ArrayList<>();
            while (rs.next()) {
                
                sg = new B_sugerencia();
                sg.setIdSugerencia(rs.getInt(1));
                sg.setSug_id_cat(rs.getInt(2));
                sg.setSug_cat(rs.getString(3));
                sg.setSug_nombre(rs.getString(4));
                sg.setSug_descripcion(rs.getString(5));
                sg.setSug_distribuidor(rs.getString(6));
                sg.setSug_fecha(rs.getString(7));
                sg.setSug_nom_img(rs.getString(8));
                sg.setSug_fot(rs.getBytes(9));
                sg.setSug_base64(rs.getString(10));
                sg.setSug_eliminado(rs.getInt(11));
                lista.add(sg);
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
