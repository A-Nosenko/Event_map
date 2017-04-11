package place.to.time.uploaders;

import org.springframework.web.multipart.MultipartFile;

/**
 * Created by ENTITY on 4/2/2017.
 */
public class AccountUploader {

    private String userName;
    private MultipartFile file;

    public AccountUploader() {
    }

    public AccountUploader(String userName, MultipartFile file) {
        this.userName = userName;
        this.file = file;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
