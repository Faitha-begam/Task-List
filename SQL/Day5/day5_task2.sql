CREATE DATABASE CinemaDB;
USE CinemaDB;
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);
INSERT INTO Genres VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Horror'),
(5, 'Sci-Fi');
CREATE TABLE Directors (
    director_id INT PRIMARY KEY,
    director_name VARCHAR(100)
);
INSERT INTO Directors VALUES
(101, 'Lokesh Kanagaraj'),
(102, 'Atlee'),
(103, 'Mani Ratnam'),
(104, 'Shankar'),
(105, 'Nelson Dilipkumar');
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100),
    genre_id INT,
    director_id INT,
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id)
);
INSERT INTO Movies VALUES
(1, 'Leo', 1, 101),
(2, 'Jailer', 1, 105),
(3, 'Enthiran', 5, 104),
(4, 'Ponniyin Selvan', 3, 103),
(5, 'Bigil', 1, 102);

CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    actor_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50)
);
INSERT INTO Actors VALUES
(201, 'Vijay', 50, 'Male', 'Chennai'),
(202, 'Rajinikanth', 74, 'Male', 'Chennai'),
(203, 'Kamal Haasan', 71, 'Male', 'Chennai'),
(204, 'Suriya', 50, 'Male', 'Coimbatore'),
(205, 'Ajith Kumar', 54, 'Male', 'Chennai'),
(206, 'Nayanthara', 41, 'Female', 'Chennai'),
(207, 'Trisha Krishnan', 43, 'Female', 'Chennai'),
(208, 'Sai Pallavi', 34, 'Female', 'Coimbatore'),
(209, 'Sivakarthikeyan', 40, 'Male', 'Trichy'),
(210, 'Dhanush', 43, 'Male', 'Chennai');
SELECT Movies.movie_name,Genres.genre_name FROM Movies INNER JOIN Genres ON Movies.genre_id = Genres.genre_id;
SELECT Movies.movie_name,Directors.director_name FROM Movies INNER JOIN Directors ON Movies.director_id = Directors.director_id;
SELECT Movies.movie_name,Actors.actor_name FROM Movies INNER JOIN Movies ON Movies.director_id = Directors.director_id;