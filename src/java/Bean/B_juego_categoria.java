/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Airth
 */
public class B_juego_categoria {
   int idjuego;
   int cod_cat;
   String nom_cat;
   String nombre; 
   String descripcion;
   String distribuidor;
   String fec_lanz;
   String nombre_img;
   byte [] foto;
   String foto_base64;
   int eliminado;

    public int getIdjuego() {
        return idjuego;
    }

    public void setIdjuego(int idjuego) {
        this.idjuego = idjuego;
    }

    public int getCod_cat() {
        return cod_cat;
    }

    public void setCod_cat(int cod_cat) {
        this.cod_cat = cod_cat;
    }

    public String getNom_cat() {
        return nom_cat;
    }

    public void setNom_cat(String nom_cat) {
        this.nom_cat = nom_cat;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDistribuidor() {
        return distribuidor;
    }

    public void setDistribuidor(String distribuidor) {
        this.distribuidor = distribuidor;
    }

    public String getFec_lanz() {
        return fec_lanz;
    }

    public void setFec_lanz(String fec_lanz) {
        this.fec_lanz = fec_lanz;
    }

    public String getNombre_img() {
        return nombre_img;
    }

    public void setNombre_img(String nombre_img) {
        this.nombre_img = nombre_img;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }


    public int getEliminado() {
        return eliminado;
    }

    public void setEliminado(int eliminado) {
        this.eliminado = eliminado;
    }

    public String getFoto_base64() {
        return foto_base64;
    }

    public void setFoto_base64(String foto_base64) {
        this.foto_base64 = foto_base64;
    }

   
}
