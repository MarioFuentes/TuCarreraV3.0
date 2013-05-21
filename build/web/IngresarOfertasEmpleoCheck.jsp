<%@page import="Clases.Ofertas"%>
<%@page import="Clases.Empresa"%>

<%
    if(request.getMethod().equals("POST"))
    {
    String NIT_fk = request.getParameter("NIT");
    int IdPosition_fk = Integer.parseInt(request.getParameter("IdPosition_fk"));
    int ExperienceYears = Integer.parseInt(request.getParameter("ExperienceYears"));
    String Specialization = request.getParameter("Specialization");
    String Qualifications = request.getParameter("Qualifications");
    
    Ofertas of = new Ofertas(NIT_fk, IdPosition_fk, ExperienceYears, Specialization, Qualifications);

    int filas = of.agregarOferta();
    
    if(filas > 0)
    {

        %>
        <jsp:forward page="PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Oferta ingresada exitosamente."></jsp:param>
        </jsp:forward>
        <%
    }
    else
    {
        %>
        <jsp:forward page="PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Hubo un error al tratar de ingresar la oferta."></jsp:param>
        </jsp:forward>
        <%
    }
    
    of.desconectar();
    } 
%>