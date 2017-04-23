package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.application.LatLng;
import place.to.time.service.LatLngService;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;

/**
 * Created by ENTITY on 4/15/2017.
 */
@Controller
public class MapController {

    @Autowired
    private LatLngService latLngService;

    @RequestMapping(method = RequestMethod.POST, value = "/map")
    public ModelAndView getMapPage(){

        StringBuilder stringBuilder = new StringBuilder();

        stringBuilder.append("'{");
        for(LatLng latLng: latLngService.getLatLng()) {
            stringBuilder.append(latLng +",");
        }
        stringBuilder.deleteCharAt(stringBuilder.toString().length()-1);
        stringBuilder.append("}'");
        ModelAndView modelAndView = new ModelAndView("map", "markers", stringBuilder.toString());
        modelAndView.addObject("json", new Gson().toJson(latLngService.getLatLng()));

        JSONObject jsonObject = new JSONObject();
        for(LatLng latLng: latLngService.getLatLng()){

            Map <String, String> values = new HashMap<>();
            values.put("Marker", latLng.getMarker());
            values.put("lat", latLng.getLat());
            values.put("lng", latLng.getLng());

            jsonObject.put("" + latLng.getId(), values);
        }

        modelAndView.addObject("JSONObject", jsonObject);
        return modelAndView;
    }


    @RequestMapping("/getLatLngTest")
    public JSONObject getLatLngTest() {

        JSONObject jsonObject = new JSONObject();
        for(LatLng latLng: latLngService.getLatLng()){

            Map <String, String> values = new HashMap<>();
            values.put("Marker", latLng.getMarker());
            values.put("lat", latLng.getLat());
            values.put("lng", latLng.getLng());

            jsonObject.put("" + latLng.getId(), values);
        }
        return jsonObject;
    }


}
