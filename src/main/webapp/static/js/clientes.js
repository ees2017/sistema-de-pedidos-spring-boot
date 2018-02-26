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
            cpf: $("#cliente-cpf"),
            nome: $("#cliente-nome"),
            sobrenome: $("#cliente-sobrenome")
        }
    },

    models: {
        cpf: null,
        nome: null,
        sobrenome: null
    },

    init: function () {
        console.log("Cliente started");
        this.models.cpf = this.elements.form.cpf.val();
        this.models.nome = this.elements.form.nome.val();
        this.models.sobrenome = this.elements.form.sobrenome.val();


        console.log("Calling watchers");
        this.watchers.form(this.elements.form);
    },

    watchers: {
        form: function (form) {
            form._.submit(function (event) {
                Cliente.methods.save();
                event.preventDefault();
            });

            form.cpf.on('keyup', function (e) {
                Cliente.models.cpf = form.cpf.val();
            });
            form.nome.on('keyup', function (e) {
                Cliente.models.nome = form.nome.val();
            });
            form.nome.on('keyup', function (e) {
                Cliente.models.sobrenome = form.sobrenome.val();
            });
        }
    },

    methods: {
        save: function () {
            var _this = this;
            $.ajax({
                url: Cliente.elements.form.attr('action'),
                method: "POST",
                contentType: "application/json",
                dataType: "json",
                data: {
                    cpf: Cliente.models.cpf,
                    nome: Cliente.models.nome,
                    sobrenome: Cliente.models.sobrenome
                }
            }).done(function (data) {
                console.log("success");
                console.log(data);
            }).fail(function () {
                console.log("error");
            }).always(function () {
                console.log("complete");
            });
        }
    }
};