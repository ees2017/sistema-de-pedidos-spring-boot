<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="func" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="row">
    <div class="col">

        ${cliente.nome}
        <form id="cliente-form" action="/api/v1/clientes/" method="post">
            <input type="hidden" name="id" id="id"
                    data-value="<c:if test="${func.length(cliente.id) > 0}">${cliente.id}</c:if>">

            <label for="cliente-cpf" class="sr-only">CPF:</label>
            <input type="text" name="cpf" id="cliente-cpf" placeholder="CPF"
                    data-value="<c:if test="${func.length(cliente.cpf) > 0}">${cliente.cpf}</c:if>">

            <label for="cliente-nome" class="sr-only">Nome:</label>
            <input type="text" name="nome" id="cliente-nome" placeholder="Nome"
                    data-value="<c:if test="${func.length(cliente.nome) > 0}">${cliente.nome}</c:if>">

            <label for="cliente-sobrenome" class="sr-only">Sobrenome</label>
            <input type="text" name="sobrenome" id="cliente-sobrenome" placeholder="Sobrenome"
                    data-value="<c:if test="${func.length(cliente.nome) > 0}">${cliente.nome}</c:if>">

            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </div>
</div>