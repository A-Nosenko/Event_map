package place.to.time.application;



/**
 * Created by ENTITY on 4/14/2017.
 */
public class LatLng {

    private static int i = 0;
    private String lat;
    private String lng;
    private String Marker;

    @Override
    public String toString() {
        return "\"" + i++ + "__" + Marker + "\": {\"lat\": \"" + lat+"\", \"lng\": \""+ lng + "\"}";
        }
    public LatLng() {
    }

    public LatLng(String lat, String lng, String marker) {
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

    public static int getI() {
        return i;
    }

    public static void setI(int i) {
        LatLng.i = i;
    }
}
