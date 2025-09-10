<%@ page contentType="text/html; charset=UTF-8" %>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login");
    } else {
        response.sendRedirect("home");
    }
%>
