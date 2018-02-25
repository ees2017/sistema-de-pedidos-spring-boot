<div class="row">
    <div class="col">
        <form action="/api/v1/clientes/" method="post">
            <input type="hidden" name="id" id="id">
            <label for="nome" class="sr-only">Nome:</label>
            <input type="text" name="nome" id="nome" placeholder="Nome">
            <label for="sobrenome" class="sr-only">Sobrenome</label>
            <input type="text" name="sobrenome" id="sobrenome" placeholder="Sobrenome">

            <button type="submit" class="btn btn-primary">Salvar</button>
        </form>
    </div>
</div>