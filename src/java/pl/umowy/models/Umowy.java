package pl.umowy.models;

import java.sql.Date;
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
@Table(name = "umowy")
public class Umowy {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_umowy")
    private Integer idUmowy;
    @Column(name = "system")
    private String system;
    @Column(name = "request")
    private Integer zapotrzebowanie;
    @Column(name = "order_number")
    private String nrZamowienia;
    @Column(name = "from_date")
    private Date dataPoczatek;
    @Column(name = "to_date")
    private Date dataKoniec;
    @Column(name = "amount")
    private double kwota;
    @Column(name = "amount_type")
    private String typKwota;
    @Column(name = "amount_period")
    private String okres;
    @Column(name = "authorization_percent")
    private Integer procent;
    @Column(name = "active")
    private Boolean aktywny;

    public Umowy() {
    }

    public Umowy(Integer idUmowy, String system, Integer zapotrzebowanie, String nrZamowienia, Date dataPoczatek, Date dataKoniec, double kwota, String typKwota, String okres, Integer procent, Boolean aktywny) {
        this.idUmowy = idUmowy;
        this.system = system;
        this.zapotrzebowanie = zapotrzebowanie;
        this.nrZamowienia = nrZamowienia;
        this.dataPoczatek = dataPoczatek;
        this.dataKoniec = dataKoniec;
        this.kwota = kwota;
        this.typKwota = typKwota;
        this.okres = okres;
        this.procent = procent;
        this.aktywny = aktywny;
    }

    public Integer getIdUmowy() {
        return idUmowy;
    }

    public void setIdUmowy(Integer idUmowy) {
        this.idUmowy = idUmowy;
    }

    public String getSystem() {
        return system;
    }

    public void setSystem(String system) {
        this.system = system;
    }

    public Integer getZapotrzebowanie() {
        return zapotrzebowanie;
    }

    public void setZapotrzebowanie(Integer zapotrzebowanie) {
        this.zapotrzebowanie = zapotrzebowanie;
    }

    public String getNrZamowienia() {
        return nrZamowienia;
    }

    public void setNrZamowienia(String nrZamowienia) {
        this.nrZamowienia = nrZamowienia;
    }

    public Date getDataPoczatek() {
        return dataPoczatek;
    }

    public void setDataPoczatek(Date dataPoczatek) {
        this.dataPoczatek = dataPoczatek;
    }

    public Date getDataKoniec() {
        return dataKoniec;
    }

    public void setDataKoniec(Date dataKoniec) {
        this.dataKoniec = dataKoniec;
    }

    public double getKwota() {
        return kwota;
    }

    public void setKwota(double kwota) {
        this.kwota = kwota;
    }

    public String getTypKwota() {
        return typKwota;
    }

    public void setTypKwota(String typKwota) {
        this.typKwota = typKwota;
    }

    public String getOkres() {
        return okres;
    }

    public void setOkres(String okres) {
        this.okres = okres;
    }

    public Integer getProcent() {
        return procent;
    }

    public void setProcent(Integer procent) {
        this.procent = procent;
    }

    public Boolean getAktywny() {
        return aktywny;
    }

    public void setAktywny(Boolean aktywny) {
        this.aktywny = aktywny;
    }

    @Override
    public String toString() {
        return "Umowy{" + "idUmowy=" + idUmowy + ", system=" + system + ", zapotrzebowanie=" + zapotrzebowanie + ", nrZamowienia=" + nrZamowienia + ", dataPoczatek=" + dataPoczatek + ", dataKoniec=" + dataKoniec + ", kwota=" + kwota + ", typKwota=" + typKwota + ", okres=" + okres + ", procent=" + procent + ", aktywny=" + aktywny + '}';
    }
}
