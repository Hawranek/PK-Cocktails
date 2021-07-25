package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.entity.User;
import pl.coderslab.repository.UserRepository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Optional;

@Controller
public class UserController {

    private final UserRepository userRepository;

    public UserController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping("/login")
    public String form(Model model) {
        model.addAttribute("user", new User());
        return "user/login";
    }

    @PostMapping("/login")
    public String login(@Valid User user, BindingResult result, HttpServletResponse response, HttpServletRequest request) {
        if (result.hasErrors()) {
            return "user/login";
        }
        if (userRepository.findByEmail(user.getEmail()) != null && userRepository.findByEmail(user.getEmail()).getPassword().equals(user.getPassword())) {
            User sessionUser = userRepository.findByEmail(user.getEmail());
            HttpSession session = request.getSession();
            session.setAttribute("user", sessionUser);
            return "redirect:/";
        } else {
            return "redirect:/login";
        }
    }

    @GetMapping("/form")
    public String regForm(Model model) {
        model.addAttribute("user", new User());
        return "/user/form";
    }

    @GetMapping("/form/{id}")
    public String update(@PathVariable Long id, Model model) {
        Optional<User> byId = userRepository.findById(id);
        model.addAttribute("user", byId);
        return "user/form";
    }

    @PostMapping("/form")
    public String register(@Valid User user, BindingResult result) {
        if (result.hasErrors()) {
            return "/form";
        }
        userRepository.save(user);
        return "redirect:/";
    }
}
