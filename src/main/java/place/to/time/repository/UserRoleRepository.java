package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import place.to.time.model.UserRole;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public interface UserRoleRepository extends JpaRepository<UserRole, Long> {

    @Modifying
    @Query("UPDATE UserRole a SET a.role_id = 3 WHERE a.user_id = :id")
    void ban(@Param("id")int id);

    @Modifying
    @Query("UPDATE UserRole a SET a.role_id = 1 WHERE a.user_id = :id")
    void unBan(@Param("id")int id);
}