/**
 * Created by luancomputacao on 25/02/18.
 */
$(function () {
    Cliente.init();
});


Cliente = {

    elements: {
        form: {
            _: $("#cliente-form"),
            id: $("#cliente-id"),
            cpf: $("#cliente-cpf"),
            nome: $("#cliente-nome"),
            sobrenome: $("#cliente-sobrenome")
        }
    },

    models: {
        id: null,
        cpf: null,
        nome: null,
        sobrenome: null
    },

    init: function () {
        console.log("Cliente started");

        this.models.id = this.elements.form.id.val() || null;
        this.models.cpf = this.elements.form.cpf.val();
        this.models.nome = this.elements.form.nome.val();
        this.models.sobrenome = this.elements.form.sobrenome.val();


        console.log("Calling watchers");
        this.watchers.form(this.elements.form);
    },

    watchers: {
        form: function (form) {
            form._.submit(function (event) {
                event.preventDefault();
                Cliente.methods.save();
            });

            form.cpf.on('keyup', function () {
                Cliente.models.cpf = form.cpf.val();
            });
            form.nome.on('keyup', function () {
                Cliente.models.nome = form.nome.val();
            });
            form.nome.on('keyup', function () {
                Cliente.models.sobrenome = form.sobrenome.val();
            });
        }
    },

    methods: {
        save: function () {
            $.ajax({
                url: Cliente.elements.form._.attr('action'),
                method: "POST",
                contentType: "application/json",
                dataType: "json",
                data: JSON.stringify({
                    id: Cliente.models.id,
                    cpf: Cliente.models.cpf,
                    nome: Cliente.models.nome,
                    sobrenome: Cliente.models.sobrenome
                })
            }).done(function (data) {
                console.log("success");
                console.log(data);
            }).fail(function (data) {
                console.log("error");
                console.log(data);
            }).always(function () {
                console.log("complete");
            });
        }
    }
};