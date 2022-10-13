package com.spring.demo.Repository;



import com.spring.demo.Model.Room;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface RoomRepo extends JpaRepository<Room, Integer> {

    List<Room> findByCinemaId(Integer id);
    
}
