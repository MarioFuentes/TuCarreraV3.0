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
                <form name="BuscarEmpresa" method="POST" action="ModificarEmpresa.jsp">
                    <h3>Seleccionar Empresa</h3>
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>
                                <select name="NombreEmpresa">
                                   <%  
                                        Empresa emp= new Empresa();
                                          emp.getNITs();
                                           while(emp.rs.next())
                                            {
                                                out.println("<option value=\"" + emp.rs.getInt("NIT") + "\">" + emp.rs.getString("CompanyName") + "</option>");
                                            }
                                    %>                        
                                </select>
                            </td>
                            <td><input type="submit" name="Buscar" value="Buscar"></td>
                        </tr>
                    </table>
                </form>
                <%
                    if(request.getMethod().equals("POST"))
                    {
                        
                    }
                %>
                <form name="EliminarEmpresa" method="POST" action="Check/EliminarEmpresaCheck.jsp">
                    <h3>Eliminar Empresa</h3>
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>NIT:</td>
                            <td><input type="text" value="" name="NIT" placeholder="0123-010190-100-1" required pattern="\d{4}-\d{6}-\d{3}-\d{1}" readonly/></td>
                        </tr>
                        <tr>
                            <td>Nombre de la empresa:</td>
                            <td><input type="text" value="" name="CompanyName" required length="25" size="25"/></td>
                        </tr>
                        <tr>
                            <td>Email de contacto:</td>
                            <td><input type="email" value="" name="Email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" placeholder="ejemplo@ejemplo.com" required length="30" size="30"/></td>
                        </tr>
                        <tr>
                            <td>Direccion:</td>
                            <td><textarea name="Address" required length="50"></textarea>
                               <!-- <input type="text" value="" name="Address" required lenght="50"/>                            <!-- <input type="text" value="" name="Address" required lenght="50"/></td> -->
                            </td>
                        </tr>
                        <tr>
                            <td>Telefono:</td>
                            <td><input type="text" value="" name="Phone" pattern="\d{4}-\d{4}" placeholder="1234-5678" required/></td>
                        </tr>
                        <tr>
                            <td>Ciudad:</td>
                            <td><input type="text" value="" name="City" required/></td>
                        </tr>
                        <tr>
                            <td>Departamento:</td>
                            <td>
                                <Select name="Department">
                                    <option value="San Salvador">San Salvador</option>
                                    <option value="San Miguel">San Miguel</option>
                                    <option value="San Vicente">San Vicente</option>
                                    <option value="Santa Ana">Santa Ana</option>
                                    <option value="Ahuachapan">Ahuachapan</option>
                                    <option value="La Union">La Union</option>
                                    <option value="La Libertad">La Libertad</option>
                                    <option value="Sonsonate">Sonsonate</option>
                                    <option value="Cabanas">Cabanas</option>
                                    <option value="Morazan">Morazan</option>
                                    <option value="La Paz">La Paz</option>
                                    <option value="Usulutan">Usulutan</option>
                                    <option value="Chalatenango">Chalatenango</option>
                                    <option value="Cuscatlan">Cuscatlan</option>
                                </Select>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Eliminar" name="Eliminar"/></td>
                            <td></td>
                        </tr>
                    </table>  
                </form>
            </div>
            <jsp:include page="Plantillas/Pagina2.html"/>		    
    </body>
</html>

