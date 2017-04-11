package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import place.to.time.model.Role;

/**
 * Created by ENTITY on 2/5/2017.
 */

@Transactional
public interface RoleRepository extends JpaRepository<Role, Long> {
    }
