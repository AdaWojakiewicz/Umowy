package pl.umowy.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Ada
 */
@Entity
@Table(name = "systemy")
public class Systemy {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_systemu")
    private Integer idSystemu;
    @Column(name = "nazwa_systemu")
    private String nazwaSystemu;
    @Column(name = "opis_systemu")
    private String opisSystemu;
    @Column(name = "opis_technologii")
    private String opisTechnologii;
    @Column(name = "id_klienta")
    private Integer idKlienta;

    public Systemy() {
    }

    public Systemy(Integer idSystemu, String nazwaSystemu, String opisSystemu, String opisTechnologii, Integer idKlienta) {
        this.idSystemu = idSystemu;
        this.nazwaSystemu = nazwaSystemu;
        this.opisSystemu = opisSystemu;
        this.opisTechnologii = opisTechnologii;
        this.idKlienta = idKlienta;
    }

    public Integer getIdSystemu() {
        return idSystemu;
    }

    public void setIdSystemu(Integer idSystemu) {
        this.idSystemu = idSystemu;
    }

    public String getNazwaSystemu() {
        return nazwaSystemu;
    }

    public void setNazwaSystemu(String nazwaSystemu) {
        this.nazwaSystemu = nazwaSystemu;
    }

    public String getOpisSystemu() {
        return opisSystemu;
    }

    public void setOpisSystemu(String opisSystemu) {
        this.opisSystemu = opisSystemu;
    }

    public String getOpisTechnologii() {
        return opisTechnologii;
    }

    public void setOpisTechnologii(String opisTechnologii) {
        this.opisTechnologii = opisTechnologii;
    }

    public Integer getIdKlienta() {
        return idKlienta;
    }

    public void setIdKlienta(Integer idKlienta) {
        this.idKlienta = idKlienta;
    }

    @Override
    public String toString() {
        return "Systemy{" + "idSystemu=" + idSystemu + ", nazwaSystemu=" + nazwaSystemu + ", opisSystemu=" + opisSystemu + ", opisTechnologii=" + opisTechnologii + ", idKlienta=" + idKlienta + '}';
    }
}
