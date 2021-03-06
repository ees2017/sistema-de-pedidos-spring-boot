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
        <th></th>
        <th></th>
    </jsp:attribute>

    <jsp:attribute name="content">
        <c:choose>
            <c:when test="${func:length(clientes) gt 0}">
                <c:forEach var="cliente" items="${clientes}">
                    <tr id="cliente-${cliente.id}">
                        <th scope="row">${cliente.id}</th>
                        <td><c:if test="${func:length(cliente.cpf) < 1}"> - </c:if>${cliente.cpf}</td>
                        <td><c:if test="${func:length(cliente.nome) < 1}"> - </c:if>${cliente.nome}</td>
                        <td><c:if test="${func:length(cliente.sobrenome) < 1}"> - </c:if>${cliente.sobrenome}</td>
                        <td class="text-center">
                            <a class="js-btn-delete-cliente text-danger"
                               href="#"
                                data-cliente-id="${cliente.id}"
                                data-cliente-cpf="${cliente.cpf}"
                                data-cliente-nome="${cliente.nome}"
                                data-cliente-sobrenome="${cliente.sobrenome}">
                                <span data-feather="trash-2"></span>
                            </a>
                        </td>
                        <td class="text-center">
                            <a class="js-btn-edit-cliente text-info"
                               href="/cliente/${cliente.id}"><span data-feather="edit"></span></a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <th scope="row">-</th>
                <td> - </td>
                <td> - </td>
                <td> - </td>
            </c:otherwise>
        </c:choose>
    </jsp:attribute>

</tp:table_dark>