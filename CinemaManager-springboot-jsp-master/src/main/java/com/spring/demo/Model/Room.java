package com.spring.demo.Model;

import lombok.*;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer roomNumber;
    private Integer placesCount;

    @ManyToOne
    private Cinema cinema;

    @OneToOne(cascade=CascadeType.ALL)
    @JoinColumn(name = "movieId", nullable = false)
    private Movie movie;
}
