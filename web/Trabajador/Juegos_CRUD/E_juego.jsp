<%-- 
    Document   : M_juego
    Created on : 21/04/2022, 12:52:14 AM
    Author     : USUARIO
--%>
<%@page import="Bean.B_imagen"%>
<%@page import="Dao.D_imagen"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.B_juego_categoria"%>
<%@page import="Dao.D_categoria_juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String cod = request.getParameter("codigo");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR VIDEOJUEGO</title>
    </head>
    <body>

        <%
            D_categoria_juego obj = new D_categoria_juego();
            List<B_juego_categoria> lista_recibe = new ArrayList<>();
            B_juego_categoria bjc = new B_juego_categoria();
            lista_recibe = obj.BuscarJuego_Codigo(cod);
            int i = 0;
            int t = lista_recibe.size();
            while (i < t) {
                bjc.setIdjuego(lista_recibe.get(i).getIdjuego());
                bjc.setCod_cat(lista_recibe.get(i).getCod_cat());
                bjc.setNom_cat(lista_recibe.get(i).getNom_cat());
                bjc.setNombre(lista_recibe.get(i).getNombre());
                bjc.setDescripcion(lista_recibe.get(i).getDescripcion());
                bjc.setDistribuidor(lista_recibe.get(i).getDistribuidor());
                bjc.setFec_lanz(lista_recibe.get(i).getFec_lanz());
                bjc.setNombre_img(lista_recibe.get(i).getNombre_img());
                bjc.setFoto(lista_recibe.get(i).getFoto());
                bjc.setFoto_base64(lista_recibe.get(i).getFoto_base64());
                bjc.setEliminado(lista_recibe.get(i).getEliminado());
                i++;
            }
        %>

        <form align="center" action="E_juego.jsp" method="POST">
            <label>MODIFICAR JUEGO</label>
            <br>
            <label> CODIGO USUARIO </label> <input type="text" name="codusuario" id="codusuario" disabled="true" value="<%=cod%>"><br>
            <input type="hidden" name="codusuario1" id="codusuario1"  value="<%=cod%>"><br>

            <label> NOMBRE JUEGO</label> <input type="text" name="nombre" id="nombre" disabled="true" value="<%=bjc.getNombre()%>" ><br>
            <input type="hidden" name="nombre1" id="nombre1" value="<%=bjc.getNombre()%>" ><br>
            
            <label> NOMBRE CATEGORIA</label> <input type="text" name="nombrecategoria" id="nombrecategoria" disabled="true" value="<%=bjc.getNom_cat()%>"><br>
            <input type="hidden"" name="nombrecategoria1" id="nombrecategoria1" value="<%=bjc.getNom_cat()%>"><br>
            
            
            <%
                String nombrecat = request.getParameter("nombrecategoria1");
                D_categoria_juego o3 = new D_categoria_juego();
                int codigo_categoria = o3.BuscaridCategoriaNombre(nombrecat);
            %>

            <label> DESCRIPCION </label> <input type="text" name="descripcion" id="descripcion" disabled="true" value="<%=bjc.getDescripcion()%>"><br>
            <input type="hidden" name="descripcion1" id="descripcion1" value="<%=bjc.getDescripcion()%>"><br>

            <label> DISTRIBUIDOR </label> <input type="text" name="distribuidor" id="distribuidor" disabled="true" value="<%=bjc.getDistribuidor()%>"><br>
            <input type="hidden" name="distribuidor1" id="distribuidor1" value="<%=bjc.getDistribuidor()%>"><br>

            <label> FECHA DE LANZAMIENTO: </label><input type="text" name="feche" id="feche" disabled="true" value="<%=bjc.getFec_lanz()%>"><br>
            <input type="hidden" name="feche1" id="feche1" value="<%=bjc.getFec_lanz()%>"><br>


            <label> NOMBRE DE LA IMAGEN </label><input type="text" name="nombreimg" id="nombreimg" disabled="true" value="<%=bjc.getNombre_img()%>"><br>
            <input type="hidden"" name="nombreimg1" id="nombreimg1" value="<%=bjc.getNombre_img()%>"><br>
            


            <%
                String nombreimg = request.getParameter("nombreimg1");
                D_imagen i2 = new D_imagen();
                byte[] imagen = i2.BuscarImagenNombre(nombreimg);
                String imagen_base64 = i2.BuscarImagenNombre_b64(nombreimg);
            %>


            <label> ESTADO </label> 

            <%if (bjc.getEliminado() == 0) { %>
            <input type="text" name="eliminado" id="eliminado" disabled="true" value="VIGENTE"><br>
            <%} else { %>
            <input type="text" name="eliminado" id="eliminado" disabled="true" value="ELIMINADO"><br>
            <%}%>
            
            <br>
            <input type="hidden" name="pagina" id="pagina" value="7">
            <button type="submit">ELIMINAR</button>

        </form>




        <%
            String pagina;
            pagina = request.getParameter("pagina");

            if (Integer.parseInt(pagina) == 7) {
                String codusu1, nombre1, estado1, descripcion1, distribuidor1, fecha_lanzamiento;
                fecha_lanzamiento = request.getParameter("feche1");
                codusu1 = request.getParameter("codusuario1");
                nombre1 = request.getParameter("nombre1");
                estado1 = "1";
                descripcion1 = request.getParameter("descripcion1");
                distribuidor1 = request.getParameter("distribuidor1");

                D_categoria_juego obj4 = new D_categoria_juego();

                B_juego_categoria obj9 = new B_juego_categoria();

                obj9.setIdjuego(Integer.parseInt(codusu1));
                obj9.setCod_cat(codigo_categoria);
                obj9.setNom_cat(nombrecat);
                obj9.setNombre(nombre1);
                obj9.setDescripcion(descripcion1);
                obj9.setDistribuidor(distribuidor1);
                obj9.setFec_lanz(fecha_lanzamiento);
                obj9.setNombre_img(nombreimg);
                obj9.setFoto(imagen);
                obj9.setFoto_base64(imagen_base64);
                obj9.setEliminado(Integer.parseInt(estado1));
                obj4.ModificarJuego_Codigo(obj9);
                response.sendRedirect("cerradoautomatico.jsp");
            }
        %>
        <style>
            body{
                background: url(../..//Imagenes/Fondos/dif.jpg)
            }
        </style>
    </body>
</html>
