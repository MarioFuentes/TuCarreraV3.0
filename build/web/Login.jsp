<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tu Carrera SV de CV</title>
        <link href="CSS/Default.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
            <jsp:include page="Plantillas/Pagina1.html"/>  
            <div id="content">
                <form name="IniciarSesion" method="POST" action="Check/LoginCheck.jsp">
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>Usuario:</td>
                            <td><input type="text" value="" name="Usuario"/></td>
                        </tr>
                        <tr>
                            <td>Contraseña:</td>
                            <td><input type="password" value="" name="Contrasenia"/></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Iniciar Sesion" name="Iniciar"/></td>
                            <td></td>
                        </tr>
                    </table>
                </form>
            </div>
            <jsp:include page="Plantillas/Pagina2.html"/>		    
    </body>
</html>
