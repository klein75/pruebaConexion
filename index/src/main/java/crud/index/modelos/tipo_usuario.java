package crud.index.modelos;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

@Entity

public class tipo_usuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private Integer id;
    
    @Column(name = "tipousuario")
    private String tipo_usuario;

    @ManyToOne
    @JoinColumn(name = "estado_id", referencedColumnName = "id")
    private Estado estado;

    
   @CreationTimestamp
    @Column(name = "creado", nullable = false, updatable = false)
    @Getter
    private Timestamp creado;



    @UpdateTimestamp
    @Column(name =  "modificado" )
    @Getter
    private Timestamp modificado ;


    


}
