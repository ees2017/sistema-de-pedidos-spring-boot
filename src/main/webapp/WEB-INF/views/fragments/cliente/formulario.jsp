<div class="row">
    <div class="col">
        <form id="cliente-form" action="/api/v1/clientes/" method="post">
            <input type="hidden" name="id" id="id">

            <label for="cliente-cpf" class="sr-only">CPF:</label>
            <input type="text" name="cpf" id="cliente-cpf" placeholder="CPF">

            <label for="cliente-nome" class="sr-only">Nome:</label>
            <input type="text" name="nome" id="cliente-nome" placeholder="Nome">

            <label for="cliente-sobrenome" class="sr-only">Sobrenome</label>
            <input type="text" name="sobrenome" id="cliente-sobrenome" placeholder="Sobrenome">

            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </div>
</div>