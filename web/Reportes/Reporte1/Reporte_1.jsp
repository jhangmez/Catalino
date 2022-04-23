<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>

<%
    String USERNAME = "root";
    String PASSWORD = "kamis.26";
    String HOST = "localhost";
    String PORT = "3306";
    String DATABASE = "catalino_mejorado";
    String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + "?serverTimezone=UTC";

    Connection con = null;

    try {
        Class.forName(CLASSNAME);
        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        if (con != null) {
            out.println("conexión con éxito....");
        }
    } catch (ClassNotFoundException e) {
        System.err.println("Error 1: " + e);
    } catch (SQLException e) {
        System.err.println("Error 2: " + e);
    }


    File reportFile = new File(application.getRealPath("//Reportes/Reporte1/Reporte-CatalinoWeb-Juegos_1.jasper"));
    Map parametros = new HashMap();

    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, con);
    response.setContentType("application/pdf");
    response.setContentLength(bytes.length);

    ServletOutputStream output = response.getOutputStream();
    response.getOutputStream();
    output.write(bytes, 0, bytes.length);
    output.flush();
    output.close();
%>