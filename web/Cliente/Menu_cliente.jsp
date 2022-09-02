<%-- 
    Document   : Menu_cliente
    Created on : 02/04/2022, 10:55:14 PM
    Author     : Airth
--%>
<%@page import="org.apache.coyote.RequestGroupInfo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/Principal.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet">
        <title>MENU CLIENTE</title>
    </head>
    <body>
        <script>
                $(document).ready(function () {
                $('.menuContainer').load('../ContenedorMenu.jsp');
            });
        </script>
        <div class="menuContainer"></div>
        <main> 
            <h1 class="usuario">BIENVENIDO 
            <%
            HttpSession sesion = request.getSession();
            String u;
            String c;

            if(sesion.getAttribute("user")!=null){
                u=sesion.getAttribute("user").toString();
                out.print(u);
            }else{
                out.print("<script>location.replace('Login_Cliente.jsp');</script>");
            }
        %>
            </h1>
            <section class="contenedor sobre-nosotros">
                <h2 class="titulo">Acerca de</h2>
                <div class="contenedor-sobre-nosotros">
                    <img src="../Imagenes/Fondos/consola.svg" alt="" class="imagen-about-us">
                    <div class="contenido-textos">
                        <h3><span>1</span>Puntuación o Valoración</h3>
                        <p>Aquí encontrarás los mejores juegos de todos los tiempos, valorados según la opinión de los usuarios, 
                            de metacritic o de nuestra nuestra opinión.</p>
                        <h3><span>2</span>Los mejores productos</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt veniam eius aspernatur ad
                            consequuntur aperiam minima sed dicta odit numquam sapiente quam eum, architecto animi pariatur,
                            velit doloribus laboriosam ut.</p>
                    </div>
                </div>
            </section>
            <section class="portafolio">
                <div class="contenedor">
                    <h2 class="titulo">Recomendado Por Nosotros</h2>
                    <div class="galeria-port">
                        <div class="imagen-port">
                            <img src="../Imagenes/Galería/little.jpg" alt="">
                            <div class="hover-galeria">
                                <img src="../Imagenes/Icono/icono1.png" alt="">
                                <p>LITTLE NIGHTMARES</p>
                            </div>
                        </div>
                        <div class="imagen-port">
                             <img src="../Imagenes/Galería/god.jpg" alt="">
                            <div class="hover-galeria">
                                <img src="../Imagenes/Icono/icono1.png" alt="">
                                <p>GOD OF WAR</p>
                            </div>
                        </div>
                        <div class="imagen-port">
                            <img src="../Imagenes/Galería/ns4.jpg" alt="">
                            <div class="hover-galeria">
                                <img src="../Imagenes/Icono/icono1.png" alt="">
                                <p>NS:Ultimate Ninja STORM 4</p>
                            </div>
                        </div>
                        <div class="imagen-port">
                            <img src="../Imagenes/Galería/Rs4.jpg" alt="">
                            <div class="hover-galeria">
                                <img src="../Imagenes/Icono/icono1.png" alt="">
                                <p>RESIDENT EVIL 4</p>
                            </div>
                        </div>
                        <div class="imagen-port">
                            <img src="../Imagenes/Galería/val.jpg" alt="">
                            <div class="hover-galeria">
                                <img src="../Imagenes/Icono/icono1.png" alt="">
                                <p>VALORANT</p>
                            </div>
                        </div>
                        <div class="imagen-port">
                            <img src="../Imagenes/Galería/gen.jpg" alt="">
                            <div class="hover-galeria">
                                <img src="../Imagenes/Icono/icono1.png" alt="">
                                <p>GENSHI IMPACT</p>
                            </div>
                        </div>
                        <div class="imagen-port">
                            <img src="../Imagenes/Galería/Kf2.jfif" alt="">
                            <div class="hover-galeria">
                                <img src="../Imagenes/Icono/icono1.png" alt="">
                                <p>KILLING FLOOR 2</p>
                            </div>
                        </div>
                        <div class="imagen-port">
                            <img src="../Imagenes/Galería/Dg.jfif" alt="">
                            <div class="hover-galeria">
                                <img src="../Imagenes/Icono/icono1.png" alt="">
                                <p>DARKEST DUNGEON</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="clientes contenedor">
                <h2 class="titulo">Tops Más Destacados</h2>
                <div class="cards">
                    <div class="card">
                        <img src="../Imagenes/Galería/Top.jpg" alt="">
                        <div class="contenido-texto-card">
                            <h4>Top 5 con mayor descargas</h4>
                            <p>En este top destacan los juegos que se estrenaron para consolas como Ps4, Ps5 y Xbox.<br>
                                -Hitman 3<br>
                                -The Medium<br>
                                -Little Nightmares 2<br>
                                -Kena: Bridge of Spirits<br>
                                -Wario Ware: Get it together<br>
                            </p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="../Imagenes/Galería/Top_pc.jpg" alt="">
                        <div class="contenido-texto-card">
                            <h4>Top 5 para Pc</h4>
                            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Vitae, sapiente!</p>
                        </div>
                    </div>
                </div>
            </section>
            <section class="about-services">
                <div class="contenedor">
                    <h2 class="titulo">TAMBIÉN TE PUEDE INSTERESAR</h2>
                    <h3 class="titulo">Top 3 de juegos móviles</h3>
                    <div class="servicio-cont">
                        <div class="servicio-ind">
                            <img src="../Imagenes/Galería/pku.jfif" alt="">
                            <h3>POKEMON UNITE</h3>
                            <p>Únete a Entrenadores de todo el mundo para competir en 
                                los Combates Unite que se celebran en Æos. En este tipo
                                de contienda con altas dosis de estrategia, dos equipos
                                de cinco miembros.</p>
                        </div>
                        <div class="servicio-ind">
                            <img src="../Imagenes/Galería/cr.jpg" alt="">
                            <h3>CLASH ROYALE</h3>
                            <p>Es un juego de cartas en el que puedes ver en 
                                tiempo real cómo los personajes de tu baraja,
                                se enfrentan a las tropas de tu rival, a quien tendrás 
                                que derrotar derribando sus torres con tus mejores estrategias
                                de ataque y defensa.</p>
                        </div>
                        <div class="servicio-ind">
                            <img src="../Imagenes/Galería/jh.png" alt="">
                            <h3>SUBWAY SURFERS</h3>
                            <p>Pobre inspector. Se ha pasado años persiguiendo a Jake, 
                                Tricky y Fresh a través de innumerables túneles y millones
                                de trenes sufriendo una vida plagada de golpes y moretones. 
                                Lo intenta y lo intenta, pero lo cierto es que no hay forma 
                                de detener a estos surfistas del metro.</p>
                        </div>
                    </div>
                </div>
            </section>
        </main>
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
