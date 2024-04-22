package crud.index.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import crud.index.modelos.Estado;

public interface Repository extends JpaRepository<Estado, Integer> {
   
    List<Estado> findByEstadoContaining(String estado);

 

}