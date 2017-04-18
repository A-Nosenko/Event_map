package place.to.time.application;



/**
 * Created by ENTITY on 4/14/2017.
 */
public class LatLng {

    private long id = 0;
    private String lat;
    private String lng;
    private String Marker;

    @Override
    public String toString() {
        return "\"" + id + "__" + Marker + "\": {\"id\": \"" + id + "\", \"lat\": \"" + lat+"\", \"lng\": \""+ lng + "\"}";
        }
    public LatLng() {
    }

    public LatLng(long id, String lat, String lng, String marker) {
        this.id = id;
        this.lat = lat;
        this.lng = lng;
        Marker = marker;
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

    public String getMarker() {
        return Marker;
    }

    public void setMarker(String marker) {
        Marker = marker;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }
}
