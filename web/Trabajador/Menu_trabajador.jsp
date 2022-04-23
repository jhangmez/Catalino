<%-- 
    Document   : Menu_trabajador
    Created on : 05/04/2022, 02:36:03 PM
    Author     : Airth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/Trabajador/Menu_trabajador.css" rel="stylesheet" type="text/css"/>
        <title>MENÚ TRABAJADOR</title>
    </head>
    <body>
        <header class="header">
            <div class="container">
                <div class="btn-menu">
                    <label for="btn-menu">☰</label>
                </div>
                <div class="logo">
                    <h1>CATALINO WEB</h1>
                </div>
                <nav class="menu">
                </nav>
            </div>
        </header>
        <div class="capa"></div>
        <input type="checkbox" id="btn-menu">
        <div class="container-menu">
            <div class="cont-menu">
                <div class="bienvenido">Bienvenido <br>
                <%
            HttpSession sesion = request.getSession();
            String u;
            String c;

            if(sesion.getAttribute("user")!=null){
                u=sesion.getAttribute("user").toString();
                out.print(u);
                out.print("<br><a href='../Principal.jsp?cerrar=true'> Cerrar sesión </a>");
            }else{
                out.print("<script>location.replace('Login_trabajador.jsp');</script>");
            }
        %>
                </div>
                <nav>
                    <a href="Juegos_CRUD/tb_juego.jsp">Juegos</a>
                    <a href="Clientes_CRUD/tb_Cliente.jsp">Clientes</a>
                    <a href="Sugerencias_CRUD/tb_sugerencia.jsp">Sugerencias</a>
                    <a href="../Reportes/Reporte_menu.jsp">Reportes</a>
                </nav>
                <label for="btn-menu">✖️</label>
            </div>
        </div>
    </body>
</html>
