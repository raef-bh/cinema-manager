package com.spring.demo.Controller;

import com.spring.demo.Model.Movie;
import com.spring.demo.Service.MovieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/apiMovie")
public class MovieController {

    @Autowired
    public MovieService movieService;

    @GetMapping("/all")
    public String getAllCinema(Model m) {
        List<Movie> movie = movieService.getAllMovies();
        m.addAttribute("MovieList", movie);
        return "MovieVue";
    }

    @GetMapping("/addMovie")
    public String add(Model m) {
        m.addAttribute("movies",movieService.getAllMovies());
        return "MovieForm";
    }

    @PostMapping("/addMovie")
    public String addMovie(@Valid Movie movie, @RequestParam("file") MultipartFile file, Model m) throws IOException {
        Integer id = movie.getId();
        movieService.addMovie(movie, file);

        if (id != null) {
            return "redirect:/apiMovie/all";
        } else {
            m.addAttribute("message", "Success");
            return "MovieForm";
        }
    }

    @GetMapping("/deleteMovie/{id}")
    public String deleteMovie(@PathVariable int id) throws IOException {
        movieService.deleteMovie(id);
        return "redirect:/apiMovie/all";
    }

    @GetMapping("/updateMovie/{id}")
    public String updateMovie(Model m,@PathVariable int id) {
        m.addAttribute("movie",movieService.getMovieById(id));
        return "MovieForm";
    }

}
