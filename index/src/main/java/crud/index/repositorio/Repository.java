package crud.index.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import crud.index.modelos.Usuario;

public interface Repository extends JpaRepository<Usuario, Long> {

}
