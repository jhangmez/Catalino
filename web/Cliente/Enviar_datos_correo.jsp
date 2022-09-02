<%-- 
    Document   : Enviar_datos_correo
    Created on : 03/04/2022, 02:45:52 PM
    Author     : Airth
--%>

<%@page import="Email.Mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        Mail mail = new Mail();
          
        String host = "smtp.gmail.com";
        String port = "587";
        String de = request.getParameter("de");
        String clave = request.getParameter("clave");
        
        String[] para = {"elvisenequech@gmail.com","achanamef@unprg.edu.pe","jgomezpad@unprg.edu.pe","fgonzalesesq@unprg.edu.pe"};
        String asunto = request.getParameter("asunto");
        String mensaje = request.getParameter("mensaje");
        
        boolean mandar = mail.enviarCorreo(host, port, de, clave, para, asunto, mensaje);
        
      
            if(mandar){
                out.print("CORREO ELECTRONICO CORRECTAMENTE ENVIADO....."+"\n\n"+"<a href='Menu_cliente.jsp'>VOLVER AL INDEX</a>");
            }else{
                out.print("CORREO ELECTRONICO NO ENVIADO....."+"\n\n"+"<a href='Menu_cliente.jsp'>VOLVER AL INDEX</a>"); 
            }
                %>
    </body>
</html>
