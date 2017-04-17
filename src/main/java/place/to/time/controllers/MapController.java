package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.application.LatLng;
import place.to.time.service.LatLngService;

import javax.json.Json;
import javax.json.JsonArray;
import javax.json.JsonArrayBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by ENTITY on 4/15/2017.
 */
@Controller
public class MapController {

    @Autowired
    private LatLngService latLngService;

    @RequestMapping(method = RequestMethod.POST, value = "/map")
    public ModelAndView getMapPage(){
        JsonArrayBuilder builder = Json.createArrayBuilder();
        for(LatLng latLng : latLngService.getLatLng()){
            builder
                    .add(Json.createObjectBuilder()
                            .add("lat", latLng.getLat())
                            .add("lng", latLng.getLng()));
        }

        JsonArray result  = builder.build();
        ModelAndView modelAndView = new ModelAndView("map", "getJson",result );
        modelAndView.addObject("getLatLng", latLngService.getLatLng().toString());

        return modelAndView;
    }


    @RequestMapping("/getJson")
    public void getJson(HttpServletRequest request, HttpServletResponse response) {

        JsonArrayBuilder builder = Json.createArrayBuilder();
        for(LatLng latLng : latLngService.getLatLng()){
            builder
                    .add(Json.createObjectBuilder()
                            .add("lat", latLng.getLat())
                            .add("lng", latLng.getLng()));
        }

        JsonArray result  = builder.build();

        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(result.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/getLatLng")
    public void getLatLng(HttpServletRequest request, HttpServletResponse response) {

        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(latLngService.getLatLng().toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
