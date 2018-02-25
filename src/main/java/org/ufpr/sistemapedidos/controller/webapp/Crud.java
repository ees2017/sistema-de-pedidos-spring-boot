package org.ufpr.sistemapedidos.controller.webapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.ufpr.sistemapedidos.repository.ClienteRepository;

/**
 * Created by luancomputacao on 24/02/18.
 */
@Controller
public class Crud {

    @Autowired
    ClienteRepository clienteRepository;

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("index");
        return mv;
    }

    @GetMapping("/clientes")
    public ModelAndView clientes() {
        ModelAndView mv = new ModelAndView("clientes");
        mv.addObject("clientes", clienteRepository.findAll());
        return mv;
    }

    @GetMapping({"/cliente"})
    public ModelAndView cliente() {
        ModelAndView mv = new ModelAndView("clientes");
        mv.addObject("criar", true);
        return mv;
    }

    @GetMapping("/cliente/{id}")
    public ModelAndView cliente(@RequestAttribute(name = "id") Integer clienteID) {
        ModelAndView mv = new ModelAndView("clientes");
        mv.addObject("cliente", clienteRepository.findOne(Long.valueOf(clienteID)));
        return mv;
    }

    @GetMapping("/produtos")
    public ModelAndView produtos() {
        ModelAndView mav = new ModelAndView("produtos");
        return mav;
    }


    @GetMapping("/itens-do-pedido")
    public ModelAndView itensDoPedido() {
        ModelAndView mav = new ModelAndView("itens-do-pedido");
        return mav;
    }
}
