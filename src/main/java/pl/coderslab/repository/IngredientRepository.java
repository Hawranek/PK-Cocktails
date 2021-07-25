package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Ingredient;

public interface IngredientRepository extends JpaRepository<Ingredient,Long> {

}
