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
import pl.coderslab.repository.CardRepository;
import pl.coderslab.repository.CocktailRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/app/card")
public class CardController {

    private final CardRepository cardRepository;
    private final CocktailRepository cocktailRepository;

    @ModelAttribute("user")
    public User user(HttpServletRequest request) {
        return (User) request.getSession().getAttribute("user");
    }

    public CardController(CardRepository cardRepository, CocktailRepository cocktailRepository) {
        this.cardRepository = cardRepository;
        this.cocktailRepository = cocktailRepository;
    }

    @RequestMapping("/all")
    public String list(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("cards", cardRepository.findByUser((User) session.getAttribute("user")));
        List<Card> user = cardRepository.findByUser((User) session.getAttribute("user"));
        return "cards/list";
    }

    @GetMapping("/form")
    public String form(Model model, HttpServletRequest request) {
        Card card = new Card();
        HttpSession session = request.getSession();
        card.setUser((User) session.getAttribute("user"));
        model.addAttribute("card", card);
        return "cards/form";
    }

    @GetMapping("/form/{id}")
    public String edit(@PathVariable Long id, Model model) {
        Card card = cardRepository.getById(id);
        model.addAttribute("card", card);
        return "cards/form";
    }

    @PostMapping("/form")
    public String addingCard(@Valid Card card, BindingResult result) {
        if (result.hasErrors()) {
            return "cards/form";
        }

        cardRepository.save(card);
        return "redirect:/app/card/all";
    }

    @GetMapping("/del/{id}")
    public String delete(@PathVariable Long id) {
        cardRepository.deleteById(id);
        return "redirect:/app/card/all";
    }

    @RequestMapping("/{id}/cocktails")
    public String cocktailList(@PathVariable Long id, Model model) {
        Card byId = cardRepository.findById(id).orElse(null);
        model.addAttribute("card", byId);
        model.addAttribute("cocktails", byId.getCocktails());
        return "drinks/cardcocktails";
    }

    @GetMapping("/addtocard/{drinkid}")
    public String addToCard(@PathVariable("drinkid") Long id, Model model, HttpServletRequest request) {
        RestTemplate restTemplate = new RestTemplate();
        String resource = String.format("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=%d", id);
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        Cocktail cocktail = cocktailList.getDrinks().get(0).parseToCocktail();
        List<Card> cardsByUser = cardRepository.findByUser(user(request));
        //dodanie usera do modelu? niby jest w modelu servletu..
        //dodanie kart do modelu? - DODANE

        model.addAttribute("cocktail", cocktail);
        model.addAttribute("cards",cardsByUser);
        return "drinks/addtocard";
    }

    @PostMapping("/addtocard")
    public String add(
            @RequestParam("drinkid") Long drinkId,
            @RequestParam("cardid") Long id
            ) {
        Card byId = cardRepository.findById(id).orElse(null);
        RestTemplate restTemplate = new RestTemplate();
        String resource = String.format("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=%d", drinkId);
        CocktailList cocktailList = restTemplate.getForObject(resource, CocktailList.class);
        Cocktail cocktail = cocktailList.getDrinks().get(0).parseToCocktail();
        List<Cocktail> tmplist;
        if (byId.getCocktails() == null) {
            tmplist = new ArrayList<>();
        }else {
            tmplist = byId.getCocktails();
        }
        tmplist.add(cocktail);
        byId.setCocktails(tmplist);
//        cocktailRepository.save(cocktail);
        cardRepository.save(byId);
        return "redirect:/app/card/all";
    }
}
