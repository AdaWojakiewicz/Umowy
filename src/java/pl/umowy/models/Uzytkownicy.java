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
@Table(name = "uzytkownicy")
public class Uzytkownicy {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_uzytkownika")
    private Integer idUzytkownika;
    @Column(name = "login")
    private String login;
    @Column(name = "uprawnienie")
    private String uprawnienie;

    public Uzytkownicy() {
    }

    public Uzytkownicy(Integer idUzytkownika, String login, String uprawnienie) {
        this.idUzytkownika = idUzytkownika;
        this.login = login;
        this.uprawnienie = uprawnienie;
    }

    public Integer getIdUzytkownika() {
        return idUzytkownika;
    }

    public void setIdUzytkownika(Integer idUzytkownika) {
        this.idUzytkownika = idUzytkownika;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getUprawnienie() {
        return uprawnienie;
    }

    public void setUprawnienie(String uprawnienie) {
        this.uprawnienie = uprawnienie;
    }

    @Override
    public String toString() {
        return "Uzytkownicy{" + "idUzytkownika=" + idUzytkownika + ", login=" + login + ", uprawnienie=" + uprawnienie + '}';
    }
}
