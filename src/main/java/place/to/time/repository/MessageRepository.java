package place.to.time.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import place.to.time.model.Message;

import java.util.List;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
public interface MessageRepository extends JpaRepository<Message, Long> {
    @Query("SELECT m FROM Message m WHERE (m.userNameFrom = :userNameFrom OR m.userNameFrom = :userNameTo) AND (m.userNameTo = :userNameTo OR m.userNameTo = :userNameFrom) ORDER BY m.messageTime DESC ")
    List<Message> getDialog(@Param("userNameFrom") String userNameFrom, @Param("userNameTo") String userNameTo);

    @Query("SELECT m FROM Message m WHERE m.userNameFrom = :userName OR m.userNameTo = :userName ORDER BY m.messageTime DESC ")
    List<Message> getMessages(@Param("userName") String userName);
}

