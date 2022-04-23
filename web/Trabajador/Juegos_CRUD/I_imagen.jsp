

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
            <input type="file" name="file" size="50" onchange="previewImage(event)" />
            <br>
            <input type="submit" value="Subir Archivo" />
        </form>
        <img id="image-container" />
        <script>
            function previewImage(event) {
                /*        creating FileReader object to read the file */
                var reader = new FileReader();
                reader.onload = function () {
                    var imageContainer = document.getElementById('image-container');
                    imageContainer.src = reader.result;
                };
                /* Read the selected image as URL in base64 */
                reader.readAsDataURL(event.target.files[0]);
            }
        </script>
    </body>
</html>
