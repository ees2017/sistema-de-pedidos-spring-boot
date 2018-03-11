package org.ufpr.sistemapedidos.controller.apiv1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.ufpr.sistemapedidos.controller.apiv1.wrapper.ItemDoPedidoWrapper;
import org.ufpr.sistemapedidos.model.ItemDoPedido;
import org.ufpr.sistemapedidos.model.ItemDoPedidoPK;
import org.ufpr.sistemapedidos.model.Pedido;
import org.ufpr.sistemapedidos.model.Produto;
import org.ufpr.sistemapedidos.repository.ItemDoPedidoRepository;
import org.ufpr.sistemapedidos.repository.PedidoRepository;
import org.ufpr.sistemapedidos.repository.ProdutoRepository;

import javax.validation.Valid;
import java.util.Collection;
import java.util.Optional;

import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.http.HttpStatus.OK;

@RestController
@RequestMapping("/api/v1/clientes/{clienteID}/pedidos/{pedidoID}")
public class ItemDoPedidoController {

    @Autowired
    PedidoRepository pedidoRepository;

    @Autowired
    ItemDoPedidoRepository itemDoPedidoRepository;

    @Autowired
    ProdutoRepository produtoRepository;

    @GetMapping(path = "/itens", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Collection<ItemDoPedido>> listarItensDoPedido(@PathVariable("clienteID") Integer clienteID, @PathVariable("pedidoID") Integer pedidoID) {
        System.out.println(clienteID);
        System.out.println(pedidoID);
        ItemDoPedidoPK itemDoPedidoPK = new ItemDoPedidoPK();
        Collection<ItemDoPedido> itemDoPedidoCollection = pedidoRepository.findOne(pedidoID).getItemDoPedidoCollection();
        if (itemDoPedidoCollection == null) return ResponseEntity.notFound().build();
        return ResponseEntity.ok().body(itemDoPedidoCollection);
    }

    @PostMapping(path = "/itens", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<ItemDoPedido> addItemDoPedido(
            @PathVariable("clienteID") Integer clienteID,
            @PathVariable("pedidoID") Integer pedidoID,
            @Valid @RequestBody ItemDoPedidoWrapper itemDoPedidoWrapper) {

        Pedido pedido = pedidoRepository.findOne(pedidoID);
        Produto produto = produtoRepository.findOne(itemDoPedidoWrapper.getProdutoId());

        ItemDoPedidoPK itemDoPedidoPK = new ItemDoPedidoPK();
        ItemDoPedido itemDoPedido = new ItemDoPedido();

        if (pedido != null && produto != null) {
            itemDoPedidoPK.setIdPedido(pedido.getId());
            itemDoPedidoPK.setIdProduto(produto.getId());
            Optional<ItemDoPedido> foundItemDoPedido = itemDoPedidoRepository.findById(itemDoPedidoPK);

            if (foundItemDoPedido.isPresent()) {
                itemDoPedido.setItemDoPedidoPK(foundItemDoPedido.get().getItemDoPedidoPK());
                itemDoPedido.setQtdade(itemDoPedidoWrapper.getQtdade());
                itemDoPedido.setPedido(pedido);
                itemDoPedido.setProduto(produto);
                itemDoPedidoRepository.save(itemDoPedido);
                return new ResponseEntity<>(itemDoPedidoRepository.getOne(itemDoPedido.getItemDoPedidoPK()), OK);
            } else {
                itemDoPedido.setItemDoPedidoPK(itemDoPedidoPK);
                itemDoPedido.setQtdade(itemDoPedidoWrapper.getQtdade());
                itemDoPedido.setPedido(pedido);
                itemDoPedido.setProduto(produto);
                itemDoPedido = itemDoPedidoRepository.save(itemDoPedido);
                return new ResponseEntity<>(itemDoPedidoRepository.getOne(itemDoPedido.getItemDoPedidoPK()), CREATED);
            }
        }

        return ResponseEntity.notFound().build();
    }
}