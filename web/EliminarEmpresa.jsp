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
                <form name="BuscarEmpresa" method="POST" action="EliminarEmpresa.jsp">
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
                                                out.println("<option value=\"" + emp.rs.getString("NIT") + "\">" + emp.rs.getString("CompanyName") + "</option>");
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
                        Empresa emp1 = new Empresa();
                        emp1.getAllfields(request.getParameter("NombreEmpresa"));
                        emp1.rs.next();
                        
                        String NIT = emp1.rs.getString("NIT");
                        String CompanyName = emp1.rs.getString("CompanyName");
                        String Email = emp1.rs.getString("Email");
                        String Address = emp1.rs.getString("Address");
                        String Phone = emp1.rs.getString("Phone");
                        String City = emp1.rs.getString("City");
                        String Department = emp1.rs.getString("Department");
                        
                    
                %>
                <form name="ModificarEmpresa" method="POST" action="EliminarEmpresaCheck.jsp">
                    <h3>Eliminar Empresa</h3>
                    <table cellspacing="5" cellpadding="5">
                        <tr>
                            <td>NIT:</td>
                            <td><input type="text" value="<%=NIT%>" name="NIT" placeholder="0123-010190-100-1" required pattern="\d{4}-\d{6}-\d{3}-\d{1}" readonly/></td>
                        </tr>
                        <tr>
                            <td>Nombre de la empresa:</td>
                            <td><input type="text" value="<%=CompanyName%>" name="CompanyName" required length="25" size="25"/></td>
                        </tr>
                        <tr>
                            <td>Email de contacto:</td>
                            <td><input type="email" value="<%=Email%>" name="Email" pattern="[^@]+@[^@]+\.[a-zA-Z]{2,6}" placeholder="ejemplo@ejemplo.com" required length="30" size="30"/></td>
                        </tr>
                        <tr>
                            <td>Direccion:</td>
                            <td><textarea name="Address" required length="50" value=""><%=Address%> </textarea>
                               <!-- <input type="text" value="" name="Address" required lenght="50"/>                            <!-- <input type="text" value="" name="Address" required lenght="50"/></td> -->
                            </td>
                        </tr>
                        <tr>
                            <td>Telefono:</td>
                            <td><input type="text" value="<%=Phone%>" name="Phone" pattern="\d{4}-\d{4}" placeholder="1234-5678" required/></td>
                        </tr>
                        <tr>
                            <td>Ciudad:</td>
                            <td><input type="text" value="<%=City%>" name="City" required/></td>
                        </tr>
                       
                        <tr>
                            <td>Departamento:</td>
                            <td>
                                <Select name="Department" id="prueba">
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
                                <script>
                                    var val = "<%=Department%>", prueba = document.getElementById('prueba');
                                    for(var i, j = 0; i = prueba.options[j]; j++) 
                                    {
                                        if(i.value == val) 
                                        {
                                            prueba.selectedIndex = j;
                                            break;
                                        }
                                    }
                                </script>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Eliminar" name="Eliminar"/></td>
                            <td></td>
                        </tr>
                        <% } %>
                    </table>  
                </form>
            </div>
            <jsp:include page="Plantillas/Pagina2.html"/>		    
    </body>
</html>
