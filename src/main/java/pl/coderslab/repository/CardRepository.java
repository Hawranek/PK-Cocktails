package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.entity.Card;
import pl.coderslab.entity.User;

import java.util.List;

public interface CardRepository extends JpaRepository<Card,Long> {
    List<Card> findByUser(User user);
}
