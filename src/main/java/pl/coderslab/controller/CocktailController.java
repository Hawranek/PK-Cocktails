package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import pl.coderslab.jsonclasses.CocktailList;
import pl.coderslab.repository.CocktailRepository;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("app/drink")
public class CocktailController {

    private final CocktailRepository cocktailRepository;

    @ModelAttribute("alphabet")
    private List<String> alphabet() {
        List<String> alphabet = new ArrayList<>();
        for (int i = 65; i <= 90; i++) {
            alphabet.add(Character.toString(i));
        }
        return alphabet;
    }

    ;


    public CocktailController(CocktailRepository cocktailRepository) {
        this.cocktailRepository = cocktailRepository;
    }

    @GetMapping("/list")
    public String list(Model model) {
        RestTemplate restTemplate = new RestTemplate();
        String resource = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a";
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        model.addAttribute("cocktails", cocktailList);
        return "drinks/cardcocktails";
    }

    @GetMapping("/list/letter")
    public String listByLetter(@RequestParam("search") String litera, Model model) {
        RestTemplate restTemplate = new RestTemplate();
        String resource = String.format("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=%s", litera);
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        model.addAttribute("cocktails", cocktailList);
        return "drinks/cardcocktails";
    }

    @GetMapping("/show")
    public String showDrink(@RequestParam("drinkid") Long id, Model model) {
        RestTemplate restTemplate = new RestTemplate();
        String resource = String.format("www.thecocktaildb.com/api/json/v1/1/lookup.php?i=%s", id);
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        model.addAttribute("cocktail", cocktailList);
        return "drinks/show";
    }

}
