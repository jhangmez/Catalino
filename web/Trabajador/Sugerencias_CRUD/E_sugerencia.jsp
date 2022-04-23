<%-- 
    Document   : E_sugerencia
    Created on : 22/04/2022, 09:22:27 AM
    Author     : Airth
--%>

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
        <title>ELIMINAR SUGERENCIA</title>
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

        <form align="center" action="E_sugerencia.jsp" method="POST">
            <label>MODIFICAR JUEGO</label>
            <br>
            <label> CODIGO USUARIO </label> <input type="text" name="codusuario" id="codusuario" disabled="true" value="<%=cod%>"><br>
            <input type="hidden" name="codusuario1" id="codusuario1"  value="<%=cod%>"><br>

            <label> NOMBRE JUEGO</label> <input type="text" name="nombre" id="nombre" disabled="true" value="<%=bjc.getSug_nombre()%>" ><br>
            <input type="hidden" name="nombre1" id="nombre1" value="<%=bjc.getSug_nombre()%>" ><br>
            
            <label> NOMBRE CATEGORIA</label> <input type="text" name="nombrecategoria" id="nombrecategoria" disabled="true" value="<%=bjc.getSug_cat()%>"><br>
            <input type="hidden"" name="nombrecategoria1" id="nombrecategoria1" value="<%=bjc.getSug_cat()%>"><br>
            
            
            <%
                String nombrecat = request.getParameter("nombrecategoria1");
                D_sugerencia o3 = new D_sugerencia();
                int codigo_categoria = o3.BuscaridCategoriaNombre(nombrecat);
            %>

            <label> DESCRIPCION </label> <input type="text" name="descripcion" id="descripcion" disabled="true" value="<%=bjc.getSug_descripcion()%>"><br>
            <input type="hidden" name="descripcion1" id="descripcion1" value="<%=bjc.getSug_descripcion()%>"><br>

            <label> DISTRIBUIDOR </label> <input type="text" name="distribuidor" id="distribuidor" disabled="true" value="<%=bjc.getSug_distribuidor()%>"><br>
            <input type="hidden" name="distribuidor1" id="distribuidor1" value="<%=bjc.getSug_distribuidor()%>"><br>

            <label> FECHA DE LANZAMIENTO: </label><input type="text" name="feche" id="feche" disabled="true" value="<%=bjc.getSug_fecha()%>"><br>
            <input type="hidden" name="feche1" id="feche1" value="<%=bjc.getSug_fecha()%>"><br>


            <label> NOMBRE DE LA IMAGEN </label><input type="text" name="nombreimg" id="nombreimg" disabled="true" value="<%=bjc.getSug_nom_img()%>"><br>
            <input type="hidden"" name="nombreimg1" id="nombreimg1" value="<%=bjc.getSug_nom_img()%>"><br>
            


            <%
                String nombreimg = request.getParameter("nombreimg1");
                D_imagen i2 = new D_imagen();
                byte[] imagen = i2.BuscarImagenNombre(nombreimg);
                String imagen_base64 = i2.BuscarImagenNombre_b64(nombreimg);
            %>


            <label> ESTADO </label> 

            <%if (bjc.getSug_eliminado()== 0) { %>
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
