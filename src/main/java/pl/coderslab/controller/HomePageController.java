package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.entity.Card;
import pl.coderslab.entity.Cocktail;
import pl.coderslab.entity.Ingredient;
import pl.coderslab.entity.User;

@Controller
public class HomePageController {

    @RequestMapping("/")
    private String home(Model model){
        User user = new User();
        Cocktail cocktail = new Cocktail();
        Ingredient ingredient = new Ingredient();
        Card card = new Card();
        model.addAttribute("user",user);
        model.addAttribute("cocktail",cocktail);
        model.addAttribute("ingredient",ingredient);
        model.addAttribute("card",card);
        return "home/home";
    }
}
