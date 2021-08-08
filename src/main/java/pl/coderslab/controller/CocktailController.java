package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import pl.coderslab.entity.Card;
import pl.coderslab.entity.Cocktail;
import pl.coderslab.entity.User;
import pl.coderslab.jsonclasses.CocktailList;
import pl.coderslab.jsonclasses.Drink;
import pl.coderslab.repository.CardRepository;
import pl.coderslab.repository.CocktailRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("app/drink")
public class CocktailController {

    private final CocktailRepository cocktailRepository;
    private final CardRepository cardRepository;

    @ModelAttribute("alphabet")
    private List<String> alphabet() {
        List<String> alphabet = new ArrayList<>();
        for (int i = 49; i <= 57; i++) {
            if (i != 56) {
                alphabet.add(Character.toString(i));
            }
        }
        for (int i = 65; i <= 90; i++) {
            alphabet.add(Character.toString(i));
        }
        return alphabet;
    }

    @ModelAttribute("categories")
    public List<String> categories() {
        RestTemplate restTemplate = new RestTemplate();
        String resource = "https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list";
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        List<String> categories = new ArrayList<>();
        for (Drink drink : cocktailList.getDrinks()) {
            categories.add(drink.getStrCategory());
        }
        return categories;
    }

    @ModelAttribute("glasses")
    public List<String> glasses() {
        RestTemplate restTemplate = new RestTemplate();
        String resource = "https://www.thecocktaildb.com/api/json/v1/1/list.php?g=list";
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        List<String> glasses = new ArrayList<>();
        for (Drink drink : cocktailList.getDrinks()) {
            glasses.add(drink.getStrGlass());
        }
        return glasses;
    }

    @ModelAttribute("ingredients")
    public List<String> ingredients() {
        RestTemplate restTemplate = new RestTemplate();
        String resource = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list";
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        List<String> ingredients = new ArrayList<>();
        for (Drink drink : cocktailList.getDrinks()) {
            ingredients.add(drink.getStrIngredient1());
        }
        return ingredients;
    }

    public CocktailController(CocktailRepository cocktailRepository, CardRepository cardRepository) {
        this.cocktailRepository = cocktailRepository;
        this.cardRepository = cardRepository;
    }

    @GetMapping("/list")
    public String list(Model model) {
        RestTemplate restTemplate = new RestTemplate();
        String resource = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a";
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        model.addAttribute("cocktails", cocktailList);
        return "drinks/list";
    }

    @GetMapping("/list/search")
    public String listSearchByFirstLetter(
            @RequestParam(value = "fl", required = false) String fl,                  //first letter
            @RequestParam(value = "name", required = false) String name,              //name of cocktail
            Model model) {
        RestTemplate restTemplate = new RestTemplate();
        String resource = "";
        if (fl != null) {
            resource = String.format("https://www.thecocktaildb.com/api/json/v1/1/search.php?f=%s", fl);
        } else {
            resource = String.format("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=%s", name);
        }
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        model.addAttribute("cocktails", cocktailList);
        return "drinks/list";
    }

    @GetMapping("/list/filter")
    public String listFilter(
            @RequestParam(value = "ing", required = false) List<String> ing,          //ingredients
            @RequestParam(value = "glass", required = false) List<String> glass,      //glass type
            @RequestParam(value = "cat", required = false) List<String> cat,          //category
            @RequestParam(value = "alc", required = false) List<String> alc,          //alcohol content
            Model model) {
        RestTemplate restTemplate = new RestTemplate();
        String resource = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?";
        if (ing != null) {
            for (String s : ing) {
                resource = String.format(resource + "i=%s&", s);
            }
        }
        if (glass != null) {
            for (String s : glass) {
                resource = String.format(resource + "g=%s&", s);
            }
        }
        if (cat != null) {
            for (String s : cat) {
                resource = String.format(resource + "c=%s&", s);
            }
        }
        if (alc != null) {
            for (String s : alc) {
                resource = String.format(resource + "a=%s&", s);
            }
        }
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        model.addAttribute("cocktails", cocktailList);
        return "drinks/list";
    }

    @GetMapping("/show")
    public String showDrink(@RequestParam("drinkid") Long id, Model model) {
        RestTemplate restTemplate = new RestTemplate();
        String resource = String.format("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=%d", id);
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        model.addAttribute("cocktail", cocktailList);
        return "drinks/show";
    }

    //dodawanie nowego cocktailu do karty
    @GetMapping("/form")
    public String newCocktail(
            Model model,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        model.addAttribute("cocktail", new Cocktail());
        model.addAttribute("cards", cardRepository.findByUser((User) session.getAttribute("user")));
        return "drinks/form";
    }

    //edytowanie cocktailu w karcie
    @GetMapping("/form/{cardid}/{cocktailid}")
    public String newCocktail(
            @PathVariable("cardid") Long cardid,
            @PathVariable("cocktailid") Long id,
            Model model,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        model.addAttribute("cocktail", cocktailRepository.findById(id));
        model.addAttribute("card",cardRepository.findById(cardid).orElse(null));
        model.addAttribute("cards", cardRepository.findByUser((User) session.getAttribute("user")));
        return "drinks/formedit";
    }

    //edycja cocktailu w karcie
    @PostMapping("/edit")
    public String saveCocktail(
            @RequestParam("cardid") Long cardid,
            @Valid Cocktail cocktail, BindingResult result) {
        if (result.hasErrors()) {
            return "app/drink/form";
        }

        //nie ma potrzeby wyciągać jeszcze raz z bazy cocktailu i ustawiać mu wszsystkich pól, ponieważ
//        podczas edycji, do formularza jest przekazywany cocktail z bazy - 2 razy ta sama robota

        cocktailRepository.save(cocktail);
        return String.format("redirect:/app/card/%d/cocktails",cardid);
    }

    //dodawanie nowego cocktailu do karty
    @PostMapping("/form")
    public String editCocktail(
            @RequestParam("cardid") Long cardid,
            @Valid Cocktail cocktail, BindingResult result
    ) {
        if(result.hasErrors()){
            return "app/drink/form";
        }
        Card byId = cardRepository.findById(cardid).orElse(null);
        cocktailRepository.save(cocktail);
        if(!byId.getCocktails().contains(cocktail)){
            byId.addCocktail(cocktail);
        }
        cardRepository.save(byId);
        return String.format("redirect:/app/card/%d/cocktails",cardid);
    }

    @GetMapping("/del/{cardid}/{cocktailid}")
    public String deleteCocktail(
            @PathVariable("cardid") Long cardid,
            @PathVariable("cocktailid") Long cocktailid
    ) {
        Card byId = cardRepository.findById(cardid).orElse(null);
        byId.removeCocktail(cocktailRepository.findById(cocktailid).orElse(null));
        cardRepository.save(byId);
        return String.format("redirect:/app/card/%d/cocktails",cardid);
    }

}
