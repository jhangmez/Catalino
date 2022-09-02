<%-- 
    Document   : Sugerencia_img
    Created on : 21/04/2022, 11:39:45 PM
    Author     : Airth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a>SUBIR ARCHIVO</a><br>
        Seleccionar Archivos: <br>
        <form action="sugerencia_img_proc.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="file" size="50" />
            <br>
            <input type="submit" value="Subir Archivo" />
        </form>
    </body>
</html>
