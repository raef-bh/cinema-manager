package com.spring.demo.RestController;


import com.spring.demo.Model.Cinema;
import com.spring.demo.Service.CinemaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/apiRestCinema")
public class CinemaRestController {

    @Autowired
    CinemaService cinemaService;

    @GetMapping("/all")
    public ResponseEntity<List<Cinema>> findAllCinema() {
        List<Cinema> allCinema = cinemaService.getAllCinema();
        return new ResponseEntity<>(allCinema, HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<Cinema> addCinema(@RequestBody Cinema cinema){
        cinemaService.addCinema(cinema);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/update")
    public ResponseEntity<Cinema> updateCinema(@RequestBody Cinema cinema){
        cinemaService.addCinema(cinema);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @DeleteMapping("delete/{id}")
    public ResponseEntity <?> deleteCinema (@PathVariable("id") Integer id) {
        cinemaService.deleteCinema(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
