package crud.index.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;

import crud.index.modelos.Estado;

public interface Repository extends JpaRepository<Estado, Integer> {

 

}