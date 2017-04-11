package place.to.time.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

/**
 * Created by ENTITY on 2/5/2017.
 */

@Entity
@Table(name = "roles")
public class Role implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "role")
    private String role;

    @ManyToMany(mappedBy = "roles")
    private Set<place.to.time.model.User> users;

    public Role() {}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Set<place.to.time.model.User> getUsers() {
        return users;
    }

    public void setUsers(Set<place.to.time.model.User> users) {
        this.users = users;
    }


}
