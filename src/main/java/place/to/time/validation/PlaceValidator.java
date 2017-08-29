package place.to.time.validation;

/**
 * @version 2.0 29 August 2017
 * @author  Nosenko Anatolii
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
        } catch (NumberFormatException e){
            return false;
        }
        return result;
    }
}
