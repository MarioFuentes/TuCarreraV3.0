<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tu Carrera SV de CV</title>
        <link href="CSS/Default.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form>
            <jsp:include page="Plantillas/Pagina1.html"/>  
            <div id="content">
                <%
                    if(request.getParameter("mensaje") != null)
                    {
                        out.println(request.getParameter("mensaje"));
                    }
                    %>
                <h3 class="title">Tareas administrativas</h3>
                <div class="entry">
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>Ingresar Empresa</td>
                            <td><a href="IngresarEmpresa.jsp">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Ingresar Trabajador</td>
                            <td><a href="IngresarTrabajador.jsp">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Ingresar Oferta de trabajo</td>
                            <td><a href="IngresarOfertasEmpleo.jsp">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Buscar Oferta de trabajo</td>
                            <td><a href="#">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Modificar Empresa</td>
                            <td><a href="ModificarEmpresa.jsp">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Modificar Trabajador</td>
                            <td><a href="ModificarTrabajador.jsp">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Modificar Oferta de trabajo</td>
                            <td><a href="ModificarOfertasEmpleo.jsp">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Eliminar Empresa</td>
                            <td><a href="EliminarEmpresa.jsp">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Eliminar Trabajador</td>
                            <td><a href="EliminarTrabajador.jsp">Click aqui...</a></td>
                        </tr>
                        <tr>
                            <td>Eliminar Oferta de trabajo</td>
                            <td><a href="EliminarOfertasEmpleo.jsp">Click aqui...</a></td>
                        </tr>
                    </table>
                </div>
            </div>
            <jsp:include page="Plantillas/Pagina2.html"/>		    
        </form>
    </body>
</html>
