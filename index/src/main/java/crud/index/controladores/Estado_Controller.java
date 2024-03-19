package crud.index.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import crud.index.modelos.Estado;
import crud.index.repositorio.Repository;

@RestController
public class Estado_Controller {

    @Autowired
    private Repository repo;

    @GetMapping("")
    public String inicio() {
        return "Conectado";
    }

    @GetMapping("/estado")
    public List<Estado> geteEstados() {
        return repo.findAll();
    }

    
    @SuppressWarnings("null")
    @PostMapping("/creaEstado")
    public String creaEstado(@RequestBody Estado estado) {
        repo.save(estado);
        return "Estado guardado";
    }

}
