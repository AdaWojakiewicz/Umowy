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
@Table(name = "klienci_slownik")
public class KlienciSlownik {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_klienta")
    private Integer idKlienta;
    @Column(name = "nazwa_klienta")
    private String nazwaKlienta;

    public KlienciSlownik() {
    }

    public KlienciSlownik(Integer idKlienta, String nazwaKlienta) {
        this.idKlienta = idKlienta;
        this.nazwaKlienta = nazwaKlienta;
    }

    public Integer getIdKlienta() {
        return idKlienta;
    }

    public void setIdKlienta(Integer idKlienta) {
        this.idKlienta = idKlienta;
    }

    public String getNazwaKlienta() {
        return nazwaKlienta;
    }

    public void setNazwaKlienta(String nazwaKlienta) {
        this.nazwaKlienta = nazwaKlienta;
    }

    @Override
    public String toString() {
        return "KlienciSlownik{" + "idKlienta=" + idKlienta + ", nazwaKlienta=" + nazwaKlienta + '}';
    }
}
