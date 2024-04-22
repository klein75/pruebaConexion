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


import crud.index.modelos.tipo_usuario;
import crud.index.repositorio.TipoUsuarioRespositorio;

@RestController
public class TipoUsuarioControlador {

    @Autowired
    private TipoUsuarioRespositorio turepo;
    

    @GetMapping("/TipoUsuario")
    public List<tipo_usuario> getTipoUsuario() {
        return turepo.findAll();
    }
//tipos de ususarios activos 
  @GetMapping("/TipoUsuario/activos")
    public List<tipo_usuario> getTipoUsuarioActivos() {
        return turepo.findByEstadoActivo();}



//____________________________________________________________________________________________________________________________


// crear un nuevo estado
@PostMapping("/guardartipousuario")
public ResponseEntity<Object> savetipo_usiario(@RequestBody tipo_usuario tipo_tusuario) {
    Optional<tipo_usuario> res = turepo.findById(tipo_tusuario.getId());
    HashMap<String, Object> datos = new HashMap<>();
    
    if (res.isPresent()) {
        datos.put("error", true);
        datos.put("mensaje", "El ID ya está registrado");
        return new ResponseEntity<>(datos, HttpStatus.CONFLICT);
    }
    
    turepo.save(tipo_tusuario); // Cambio en esta línea
    datos.put("data", tipo_tusuario);
    datos.put("mensaje", "creado correctamente");

    return new ResponseEntity<>(datos, HttpStatus.CREATED);
}

//______________________________________________________________________________________________________________________________

//actuazar un Tipo de usuario 

@PutMapping("/modificaTipoUs/{id}")
public ResponseEntity<Object> updatetipo_usuario(@PathVariable("id") Integer id, @RequestBody tipo_usuario tipoUs) {
    tipo_usuario tipoUsuario=turepo.findById(id).orElse(null);
    if (tipoUsuario != null) {
        tipoUsuario.setTipo_usuario(tipoUs.getTipo_usuario());
        tipoUsuario.setEstado(tipoUs.getEstado());

        turepo.save(tipoUs);
        return new ResponseEntity<>("tipo _usuario actualizado correctamente", HttpStatus.OK);
    } else {
        return new ResponseEntity<>("No se encontró el Tipo de Usuario con ID: " + id, HttpStatus.NOT_FOUND);
    }
}
//______________________________________________________________________________________________________________________________________

//eliminar Tipo De usuario 

@DeleteMapping("/eliminar/{id}")
public ResponseEntity<Object> eliminarTipoUsuario(@PathVariable("id") Integer id) {
    if (!turepo.existsById(id)) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Tipo de usuario no encontrado");
    }
    turepo.deleteById(id);
    return ResponseEntity.ok().body("Tipo de usuario eliminado correctamente");
}
























}














