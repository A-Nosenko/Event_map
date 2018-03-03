package place.to.time.controllers;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import place.to.time.application.LatLng;
import place.to.time.service.LatLngService;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Anatolii Nosenko
 * @version 1.0 3/3/2018.
 */

@RestController
public class JSON_RestController {

    @Autowired
    private LatLngService latLngService;

    @RequestMapping(value = "/getLatLngTest",
            produces = MediaType.APPLICATION_JSON_VALUE)
    public JSONObject getLatLngTest() {

        JSONObject jsonObject = new JSONObject();
        for (LatLng latLng : latLngService.getLatLng()) {

            Map<String, String> values = new HashMap<>();
            values.put("Marker", latLng.getMarker());
            values.put("lat", latLng.getLat());
            values.put("lng", latLng.getLng());

            jsonObject.put("" + latLng.getId(), values);
        }
        return jsonObject;
    }
}
