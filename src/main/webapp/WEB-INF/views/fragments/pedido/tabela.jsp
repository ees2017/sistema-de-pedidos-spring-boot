<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="tp" tagdir="/WEB-INF/tags" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="func" uri="http://java.sun.com/jsp/jstl/functions" %>

<tp:table_dark>
    <jsp:attribute name="header">
        <th scope="col">#</th>
        <th scope="col">Data</th>
        <th scope="col">Cliente</th>
        <th scope="col"></th>
        <td></td>
        <td></td>
    </jsp:attribute>

    <jsp:attribute name="content">
        <c:choose>
            <c:when test="${func:length(pedidos) gt 0}">
                <c:forEach var="index" begin="0" end="${func:length(pedidos) - 1 }">
                    <tr id="pedido-${pedidos[index].id}">
                        <th scope="row">
                            <a href="<c:url value="/pedido/${pedidos[index].id}/itens/" />">
                                <span data-feather="maximize-2"></span></a>
                                ${pedidos[index].id}
                        </th>
                        <td>${pedidos[index].dataPedido}</td>
                        <td>
                            <c:choose>
                                <c:when test="${pedidos[index].cliente != null}">
                                    [${pedidos[index].cliente.cpf}] - ${pedidos[index].cliente.nome} ${pedidos[index].cliente.sobrenome}
                                </c:when>
                                <c:otherwise>
                                    -
                                </c:otherwise>
                            </c:choose>
                        </td>


                        <td class="text-center">
                            <a class="js-btn-delete-pedido text-danger"
                               data-pedido-id="${pedidos[index].id}"
                               data-pedido-data="${pedidos[index].dataPedido}"
                               data-pedido-cliente-id="${pedidos[index].cliente.id}"
                               data-pedido-cliente-cpf="${pedidos[index].cliente.cpf}"
                               data-pedido-cliente-nome="${pedidos[index].cliente.nome}"
                               data-pedido-cliente-sobrenome="${pedidos[index].cliente.sobrenome}"

                               href="#"><span data-feather="trash-2"></span></a>
                        </td>
                        <td class="text-center">
                            <a class="js-btn-edit-pedido text-info"
                               href="/pedido/${pedidos[index].id}"><span data-feather="edit"></span></a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <th scope="row"> - #</th>
                <td> - </td>
            </c:otherwise>
        </c:choose>
    </jsp:attribute>

</tp:table_dark>