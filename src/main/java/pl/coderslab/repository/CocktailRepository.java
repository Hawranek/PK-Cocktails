package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Cocktail;

import java.util.List;

public interface CocktailRepository extends JpaRepository<Cocktail, Long> {
    Cocktail findByName(String name);
    List<Cocktail> findByAlcoholicIsTrue();
    List<Cocktail> findByAlcoholicIsFalse();
}
