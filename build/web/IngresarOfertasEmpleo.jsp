<%@page import="Clases.Posicion"%>
<%@page import="Clases.Empresa"%>
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
                <h3>Ingresar Oferta de Empleo</h3>
                <form name="IngresarOfertasEmpleo" method="POST" action="IngresarOfertasEmpleoCheck.jsp">
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>NIT:</td>
                            <td>
                                <select name="NIT">
                                   <%  
                                        Empresa emp= new Empresa();
                                          emp.getNITs();
                                           while(emp.rs.next())
                                            {
                                                out.println("<option value=\"" + emp.rs.getString("NIT") + "\">" + emp.rs.getString("CompanyName") + "</option>");
                                            }
                                    %>                        
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Posicion de trabajo:</td>
                            <td>
                                <Select name="IdPosition_fk" required>
                                     <%
                                        Posicion pos = new Posicion();
                                        pos.getPosiciones();
                                        while(pos.rs.next())
                                        {
                                            out.println("<option value=\"" + pos.rs.getInt("IdPosition") + "\">" + pos.rs.getString("PositionName") + "</option>");
                                        }
                                        %>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Años de experiencia:</td>
                            <td><input type="text" value="" name="ExperienceYears" pattern="\d{1,2}" required/></td>
                        </tr>
                        <tr>
                            <td>Especializacion:</td>
                            <td><input type="text" value="" name="Specialization" required/></td>
                        </tr>
                        <tr>
                            <td>Cualidades:</td>
                            <td><input type="text" value="" name="Qualifications" required=""/></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Ingresar" name="Ingresar"/></td>
                        </tr>
                        
                    </table>
                </form>
                <br><br><br>
            </div>
            <jsp:include page="Plantillas/Pagina2.html"/>		    
        
    </body>
</html>

