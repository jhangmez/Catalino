
import Bean.B_juego_categoria;
import Dao.D_categoria_juego;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

public class T_categoria_juego {

    public static void main(String[] args) throws SQLException {
        System.out.println("\n");
        System.out.println("Todas las categorias:");
        D_categoria_juego categorias = new D_categoria_juego();

        List<B_juego_categoria> lista2 = new ArrayList<>();
        lista2 = categorias.BuscarCategoriaTodos();
        for (int i = 0; i < lista2.size(); i++) {
            System.out.println("Datos de la lista " + (i + 1) + " : "
                    + lista2.get(i).getCod_cat() + " "
                    + lista2.get(i).getNom_cat() + " ");
        }

        System.out.println("\n");
        System.out.println("Todos los juegos");
        D_categoria_juego juegos = new D_categoria_juego();

        List<B_juego_categoria> lista3 = new ArrayList<>();
        lista3 = juegos.BuscarJuegoTodos();

        for (int i = 0; i < lista3.size(); i++) {
            System.out.println("Datos de la lista " + (i + 1) + " : "
                    + lista3.get(i).getIdjuego() + " "
                    + lista3.get(i).getCod_cat() + " "
                    + lista3.get(i).getNom_cat() + " "
                    + lista3.get(i).getNombre() + " "
                    + lista3.get(i).getDescripcion() + " "
                    + lista3.get(i).getDistribuidor() + " "
                    + lista3.get(i).getFec_lanz() + " "
                    + lista3.get(i).getNombre_img() + " "
                    + lista3.get(i).getFoto() + " "
                    + lista3.get(i).getEliminado() + " ");
        }

        System.out.println("\n");
        System.out.println("Buscar categoria:");
        D_categoria_juego nombre_categoria = new D_categoria_juego();
        String categoria_nombre = "aventura";
        int numero = nombre_categoria.BuscaridCategoriaNombre(categoria_nombre);
        System.out.println(numero);

        System.out.println("\n");
        System.out.println("Contar categoria:");
        D_categoria_juego insertar2 = new D_categoria_juego();
        
        D_categoria_juego contar1 = new D_categoria_juego();
        B_juego_categoria jc = new B_juego_categoria();
        
        int total1 = contar1.ContarVideojuego();
        int codigo = total1 + 1;
        System.out.println(total1);
        System.out.println(codigo);

        byte[] byteArrray3 = {72, 101, 108, 108, 111, 32, 87, 111, 114,
            108, 100, 33};
        try {
            jc.setIdjuego(codigo);
            jc.setCod_cat(numero);
            jc.setNom_cat(categoria_nombre);
            jc.setNombre("Matanza en las puno");
            jc.setDescripcion("demasiado texto que leer peruano");
            jc.setDistribuidor("Gran Peruano");
            jc.setFec_lanz("2021-01-22");
            jc.setNombre_img("Las pune;as");
            jc.setFoto(byteArrray3);
            jc.setEliminado(0);

            insertar2.InsertarJuego(jc);
            
            System.out.println("correcto papi, se subio tu wbd");
        } catch (SQLException e) {
            
            JOptionPane.showMessageDialog(null,e);
        }

    }
}
