package pl.coderslab.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.jsonclasses.Drink;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "cocktails")
@Getter
@Setter
@ToString
public class Cocktail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String category;
    private Boolean alcoholic;
    private String glass;
    private String instructions;
    @Size(max = 255)
    private String drinkThumb;
    private String imageSource;
    private String ingredientList;
}
