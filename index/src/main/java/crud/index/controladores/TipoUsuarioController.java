package crud.index.controladores;






import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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

  
   
    
}
