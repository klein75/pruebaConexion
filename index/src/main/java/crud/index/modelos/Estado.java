package crud.index.modelos;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Estado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;


    @Column(name = "estado")
    private String estado;



    @Column(name = "tipo")
    private String tipo;



    @Column(name = "activo")
    private Integer activo;


    
    @Column(name = "detalles")
    private String detalles;



   @CreationTimestamp
    @Column(name = "creado", nullable = false, updatable = false)
    @Getter
    private Timestamp creado;



    @UpdateTimestamp
    @Column(name =  "modificado" )
    @Getter
    private Timestamp modificado ;


}
