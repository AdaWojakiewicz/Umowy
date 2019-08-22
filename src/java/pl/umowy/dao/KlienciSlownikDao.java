package pl.umowy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import pl.umowy.models.KlienciSlownik;
import pl.umowy.utils.DatabaseConnector;
import pl.umowy.utils.HibernateUtil;

/**
 *
 * @author Ada
 */
public class KlienciSlownikDao {
    
    public List<KlienciSlownik> getAll() {
        List<KlienciSlownik> result = new ArrayList<KlienciSlownik>();       
        String sql = "select * from klienci_slownik";
        ResultSet rows = null;
        Statement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            stm = connection.createStatement();
            rows = stm.executeQuery(sql);
            while (rows.next()) {
                KlienciSlownik ks = new KlienciSlownik();
                ks.setIdKlienta(rows.getInt("id_klienta"));
                ks.setNazwaKlienta(rows.getString("nazwa_klienta"));
                result.add(ks);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Umowy - KlienciSlownikDao - Problem z zapytaniem - getAll");
        } finally {
            try {
//                if (rows != null) {
//                    rows.close();
//                }
//                if (stm != null) {
//                    stm.close();
//                }
//                if (connection != null) {
//                    connection.close();
//                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
    
    public void save(String nazwa, String ja) {
        PreparedStatement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            String sql = "INSERT INTO klienci_slownik(nazwa_klienta) VALUES (?); INSERT INTO logi(login, czas, czynnosc) VALUES (?, now(), ?);";
            stm = connection.prepareStatement(sql);           
            stm.setString(1, nazwa);
            stm.setString(2, ja);
            stm.setString(3, "Dodano klienta o nazwie "+nazwa);
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Umowy - KlienciSlownikDao - Problem z zapytaniem - save");
        } finally {
            try {
//                if (stm != null) {
//                    stm.close();
//                }
//                if (connection != null) {
//                    connection.close();
//                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    public void delete(int id, String ja) throws SQLException {
        PreparedStatement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        String nazwa = getById(id).getNazwaKlienta();
        try {
            String sql = "delete from klienci_slownik where id_klienta=?; INSERT INTO logi(login, czas, czynnosc) VALUES (?, now(), ?);";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            stm.setString(2, ja);
            stm.setString(3, "Usunięto klienta o nazwie "+nazwa);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Umowy - KlienciSlownikDao - Problem z zapytaniem - delete");
        } finally {
            try {
//                if (stm != null) {
//                    stm.close();
//                }
//                if (connection != null) {
//                    connection.close();
//                }
            } catch (Exception ex) {
            }
        }
    }

    public KlienciSlownik getById(int id) throws SQLException {

        String sql = "select * from klienci_slownik where id_klienta = ?";
        PreparedStatement stm = null;
        ResultSet rows = null;
        Connection connection = DatabaseConnector.getConnection();
        KlienciSlownik ks = new KlienciSlownik();
        try {
            stm = connection.prepareStatement(sql);
            stm.setLong(1, id);
            rows = stm.executeQuery();
            if (rows.next()) {
                ks.setIdKlienta(id);
                ks.setNazwaKlienta(rows.getString("nazwa_klienta"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Umowy - KlienciSlownikDao - Problem z zapytaniem - getById");
        } finally {
//            if (rows != null) {
//                rows.close();
//            }
//            if (stm != null) {
//                stm.close();
//            }
//            if (connection != null) {
//                connection.close();
//            }
        }
        return ks;
    }
    
    public List<KlienciSlownik> getAllHibernate() {
        List<KlienciSlownik> wynik = new ArrayList<KlienciSlownik>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            wynik = (List<KlienciSlownik>) session.createQuery("from KlienciSlownik").list();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return wynik;
    }
}
