package pl.umowy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import pl.umowy.models.Uzytkownicy;
import pl.umowy.utils.DatabaseConnector;
import pl.umowy.utils.HibernateUtil;

/**
 *
 * @author Ada
 */
public class UzytkownicyDao {
    
    public List<Uzytkownicy> getAll() {
        List<Uzytkownicy> result = new ArrayList<Uzytkownicy>();       
        String sql = "select * from uzytkownicy";
        ResultSet rows = null;
        Statement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            stm = connection.createStatement();
            rows = stm.executeQuery(sql);
            while (rows.next()) {
                Uzytkownicy u = new Uzytkownicy();
                u.setIdUzytkownika(rows.getInt("id_uzytkownika"));
                u.setLogin(rows.getString("login"));
                u.setUprawnienie(rows.getString("uprawnienie"));
                result.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Umowy - UżytkownicyDao - Problem z zapytaniem - getAll");
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
    
    public void save(String login, String ja) {
        PreparedStatement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            String sql = "INSERT INTO uzytkownicy(login, uprawnienie) VALUES (?, 'UŻYTKOWNIK'); INSERT INTO logi(login, czas, czynnosc) VALUES (?, now, ?);";
            stm = connection.prepareStatement(sql);           
            stm.setString(1, login);
            stm.setString(2, ja);
            stm.setString(3, "Dodano użytkownika o loginie "+login);
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Umowy - UżytkownicyDao - Problem z zapytaniem - save");
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
        String login = getById(id).getLogin();
        try {
            String sql = "delete from uzytkownicy where id_uzytkownik=?; INSERT INTO logi(login, czas, czynnosc) VALUES (?, now, ?);";
            stm = connection.prepareStatement(sql);
            stm.setLong(1, id);
            stm.setString(2, ja);
            stm.setString(3, "Usunięto użytkownika o loginie "+login);
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Umowy - UżytkownicyDao - Problem z zapytaniem - delete");
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

    public Uzytkownicy getByLogin(String login) throws SQLException {

        String sql = "select * from uzytkownicy where login = ?";
        PreparedStatement stm = null;
        ResultSet rows = null;
        Connection connection = DatabaseConnector.getConnection();
        Uzytkownicy u = new Uzytkownicy();
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, login);
            rows = stm.executeQuery();
            if (rows.next()) {
                u.setIdUzytkownika(rows.getInt("id_uzytkownika"));
                u.setLogin(login);
                u.setUprawnienie(rows.getString("uprawnienie"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("JUmowy - UżytkownicyDao - Problem z zapytaniem - - getByLogin");
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
        return u;
    }
    
    public Uzytkownicy getById(int id) throws SQLException {

        String sql = "select * from uzytkownicy where id_uzytkownika = ?";
        PreparedStatement stm = null;
        ResultSet rows = null;
        Connection connection = DatabaseConnector.getConnection();
        Uzytkownicy u = new Uzytkownicy();
        try {
            stm = connection.prepareStatement(sql);
            stm.setLong(1, id);
            rows = stm.executeQuery();
            if (rows.next()) {
                u.setIdUzytkownika(id);
                u.setLogin(rows.getString("login"));
                u.setUprawnienie(rows.getString("uprawnienie"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Umowy - UżytkownicyDao - Problem z zapytaniem - getById");
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
        return u;
    }
    
    public List<Uzytkownicy> getAllHibernate() {
        List<Uzytkownicy> wynik = new ArrayList<Uzytkownicy>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            wynik = (List<Uzytkownicy>) session.createQuery("from Uzytkownicy").list();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return wynik;
    }
}
