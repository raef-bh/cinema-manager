package com.spring.demo.Repository;

import com.spring.demo.Model.Cinema;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CinemaRepo extends JpaRepository<Cinema, Integer> {

    @Query("select c from Cinema c  where c.name like %:x%")
    List<Cinema> findByName(@Param("x") String mc);

}
