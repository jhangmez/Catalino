<%-- 
    Document   : Reporte_menu
    Created on : 22/04/2022, 01:02:43 PM
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
                    <a href="../Trabajador/Menu_trabajador.jsp">Inicio</a>
                    <a href="Reporte1/Reporte_1.jsp" target="_blank">Reporte 1</a>
                    <a href="Reporte2/llama_reporte2.jsp">Reporte 2</a>
                    <a href="Reporte1/Reporte_1.jsp">Reporte 3</a>
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

                        if (sesion.getAttribute("user") != null) {
                            u = sesion.getAttribute("user").toString();
                            out.print(u);
                            out.print("<br><a href='../Principal.jsp?cerrar=true'> Cerrar sesión </a>");
                        } else {
                            out.print("<script>location.replace('Login_trabajador.jsp');</script>");
                        }
                    %>
                </div>
                <nav>
                    <a href="../Trabajador/Juegos_CRUD/tb_juego.jsp">Juegos</a>
                    <a href="../Trabajador/Clientes_CRUD/tb_Cliente.jsp">Clientes</a>
                    <a href="../Trabajador/Sugerencias_CRUD/tb_sugerencia.jsp">Sugerencias</a>
                </nav>
                <label for="btn-menu">✖️</label>
            </div>
        </div>
    </body>
</html>