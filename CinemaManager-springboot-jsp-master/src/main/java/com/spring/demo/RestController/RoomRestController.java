package com.spring.demo.RestController;

import com.spring.demo.Model.Cinema;
import com.spring.demo.Model.Room;
import com.spring.demo.Service.CinemaService;
import com.spring.demo.Service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/apiRestRoom")
public class RoomRestController {

    @Autowired
    RoomService roomService;

    @GetMapping("/all")
    public ResponseEntity<List<Room>> findAllCinema() {
        List<Room> allRooms = roomService.getAllRooms();
        return new ResponseEntity<>(allRooms, HttpStatus.OK);
    }

    @PostMapping("/add")
    public ResponseEntity<Room> addRoom(@RequestBody Room room){
        roomService.addRoom(room);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @PutMapping("/update")
    public ResponseEntity<Room> updateRoom(@RequestBody Room room){
        roomService.addRoom(room);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @DeleteMapping("delete/{id}")
    public ResponseEntity <?> deleteRoom (@PathVariable("id") Integer id) throws InterruptedException {
        roomService.deleteRoom(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
