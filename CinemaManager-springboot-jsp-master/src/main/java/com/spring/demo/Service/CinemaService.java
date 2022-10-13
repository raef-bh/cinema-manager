package com.spring.demo.Service;

import com.spring.demo.Model.Cinema;
import com.spring.demo.Repository.CinemaRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CinemaService {

    @Autowired
    public CinemaRepo cinemaRepo;

    public void addCinema(Cinema cinema){
        cinemaRepo.save(cinema);
    }

    public List<Cinema> getAllCinema(){
        return cinemaRepo.findAll();
    }

    public Cinema getCinemaById(int id){
        return cinemaRepo.findById(id).get();
    }

    public void deleteCinema(int id){
        cinemaRepo.deleteById(id);
    }

    public List<Cinema> findByName(String mc) {
        return cinemaRepo.findByName(mc);
    }

    public void updateCinema(Cinema cinema){
        cinemaRepo.save(cinema);
    }
}
