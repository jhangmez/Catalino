
package Dao;

import Bean.B_imagen;
import Config.Conexion;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class D_imagen {
    
    Conexion cn;
    Connection con;
    B_imagen ba, jc;
    private PreparedStatement pst;
    private ResultSet rs;

    public D_imagen() throws SQLException {
        this.cn = new Conexion();
    }
    
    public void InsertarArchivos(B_imagen n) throws SQLException {
        try {
            String sql = "call imagen_i(?,?,?,?) ";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            pst.setInt(1, n.getCodigo_archivo());
            pst.setString(2, n.getNombre_archivo());
            pst.setBytes(3, n.getArchivo());
            pst.setString(4, n.getBase64());

            pst.executeUpdate();
            pst.close();
            con.close();
        } catch (SQLException e) {
            throw e;
        }
    }
    
    public int ContarArchivos() throws SQLException {
        int total = 0;
        try {
            String sql = "call imagen_s_contar ()";
            con = cn.getConexion();
            pst = con.prepareStatement(sql);

            rs = pst.executeQuery();

            while (rs.next()) {
                total = rs.getInt(1);
            }
            pst.close();
            rs.close();
            con.close();
            return total;

        } catch (SQLException e) {
            throw e;
        }
    }
    
    public byte[] BuscarImagenNombre(String Nombre) throws SQLException {
        //int t = 0;
        byte [] archivo = null;
        String sql = "call imagen_s(?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, Nombre);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                archivo = rs.getBytes(1);
            }

        } catch (SQLException e) {
            throw e;
        }
        return archivo;
    }
    
    public String BuscarImagenNombre_b64(String Nombre) throws SQLException {
        //int t = 0;
        String archivo = null;
        String sql = "call imagen_s_b64(?)";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            pst.setString(1, Nombre);
            rs = pst.executeQuery();
            
            if (rs.next()) {
                archivo = rs.getString(1);
            }

        } catch (SQLException e) {
            throw e;
        }
        return archivo;
    }
   
    
    public List BuscarImagenTodos() throws SQLException {
        String sql = "call imagen_s_todos()";
        try {
            con = cn.getConexion();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            List<B_imagen> lista = new ArrayList<>();

            while (rs.next()) {
                jc = new B_imagen();

                jc.setCodigo_archivo(rs.getInt(1));
                jc.setNombre_archivo(rs.getString(2));
                jc.setArchivo(rs.getBytes(3));
                jc.setBase64(rs.getString(4));

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
