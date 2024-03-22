package crud.index.controladores;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import crud.index.modelos.Estado;
import crud.index.repositorio.Repository;

@RestController
public class EstadoController {

    @Autowired
    private Repository repo;

    @GetMapping("")
    public String inicio() {
        return "Conectado";
    }

    @GetMapping("/estado")
    public List<Estado> getEstados() {
        return repo.findAll();
    }

    @GetMapping("/estado/{id}")
    public ResponseEntity<Object> getEstadoById(@PathVariable("id") Integer id) {
    Optional<Estado> estadoOptional = repo.findById(id);
    if (estadoOptional.isPresent()) {
        return new ResponseEntity<>(estadoOptional.get(), HttpStatus.OK);
    } else {
        return new ResponseEntity<>("No se encontró el Estado definifo con ID: " + id, HttpStatus.NOT_FOUND);
    }
}


    // modificar o actualizar un estado
    @PutMapping("/modificaEstado/{id}")
    public ResponseEntity<String> updateEstado(@PathVariable("id") Integer id, @RequestBody Estado estadoDetails) {
        Estado estado = repo.findById(id).orElse(null);
        if (estado != null) {
            estado.setEstado(estadoDetails.getEstado());
            estado.setTipo(estadoDetails.getTipo());
            estado.setDetalles(estadoDetails.getDetalles());
            estado.setActivo(estadoDetails.getActivo());
            repo.save(estado);
            return new ResponseEntity<>("Estado actualizado correctamente", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("No se encontró el Estado con ID: " + id, HttpStatus.NOT_FOUND);
        }
    }

    // guardar un nuevo estado
    @PostMapping("/guardarEstado")
    public ResponseEntity<Object> saveEstado(@RequestBody Estado estado) {
        Optional<Estado> res = repo.findById(estado.getId());
        HashMap<String, Object> datos = new HashMap<>();
        
        if (res.isPresent()) {
            datos.put("error", true);
            datos.put("mensaje", "El ID ya está registrado con otro estado");
            return new ResponseEntity<>(datos, HttpStatus.CONFLICT);
        }
        
        repo.save(estado);
        datos.put("data", estado);
        datos.put("mensaje", "Estado creado correctamente");

        return new ResponseEntity<>(datos, HttpStatus.CREATED);
    }

    // eliminación
    @DeleteMapping("/eliminarEstado/{id}")
    public ResponseEntity<String> deleteEstado(@PathVariable("id") Integer id) {
        Estado estado = repo.findById(id).orElse(null);
        if (estado != null) {
            repo.delete(estado);
            return new ResponseEntity<>("Estado eliminado correctamente", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("No se encontró el Estado con ID: " + id, HttpStatus.NOT_FOUND);
        }
    }
}

    
    
    






