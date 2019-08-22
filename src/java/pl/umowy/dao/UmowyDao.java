package pl.umowy.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import pl.umowy.models.Umowy;
import pl.umowy.utils.DatabaseConnector;
import pl.umowy.utils.HibernateUtil;

/**
 *
 * @author Ada
 */
public class UmowyDao {
    
    public List<Umowy> getAll() {
        List<Umowy> result = new ArrayList<Umowy>();       
        String sql = "select * from umowy";
        ResultSet rows = null;
        Statement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            stm = connection.createStatement();
            rows = stm.executeQuery(sql);
            while (rows.next()) {
                Umowy u = new Umowy();
                u.setIdUmowy(rows.getInt("id_umowy"));
                u.setSystem(rows.getString("system"));
                u.setZapotrzebowanie(rows.getInt("request"));
                u.setNrZamowienia(rows.getString("order_number"));
                u.setDataPoczatek(rows.getDate("from_date"));
                u.setDataKoniec(rows.getDate("to_date"));
                u.setKwota(rows.getDouble("amount"));
                u.setTypKwota(rows.getString("amount_type"));
                u.setOkres(rows.getString("amount_period"));
                u.setProcent(rows.getInt("authorization_percent"));
                u.setAktywny(rows.getBoolean("active"));
                result.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Umowy - UmowyDao - Problem z zapytaniem - getAll");
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
    
    public void save(Umowy u, String ja) {
        PreparedStatement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            String sql = "INSERT INTO umowy(system, request, order_number, form_date, to_date, amount, amount_type, amount_period, authorization_percent, active) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, true); INSERT INTO logi(login, czas, czynnosc) VALUES (?, now(), ?);";
            stm = connection.prepareStatement(sql);           
            stm.setString(1, u.getSystem());
            stm.setInt(2, u.getZapotrzebowanie());
            stm.setString(3, u.getNrZamowienia());
            stm.setDate(4, u.getDataPoczatek());
            stm.setDate(5, u.getDataKoniec());
            stm.setDouble(6, u.getKwota());
            stm.setString(7, u.getTypKwota());
            stm.setString(8, u.getOkres());
            stm.setInt(9, u.getProcent());
            stm.setString(10, ja);
            stm.setString(11, "Dodano umowę o numerze "+u.getNrZamowienia()+" dotyczącej systemu "+u.getSystem());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Umowy - UmowyDao - Problem z zapytaniem - save");
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

    public void update(Umowy u, String ja) {
        PreparedStatement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        try {
            String sql = "UPDATE umowy SET system=?, request=?, order_number=?, form_date=?, to_date=?, amount=?, amount_type=?, amount_period=?, authorization_percent=? WHERE id_umowy=?; INSERT INTO logi(login, czas, czynnosc) VALUES (?, now, ?);";
            stm = connection.prepareStatement(sql);           
            stm.setString(1, u.getSystem());
            stm.setInt(2, u.getZapotrzebowanie());
            stm.setString(3, u.getNrZamowienia());
            stm.setDate(4, u.getDataPoczatek());
            stm.setDate(5, u.getDataKoniec());
            stm.setDouble(6, u.getKwota());
            stm.setString(7, u.getTypKwota());
            stm.setString(8, u.getOkres());
            stm.setInt(9, u.getProcent());
            stm.setInt(10, u.getIdUmowy());
            stm.setString(11, ja);
            stm.setString(12, "Edytowano umowę o numerze "+u.getNrZamowienia()+" dotyczącej systemu "+u.getSystem());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Umowy - UmowyDao - Problem z zapytaniem - update");
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
    
    public void deaktywuj(int id, String ja) throws SQLException {
        PreparedStatement stm = null;
        Connection connection = DatabaseConnector.getConnection();
        Umowy u = getById(id);
        try {
            String sql = "UPDATE umowy SET active=false WHERE id_umowy=?; INSERT INTO logi(login, czas, czynnosc) VALUES (?, now, ?);";
            stm = connection.prepareStatement(sql);  
            stm.setInt(1, u.getIdUmowy());
            stm.setString(2, ja);
            stm.setString(3, "Deaktywowano umowę o numerze "+u.getNrZamowienia()+" dotyczącej systemu "+u.getSystem());
            stm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Umowy - UmowyDao - Problem z zapytaniem - update");
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
        Umowy u = getById(id);
        try {
            String sql = "delete from umowy where id_umowy=?; INSERT INTO logi(login, czas, czynnosc) VALUES (?, now, ?);";
            stm = connection.prepareStatement(sql);
            stm.setLong(1, id);
            stm.setString(2, ja);
            stm.setString(3, "Dodano umowę o numerze "+u.getNrZamowienia()+" dotyczącej systemu "+u.getSystem());
            stm.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Umowy - UmowyDao - Problem z zapytaniem - delete");
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
    
    public Umowy getById(int id) throws SQLException {

        String sql = "select * from umowy where id_umowy = ?";
        PreparedStatement stm = null;
        ResultSet rows = null;
        Connection connection = DatabaseConnector.getConnection();
        Umowy u = new Umowy();
        try {
            stm = connection.prepareStatement(sql);
            stm.setLong(1, id);
            rows = stm.executeQuery();
            if (rows.next()) {
                u.setIdUmowy(id);
                u.setSystem(rows.getString("system"));
                u.setZapotrzebowanie(rows.getInt("request"));
                u.setNrZamowienia(rows.getString("order_number"));
                u.setDataPoczatek(rows.getDate("from_date"));
                u.setDataKoniec(rows.getDate("to_date"));
                u.setKwota(rows.getDouble("amount"));
                u.setTypKwota(rows.getString("amount_type"));
                u.setOkres(rows.getString("amount_period"));
                u.setProcent(rows.getInt("authorization_percent"));
                u.setAktywny(rows.getBoolean("active"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Umowy - UmowyDao - Problem z zapytaniem - getById");
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
    
    public List<Umowy> getAllHibernate() {
        List<Umowy> wynik = new ArrayList<Umowy>();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            wynik = (List<Umowy>) session.createQuery("from Umowy").list();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
        return wynik;
    }
}
