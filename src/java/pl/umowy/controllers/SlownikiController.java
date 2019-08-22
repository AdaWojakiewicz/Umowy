package pl.umowy.controllers;

import java.security.Principal;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.umowy.dao.KlienciSlownikDao;
import pl.umowy.models.KlienciSlownik;

/**
 *
 * @author Ada
 */
@Controller
public class SlownikiController {
    
    KlienciSlownikDao ksDao = new KlienciSlownikDao();
    
    @RequestMapping(value = "slowniki.do", method = RequestMethod.GET)
    public String toListaUmow(Model model, Principal p) throws SQLException{ 
        String login = p.getName();        
        model.addAttribute("nowyKlient", new KlienciSlownik());
        model.addAttribute("login", login);
        return "slowniki";
    }
    
    @RequestMapping(value = "dodaj-klienta.do", method = RequestMethod.POST)
    public String dodajAgencjeSlownik(KlienciSlownik ks, Principal p) {
        String login = p.getName();
        ksDao.save(ks.getNazwaKlienta(), login);
        return "redirect: slowniki.do";
    }
    
    @RequestMapping(value = "usun-klienta.do", method = RequestMethod.GET)
    public String usunOrganizatoraSlownik(@RequestParam int id, Principal p) throws SQLException{ 
        String login = p.getName();
        ksDao.delete(id, login);
        return "redirect: slowniki.do";
    }

}
