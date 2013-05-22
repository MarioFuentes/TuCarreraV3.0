<%@page import="Clases.Posicion"%>
<%@page import="Clases.Empresa"%>
<%@page import="Clases.Ofertas"%>
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
                <h3>Seleccionar Oferta de Empleo</h3>
                <form name="BuscarOfertasEmpleo" method="POST" action="EliminarOfertasEmpleo.jsp">
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>
                                <select name="OfertaEmpleo">
                                   <%  
                                        Ofertas Of= new Ofertas();
                                          Of.getOfertas();
                                           while(Of.rs.next())
                                            {
                                                out.println("<option value=\"" + Of.rs.getInt("IdJoboffer") + "\">" + Of.rs.getString("CompanyName")+" , "+ Of.rs.getString("PositionName")+ "</option>");
                                            }
                                   %>                        
                                </select>
                            </td>
                            <td><input type="submit" name="Buscar" value="Buscar"></td>
                        </tr>
                    </table>
                </form>
                                   <% if(request.getMethod().equals("POST"))
                                   {
                                       Ofertas of = new Ofertas();
                                       of.getOferta(Integer.parseInt(request.getParameter("OfertaEmpleo")));
                                       of.rs.next();
                                       
                                       String NIT = of.rs.getString("NIT_fk");
                                       int IdPosition_fk = of.rs.getInt("IdPosition_fk");
                                       String ExperienceYears = of.rs.getString("ExperienceYears");
                                       String Specialization = of.rs.getString("Specialization");
                                       String Qualifications = of.rs.getString("Qualifications");
                                   
                                       of.getPosition(IdPosition_fk);
                                       of.rs.next();
                                       String PositionName = of.rs.getString("PositionName");
                                   %>
                <br>
                <h3>Eliminar Oferta de Empleo</h3>
                <form name="EliminarOfertasEmpleo" method="POST" action="Check/EliminarOfertasEmpleoCheck.jsp">
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>NIT:</td>
                            <td>
                                <input type="text" name="NIT" value="<%=NIT%>">
                            </td>
                        </tr>
                        <tr>
                            <td>Posicion de trabajo:</td>
                            <td>
                                <input type="text" name="Posicion" value="<%=PositionName%>">
                            </td>
                        </tr>
                        <tr>
                            <td>Años de experiencia:</td>
                            <td><input type="text" value="<%=ExperienceYears%>" name="ExperienceYears" pattern="\d{1,2}" required/></td>
                        </tr>
                        <tr>
                            <td>Especializacion:</td>
                            <td><input type="text" value="<%=Specialization%>" name="Specialization"/></td>
                        </tr>
                        <tr>
                            <td>Cualidades:</td>
                            <td><input type="text" value="<%=Qualifications%>" name="Qualifications"/></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Eliminar" name="Eliminar"/></td>
                        </tr>
                        
                    </table>
                </form>
                <% } %>
                <br><br><br>
            </div>
            <jsp:include page="Plantillas/Pagina2.html"/>		    
        
    </body>
</html>
