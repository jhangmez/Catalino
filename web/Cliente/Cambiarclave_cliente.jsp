<%-- 
    Document   : Cambiarclave_cliente
    Created on : 05/04/2022, 12:50:31 PM
    Author     : Airth
--%>

<%@page import="Bean.B_cliente"%>
<%@page import="Dao.D_cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../Estilos/Clientes/Cambiarclave_cliente.css" rel="stylesheet" type="text/css"/>
        <title>CAMBIAR CLAVE</title>
    </head>
    <body>
        <div id="contenedor">

            <div id="contenedorcentrado">
                <div id="login">
                    <form action="Cambiarclave_cliente.jsp" method="post" id="loginform">
                        <label for="usuario">Usuario</label>
                        <input id="usuario" type="text" name="usuario" placeholder="Ingrese su nick" required>
                        <label for="correo">Correo</label>
                        <input id="correo" type="text" name="correo" placeholder="Ingrese su correo" required="">
                        <label for="password">Nueva Contraseña</label>
                        <input id="contra" type="password" placeholder="Ingrese su nueva contraseña" name="contra" required>
                        <button type="submit" title="Ingresar" name="Ingresar">ACTUALIZAR</button>
                        <input type="hidden" name="pagina" id="pagina" value="5">
                    </form>

                </div>
                <div id="derecho">
                    <div class="titulo">
                         MODIFICAR SU CONTRASEÑA
                    </div>
                    <hr>
                    <div class="pie-form">
                        <a href="Registrar_Cliente.jsp">¿No tienes Cuenta? Registrate</a>
                        <hr>
                        <a href="Login_Cliente.jsp">« Volver</a>
                    </div>
                </div>
            </div>
        </div>
        
        <%
                String nick, correo, clave, pag;
                nick = request.getParameter("usuario");
                correo = request.getParameter("correo");
                clave = request.getParameter("contra");
                pag = request.getParameter("pagina");
               if (pag != null) {
                D_cliente obj1 = new D_cliente();
                B_cliente bu = new B_cliente();
                bu.setNick(nick);
                bu.setCorreo(correo);
                bu.setClave(clave);

                obj1.CambiarContraCliente(nick,clave,correo);
                response.sendRedirect("Mensaje_Clave.jsp");
            }
            %>  
    </body>
    </body>
</html>
