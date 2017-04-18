package place.to.time.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import place.to.time.application.LatLng;
import place.to.time.service.LatLngService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


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

        stringBuilder.append("\'{");
        for(LatLng latLng: latLngService.getLatLng()) {
            stringBuilder.append(latLng +",");
        }
        stringBuilder.deleteCharAt(stringBuilder.toString().length()-1);
        stringBuilder.append("}\'");
        ModelAndView modelAndView = new ModelAndView("map", "getLatLng", stringBuilder.toString() );

        return modelAndView;
    }



    @RequestMapping("/getLatLng")
    public void getLatLng(HttpServletRequest request, HttpServletResponse response) {

        StringBuilder stringBuilder = new StringBuilder();

        stringBuilder.append("\'{");
        for(LatLng latLng: latLngService.getLatLng()) {
            stringBuilder.append(latLng +",");
        }
        stringBuilder.deleteCharAt(stringBuilder.toString().length()-1);
        stringBuilder.append("}\'");

        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(stringBuilder.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



}
