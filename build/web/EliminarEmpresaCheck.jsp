<%@page import="Clases.Empresa"%>

<%
    if(request.getMethod().equals("POST"))
    {
    String NIT = request.getParameter("NIT");
    
    //Empresa emp = new Empresa(NIT, CompanyName, Email, Address, Phone, City, Department);
        Empresa emp = new Empresa();
        
      int filas = emp.borrarEmpresa(NIT);
    //int filas = emp.agregarEmpresa();
    
    if(filas > 0)
    {
        %>
        <jsp:forward page="PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Empresa borrada exitosamente."></jsp:param>
        </jsp:forward>
        <%
    }
    else
    {
        %>
        <jsp:forward page="PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Hubo un error al borrar la empresa"></jsp:param>
        </jsp:forward>
        <%
    }
    
    emp.desconectar();
    }
%>