package com.spring.demo.Repository;

import com.spring.demo.Model.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MovieRepo extends JpaRepository<Movie, Integer> {

    List<Movie> findByChecked(boolean mc);
}
