package place.to.time.model;

import javax.persistence.*;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
@Entity
@Table(name = "user_roles")
public class UserRole {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "user_id")
    private int user_id;

    @Column(name = "role_id")
    private int role_id;

    public UserRole() {
    }

    public UserRole(int user_id, int role_id) {
        this.user_id = user_id;
        this.role_id = role_id;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }
}
