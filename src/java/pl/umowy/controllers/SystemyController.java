package pl.umowy.controllers;

import java.security.Principal;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.umowy.dao.KlienciSlownikDao;
import pl.umowy.dao.SystemyDao;
import pl.umowy.models.Systemy;

/**
 *
 * @author Ada
 */
@Controller
public class SystemyController {
    
    SystemyDao sDao = new SystemyDao();
    KlienciSlownikDao ksDao = new KlienciSlownikDao();
    
    @RequestMapping(value = "lista-systemow.do", method = RequestMethod.GET)
    public String listaSystemow(Model model, Principal p){ 
        String login = p.getName();
        model.addAttribute("login", login);
        model.addAttribute("nowySystem", new Systemy());
        model.addAttribute("listaKlientow", ksDao.getAll());
        return "lista-systemow";
    }
    
    @RequestMapping(value = "podglad-systemu.do", method = RequestMethod.GET)
    public String podgladSystemu(@RequestParam int id, Model model, Principal p) throws SQLException{
        String login = p.getName();
        Systemy s = sDao.getById(id);
        model.addAttribute("system", s);
        model.addAttribute("login", login);
        model.addAttribute("listaKlientow", ksDao.getAll());
        return "podglad-systemu";
    }

    @RequestMapping(value = "dodaj-system.do", method = RequestMethod.POST)
    private String zapiszDodawanieSystemu(Systemy system, Principal p){
        String login = p.getName();
        sDao.save(system, login);
        return "redirect: lista-systemow.do";
    }
}
