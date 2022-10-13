package com.spring.demo.Controller;


import com.spring.demo.Model.Cinema;
import com.spring.demo.Model.Room;
import com.spring.demo.Service.CinemaService;
import com.spring.demo.Service.MovieService;
import com.spring.demo.Service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/apiRoom")
public class RoomController {

    @Autowired
    public RoomService roomService;

    @Autowired
    public MovieService movieService;

    @Autowired
    public CinemaService cinemaService;

    @GetMapping("/all")
    public String getAllRoom(Model m) {
        List<Room> room = roomService.getAllRooms();
        m.addAttribute("RoomList", room);
        m.addAttribute("cinemasLists",cinemaService.getAllCinema());
        return "RoomVue";
    }

    @GetMapping("/addRoom")
    public String add( Model m) {
        m.addAttribute("movie",movieService.getNotChecked());
        m.addAttribute("cinema",cinemaService.getAllCinema());
        return "RoomForm";
    }

    @PostMapping("/addRoom")
    public String addRoom(@Valid @ModelAttribute Room room, Model m) {

        Integer id = room.getId();
        roomService.addRoom(room);

        if (id != null) {
            return "redirect:/apiRoom/all";
        } else {
            m.addAttribute("message", "Success");
            m.addAttribute("movies", movieService.getNotChecked());
            m.addAttribute("cinemas", cinemaService.getAllCinema());
            return "redirect:/apiRoom/all";
        }
    }

    @GetMapping("/deleteRoom/{id}")
    public String deleteRoom(@PathVariable int id) throws IOException, InterruptedException {
        roomService.deleteRoom(id);
        return "redirect:/apiRoom/all";
    }

    @GetMapping("/updateRoom/{id}")
    public String updateRoom(Model m,@PathVariable int id) {
        m.addAttribute("room", roomService.getRoomById(id));
        m.addAttribute("movie", movieService.getNotChecked());
        m.addAttribute("cinema", cinemaService.getAllCinema());
        return "RoomForm";
    }

    @GetMapping("/RoomByCinema")
    public  String getRoomByCinema(@RequestParam ("cinema") int id, Model m){
        m.addAttribute("cinemasLists", cinemaService.getAllCinema());
        if(id == 0){
            m.addAttribute("list", roomService.getAllRooms());
            return "redirect:/apiRoom/all";
        } else{
            m.addAttribute("list",cinemaService.getCinemaById(id));
            m.addAttribute("cinema",cinemaService.getCinemaById(id).getName());
            return "RoomVue";
        }
    }
}
