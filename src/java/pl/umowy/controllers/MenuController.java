package pl.umowy.controllers;

import java.security.Principal;
import java.sql.SQLException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Ada
 */
@Controller
public class MenuController {

    @RequestMapping(value = "start.do", method = RequestMethod.GET)
    public String start(Model model, Principal p) throws SQLException {
        String login = p.getName();
        model.addAttribute("login", login);
        return "start";
    }
    
    @RequestMapping(value = "o-aplikacji.do", method = RequestMethod.GET)
    public String toListaKlientow(Model model, Principal p){ 
        String login = p.getName();        
        model.addAttribute("login", login);
        return "info";
    }
    
}
