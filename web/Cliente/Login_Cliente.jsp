<%-- 
    Document   : Login_Cliente
    Created on : 02/04/2022, 07:55:52 PM
    Author     : Airth
--%>

<%@page import="Dao.D_cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/Clientes/Login_cliente.css" rel="stylesheet" type="text/css"/>
        <title>LOGIN CLIENTE</title>
    </head>
    <body>
        <div class="login-box">
            <img src="../Imagenes/Icono/usario1.png" class="avatar" alt="Avatar Image">
            <h1>BIENVENIDO</h1>
            <form action="Login_Cliente.jsp" method="post">
                <label>Usuario</label>
                <input name="usuario" id="usuario" type="text" placeholder="Ingrese su nick o nombre de usuario" required="">
                <label>Contraseña</label>
                <input name="clave" id="clave" type="password" placeholder="Ingrese su contraseña" required="">
                <input type="submit" name="enviar" id="enviar" value="Ingresar">
                <input type="hidden" name="pagina" id="pagina" value="2">
                <a href="Cambiarclave_cliente.jsp">¿Olvidó su contraseña?</a><br>
                <a href="Registrar_Cliente.jsp">¿Aún no está registrado?</a>
                <a href="../Principal.jsp">« Volver</a>
            </form>
  
        </div>
        
         <h3 align="center">
             <% D_cliente ob = new D_cliente();

                if (request.getParameter("enviar") != null) {
                    String u = request.getParameter("usuario");
                    String c = request.getParameter("clave");
                    HttpSession sesion = request.getSession();
                    switch (ob.BuscarCliente_usuario_clave(u, c)) {
                        case 1:
                            sesion.setAttribute("user", u);
                            response.sendRedirect("Menu_cliente.jsp");
                        break;
                        
                        default:
                            out.print("usuario o contraseña incorrecta !!");
                            break;
                    }
                }
                %>
         </h3>
    </body>
</html>
