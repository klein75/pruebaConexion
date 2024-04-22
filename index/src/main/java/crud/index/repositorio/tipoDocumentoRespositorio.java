package crud.index.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import crud.index.modelos.tipo_documento;

public interface tipoDocumentoRespositorio extends JpaRepository<tipo_documento, Integer> {

}
