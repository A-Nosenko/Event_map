package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;
import place.to.time.model.User;

import java.util.List;

/**
 * Created by ENTITY on 2/5/2017.
 */

@Transactional
public interface UserRepository extends JpaRepository<User, Long> {

    User findByLogin(String login);
    User findByEmail(String email);
    @Query("SELECT user FROM User user")
    List<User> getAllUsers();
}
