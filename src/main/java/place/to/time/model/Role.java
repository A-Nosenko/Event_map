package place.to.time.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
@Entity
@Table(name = "roles")
public class Role implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "role")
    private String role;

    public String toString(){
        return role;
    }

    public Role() {}

    public Role(String role){
        this.role = role;
    }

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

}
