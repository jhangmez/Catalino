<%-- 
    Document   : M_sugerencia
    Created on : 22/04/2022, 08:29:11 AM
    Author     : Airth
--%>

<%@page import="Bean.B_imagen"%>
<%@page import="Dao.D_imagen"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.B_sugerencia"%>
<%@page import="Dao.D_sugerencia"%>
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
            D_sugerencia obj = new D_sugerencia();
            List<B_sugerencia> lista_recibe = new ArrayList<>();
            B_sugerencia bjc = new B_sugerencia();
            lista_recibe = obj.Buscarsugerencia_Codigo(cod);
            int i = 0;
            int t = lista_recibe.size();
            while (i < t) {
                bjc.setIdSugerencia(lista_recibe.get(i).getIdSugerencia());
                bjc.setSug_id_cat(lista_recibe.get(i).getSug_id_cat());
                bjc.setSug_cat(lista_recibe.get(i).getSug_cat());
                bjc.setSug_nombre(lista_recibe.get(i).getSug_nombre());
                bjc.setSug_descripcion(lista_recibe.get(i).getSug_descripcion());
                bjc.setSug_distribuidor(lista_recibe.get(i).getSug_distribuidor());
                bjc.setSug_fecha(lista_recibe.get(i).getSug_fecha());
                bjc.setSug_nom_img(lista_recibe.get(i).getSug_nom_img());
                bjc.setSug_fot(lista_recibe.get(i).getSug_fot());
                bjc.setSug_base64(lista_recibe.get(i).getSug_base64());
                bjc.setSug_eliminado(lista_recibe.get(i).getSug_eliminado());
                i++;
            }
        %>

        <form align="center" action="M_sugerencia.jsp" method="POST">
            <label>MODIFICAR JUEGO</label>
            <br>
            <input type="hidden" name="codusuario" id="codusuario"  value="<%=cod%>"><br>

            <label> NOMBRE JUEGO</label> <input type="text" name="nombre" id="nombre" value="<%=bjc.getSug_nombre()%>" ><br>

            <label> NOMBRE CATEGORIA</label><select name="nombrecategoria" id="nombrecategoria">
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

            <label> DESCRIPCION </label> <input type="text" name="descripcion" id="descripcion" value="<%=bjc.getSug_descripcion()%>"><br>

            <label> DISTRIBUIDOR </label> <input type="text" name="distribuidor" id="distribuidor" value="<%=bjc.getSug_distribuidor()%>"><br>

            <label> FECHA DE LANZAMIENTO: </label><br>
             <input type="date" name="fecha"><br>


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
                <option value="0"<%if (bjc.getSug_eliminado()== 0) {
                        out.print("selected");
                    }
                        %>>VIGENTE</option>
                <option value="1"<%if (bjc.getSug_eliminado()== 1) {
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
                        
                D_sugerencia obj4 = new D_sugerencia();
                
                B_sugerencia obj9 = new B_sugerencia();
                
                obj9.setIdSugerencia(Integer.parseInt(codusu1));
                obj9.setSug_id_cat(codigo_categoria);
                obj9.setSug_cat(nombrecat);
                obj9.setSug_nombre(nombre1);
                obj9.setSug_descripcion(descripcion1);
                obj9.setSug_distribuidor(distribuidor1);
                obj9.setSug_fecha(fecha_lanzamiento);
                obj9.setSug_nom_img(nombreimg);
                obj9.setSug_fot(imagen);
                obj9.setSug_base64(imagen_base64);
                obj9.setSug_eliminado(Integer.parseInt(estado1));
                obj4.ModificarSugerencia_Codigo(obj9);
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