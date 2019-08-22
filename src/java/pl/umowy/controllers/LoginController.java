
package pl.umowy.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Ada
 */
@Controller
public class LoginController {
    
    @RequestMapping(value="/login.do")
    public String show(Model model){
        return "login";
    }
}
