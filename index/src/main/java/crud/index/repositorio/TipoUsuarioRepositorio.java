package crud.index.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import crud.index.modelos.TipoUsuario;

public interface TipoUsuarioRepositorio extends JpaRepository <TipoUsuario,Integer> {

}
