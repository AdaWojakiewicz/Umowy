package pl.umowy.controllers;

import java.security.Principal;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.umowy.dao.UmowyDao;
import pl.umowy.models.Umowy;

/**
 *
 * @author Ada
 */
@Controller
public class UmowyController {

    UmowyDao uDao = new UmowyDao();
    
    @RequestMapping(value = "anuluj-umowe.do", method = RequestMethod.GET)
    public String anulujUmowe(@RequestParam int id, Principal p) throws SQLException {
        String login = p.getName();
        uDao.deaktywuj(id, login);
        return "redirect: lista-umow.do";
    }

    @RequestMapping(value = "dodaj-umowe.do", method = RequestMethod.GET)
    public String dodajUmowe(Model model, Principal p) throws SQLException {
        String login = p.getName();
        model.addAttribute("umowy", new Umowy());
        model.addAttribute("login", login);
        return "umowa";
    }

    @RequestMapping(value = "zapisz-dodawanie-umowy.do", method = RequestMethod.POST)
    private String zapiszDodawanieUmowy(Umowy umowy, Principal p){
        String login = p.getName();
        uDao.save(umowy, login);
        return "redirect: lista-umow.do";
    }
    
    @RequestMapping(value = "edytuj-umowe.do", method = RequestMethod.GET)
    public String edytujUmowe(Model model, @RequestParam int id, Principal p) throws SQLException {
        String login = p.getName();
        Umowy umowy = uDao.getById(id);  
        model.addAttribute("umowy", umowy);
        model.addAttribute("login", login);
        return "edytuj-umowe";
    }

    @RequestMapping(value = "zapisz-edycje-umowy.do", method = RequestMethod.POST)
    private String zapiszEdycjeUmowy(Umowy umowy, Principal p){
        String login = p.getName();
        uDao.update(umowy, login);
        return "redirect: lista-umow.do";
    }

    @RequestMapping(value = "lista-umow.do", method = RequestMethod.GET)
    public String toListaUmow(Model model, Principal p) throws SQLException {
        String login = p.getName();
        model.addAttribute("login", login);
        return "lista-umow";
    }
    
}
