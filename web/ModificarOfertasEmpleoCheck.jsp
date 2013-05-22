<%@page import="Clases.Ofertas"%>
<%
    int IdJobOffer = Integer.parseInt(request.getParameter("IdJobOffer"));
    int IdPosition_fk = Integer.parseInt(request.getParameter("IdPosition_fk"));
    int ExperienceYears = Integer.parseInt(request.getParameter("ExperienceYears"));
    String Specialization = request.getParameter("Specialization");
    String Qualifications = request.getParameter("Qualifications");
    
    Ofertas of = new Ofertas();
    int filas = of.actualizarOferta(IdPosition_fk, ExperienceYears, Specialization, Qualifications, IdJobOffer);
    
    if(filas > 0)
    {
        %>
        <jsp:forward page="PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Oferta de empleo actualizada exitosamente."></jsp:param>
        </jsp:forward>
        <%
    }
    else
    {
        %>
        <jsp:forward page="PanelAdministrativo.jsp">
            <jsp:param name="mensaje" value="Hubo un error al tratar de actualizar la oferta de empleo."></jsp:param>
        </jsp:forward>
        <%
    }
    
    of.desconectar();
    
%>
