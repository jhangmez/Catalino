/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author USUARIO
 */
public class T_fecha {

    public static void main(String[] args) {
        String fecha = "2002" + "-" + "66666644" + "-" + "123123123123";

        int inicio = fecha.indexOf("-");
        int fin = fecha.indexOf("-", inicio + 1);
        
        System.out.println("dia "+fecha.substring(fecha.lastIndexOf("-") + 1));
        System.out.println("mes "+fecha.substring(inicio + 1, fin));
        System.out.println("anio "+fecha.substring(0, 4));
    }

}
