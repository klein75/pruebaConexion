package crud.index.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import crud.index.modelos.tipo_usuario;

public interface TipoUsuarioRespositorio extends JpaRepository<tipo_usuario, Integer> {
    
    
    @Query("SELECT tu FROM tipo_usuario tu WHERE tu.estado.estado = 'activo'")
    List<tipo_usuario> findByEstadoActivo();





}
