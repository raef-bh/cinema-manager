package com.spring.demo.Controller;

import com.spring.demo.Model.Cinema;
import com.spring.demo.Repository.RoomRepo;
import com.spring.demo.Service.CinemaService;
import com.spring.demo.Service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/apiCinema")
public class CinemaController {

    @Autowired
    public CinemaService cinemaService;

    @Autowired
    public RoomService roomService;


    @GetMapping("/all")
    public String getAllCinema(Model m) {
        List<Cinema> cinema = cinemaService.getAllCinema();
        m.addAttribute("CinemaList", cinema);

        return "CinemaVue";
    }

    @GetMapping("/addCinema")
    public String add( Model m) {
        return "CinemaForm";
    }

    @PostMapping("/addCinema")
    public String addCinema(@Valid Cinema cinema, Model m) {
        cinemaService.addCinema(cinema);
        return "redirect:/apiCinema/all";
    }

    @GetMapping("/deleteCinema/{id}")
    public String deleteCinema(@PathVariable int id) {
        cinemaService.deleteCinema(id);
        return "redirect:/apiCinema/all";
    }

    @GetMapping("/updateCinema/{id}")
    public String updateCinema(Model m,@PathVariable int id) {
        m.addAttribute("cinema",cinemaService.getCinemaById(id));
        return "CinemaForm";
    }

    @GetMapping("/findByMc")
    public String find(@RequestParam String mc, Model m) {
        List<Cinema> cinema = cinemaService.findByName(mc);
        m.addAttribute("CinemaList", cinema);
        return "CinemaVue";
    }

}
