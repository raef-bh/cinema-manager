package com.spring.demo.Service;

import com.spring.demo.Model.Movie;
import com.spring.demo.Model.Room;
import com.spring.demo.Repository.RoomRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomService {

    @Autowired
    public RoomRepo roomRepo;

    @Autowired
    public  MovieService movieService;

    public void addRoom(Room room){
        roomRepo.save(room);
        Movie m = movieService.getMovieById(room.getMovie().getId());
        m.setChecked(true);
        movieService.addMovies(m);
    }

    public List<Room> getAllRooms(){
        return roomRepo.findAll();
    }

    public Room getRoomById(int id){
        return roomRepo.findById(id).get();
    }

    public void deleteRoom(int id){
        roomRepo.deleteById(id);
    }


    public List<Room> getByCinemaId(Integer id){
        return roomRepo.findByCinemaId(id);
    }
}
