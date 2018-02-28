package org.ufpr.sistemapedidos.controller.apiv1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.ufpr.sistemapedidos.model.Cliente;
import org.ufpr.sistemapedidos.repository.ClienteRepository;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/v1/clientes")
public class ClienteController {

    @Autowired
    ClienteRepository clienteRepository;

    @GetMapping("/")
    public List<Cliente> getAllClientes() {
        return clienteRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cliente> getClienteById(@PathVariable(value = "id") Integer clienteId) {
        Cliente cliente = clienteRepository.findOne(clienteId);
        if (cliente == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok().body(cliente);
    }

    @GetMapping("/cpf/{cpf}")
    public ResponseEntity<Cliente> getClienteByCpf(@PathVariable(value = "cpf") String clienteCpf) {
        Cliente cliente = clienteRepository.findByCpf(clienteCpf);
        if (cliente == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok().body(cliente);
    }

    @PostMapping(path = "/", consumes = {MediaType.APPLICATION_JSON_VALUE})
    @ResponseStatus(HttpStatus.CREATED)
    public Cliente createCliente(@Valid @RequestBody Cliente cliente) {
        return clienteRepository.save(cliente);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cliente> updateCliente(@PathVariable(value = "id") Integer clienteId,
                                                 @Valid @RequestBody Cliente clienteDetails) {

        Cliente cliente = clienteRepository.findOne(clienteId);
        if (cliente == null) {
            return ResponseEntity.notFound().build();
        }

        cliente.setCpf(clienteDetails.getCpf());
        cliente.setNome(clienteDetails.getNome());
        cliente.setSobrenome(clienteDetails.getSobrenome());

        Cliente updatedCliente = clienteRepository.save(cliente);
        return ResponseEntity.ok(updatedCliente);
    }
}
