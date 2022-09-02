

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUBIR ARCHIVO</title>
    </head>
    <body>
        <a>SUBIR ARCHIVO</a><br>
        Seleccionar Archivos: <br>
        <form action="I_imagen_proc.jsp" method="post" enctype="multipart/form-data">
            <input type="file" name="file" size="50" />
            <br>
            <input type="submit" value="Subir Archivo" />
        </form>
    </body>
</html>
