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

@Entity
@Getter
@Setter
public class tipo_documento {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "tipo_documento ")
    private String tipo_documento;


    @ManyToOne
    @JoinColumn(name = "estado", referencedColumnName = "id")
    private Estado estado;

    
   @CreationTimestamp
    @Column(name = "creado", nullable = false, updatable = false)
    private Timestamp creado;



    @UpdateTimestamp
    @Column(name =  "modificado" )
    private Timestamp modificado ;

}
