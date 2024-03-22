package crud.index.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import crud.index.modelos.TipoDocumento;
import crud.index.repositorio.TipoDocumentoRepositorio;
import org.springframework.web.bind.annotation.GetMapping;



@RestController
public class TipoDocumentoController {

    @Autowired
    private TipoDocumentoRepositorio repo;

    @GetMapping("/TipoDoc")
    public List<TipoDocumento> GetTipoDocumento() {
        return repo.findAll();
    }
    

}
