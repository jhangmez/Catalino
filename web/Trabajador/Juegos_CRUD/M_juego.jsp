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
        <title>MODIFICAR VIDEOJUEGO</title>
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

        <form align="center" action="M_juego.jsp" method="POST">
            <label>MODIFICAR JUEGO</label>
            <br>
            <input type="hidden" name="codusuario" id="codusuario"  value="<%=cod%>"><br>

            <label> NOMBRE JUEGO</label> <input type="text" name="nombre" id="nombre" value="<%=bjc.getNombre()%>" ><br>

            <label> NOMBRE CATEGORIA</label><select name="nombrecategoria" id="nombrecategoria">
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

            <label> DESCRIPCION </label> <input type="text" name="descripcion" id="descripcion" value="<%=bjc.getDescripcion()%>"><br>

            <label> DISTRIBUIDOR </label> <input type="text" name="distribuidor" id="distribuidor" value="<%=bjc.getDistribuidor()%>"><br>

            <label> FECHA DE LANZAMIENTO: </label><br>
             <input type="date" name="fecha" ><br>


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
                <option data-ejemplo="<%= listaimagen.get(incie).getNombre_archivo()%>" value="<%= listaimagen.get(incie).getNombre_archivo()%>"><%= listaimagen.get(incie).getNombre_archivo()%></option>
                <%
                        incie++;
                    }
//
                %>
            </select><br>

            <%
                String nombreimg = request.getParameter("nombreimg");
                D_imagen i2 = new D_imagen();
                byte[] imagen = i2.BuscarImagenNombre(nombreimg);
                String imagen_base64 = i2.BuscarImagenNombre_b64(nombreimg);
            %>


            <label> ESTADO </label> 

            <select name="estado">
                <option value="0"<%if (bjc.getEliminado() == 0) {
                        out.print("selected");
                    }
                        %>>VIGENTE</option>
                <option value="1"<%if (bjc.getEliminado() == 1) {
                        out.print("selected");
                    }
                        %>>ELIMINADO</option>
            </select>
            <br>
            <input type="hidden" name="pagina" id="pagina" value="7">
            <button type="submit">Actualizar</button>

        </form>


        

        <%
            String pagina;
            pagina = request.getParameter("pagina");

            if (Integer.parseInt(pagina) == 7) {
                String codusu1, nombre1, estado1, descripcion1, distribuidor1, fecha_lanzamiento;
                
                codusu1 = request.getParameter("codusuario");
                nombre1 = request.getParameter("nombre");
                estado1 = request.getParameter("estado");
                descripcion1 = request.getParameter("descripcion");
                distribuidor1 = request.getParameter("distribuidor");
                fecha_lanzamiento= request.getParameter("fecha");
                        
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
