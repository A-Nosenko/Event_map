package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import place.to.time.model.Role;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
@Transactional
public interface RoleRepository extends JpaRepository<Role, Long> {
}

