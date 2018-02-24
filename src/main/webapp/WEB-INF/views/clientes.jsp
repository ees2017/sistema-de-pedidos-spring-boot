<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tp" tagdir="/WEB-INF/tags" %>

<tp:base>
    <jsp:attribute name="title">
        Sistema de Pedidos
    </jsp:attribute>
    <jsp:attribute name="subtitle">
        Consulta Clientes
    </jsp:attribute>

    <jsp:attribute name="body">
        <jsp:include page="fragments/cliente/formulario.jsp"/>
        <jsp:include page="fragments/cliente/tabela.jsp"/>
    </jsp:attribute>
</tp:base>