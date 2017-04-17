package place.to.time.application;



/**
 * Created by ENTITY on 4/14/2017.
 */
public class LatLng {
    private static int KEY = 0;
    private String lat;
    private String lng;

    @Override
    public String toString() {
        return "{\"lat\": \"" + lat+"\", \"lng\": \""+ lng + "\"}";
        }

    public LatLng() {
    }

    public LatLng(String lat, String lng) {
        this.lat = lat;
        this.lng = lng;
    }

    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }
}
