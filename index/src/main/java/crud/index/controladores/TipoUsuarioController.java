package crud.index.controladores;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import crud.index.modelos.TipoUsuario;
import crud.index.repositorio.TipoUsuarioRepositorio;

@RestController
public class TipoUsuarioController {

    @Autowired
    private TipoUsuarioRepositorio repo;



    @GetMapping("/tipous")
    public List<TipoUsuario> GetTipoUsuario() {
        return repo.findAll();
    }


    @GetMapping("/tipoUsuario/{id}")
public ResponseEntity<Object> getTipoUsuarioById(@PathVariable("id") Integer id) {
    Optional<TipoUsuario> tipoUsuarioOptional = repo.findById(id);
    if (tipoUsuarioOptional.isPresent()) {
        return new ResponseEntity<>(tipoUsuarioOptional.get(), HttpStatus.OK);
    } else {
        return new ResponseEntity<>("No se encontró el Tipo de Usuario definido con ID: " + id, HttpStatus.NOT_FOUND);
    }
}

}
