package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import place.to.time.model.Role;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
@Transactional
public interface RoleRepository extends JpaRepository<Role, Long> {
}

