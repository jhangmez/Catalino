<%-- 
    Document   : Registrar_Cliente
    Created on : 05/04/2022, 12:49:58 PM
    Author     : Airth
--%>

<%@page import="Bean.B_cliente"%>
<%@page import="Dao.D_cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/Clientes/Registrar_cliente.css" rel="stylesheet" type="text/css"/>   
        <title>REGISTRO CLIENTE</title>
    </head>
    <body>
        <form class="form" action="Registrar_Cliente.jsp" method="post">
            <h2>REGISTRARSE</h2>
            <p type="Nombres:"><input type="text" name="nombres" placeholder="Ingrese sus nombres.." required=""></p>
            <p type="Apellido Paterno:"><input type="text" name="ap_pat" placeholder="Ingrese su apellido paterno.." required=""></p>
            <p type="Apellido Materno:"><input type="text" name="ap_mat" placeholder="Ingrese su apellido materno.." required=""></p>
            <p type="Fecha de Nacimiento:"><input type="date" name="fecha"></p>
            <p type="Nick o Nombre de usuario:"><input type="text" name="usuario" placeholder="Ingrese su nombre de usuario.." required=""></p>
            <p type="Contraseña:"><input type="password" name="clave" placeholder="Ingrese su contraseña.." required=""></p>
            <p type="Correo:"><input type="email" name="correo" placeholder="Ingrese su correo.." required=""></p>
            <input type="hidden" name="pagina" id="pagina" value="3">
            <button type="submit">Registrar</button>
            <br>
            <a class="enlace" href="Login_Cliente.jsp">« Volver</a>
        </form>
        
        <%

            String  nombre, ap, am, fnac, nick, contra, correo, pag;
            
            nombre = request.getParameter("nombres");
            ap = request.getParameter("ap_pat");
            am = request.getParameter("ap_mat");
            fnac = request.getParameter("fecha");
            nick = request.getParameter("usuario");
            contra = request.getParameter("clave");
            correo = request.getParameter("correo");
            pag = request.getParameter("pagina");
            if (pag != null) {
                
                D_cliente obj2 = new D_cliente();
                int total = obj2.ContarCliente();
                int codigo = total + 1;
                int eliminado = 0;
                
                
                D_cliente obj1 = new D_cliente();

                B_cliente bc = new B_cliente();
                bc.setCod_usuario(codigo);
                bc.setNombres(nombre);
                bc.setAp_pat(ap);
                bc.setAp_mat(am);
                bc.setFec_nac(fnac);
                bc.setNick(nick);
                bc.setClave(contra);
                bc.setCorreo(correo);
                bc.setEliminado(eliminado);

                obj1.RegistrarCliente(bc);
                response.sendRedirect("Mensaje_registrado.jsp");
            }
        %>
    </body>
</html>
