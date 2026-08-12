CREATE DATABASE CinemaBooking;
USE CinemaBooking;
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL
);
CREATE TABLE Directors (
    director_id INT PRIMARY KEY,
    director_name VARCHAR(100) NOT NULL
);
CREATE TABLE Actors (
    actor_id INT PRIMARY KEY,
    actor_name VARCHAR(100) NOT NULL
);
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100) NOT NULL,
    genre_id INT,
    director_id INT,
    actor_id INT,
    
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id),
    FOREIGN KEY (director_id) REFERENCES Directors(director_id),
    FOREIGN KEY (actor_id) REFERENCES Actors(actor_id)
);
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15)
);
CREATE TABLE Theaters (
    theater_id INT PRIMARY KEY,
    theater_name VARCHAR(100) NOT NULL
);
CREATE TABLE Screens (
    screen_id INT PRIMARY KEY,
    theater_id INT,
    screen_number INT,
    
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id)
);
CREATE TABLE Shows (
    show_id INT PRIMARY KEY,
    movie_id INT,
    theater_id INT,
    screen_id INT,
    show_time DATETIME,
    
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (theater_id) REFERENCES Theaters(theater_id),
    FOREIGN KEY (screen_id) REFERENCES Screens(screen_id)
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    show_id INT,
    
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);
CREATE TABLE Tickets (
    ticket_id INT PRIMARY KEY,
    booking_id INT,
    seat_number VARCHAR(10),
    ticket_price DECIMAL(10,2),
    
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
INSERT INTO Genres VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Drama'),
(4, 'Thriller'),
(5, 'Romance');

INSERT INTO Directors VALUES
(1, 'Lokesh Kanagaraj'),
(2, 'Atlee'),
(3, 'Mani Ratnam'),
(4, 'Vetrimaaran'),
(5, 'Gautham Vasudev Menon');

INSERT INTO Actors VALUES
(1, 'Vijay'),
(2, 'Suriya'),
(3, 'Dhanush'),
(4, 'Ajith Kumar'),
(5, 'Karthi'),
(6, 'Unused Actor');

INSERT INTO Movies VALUES
(1, 'Leo', 1, 1, 1),
(2, 'Mersal', 2, 2, 1),
(3, 'Vikram', 1, 1, 2),
(4, 'Vada Chennai', 3, 4, 3),
(5, '96', 5, 3, 5);

INSERT INTO Customers VALUES
(1, 'Arun', '9876543210'),
(2, 'Priya', '9876543211'),
(3, 'Karthik', '9876543212'),
(4, 'Divya', '9876543213'),
(5, 'Rahul', '9876543214');

INSERT INTO Theaters VALUES
(1, 'PVR Cinemas'),
(2, 'INOX'),
(3, 'Rohini Theatre');

INSERT INTO Screens VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 1),
(4, 3, 1);

INSERT INTO Shows VALUES
(1, 1, 1, 1, '2026-08-12 10:00:00'),
(2, 2, 1, 2, '2026-08-12 14:00:00'),
(3, 3, 2, 3, '2026-08-12 18:00:00'),
(4, 4, 3, 4, '2026-08-13 20:00:00'),
(5, 5, 2, 3, '2026-08-13 15:00:00');

INSERT INTO Bookings VALUES
(101, 1, 1),
(102, 2, 2),
(103, 3, 3),
(104, 1, 4),
(105, 4, 5);

INSERT INTO Tickets VALUES
(1001, 101, 'A1', 250.00),
(1002, 102, 'B5', 300.00),
(1003, 103, 'C3', 350.00),
(1004, 104, 'D2', 200.00),
(1005, 105, 'E4', 280.00);

SHOW TABLES;

SELECT m.movie_name, g.genre_name FROM Movies m INNER JOIN Genres g ON m.genre_id = g.genre_id;

SELECT 
    m.movie_name,
    d.director_name
FROM Movies m
INNER JOIN Directors d
    ON m.director_id = d.director_id;
    
SELECT 
    m.movie_name,
    a.actor_name
FROM Movies m
INNER JOIN Actors a
    ON m.actor_id = a.actor_id;
    

SELECT 
    m.movie_name,
    a.actor_name
FROM Movies m
INNER JOIN Actors a
    ON m.actor_id = a.actor_id;
    
SELECT 
    c.customer_name,
    m.movie_name,
    th.theater_name
FROM Customers c
INNER JOIN Bookings b
    ON c.customer_id = b.customer_id
INNER JOIN Shows s
    ON b.show_id = s.show_id
INNER JOIN Movies m
    ON s.movie_id = m.movie_id
INNER JOIN Theaters th
    ON s.theater_id = th.theater_id;
    
SELECT 
    c.customer_name,
    m.movie_name,
    t.ticket_price,
    t.seat_number
FROM Customers c
INNER JOIN Bookings b
    ON c.customer_id = b.customer_id
INNER JOIN Shows s
    ON b.show_id = s.show_id
INNER JOIN Movies m
    ON s.movie_id = m.movie_id
INNER JOIN Tickets t
    ON b.booking_id = t.booking_id;
    
SELECT 
    m.movie_name,
    b.booking_id
FROM Movies m
LEFT JOIN Shows s
    ON m.movie_id = s.movie_id
LEFT JOIN Bookings b
    ON s.show_id = b.show_id;
    
SELECT 
    c.customer_name,
    b.booking_id
FROM Bookings b
RIGHT JOIN Customers c
    ON b.customer_id = c.customer_id;

SELECT 
    c.customer_name,
    m.movie_name,
    th.theater_name,
    s.show_time
FROM Customers c
INNER JOIN Bookings b
    ON c.customer_id = b.customer_id
INNER JOIN Shows s
    ON b.show_id = s.show_id
INNER JOIN Movies m
    ON s.movie_id = m.movie_id
INNER JOIN Theaters th
    ON s.theater_id = th.theater_id;
    
SELECT 
    a.actor_name,
    m.movie_name
FROM Actors a
LEFT JOIN Movies m
    ON a.actor_id = m.actor_id;
    
SELECT 
    b.booking_id,
    c.customer_name,
    m.movie_name,
    g.genre_name AS genre,
    d.director_name AS director,
    th.theater_name,
    sc.screen_number,
    s.show_time,
    t.ticket_price
FROM Bookings b
INNER JOIN Customers c
    ON b.customer_id = c.customer_id
INNER JOIN Shows s
    ON b.show_id = s.show_id
INNER JOIN Movies m
    ON s.movie_id = m.movie_id
INNER JOIN Genres g
    ON m.genre_id = g.genre_id
INNER JOIN Directors d
    ON m.director_id = d.director_id
INNER JOIN Theaters th
    ON s.theater_id = th.theater_id
INNER JOIN Screens sc
    ON s.screen_id = sc.screen_id
INNER JOIN Tickets t
    ON b.booking_id = t.booking_id
ORDER BY t.ticket_price DESC;
    
