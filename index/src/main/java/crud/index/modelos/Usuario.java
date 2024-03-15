package crud.index.modelos;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Entity
public class Usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
    @Setter
    private Integer id;


   

    @Column(name = "nombre")
    @Getter
    @Setter
    private String Nombre;

    @Column(name = "primerApellido")
    @Getter
    @Setter
    private String Apellidos;

    @Column(name = "segundoApellido")
    @Getter
    @Setter
    private String segundoApellidos;

    @Column
    @Getter
    @Setter
    private Long documento;

    @Column
    @Getter
    @Setter
    private Integer TipoUsuario;

    

    @Column
    @Getter
    @Setter
    private Integer TipoDocumento;


}
