package pl.coderslab.jsonclasses;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import pl.coderslab.entity.Cocktail;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Getter
@Setter
@ToString
public class Drink {
    private Long idDrink;
    private String strDrink;
    private String strDrinkAlternate;
    private String strTags;
    private String strVideo;
    private String strCategory;
    private String strIBA;
    private String strAlcoholic;
    private String strGlass;
    private String strInstructions;
    private String strInstructionsES;
    private String strInstructionsDE;
    private String strInstructionsFR;
    private String strInstructionsIT;
    private String strDrinkThumb;
    private String strIngredient1;
    private String strIngredient2;
    private String strIngredient3;
    private String strIngredient4;
    private String strIngredient5;
    private String strIngredient6;
    private String strIngredient7;
    private String strIngredient8;
    private String strIngredient9;
    private String strIngredient10;
    private String strIngredient11;
    private String strIngredient12;
    private String strIngredient13;
    private String strIngredient14;
    private String strIngredient15;
    private String strMeasure1;
    private String strMeasure2;
    private String strMeasure3;
    private String strMeasure4;
    private String strMeasure5;
    private String strMeasure6;
    private String strMeasure7;
    private String strMeasure8;
    private String strMeasure9;
    private String strMeasure10;
    private String strMeasure11;
    private String strMeasure12;
    private String strMeasure13;
    private String strMeasure14;
    private String strMeasure15;
    private String strImageSource;
    private String strImageAttribution;
    private String strCreativeCommonsConfirmed;

    public List<String> getIngredientList() {
        List<String> tmp = Arrays.asList(
                (strMeasure1 != null || strIngredient1 != null ? String.format("%s of %s", strMeasure1, strIngredient1) : null),
                (strMeasure2 != null || strIngredient2 != null ? String.format("%s of %s", strMeasure2, strIngredient2) : null),
                (strMeasure3 != null || strIngredient3 != null ? String.format("%s of %s", strMeasure3, strIngredient3) : null),
                (strMeasure4 != null || strIngredient4 != null ? String.format("%s of %s", strMeasure4, strIngredient4) : null),
                (strMeasure5 != null || strIngredient5 != null ? String.format("%s of %s", strMeasure5, strIngredient5) : null),
                (strMeasure6 != null || strIngredient6 != null ? String.format("%s of %s", strMeasure6, strIngredient6) : null),
                (strMeasure7 != null || strIngredient7 != null ? String.format("%s of %s", strMeasure7, strIngredient7) : null),
                (strMeasure8 != null || strIngredient8 != null ? String.format("%s of %s", strMeasure8, strIngredient8) : null),
                (strMeasure9 != null || strIngredient9 != null ? String.format("%s of %s", strMeasure9, strIngredient9) : null),
                (strMeasure10 != null || strIngredient10 != null ? String.format("%s of %s", strMeasure10, strIngredient10) : null),
                (strMeasure11 != null || strIngredient11 != null ? String.format("%s of %s", strMeasure11, strIngredient11) : null),
                (strMeasure12 != null || strIngredient12 != null ? String.format("%s of %s", strMeasure12, strIngredient12) : null),
                (strMeasure13 != null || strIngredient13 != null ? String.format("%s of %s", strMeasure13, strIngredient13) : null),
                (strMeasure14 != null || strIngredient14 != null ? String.format("%s of %s", strMeasure14, strIngredient14) : null),
                (strMeasure15 != null || strIngredient15 != null ? String.format("%s of %s", strMeasure15, strIngredient15) : null)
        );
        List<String> result = new ArrayList<>();
        for (String s : tmp) {
            if (s != null) {
                result.add(s);
            }
        }
        return result;
    }


    public Cocktail parseToCocktail() {
        Cocktail cocktail = new Cocktail();
        cocktail.setId(idDrink);
        cocktail.setName(strDrink);
        cocktail.setCategory(strCategory);
        cocktail.setAlcoholic(strAlcoholic.equals("Alcoholic"));
        cocktail.setGlass(strGlass);
        cocktail.setInstructions(strInstructions);
        cocktail.setDrinkThumb(strDrinkThumb);
        for (String s : getIngredientList()) {
            if (cocktail.getIngredientList() != null) {
                cocktail.setIngredientList(String.format("%s,\n%s", cocktail.getIngredientList(), s));
            } else {
                cocktail.setIngredientList(s);
            }
        }
        cocktail.setImageSource(strImageSource);
        return cocktail;
    }


}
