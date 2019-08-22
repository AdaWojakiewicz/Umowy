package pl.umowy.models;

import java.sql.Timestamp;
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
@Table(name = "logi")
public class Logi {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_log")
    private Integer idLog;
    @Column(name = "login")
    private String login;
    @Column(name = "czas")
    private Timestamp czas;
    @Column(name = "czynnosc")
    private String czynnosc;

    public Logi() {
    }

    public Logi(Integer idLog, String login, Timestamp czas, String czynnosc) {
        this.idLog = idLog;
        this.login = login;
        this.czas = czas;
        this.czynnosc = czynnosc;
    }

    public Integer getIdLog() {
        return idLog;
    }

    public void setIdLog(Integer idLog) {
        this.idLog = idLog;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public Timestamp getCzas() {
        return czas;
    }

    public void setCzas(Timestamp czas) {
        this.czas = czas;
    }

    public String getCzynnosc() {
        return czynnosc;
    }

    public void setCzynnosc(String czynnosc) {
        this.czynnosc = czynnosc;
    }

    @Override
    public String toString() {
        return "Logi{" + "idLog=" + idLog + ", login=" + login + ", czas=" + czas + ", czynnosc=" + czynnosc + '}';
    }
}
