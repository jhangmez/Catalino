<%-- 
    Document   : Aventura
    Created on : 03/04/2022, 01:42:44 AM
    Author     : Airth
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.B_juego_categoria"%>
<%@page import="Dao.D_categoria_juego"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/Categorias/Aventura.css" rel="stylesheet" type="text/css"/>
        <link href="../Estilos/Categorias/Aventura.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet">
        <title>Accion</title>
    </head>
     <script>
                $(document).ready(function () {
                $('.menuContainer').load('../ContenedorMenu.jsp');
            });
        </script>
    <body>
        <div class="menuContainer"></div>
        <%
            D_categoria_juego o1 = new D_categoria_juego();
            List<B_juego_categoria> lista = new ArrayList<>();
            String s = "Aventura";
            lista = o1.BuscarJuegoCategoria(s);
            int inicio = 0;
            int total = lista.size();
            while (inicio < total) {
        %>
        <div>
            <hr>
        <h3><label>Nombre:</label><%= lista.get(inicio).getNombre()%></h3>
        <p><label>Descripción:</label><%=lista.get(inicio).getDescripcion()%></p>
        <p><img src="data:image/jpeg;base64,<%= lista.get(inicio).getFoto_base64()%>" alt="" width="300" height="300"/></p>
        <a href="https://drive.google.com/file/d/11q3cEp5rUKXGRRYASbttP6HPFlf3GyLd/view?usp=sharing" target="_blank">Descargar</a>
        <br>
        </div>
        <hr>
        <%
                        inicio++;}
                %>
    
    <footer>
            <div class="contenedor-footer">
                <div class="content-foo">
                    <h4>Teléfono</h4>
                    <p>8296312</p>
                </div>
                <div class="content-foo">
                    <h4>Email</h4>
                    <p>Catalinogames@gmail.com</p>
                </div>
                <div class="content-foo">
                    <h4>Perú</h4>
                    <p>Lambayeque</p>
                </div>
            </div>
        <h2 class="titulo-final"><a class="enlace" href="../Trabajador/Login_trabajador.jsp">Desarrolladores</a></h2>
            <h2 class="titulo-final">&copy; Ayrton E. | Mikami</h2>
            <h2 class="titulo-final">&copy; Angelo C. | Donattelo - El rechazado</h2>
            <h2 class="titulo-final">&copy; Jhan G. | Jian</h2>
            <h2 class="titulo-final">&copy; Fabricio G. | Fabriuwu</h2>
        </footer>
    </body>
</html>
