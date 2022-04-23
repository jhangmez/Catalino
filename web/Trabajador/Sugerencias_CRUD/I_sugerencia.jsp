<%-- 
    Document   : I_sugerencia
    Created on : 22/04/2022, 09:22:13 AM
    Author     : Airth
--%>

<%@page import="Bean.B_imagen"%>
<%@page import="Dao.D_imagen"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.B_sugerencia"%>
<%@page import="Dao.D_sugerencia"%>
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
        

        <form action="I_sugerencia.jsp" method="POST" >

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

                D_sugerencia o9 = new D_sugerencia();

                int total1 = o9.ContarSugerencia();
                int codigo = total1+1;
                
                D_sugerencia o8 = new D_sugerencia();
                B_sugerencia bjc = new B_sugerencia();

                ////////////////////////////////////////////////////////////////
                byte[] byteArrray3 = {72, 101, 108, 108, 111, 32, 87, 111, 114,
                    108, 100, 33};

                ////////////////////////////////////////////////////////////////
                bjc.setIdSugerencia(codigo);
                bjc.setSug_id_cat(codigo_categoria);
                bjc.setSug_cat(nombrecat);
                bjc.setSug_nombre(nombrejuego);
                bjc.setSug_descripcion(descripcion);
                bjc.setSug_distribuidor(distribuidor);
                bjc.setSug_fecha(fecha);
                bjc.setSug_nom_img(nombreimg);
                bjc.setSug_fot(imagen);
                bjc.setSug_base64(imagen_base64);
                bjc.setSug_eliminado(0);

                o8.InsertarSugerencia(bjc);
                
                response.sendRedirect("cerradoautomatico.jsp");
            }
            ////////////////////////////////////////////////////////////////
            
            ////////////////////////////////////////////////////////////////
%>

    </body>
</html>
