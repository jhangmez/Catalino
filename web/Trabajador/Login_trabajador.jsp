<%-- 
    Document   : Login_trabajador
    Created on : 05/04/2022, 02:35:48 PM
    Author     : Airth
--%>

<%@page import="Dao.D_trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/Trabajador/Login_trabajador.css" rel="stylesheet" type="text/css"/>
        <title>LOGIN TRABAJADOR</title>
    </head>
    <body>
        <div class="login-box">
            <img src="../Imagenes/Icono/usario1.png" class="avatar" alt="Avatar Image">
            <h1>BIENVENIDO</h1>
            <form action="Login_trabajador.jsp" method="post">
                <label>Usuario</label>
                <input name="usuario" id="usuario" type="text" placeholder="Ingrese su nick o nombre de usuario" required="">
                <label>Contraseña</label>
                <input name="clave" id="clave" type="password" placeholder="Ingrese su contraseña" required="">
                <input type="submit" name="enviar" id="enviar" value="Ingresar">
                <input type="hidden" name="pagina" id="pagina" value="2">
                <a href="CambiarClave_trabajador.jsp">¿Olvidó su contraseña?</a><br>
                <a href="../Principal.jsp">« Volver</a>
            </form>

        </div>

        <h3 align="center">
            <% D_trabajador ob = new D_trabajador();

                if (request.getParameter("enviar") != null) {
                    String u = request.getParameter("usuario");
                    String c = request.getParameter("clave");
                    HttpSession sesion = request.getSession();
                    switch (ob.BuscarTrabajador_usuario_clave(u, c)) {
                        case 1:
                            sesion.setAttribute("user", u);
                            response.sendRedirect("Menu_trabajador.jsp");
                            break;

                        default:
                            out.print("usuario o contraseña incorrecta !!");
                            break;
                    }
                }

                if (request.getParameter("cerrar") != null) {
                    session.invalidate();
                }
            %>
        </h3>

    </body>
</html>
