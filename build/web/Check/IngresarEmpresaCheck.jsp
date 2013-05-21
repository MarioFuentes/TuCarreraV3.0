<%@page import="Clases.Empresa"%>

<%
    if(request.getMethod().equals("POST"))
    {
    String NIT = request.getParameter("NIT");
    String CompanyName = request.getParameter("CompanyName");
    String Email = request.getParameter("Email");
    String Address = request.getParameter("Address");
    String Phone = request.getParameter("Phone");
    String City = request.getParameter("City");
    String Department = request.getParameter("Department");
    
    Empresa emp = new Empresa(NIT, CompanyName, Email, Address, Phone, City, Department);
    out.println(emp.estado);
    int filas = emp.agregarEmpresa();
    
    if(filas > 0)
    {
        %>
        <jsp:forward page="../PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Empresa ingresada exitosamente."></jsp:param>
        </jsp:forward>
        <%
    }
    else
    {
        %>
        <jsp:forward page="../PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Hubo un error al tratar de ingresar la empresa."></jsp:param>
        </jsp:forward>
        <%
    }
    
    emp.desconectar();
    }
%>
