<%-- 
    Document   : E_cliente
    Created on : 07/04/2022, 12:58:56 PM
    Author     : Airth
--%>
<%@page import="Bean.B_cliente"%>
<%@page import="Dao.D_cliente"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String codigo = request.getParameter("codigo");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELIMINAR CLIENTE</title>
    </head>
    <script>
        function cerrarse() {
            window.close();
        }
    </script>

    <body>
        <h1>ELIMINAR CLIENTE!</h1>
        <%
            D_cliente obj = new D_cliente();
            List<B_cliente> lista_recibe = new ArrayList<>();
            B_cliente bc = new B_cliente();
            lista_recibe = obj.BuscarCliente_Codigo(codigo);
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

        <form action="E_cliente.jsp" method="POST">

            <label> CODIGO USUARIO </label> <input type="text" name="codusuario" id="codusuario" disabled="true" value="<%=codigo%>"><br>
            <input type="hidden" name="codusuario1" id="codusuario1"  value="<%=codigo%>"><br>

            <label> NOMBRES  </label> <input type="text" name="nombres" id="nombres" disabled="true" value="<%=bc.getNombres()%>"><br>
            </label> <input type="hidden" name="nombres1" id="nombres1"  value="<%=bc.getNombres()%>">

            <label> APELLIDO PATERNO </label> <input type="text" name="ap" id="ap" disabled="true" value="<%=bc.getAp_pat()%>"><br>
            <input type="hidden" name="ap1" id="ap1"  value="<%=bc.getAp_pat()%>">

            <label> APELLIDO MATERNO </label> <input type="text" name="am" id="am" disabled="true" value="<%=bc.getAp_mat()%>"><br>
            <input type="hidden" name="am1" id="am1"  value="<%=bc.getAp_mat()%>">

            <label> FECHA DE NACIMIENTO </label> <input type="text" name="fnac" id="fnac" disabled="true" value="<%=bc.getFec_nac()%>"><br>
            <input type="hidden" name="fnac1" id="fnac1"  value="<%=bc.getFec_nac()%>">

            <label> NICK </label> <input type="text" name="nick" id="nick" disabled="true" value="<%=bc.getNick()%>"><br>
            <input type="hidden" name="nick1" id="nick1"  value="<%=bc.getNick()%>">

            <label> CLAVE </label> <input type="text" name="pass" id="pass" disabled="true" value="<%=bc.getClave()%>"><br>
            <input type="hidden" name="pass1" id="pass1" value="<%=bc.getClave()%>">

            <label> CORREO </label> <input type="text" name="correo" id="correo" disabled="true" value="<%=bc.getCorreo()%>"><br>
            <input type="hidden" name="correo1" id="correo1"  value="<%=bc.getCorreo()%>">

            <label> ESTADO </label> 

            <%if (bc.getEliminado() == 0) { %>
            <input type="text" name="eliminado" id="eliminado" disabled="true" value="VIGENTE"><br>
            <%} else { %>
            <input type="text" name="eliminado" id="eliminado" disabled="true" value="ELIMINADO"><br>
            <%}%>
            <br>
            <input type="hidden" name="pagina" id="pagina" value="8">
            <button type="submit" >Eliminar</button>
        </form>
            
            <%
            String pagina;
            pagina = request.getParameter("pagina");
            if (Integer.parseInt(pagina) == 8) {
                String codusu1, nombres1, ap1, am1, fnac1, nick1, pass1, correo1, estado1;

                codusu1 = request.getParameter("codusuario1");
                nombres1 = request.getParameter("nombres1");
                ap1 = request.getParameter("ap1");
                am1 = request.getParameter("am1");
                fnac1 = request.getParameter("fnac1");
                nick1 = request.getParameter("nick1");
                pass1 = request.getParameter("pass");
                correo1 = request.getParameter("correo1");
                estado1 = "1";

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
</html>
