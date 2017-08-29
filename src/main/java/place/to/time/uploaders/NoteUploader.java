package place.to.time.uploaders;

import org.springframework.web.multipart.MultipartFile;
import java.util.List;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
 */
public class NoteUploader {

    private List<MultipartFile> files;
    private String userName;
    private String latitude;
    private String longitude;
    private String placeDescription;
    private String date;
    private String action;

    public NoteUploader() {
    }

    public NoteUploader(List<MultipartFile> files, String userName, String latitude,
                        String longitude, String placeDescription, String date,
                        String action) {
        this.files = files;
        this.userName = userName;
        this.latitude = latitude;
        this.longitude = longitude;
        this.placeDescription = placeDescription;
        this.date = date;
        this.action = action;
    }

    public List<MultipartFile> getFiles() {
        return files;
    }

    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
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
}
