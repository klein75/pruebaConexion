package crud.index.controladores;

import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RestController;

import crud.index.modelos.tipo_documento;
import crud.index.repositorio.tipoDocumentoRespositorio;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;



@RestController
public class tipoDocumentoControlador {

    @Autowired
    private tipoDocumentoRespositorio tdocrepo;
    

    @GetMapping("/tipoDocumento")
    public List<tipo_documento> gerTipo_documentos(){
        return tdocrepo.findAll();
    }
    
    //____________________________________________________________________________

//crear tipo de documento 

    @PostMapping("/crearTipoDoc")
    public ResponseEntity<Object> savetipo_documento(@RequestBody tipo_documento tipo_documento){
        Optional<tipo_documento> res= tdocrepo.findById(tipo_documento.getId());
        HashMap<String, Object> datos = new HashMap<>();

        if (res.isPresent()) {
            datos.put("error", true);
            datos.put("mensaje", "El ID ya está registrado");
            return new ResponseEntity<>(datos, HttpStatus.CONFLICT);
        }

        tdocrepo.save(tipo_documento);
        datos.put("data", tipo_documento);
        datos.put("mensaje", "creado correctamente");

    return new ResponseEntity<>(datos, HttpStatus.CREATED);
    }
    
    //_______________________________________________________________________________
    //MODIFICAR TIPOS DE DOCUMENTOS 

    @PutMapping("/modifcarTipoDoc/{id}")
    public ResponseEntity<Object> Updatetipo_documento(@PathVariable("id") Integer id , @RequestBody tipo_documento tipodoc){
        tipo_documento tipoDocumento= tdocrepo.findById(id).orElse(null);
        if ( tipoDocumento != null) {

            tipoDocumento.setTipo_documento(tipodoc.getTipo_documento());
            tipoDocumento.setEstado(tipodoc.getEstado());
            tdocrepo.save(tipodoc);

            return new ResponseEntity<>("Tipo_documento  actualizado correctamente", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("No se encontró el Estado con ID: " + id, HttpStatus.NOT_FOUND);
        }
        }
       
//_________________________________________________________________________________________________________________________


        @DeleteMapping("/eliminarTipoDoc/{id}")
        public ResponseEntity<String> deletetipo_documento(@PathVariable("id") Integer id){
        tipo_documento tipodoc=tdocrepo.findById(id).orElse(null);
        if (tipodoc != null){
            tdocrepo.delete(tipodoc);
            return new ResponseEntity<>("tipo_documento eliminado correctamente", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("No se encontró el Estado con ID: " + id, HttpStatus.NOT_FOUND);

        }


        } 










    

    }











