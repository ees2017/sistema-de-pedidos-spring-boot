package org.ufpr.sistemapedidos.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.ufpr.sistemapedidos.domain.Cliente;

import javax.swing.text.html.Option;
import java.util.Optional;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

    @Query("SELECT c FROM Cliente c WHERE c.id = ?1")
    Optional<Cliente> findOne(Integer clienteId);

    @Query("SELECT c FROM Cliente c WHERE c.cpf = ?1")
    Optional<Cliente> findByCpf(String cpf);

    @Query("SELECT c FROM Cliente c WHERE c.id = ?1 and c.cpf = ?2")
    Optional<Cliente> findByCpfAndId(Integer id, String cpf);
}
