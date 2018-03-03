package place.to.time.model;


import javax.persistence.*;
import java.io.Serializable;
import java.sql.Timestamp;

/**
 * @author Nosenko Anatolii
 * @version 2.0 29 August 2017
 */
@Entity
@Table(name = "notes")
public class Note implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "userName")
    private String userName;

    @Column(name = "latitude")
    private String latitude;

    @Column(name = "longitude")
    private String longitude;

    @Column(name = "placeDescription")
    private String placeDescription;

    @Column(name = "date")
    private String date;

    @Column(name = "action")
    private String action;

    @Column(name = "note_time")
    private Timestamp note_time;

    public Note() {
    }

    public Note(String userName, String latitude, String longitude, String placeDescription,
                String date, String action, Timestamp note_time) {
        this.userName = userName;
        this.latitude = latitude;
        this.longitude = longitude;
        this.placeDescription = placeDescription;
        this.date = date;
        this.action = action;
        this.note_time = note_time;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getPlaceDescription() {
        return placeDescription;
    }

    public void setPlaceDescription(String placeDescription) {
        this.placeDescription = placeDescription;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Timestamp getNote_time() {
        return note_time;
    }

    public void setNote_time(Timestamp note_time) {
        this.note_time = note_time;
    }
}
