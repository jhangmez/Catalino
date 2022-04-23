<%-- 
    Document   : tb_sugerencia
    Created on : 22/04/2022, 08:28:55 AM
    Author     : Airth
--%>

<%@page import="java.util.List"%>
<%@page import="Bean.B_sugerencia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dao.D_sugerencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../Estilos/Trabajador/tb_Cliente.css" rel="stylesheet" type="text/css"/>
        <title>SUGERENCIAS</title>
        <script>
            function createPopupWin(pageURL, pageTitle,
                    popupWinWidth, popupWinHeight) {
                var left = (screen.width - popupWinWidth) / 2;
                var top = (screen.height - popupWinHeight) / 4;

                var myWindow = window.open(pageURL, pageTitle,
                        'resizable=yes, width=' + popupWinWidth
                        + ', height=' + popupWinHeight + ', top='
                        + top + ', left=' + left);
            }

        </script>

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
                    <a href="../Menu_trabajador.jsp">Inicio</a>
                    
                    <a href="#" onclick ="createPopupWin('I_imagen.jsp', 'Insertar imagen', 400, 400);">Insertar imagen</a>
                    <a href="#" onclick ="createPopupWin('I_sugerencia.jsp', 'Insertar sugerencia', 400, 400);">Insertar Sugerencia</a>
                </nav>
                <form>
                    <input class="buscador" type="search" name="nombre" id="nombre" placeholder="Ingrese nick...">
                </form>
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
                            out.print("<br><a href='../Login_trabajador.jsp?cerrar=true'> Cerrar sesión </a>");
                        } else {
                            out.print("<script>location.replace('../Login_trabajador.jsp');</script>");
                        }
                    %>
                </div>
                <nav>
                    <a href="../Clientes_CRUD/tb_Cliente.jsp">Clientes</a>
                    <a href="#">Reportes</a>
                    <a href="#">Sugerencias</a>
                    <a href="../Juegos_CRUD/tb_juego.jsp">Juegos</a>
                </nav>
                <label for="btn-menu">✖️</label>
            </div>
        </div>



        <table id="main-container" >

            <tr>
                <th>CÓDIGO</th>
                <th>CÓDIGO CATEGORIA</th>
                <th>NOMBRE CATEGORIA</th>
                <th>NOMBRE</th>
                <th>DESCRIPCION</th>
                <th>DISTRIBUIDOR</th>
                <th>FECHA DE LANZAMIENTO</th>
                <th>NOMBRE DE LA IMAGEN</th>
                <th>IMAGEN</th>
                <th>ESTADO</th>

                <th>ACCIONES</th>
            </tr>
            <%
                D_sugerencia o1 = new D_sugerencia();
                List<B_sugerencia> lista = new ArrayList<>();
                String s = request.getParameter("nombre");
                lista = o1.BuscarSugerenciaNombre(s);
                int inicio = 0;
                int total = lista.size();
                while (inicio < total) {
            %>
            <tr>
                <td><%= lista.get(inicio).getIdSugerencia()%></td>
                <td><%= lista.get(inicio).getSug_id_cat()%></td>
                <td><%= lista.get(inicio).getSug_cat()%></td>
                <td><%= lista.get(inicio).getSug_nombre()%></td>
                <td><%= lista.get(inicio).getSug_descripcion()%></td>
                <td><%= lista.get(inicio).getSug_distribuidor()%></td>
                <td><%= lista.get(inicio).getSug_fecha()%></td>
                <td><%= lista.get(inicio).getSug_nom_img()%></td>
                <td><img src="data:image/jpeg;base64,<%= lista.get(inicio).getSug_base64()%>" alt="" width="100" height="100"/></td>
                <td ><% if (lista.get(inicio).getSug_eliminado()== 0) {
                        out.print("ACTIVO");
                    } else {
                        out.print("ELIMINADO");
                    }
                    %></td> 
                <td>
                    <a href="#" onclick ="createPopupWin('M_sugerencia.jsp?codigo=<%=lista.get(inicio).getIdSugerencia()%>&pagina=16', 'Modificar sugerencia', 400, 400);">
                        <img src="../../Imagenes/Icono/editar.jpg" width="16" height="16" alt="Modificar Sugerencia"/></a>
                    &nbsp
                    <a href="#" onclick ="createPopupWin('E_sugerencia.jsp?codigo=<%=lista.get(inicio).getIdSugerencia()%>&pagina=16', 'Eliminar sugerencia', 400, 400);">
                        <img  src="../../Imagenes/Icono/eliminar.gif" width="16" height="16" alt="Eliminar Sugerencia"/>
                    </a>
                </td>            
                <%
                        inicio++;
                    }
                %>
            </tr>
        </table>
                    <div id="paginado_tabla" ></div>
        <script>

            $(document).ready(function () {
                $('#main-container').after('<div id="paginado_tabla"></div>');
                var rowsShown = 6;
                var rowsTotal = $('#main-container tbody tr').length;
                var numPages = rowsTotal / rowsShown;
                for (i = 0; i < numPages; i++) {
                    var pageNum = i + 1;
                    $('#paginado_tabla').append('<a href="#" rel="' + i + '">' + pageNum + '</a> ');
                }
                $('#main-container tbody tr').hide();
                $('#main-container tbody tr').slice(0, rowsShown).show();
                $('#paginado_tabla a:first').addClass('active');
                $('#paginado_tabla a').bind('click', function () {

                    $('#paginado_tabla a').removeClass('active');
                    $(this).addClass('active');
                    var currPage = $(this).attr('rel');
                    var startItem = currPage * rowsShown;
                    var endItem = startItem + rowsShown;
                    $('#main-container tbody tr').css('opacity', '0.0').hide().slice(startItem, endItem).
                            css('display', 'table-row').animate({opacity: 1}, 300);
                });
            });

        </script>
    </body>

    <style>
        #paginado_tabla{
            margin: -100px -50px;
            font-size: 50px;
            text-align: center;
            color: white;
        }
    </style>
    </body>
</html>
