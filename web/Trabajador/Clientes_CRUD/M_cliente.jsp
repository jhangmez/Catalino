<%-- 
    Document   : M_cliente
    Created on : 07/04/2022, 01:40:57 AM
    Author     : Airth
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.B_cliente"%>
<%@page import="Dao.D_cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String cod = request.getParameter("codigo");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Estilos/Trabajador/CRUD_CLIENTE/M_cliente.css" rel="stylesheet" type="text/css"/>
        <title>MODIFICAR CLIENTE</title>
    </head>
    <body>
        <%
            D_cliente obj = new D_cliente();
            List<B_cliente> lista_recibe = new ArrayList<>();
            B_cliente bc = new B_cliente();
            lista_recibe = obj.BuscarCliente_Codigo(cod);
            int i = 0;
            int t = lista_recibe.size();
            while (i < t) {
                bc.setCod_usuario(lista_recibe.get(i).getCod_usuario());
                bc.setNombres(lista_recibe.get(i).getNombres());
                bc.setAp_pat(lista_recibe.get(i).getAp_pat());
                bc.setAp_mat(lista_recibe.get(i).getAp_mat());
                bc.setFec_nac(lista_recibe.get(i).getFec_nac());
                bc.setNick(lista_recibe.get(i).getNick());
                bc.setClave(lista_recibe.get(i).getClave());
                bc.setCorreo(lista_recibe.get(i).getCorreo());
                bc.setEliminado(lista_recibe.get(i).getEliminado());
                i++;
            }
        %>
        <form align="center" action="M_cliente.jsp" method="POST">
            <label>MODIFICAR CLIENTES</label>
            <br>
            <input type="hidden" name="codusuario" id="codusuario"  value="<%=cod%>"><br>

            <label> NOMBRES</label><input type="text" name="nombres" id="nombres"  value="<%=bc.getNombres()%>"><br>

            <label> APELLIDO PATERNO </label> <input type="text" name="ap" id="ap"  value="<%=bc.getAp_pat()%>"><br>

            <label> APELLIDO MATERNO </label> <input type="text" name="am" id="am"  value="<%=bc.getAp_mat()%>"><br>

            <label> FECHA DE NACIMIENTO </label> <input type="text" name="fnac" id="fnac"  value="<%=bc.getFec_nac()%>"><br>

            <label> NICK </label> <input type="text" name="nick" id="nick"  value="<%=bc.getNick()%>"><br>

            <label> CLAVE </label> <input type="text" name="pass" id="pass" value="<%=bc.getClave()%>"><br>

            <label> CORREO </label> <input type="text" name="correo" id="correo"  value="<%=bc.getCorreo()%>"><br>

            <label> ESTADO </label> 

            <select name="estado">
                <option value="0"<%if (bc.getEliminado() == 0) {
                        out.print("selected");
                    }
                        %>>VIGENTE</option>
                <option value="1"<%if (bc.getEliminado() == 1) {
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
                String codusu1, nombres1, ap1, am1, fnac1, nick1, pass1, correo1, estado1;

                codusu1 = request.getParameter("codusuario");
                nombres1 = request.getParameter("nombres");
                ap1 = request.getParameter("ap");
                am1 = request.getParameter("am");
                fnac1 = request.getParameter("fnac");
                nick1 = request.getParameter("nick");
                pass1 = request.getParameter("pass");
                correo1 = request.getParameter("correo");
                estado1 = request.getParameter("estado");

                D_cliente obj4 = new D_cliente();

                B_cliente obj6 = new B_cliente();

                obj6.setCod_usuario(Integer.parseInt(codusu1));
                obj6.setNombres(nombres1);
                obj6.setAp_pat(ap1);
                obj6.setAp_mat(am1);
                obj6.setFec_nac(fnac1);
                obj6.setNick(nick1);
                obj6.setClave(pass1);
                obj6.setCorreo(correo1);
                obj6.setEliminado(Integer.parseInt(estado1));
                obj4.ModificarCliente_Codigo(obj6);
                response.sendRedirect("Cerrar_ventana.jsp");
            }
        %>
    </body>
    
    <style>
        body{
            background: url(../..//Imagenes/Fondos/dif.jpg)
        }
    </style>
</body>
</html>
