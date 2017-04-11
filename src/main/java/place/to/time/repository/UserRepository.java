package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import place.to.time.model.User;

/**
 * Created by ENTITY on 2/5/2017.
 */

@Transactional
public interface UserRepository extends JpaRepository<User, Long> {

    User findByLogin(String login);
    User findByEmail(String email);
}
