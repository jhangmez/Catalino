<%-- 
    Document   : CambiarClave_trabajador
    Created on : 05/04/2022, 10:11:00 PM
    Author     : Airth
--%>

<%@page import="Bean.B_trabajador"%>
<%@page import="Dao.D_trabajador"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/Trabajador/CambiarClave_trabajador.css" rel="stylesheet" type="text/css"/>
        <title>CAMBIAR CLAVE TRABAJADOR</title>
    </head>
    <body>
        <div class="login-box">
            <h2>Cambiar Contraseña</h2>
            <form action="CambiarClave_trabajador.jsp" method="POST">
                <div class="user-box">
                    <input type="text" name="usuario" required="">
                    <label>Nombre usuario</label>
                </div>
                <div class="user-box">
                    <input type="text" name="correo" required="">
                    <label>Correo</label>
                </div>
                <div class="user-box">
                    <input type="password" name="clave" required="">
                    <label>Contraseña</label>
                </div>
                <input type="hidden" name="pagina" id="pagina" value="23">
                <button type="submit">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    Ingresar
                </button>
            </form>
        </div>
                <%
                String nick1, correo1, clave1, pag;
                nick1 = request.getParameter("usuario");
                correo1 = request.getParameter("correo");
                clave1 = request.getParameter("clave");
                pag = request.getParameter("pagina");
               if (pag != null) {
                D_trabajador obj1 = new D_trabajador();
                B_trabajador bt = new B_trabajador();
                bt.setAd_nick(nick1);
                bt.setAd_correo(correo1);
                bt.setAd_clave(clave1);

                obj1.CambiarContraTrabajador(nick1, correo1, clave1);
                response.sendRedirect("Login_trabajador.jsp");
            }
            %> 
    </body>
</html>
