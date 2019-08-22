package pl.umowy.controllers;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.umowy.dao.KlienciSlownikDao;
import pl.umowy.dao.SystemyDao;
import pl.umowy.dao.UmowyDao;

/**
 *
 * @author Ada
 */
@Controller
public class AjaxController {

    UmowyDao uDao = new UmowyDao();
    KlienciSlownikDao ksDao = new KlienciSlownikDao();
    SystemyDao sDao = new SystemyDao();
    
    @RequestMapping(value = "lista-umow-ajax.do", method = RequestMethod.GET)
    public @ResponseBody
    List listaUmow() throws SQLException {               
        List umowy = uDao.getAll();        
        return umowy;
    }

    @RequestMapping(value = "lista-klientow-ajax.do", method = RequestMethod.GET)
    public @ResponseBody
    List listaKlientow() throws SQLException {
        List listaKlientow = ksDao.getAll();
        return listaKlientow;
    }
    
    @RequestMapping(value = "lista-systemow-ajax.do", method = RequestMethod.GET)
    public @ResponseBody
    List listaSystemow() throws SQLException {        
        List systemy = sDao.getAll();        
        return systemy;
    }
}
