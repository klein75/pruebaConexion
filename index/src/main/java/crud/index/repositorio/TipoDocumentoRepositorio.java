package crud.index.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import crud.index.modelos.TipoDocumento;

public interface TipoDocumentoRepositorio extends JpaRepository<TipoDocumento, Integer> {

}
