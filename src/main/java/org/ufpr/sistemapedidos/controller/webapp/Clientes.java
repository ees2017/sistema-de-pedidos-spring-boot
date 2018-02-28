package org.ufpr.sistemapedidos.controller.webapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.ufpr.sistemapedidos.repository.ClienteRepository;

@Controller
public class Clientes {
    @Autowired
    ClienteRepository clienteRepository;

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
    public ModelAndView cliente(@PathVariable(name = "id") Integer clienteID) {
        ModelAndView mv = new ModelAndView("clientes");
        mv.addObject("cliente", clienteRepository.findOne(clienteID));
        return mv;
    }
}
