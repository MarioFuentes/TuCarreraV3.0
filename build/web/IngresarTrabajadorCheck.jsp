<%@page import="Clases.Trabajador"%>
<%@page import="Clases.Empresa"%>

<%
    if(request.getMethod().equals("POST"))
    {
    String DUI = request.getParameter("DUI");
    String FirstName = request.getParameter("FirstName");
    String LastName = request.getParameter("LastName");
    String Email = request.getParameter("Email");
    String Address = request.getParameter("Address");
    String Phone = request.getParameter("Phone");
    String City = request.getParameter("City");
    String Department = request.getParameter("Department");
    String Gender = request.getParameter("Gender");
    String Birthdate = request.getParameter("Birthdate");
    int Degree = Integer.parseInt(request.getParameter("IdDegree_fk"));
    String University = request.getParameter("University");
    String SpecializationField = request.getParameter("SpecializationField");
    int Position = Integer.parseInt(request.getParameter("IdPosition_fk"));
    
    //Empresa emp = new Empresa(NIT, CompanyName, Email, Address, Phone, City, Department);
    Trabajador trab = new Trabajador(DUI, FirstName, LastName, Email, Address, Phone, City, Department, Gender, Birthdate, Degree, University, SpecializationField, Position);
      int filas = trab.agregarTrabajador();
    //int filas = emp.agregarEmpresa();
    
    if(filas > 0)
    {
        %>
        <jsp:forward page="PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="JobSeeker ingresado exitosamente."></jsp:param>
        </jsp:forward>
        <%
    }
    else
    {
        %>
        <jsp:forward page="PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Hubo un error al tratar de ingresar JobSeeker"></jsp:param>
        </jsp:forward>
        <%
    }
    
    trab.desconectar();
    }
%>