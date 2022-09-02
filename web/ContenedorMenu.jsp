<%-- 
    Document   : ContenedorMenu
    Created on : 02/04/2022, 11:06:47 PM
    Author     : Airth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contenedor Menu</title>
    </head>

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
    
    
    <body>
        <header>
            <nav class="navegacion">
                <ul class="menu">
                    <li><a href="../Cliente/Menu_cliente.jsp">Inicio</a></li>
                    <li>
                     <a href="#" onclick ="createPopupWin('../Cliente/Sugerencia.jsp', 'sugerencia', 400, 400);">Sugerencias</a>
                    </li>
                    <li><a href="#">Categorías</a>
                        <ul class="submenu">
                            <li><a href="../Categorias/Accion.jsp">Acción</a></li>
                            <li><a href="../Categorias/Deporte.jsp">Deportes</a></li>
                            <li><a href="../Categorias/Aventura.jsp">Aventura</a></li>
                            <li><a href="../Categorias/Carrera.jsp">Carreras</a></li>
                            <li><a href="../Categorias/Estrategia.jsp">Estrategias</a></li>
                        </ul>
                    </li>
                    <li><a href="../Cliente/Contacto.jsp">Contacto</a></li>
                    <li><a href="../Principal.jsp?cerrar=true">Salir</a></li>
                    <form action="../Cliente/Buscar_juego.jsp" method="post"> 
                        <input class="buscador" name="nombre" type="search" placeholder="Buscar videojuego..." id="Buscador" />
                    </form>
                </ul>
            </nav>

            <section class="textos-header">
                <h1><span class="animation">Los Mejores Top de Videojuegos</span></h1>
                <h2>en CatalinoGames</h2>
            </section>
            <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                            style="height: 100%; width: 100%;">
                <path d="M0.00,49.98 C150.00,150.00 349.20,-50.00 500.00,49.98 L500.00,150.00 L0.00,150.00 Z"
                      style="stroke: none; fill: #fff;"></path>
                </svg></div>


        </header>
    </body>
</html>
