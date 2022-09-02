<%-- 
    Document   : Sugerencia
    Created on : 21/04/2022, 11:42:41 PM
    Author     : Airth
--%>


<%@page import="Bean.B_sugerencia"%>
<%@page import="Dao.D_sugerencia"%>
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
<%@page import="Bean.B_imagen"%>
<%@page import="Dao.D_imagen"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUGERENCIA</title>
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


        <form action="Sugerencia.jsp" method="POST" >

            <label> NOMBRE JUEGO</label> <input type="text" name="nombre" id="nombre"><br>
            <label> CATEGORIA </label> 
            <select name="nombrecategoria" id="nombrecategoria">
                <%
                    D_sugerencia o2 = new D_sugerencia();
                    List<B_sugerencia> lista = new ArrayList<>();
                    lista = o2.BuscarCategoriaTodos();
                    int inicio = 0;
                    int total = lista.size();
                    while (inicio < total) {
                %>
                <option data-ejemplo="<%= lista.get(inicio).getSug_cat()%>" value="<%= lista.get(inicio).getSug_cat()%>"><%= lista.get(inicio).getSug_cat()%></option>
                <%
                        inicio++;
                    }
                %>
            </select><br>
            <%
                String nombrecat = request.getParameter("nombrecategoria");
                D_sugerencia o3 = new D_sugerencia();
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
            <a href="#" onclick ="createPopupWin('Sugerencia_img.jsp', 'Insertar imagen', 400, 400);">Insertar imagen</a>
            <input type="hidden" name="pagina" id="pagina" value="5">
            <button type="submit">registrar</button>

        </form>

        <%
            String pagina, nombrejuego, descripcion, distribuidor, fecha;

            nombrejuego = request.getParameter("nombre");
            descripcion = request.getParameter("descripcion");
            distribuidor = request.getParameter("distribuidor");
            nombreimg = request.getParameter("nombreimg");
            pagina = request.getParameter("pagina");
            fecha = request.getParameter("fecha");
            if (pagina != null) {

                D_sugerencia o9 = new D_sugerencia();

                int total1 = o9.ContarSugerencia();
                int codigo = total1 + 1;

                D_sugerencia o8 = new D_sugerencia();
                B_sugerencia sg = new B_sugerencia();

                ////////////////////////////////////////////////////////////////
                byte[] byteArrray3 = {72, 101, 108, 108, 111, 32, 87, 111, 114,
                    108, 100, 33};

                ////////////////////////////////////////////////////////////////
                sg.setIdSugerencia(codigo);
                sg.setSug_id_cat(codigo_categoria);
                sg.setSug_cat(nombrecat);
                sg.setSug_nombre(nombrejuego);
                sg.setSug_descripcion(descripcion);
                sg.setSug_distribuidor(distribuidor);
                sg.setSug_fecha(fecha);
                sg.setSug_nom_img(nombreimg);
                sg.setSug_fot(imagen);
                sg.setSug_base64(imagen_base64);
                sg.setSug_eliminado(0);

                o8.InsertarSugerencia(sg);

                response.sendRedirect("cerradoautomatico.jsp");
            }
            ////////////////////////////////////////////////////////////////

            ////////////////////////////////////////////////////////////////
        %>

    </body>
</html>
