package place.to.time.validation;

/**
 * Created by ENTITY on 3/29/2017.
 */
public class PlaceValidator {
    public static boolean validate(String latitude, String longitude){
        boolean result = false;
        try{
        Double DLatitude = new Double(latitude);
        Double DLongitude = new Double(longitude);

        if(DLatitude >= -90.0 && DLatitude <= 90.0 && DLongitude >= -180.0 && DLongitude <= 180.0){
            result = true;
            }
        } catch (NumberFormatException e){return false;}
        return result;
    }
}
