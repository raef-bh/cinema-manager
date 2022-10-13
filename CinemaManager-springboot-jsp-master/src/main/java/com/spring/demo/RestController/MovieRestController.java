package com.spring.demo.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.demo.Model.Movie;
import com.spring.demo.Service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/apiRestMovie")
public class MovieRestController {

        @Autowired
        public MovieService movieService;

        @PostMapping("/add")
        public ResponseEntity<Movie> addMovie(@RequestParam("movie") String m,
                                              @RequestParam("file") MultipartFile file) throws IOException {
            Movie movie = new ObjectMapper().readValue(m, Movie.class);
            movieService.addMovie(movie, file);
            return new ResponseEntity<>(movie, HttpStatus.CREATED);
        }

        @PutMapping("/update")
        public ResponseEntity<Movie> updateMovie(@RequestParam("movie") String m,
                                                 @RequestParam("file") MultipartFile file) throws IOException {
            Movie movie = new ObjectMapper().readValue(m, Movie.class);
            movieService.addMovie(movie, file);
            return new ResponseEntity<>(movie, HttpStatus.CREATED);
        }

        @DeleteMapping("/delete/{id}")
        public ResponseEntity<?> deleteMovie(@PathVariable("id") Integer id) throws IOException {
            movieService.deleteMovie(id);
            return new ResponseEntity<>(id, HttpStatus.OK);
        }

        @GetMapping("/all")
        public ResponseEntity<List<Movie>> findAllMovie() {
            List<Movie> allMovies = movieService.getAllMovies();
            return new ResponseEntity<>(allMovies, HttpStatus.OK);
        }

        @GetMapping(path = "/getImage/{id}", produces = MediaType.IMAGE_JPEG_VALUE)
        public byte[] getFile(@PathVariable("id") Integer id) throws IOException {
            return movieService.getImage(id);
        }
    }

