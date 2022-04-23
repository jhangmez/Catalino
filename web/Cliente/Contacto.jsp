<%-- 
    Document   : Contacto
    Created on : 02/04/2022, 07:56:34 PM
    Author     : Airth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="js/jquery-3.6.0.min.js" type="text/javascript"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Estilos/Clientes/Contacto.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800&display=swap" rel="stylesheet">
        <title>CONTACTO</title>
    </head>
    <script>
        $(document).ready(function () {
            $('.menuContainer').load('../ContenedorMenu.jsp');
        });
    </script>
    <body>
        <div class="menuContainer"></div>
        <div class="form_con">
            <div class="contact_form"> 
                <div class="formulario"> 
                    <h2>Reclamos o Contactanos!!</h2>
                    <br>
                    <h3>Escríbenos y en breve nos pondremos en contacto contigo</h3>
                    <form action="Enviar_datos_correo.jsp" method="post">       
                        <p>
                            <label for="nombre" class="colocar_nombre">Usuario
                                <span class="obligatorio">*</span>
                            </label>
                            <input type="text" name="nombre" id="nombre" required="obligatorio" placeholder="Escribe tu nombre">
                        </p>

                        <p>
                            <label for="email" class="colocar_email">Email
                                <span class="obligatorio">*</span>
                            </label>
                            <input type="email" name="de" id="de" required="obligatorio" placeholder="Escribe tu Email">
                        </p>

                        <p>
                            <label for="email" class="colocar_email">Contraseña
                                <span class="obligatorio">*</span>
                            </label>
                            <input type="password" name="clave" id="clave" required="obligatorio" placeholder="Escribe tu contraseña de email">
                        </p>
   
                        <p>
                            <label for="asunto" class="colocar_asunto">Asunto
                                <span class="obligatorio">*</span>
                            </label>
                            <input type="text" name="asunto" id="asunto" required="obligatorio" placeholder="Escribe un asunto">
                        </p>   

                        <p>
                            <label for="mensaje" class="colocar_mensaje">Mensaje
                                <span class="obligatorio">*</span>
                            </label>                     
                            <textarea name="mensaje" class="texto_mensaje" id="mensaje" required="obligatorio" placeholder="Deja aquí tu comentario..."></textarea> 
                        </p>   

                        <button type="submit" name="enviar_formulario" id="enviar"><p>Enviar</p></button>
                        <p class="aviso">
                            <span class="obligatorio"> * </span>los campos son obligatorios.<br>
                            <span class="obligatorio"> * </span>Para enviar el correo, debe hacerlo con su correo y contraseña de gmail.
                        </p>  

                    </form>
                </div> 
            </div>  
        </div>
        
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
