<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="func" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="tp" tagdir="/WEB-INF/tags" %>

<tp:base>
    <jsp:attribute name="title">
        Sistema de Pedidos
    </jsp:attribute>
    <jsp:attribute name="subtitle">
        Consulta Clientes
    </jsp:attribute>


    <jsp:attribute name="btnToolbar">
        <div class="btn-group mr-2">
            <a href="/cliente" class="btn btn-sm btn-outline-primary">Adicionar Cliente</a>
        </div>
    </jsp:attribute>

    <jsp:attribute name="body">
    <c:if test="${clientes == null}">
        <jsp:include page="fragments/cliente/formulario.jsp"/>
    </c:if>


    <c:if test="${clientes != null}">

            <jsp:include page="fragments/cliente/tabela.jsp"/>

    </c:if>
    </jsp:attribute>

</tp:base>