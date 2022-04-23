<%-- 
    Document   : sugerencia_img_proc
    Created on : 21/04/2022, 11:41:12 PM
    Author     : Airth
--%>

<%@page import="java.nio.ByteBuffer"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Bean.B_imagen"%>
<%@page import="Dao.D_imagen"%>
<%@page import="java.io.File"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.output.*" %>
<%@page import="javax.xml.bind.DatatypeConverter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File file;
            int maxFileSize = 5000 * 1024;
            int maxMemSize = 5000 * 1024;
            String filePath = "%temp%";
            //String archivo = request.getParameter("file");
            //JOptionPane.showMessageDialog(null, archivo);
            String nombre;

            String contentType = request.getContentType();
            if ((contentType.indexOf("multipart/form-data") >= 0)) {

                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(maxMemSize);
                factory.setRepository(new File("c:\\temp"));

                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(maxFileSize);
                try {
                    List fileItems = upload.parseRequest(request);
                    Iterator i = fileItems.iterator();
                    while (i.hasNext()) {

                        FileItem fi = (FileItem) i.next();
                        if (!fi.isFormField()) {
                            String fieldName = fi.getFieldName();
                            String fileName = fi.getName();
                            boolean isInMemory = fi.isInMemory();
                            long sizeInBytes = fi.getSize();
                         
                            if (fileName.lastIndexOf("\\") >= 0) {
                                file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\")));
                            } else {
                                file = new File(filePath + fileName.substring(fileName.lastIndexOf("\\") + 1));
                            }

                            fi.write(file);//Aca sube el archivo a la ruta especifcada arriba
                            
                            //despues de esto va hacer que el archivo se transforme en bytes
                            String encodedBase64 = null;
                            FileInputStream fin = new FileInputStream(file);
                            FileInputStream fin1 = new FileInputStream(file);
                            // Construye un buffer para guardar datos
                            ByteBuffer nbf = ByteBuffer.allocate((int) file.length());
                            byte[] array = new byte[1024];
                            byte[] array1 = new byte[(int)file.length()];
                            fin1.read(array1);
                            encodedBase64 = new String(DatatypeConverter.printBase64Binary(array1));
                            
                            
                            int offset = 0, length = 0;
                            // Leer y guardar datos
                            while ((length = fin.read(array)) > 0) {
                                if (length != 1024) {
                                    nbf.put(array, 0, length);
                                } else {
                                    nbf.put(array);
                                }
                                offset += length;
                            }
                            // Crea una nueva matriz para guardar el contenido que se va a escribir
                            byte[] content = nbf.array();

                            D_imagen obj6 = new D_imagen();
                            D_imagen obj7 = new D_imagen();
                            B_imagen ba = new B_imagen();

                            int total = obj7.ContarArchivos();
                            int codigo = total + 1;

                            ba.setCodigo_archivo(codigo);
                            ba.setNombre_archivo(fileName);
                            ba.setArchivo(content);
                            ba.setBase64(encodedBase64);
                            obj6.InsertarArchivos(ba);

                            out.print(file.getName() + "<br>/////<br>");
                            out.println("Nombre de la ruta subida: " + filePath + "<br>/////<br>");
                            out.print("Nombre del archivo subido: " + fileName + "<br>/////<br>---<br>");

                            //DAO_Archivos obj2 = new DAO_Archivos();
                            //Beans_Archivos baa = new Beans_Archivos();
                            //baa.setNombre_archivo(fileName);
                            //obj2.InsertarArchivos_N(baa);
                            %><br>El codigo de la imagen es: <%out.print(codigo);
                        }

                    }
                } catch (Exception ex) {
                    out.println(ex);
                }
            } else {
                out.println("Error en la subida.");

            }
            //out.print(""+nombre);

            response.sendRedirect("cerradoautomatico.jsp");

        %>
        <br>
        <a href="Sugerencia.jsp">Volver a la tabla</a><br>
        

    </body>
    </body>