<%@page import="Clases.Trabajador"%>
<%@page import="Clases.Grado"%>
<%@page import="Clases.Posicion"%>
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
                <form name="BuscarTrabajador" method="POST" action="ModificarTrabajador.jsp">
                    <h3>Seleccionar Trabajador</h3>
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>
                                <select name="NombreTrabajador">
                                   <%  
                                        Trabajador tra= new Trabajador();
                                          tra.getTrabajadores();
                                           while(tra.rs.next())
                                            {
                                                out.println("<option value=\"" + tra.rs.getInt("DUI") + "\">" + tra.rs.getString("FirstName")+" , "+ tra.rs.getString("LastName") + "</option>");
                                            }
                                    %>                        
                                </select>
                            </td>
                            <td><input type="submit" name="Buscar" value="Buscar"></td>
                        </tr>
                    </table>
                </form>
                <form name="ModificarTrabajador" method="POST" action="Check/ModificarTrabajadorCheck.jsp">
                <h3>Modificar Trabajador (JobSeeker)</h3>
                <table cellspacing="5" cellpadding="5">
                    <tr>
                        <td>DUI:</td>
                        <td><input type="text" value="" name="DUI" required pattern="\d{8}-\d{1}" size="10" readonly placeholder="01234567-1" readonly/></td>
                    </tr>
                    <tr>
                        <td>Nombres:</td>
                        <td><input type="text" value="" name="FirstName" required size="20"/></td>
                    </tr>
                    <tr>
                        <td>Apellidos:</td>
                        <td><input type="text" value="" name="LastName" required size="20"/></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="email" value="" name="Email" required pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" size="30" placeholder="ejemplo@ejemplo.com"/></td>
                    </tr>
                    <tr>
                        <td>Direccion:</td>
                        <td><!-- <input type="text" value="" name="Address" required size="50"/></td> -->
                    <textarea name="Address" required maxlength="50"></textarea>
                    </tr>
                    <tr>
                        <td>Telefono:</td>
                        <td><input type="text" value="" name="Phone" required pattern="\d{4}-\d{4}" placeholder="1234-5678"/></td>
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
                        <td>Genero:</td>
                        <td>
                            <Select name="Gender">
                                <option value="Femenino">Femenino</option>
                                <option value="Masculino">Masculino</option>
                            </select>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>Fecha de nacimiento:</td>
                        <td><input type="text" placeholder="dd/mm/aaaa" name="Birthdate" pattern="\d{1,2}/\d{1,2}/\d{4}"/></td>
                    </tr>
                    <tr>
                        <td>Grado de estudio:</td>
                        <td>
                            <Select name="IdDegree_fk">
                                <% Grado grad = new Grado();
                                    grad.getGrados();
                                    while(grad.rs.next())
                                    {
                                        out.println("<option value=\"" + grad.rs.getInt("IdDegree") + "\">" + grad.rs.getString("DegreeName") + "</option>");
                                    }
                                %>
                            </select>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>Universidad:</td>
                        <td><input type="text" value="" name="University" required/></td>
                    </tr>
                    <tr>
                        <td>Campo de especializacion:</td>
                        <td><input type="text" value="" name="SpecializationField" required/></td>
                    </tr>
                    <tr>
                        <td>Posicion de trabajo:</td>
                        <td>
                            <Select name="IdPosition_fk">
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
                        <td><input type="submit" value="Modificar" name="Modificar"/></td>
                        <td></td>
                    </tr>
                </table>  
            </form>
            </div>
            <jsp:include page="Plantillas/Pagina2.html"/>		    

    </body>
</html>