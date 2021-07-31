package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.entity.Card;
import pl.coderslab.entity.User;
import pl.coderslab.repository.CardRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/app/card")
public class CardController {

    private final CardRepository cardRepository;

    @ModelAttribute("user")
    public User user(HttpServletRequest request){return (User) request.getSession().getAttribute("user");}

    public CardController(CardRepository cardRepository) {
        this.cardRepository = cardRepository;
    }

    @RequestMapping("/all")
    public String list(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        model.addAttribute("user",session.getAttribute("user"));
        model.addAttribute("cards",cardRepository.findByUser((User) session.getAttribute("user")));
        List<Card> user = cardRepository.findByUser((User) session.getAttribute("user"));
        return "cards/list";
    }

    @GetMapping("/form")
    public String form(Model model,HttpServletRequest request){
        Card card = new Card();
        HttpSession session=request.getSession();
        card.setUser((User) session.getAttribute("user"));
        model.addAttribute("card",card);
        return "cards/form";
    }

    @GetMapping("/form/{id}")
    public String edit(@PathVariable Long id, Model model){
        Card card = cardRepository.getById(id);
        model.addAttribute("card",card);
        return "cards/form";
    }

    @PostMapping("/form")
    public String addingCard(@Valid Card card, BindingResult result){
        if (result.hasErrors()){
            return "cards/form";
        }

        cardRepository.save(card);
        return "redirect:/app/card/all";
    }

    @GetMapping("/del/{id}")
    public String delete(@PathVariable Long id){
        cardRepository.deleteById(id);
        return "redirect:/app/card/all";
    }

    @RequestMapping("/{id}/cocktails")
    public String cocktailList(@PathVariable Long id, Model model){
        Card byId = cardRepository.findById(id).orElse(null);
        model.addAttribute("card",byId);
        model.addAttribute("cocktails",byId.getCocktails());
        return "/drinks/cardcocktails";
    }
}
