package com.spring.demo.Service;

import com.spring.demo.Model.Movie;
import com.spring.demo.Repository.MovieRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Service
public class MovieService {

    @Autowired
    MovieRepo movieRepo;

    public void addMovie(Movie movie, MultipartFile file) throws IOException {
        String image;
        if(!file.getOriginalFilename().equals("")) {
            image = saveImage(file);
            movie.setImage(image);
        }
        movieRepo.save(movie);
    }

    public void addMovies(Movie movie){
        movieRepo.save(movie);
    }

    public List<Movie> getAllMovies() {
        return movieRepo.findAll();
    }

    public Movie getMovieById(int id) {
        return movieRepo.findById(id).get();
    }


    public void deleteImage(Integer id) throws IOException{
        Movie movie = movieRepo.getById(id);
        String c = System.getProperty("user.dir") + "/src/main/webapp/imagesData/";
        Path p = Paths.get(c,movie.getImage());
        Files.delete(p);
    }

    public  void deleteMovie(Integer id) throws  IOException{
        if(!movieRepo.getById(id).getImage().equals("")){
            deleteImage(id);
        }
        movieRepo.deleteById(id);
    }

    public String saveImage(MultipartFile file) throws IOException{
       String filename=file.getOriginalFilename();
       String tab[]=filename.split("\\.");
       String filenameModify=tab[0]+"_"+System.currentTimeMillis()+"."+tab[1];
       String c = System.getProperty("user.dir") + "/src/main/webapp/imagesData/";
       Path p = Paths.get(c,filenameModify);
       Files.write(p,file.getBytes());
       return filenameModify;
     }

    public byte[] getImage(int id) throws IOException{
        String photo = movieRepo.findById(id).get().getImage();
        File f = new File(System.getProperty("user.dir") + "/src/main/webapp");
        Path p = Paths.get(f+"/imagesData",photo);
        return Files.readAllBytes(p);
    }

    public List<Movie> getNotChecked() {
        return movieRepo.findByChecked(false);
    }
}
