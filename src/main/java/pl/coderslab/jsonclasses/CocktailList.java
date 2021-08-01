package pl.coderslab.jsonclasses;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@ToString
public class CocktailList implements Serializable {
    private List<Drink> drinks;

}
