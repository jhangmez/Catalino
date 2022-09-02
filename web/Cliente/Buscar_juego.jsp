<%-- 
    Document   : Buscar_juego
    Created on : 02/04/2022, 07:56:17 PM
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
        <link href="../Estilos/Clientes/Buscar_juego.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet">
        <title>Buscar juegos</title>
    </head>
    <script>
        $(document).ready(function () {
            $('.menuContainer').load('<%=request.getContextPath()%>/ContenedorMenu.jsp');
        });
    </script>
    <body>
        <div class="menuContainer"></div>
        <%
            D_categoria_juego o1 = new D_categoria_juego();
            List<B_juego_categoria> lista = new ArrayList<>();
            String s = request.getParameter("nombre");
            lista = o1.BuscarJuegoNombre(s);
            int inicio = 0;
            int total = lista.size();
            while (inicio < total) {
        %>
        <div>
            <hr>
            <h3><label>Nombre:</label></h3>
            <p><%= lista.get(inicio).getNombre()%></p>
            <br>
            <h3><label>Categoria:</label></h3>
            <p><%= lista.get(inicio).getNom_cat()%></p>
            <br>
            <h3><label>Distribuidor:</label></h3>
            <p><%= lista.get(inicio).getDistribuidor()%></p>
            <br>
            <h3><label>Fecha de lanzamiento:</label></h3>
            <p><%= lista.get(inicio).getFec_lanz()%></p>
            <br>
            <h3><label>Descripción:</label></h3>
            <p><%=lista.get(inicio).getDescripcion()%></p>
            <br>
            <h3><label>Imagen:</label></h3>
            <p><img src="data:image/jpeg;base64,<%= lista.get(inicio).getFoto_base64()%>" alt="" width="300" height="300"/></p>
            <a href="#">Descargar</a>
            <br>
        </div>
        <br>
        <hr>
        <%
                inicio++;
            }
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
