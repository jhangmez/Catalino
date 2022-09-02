
import Bean.B_imagen;
import Dao.D_imagen;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.swing.JOptionPane;

public class T_imagen {

    public static void main(String[] args) throws SQLException {
        System.out.println("\n");
        System.out.println("Todas las categorias:");
        D_imagen categorias = new D_imagen();

        List<B_imagen> lista2 = new ArrayList<>();
        lista2 = categorias.BuscarImagenTodos();
        for (int i = 0; i < lista2.size(); i++) {
            System.out.println("Datos de la lista " + (i + 1) + " : "
                    + lista2.get(i).getCodigo_archivo() + " "
                    + lista2.get(i).getNombre_archivo() + " "
                    
                    + Arrays.toString(lista2.get(i).getArchivo())+ " ");
        }
    }
}
