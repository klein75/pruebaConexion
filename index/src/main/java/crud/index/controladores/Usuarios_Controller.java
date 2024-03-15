package crud.index.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import crud.index.modelos.Usuario;
import crud.index.repositorio.Repository;

@RestController
public class Usuarios_Controller {

    @Autowired
    private Repository repo;

    @GetMapping("")
    public String inicio() {
        return "Conectado";
    }

    @GetMapping("/users")
    public List<Usuario> getusuarios() {
        return repo.findAll();
    }

    @PostMapping("/creauser")
    public String creauser(@RequestBody Usuario us) {
        repo.save(us);
        return "usuario guardado";
    }

}
