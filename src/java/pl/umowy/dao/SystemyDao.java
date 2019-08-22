package pl.umowy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import pl.umowy.models.Systemy;
import pl.umowy.utils.DatabaseConnector;
import pl.umowy.utils.HibernateUtil;

/**
 *
 * @author Ada
 */
public class SystemyDao {
    
    public List<Systemy> getAll() {
        List<Systemy> result = new ArrayList<Systemy>();       
        String sql = "select * from systemy";
        ResultSet rows = null;
        Statement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            stm = connection.createStatement();
            rows = stm.executeQuery(sql);
            while (rows.next()) {
                Systemy s = new Systemy();
                s.setIdSystemu(rows.getInt("id_systemu"));
                s.setNazwaSystemu(rows.getString("nazwa_systemu"));
                s.setOpisSystemu(rows.getString("opis_systemu"));
                s.setOpisTechnologii(rows.getString("opis_technologii"));
                s.setIdKlienta(rows.getInt("id_klienta"));
                result.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Umowy - SystemyDao - Problem z zapytaniem - getAll");
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
    
    public void save(Systemy s, String ja) {
        PreparedStatement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            String sql = "INSERT INTO public.systemy(nazwa_systemu, opis_systemu, opis_technologii, id_klienta) VALUES (?, ?, ?, ?); INSERT INTO logi(login, czas, czynnosc) VALUES (?, now(), ?);";
            stm = connection.prepareStatement(sql);           
            stm.setString(1, s.getNazwaSystemu());
            stm.setString(2, s.getOpisSystemu());
            stm.setString(3, s.getOpisTechnologii());
            stm.setInt(4, s.getIdKlienta());
            stm.setString(5, ja);
            stm.setString(6, "Dodano system o nazwie "+s.getNazwaSystemu());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Umowy - SystemyDao - Problem z zapytaniem - save");
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
        String nazwa = getById(id).getNazwaSystemu();
        try {
            String sql = "delete from systemy where id_systemu=?; INSERT INTO logi(login, czas, czynnosc) VALUES (?, now, ?);";
            stm = connection.prepareStatement(sql);
            stm.setLong(1, id);
            stm.setString(2, ja);
            stm.setString(3, "Usunięto system o nazwie "+nazwa);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Umowy - SystemyDao - Problem z zapytaniem - delete");
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
    
    public Systemy getById(int id) throws SQLException {

        String sql = "select * from systemy where id_systemu = ?";
        PreparedStatement stm = null;
        ResultSet rows = null;
        Connection connection = DatabaseConnector.getConnection();
        Systemy s = new Systemy();
        try {
            stm = connection.prepareStatement(sql);
            stm.setLong(1, id);
            rows = stm.executeQuery();
            if (rows.next()) {
                s.setIdSystemu(id);
                s.setNazwaSystemu(rows.getString("nazwa_systemu"));
                s.setOpisSystemu(rows.getString("opis_systemu"));
                s.setOpisTechnologii(rows.getString("opis_technologii"));
                s.setIdKlienta(rows.getInt("id_klienta"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Umowy - SystemyDao - Problem z zapytaniem - getById");
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
        return s;
    }
    
    public List<Systemy> getAllHibernate() {
        List<Systemy> wynik = new ArrayList<Systemy>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            wynik = (List<Systemy>) session.createQuery("from Systemy").list();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return wynik;
    }
}
