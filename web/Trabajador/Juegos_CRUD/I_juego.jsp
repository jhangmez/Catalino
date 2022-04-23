<%@page import="org.apache.commons.fileupload.MultipartStream"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.nio.ByteBuffer"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.B_juego_categoria"%>
<%@page import="Dao.D_categoria_juego"%>
<%@page import="Bean.B_imagen"%>
<%@page import="Dao.D_imagen"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERTAR JUEGO</title>
        <script>
        function createPopupWin(pageURL, pageTitle,
                popupWinWidth, popupWinHeight) {
            var left = (screen.width - popupWinWidth) / 2;
            var top = (screen.height - popupWinHeight) / 4;

            var myWindow = window.open(pageURL, pageTitle,
                    'resizable=yes, width=' + popupWinWidth
                    + ', height=' + popupWinHeight + ', top='
                    + top + ', left=' + left);
        }
    </script>
    </head>
    <body>
        

        <form action="I_juego.jsp" method="POST" >

            <label> NOMBRE JUEGO</label> <input type="text" name="nombre" id="nombre"><br>
            <label> CATEGORIA </label> 
            <select name="nombrecategoria" id="nombrecategoria">
                <%
                    D_categoria_juego o2 = new D_categoria_juego();
                    List<B_juego_categoria> lista = new ArrayList<>();
                    lista = o2.BuscarCategoriaTodos();
                    int inicio = 0;
                    int total = lista.size();
                    while (inicio < total) {
                %>
                <option data-ejemplo="<%= lista.get(inicio).getNom_cat()%>" value="<%= lista.get(inicio).getNom_cat()%>"><%= lista.get(inicio).getNom_cat()%></option>
                <%
                        inicio++;
                    }
                %>
            </select><br>
            <%
                String nombrecat = request.getParameter("nombrecategoria");
                D_categoria_juego o3 = new D_categoria_juego();
                int codigo_categoria = o3.BuscaridCategoriaNombre(nombrecat);
            %>
            <label> DESCRIPCION </label> <textarea type="text" name="descripcion" id="descripcion"></textarea>
            <label> DISTRIBUIDOR </label> <input type="text" name="distribuidor" id="distribuidor"><br>
            FECHA DE LANZAMIENTO:<br><input type="date" name="fecha" id="fecha"><br>
            <label> NOMBRE DE LA IMAGEN </label> 
            <select name="nombreimg" id="nombreimg">

                <%
                    D_imagen i1 = new D_imagen();
                    List<B_imagen> listaimagen = new ArrayList<>();
                    listaimagen = i1.BuscarImagenTodos();
                    int incie = 0;
                    int totale = listaimagen.size();
                    while (incie < totale) {
                %>
                <option " value="<%= listaimagen.get(incie).getNombre_archivo()%>"><%= listaimagen.get(incie).getNombre_archivo()%></option>
                <%
                        incie++;
                    }
                %>
            </select><br>

            <%
                String nombreimg = request.getParameter("nombreimg");
                D_imagen i2 = new D_imagen();
                byte[] imagen = i2.BuscarImagenNombre(nombreimg);
                String imagen_base64 = i2.BuscarImagenNombre_b64(nombreimg);
            %>

            <%-- <input type="text" name="nombreimg" id="nombreimg"><br>
            <label> IMAGEN </label> <input type="file" name="file" id="file"><br> --%>
            <a href="#" onclick ="createPopupWin('I_imagen.jsp', 'Insertar imagen', 400, 400);">Insertar imagen</a>
            <input type="hidden" name="pagina" id="pagina" value="5">
            <button type="submit">registrar</button>
            
        </form>

        <%
            String pagina, nombrejuego, descripcion, distribuidor,fecha;

            nombrejuego = request.getParameter("nombre");
            descripcion = request.getParameter("descripcion");
            distribuidor = request.getParameter("distribuidor");
            nombreimg = request.getParameter("nombreimg");
            pagina = request.getParameter("pagina");
            fecha = request.getParameter("fecha");
            if (pagina != null) {

                D_categoria_juego o9 = new D_categoria_juego();

                int total1 = o9.ContarVideojuego();
                int codigo = total1 + 1;

                D_categoria_juego o8 = new D_categoria_juego();
                B_juego_categoria bjc = new B_juego_categoria();

                ////////////////////////////////////////////////////////////////
                byte[] byteArrray3 = {72, 101, 108, 108, 111, 32, 87, 111, 114,
                    108, 100, 33};

                ////////////////////////////////////////////////////////////////
                bjc.setIdjuego(codigo);
                bjc.setCod_cat(codigo_categoria);
                bjc.setNom_cat(nombrecat);
                bjc.setNombre(nombrejuego);
                bjc.setDescripcion(descripcion);
                bjc.setDistribuidor(distribuidor);
                bjc.setFec_lanz(fecha);
                bjc.setNombre_img(nombreimg);
                bjc.setFoto(imagen);
                bjc.setFoto_base64(imagen_base64);
                bjc.setEliminado(0);

                o8.InsertarJuego(bjc);
                
                response.sendRedirect("cerradoautomatico.jsp");
            }
            ////////////////////////////////////////////////////////////////
            
            ////////////////////////////////////////////////////////////////
%>

    </body>
</html>
