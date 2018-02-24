<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="tp" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="func" uri="http://java.sun.com/jsp/jstl/functions" %>

<tp:table_dark>
    <jsp:attribute name="header">
        <th scope="col">#</th>
        <th scope="col">CPF</th>
        <th scope="col">Nome</th>
        <th scope="col">Sobrenome</th>
    </jsp:attribute>

    <jsp:attribute name="content">
        <c:choose>
            <c:when test="${func:length(clientes) gt 0}">
                <c:forEach items="${clientes}" var="cliente">
                    <th scope="row">${cliente.id}</th>
                    <td>${cliente.cpf}</td>
                    <td>${cliente.nome}</td>
                    <td>${cliente.sobrenome}</td>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <th scope="row">-</th>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </c:otherwise>
        </c:choose>
    </jsp:attribute>

</tp:table_dark>