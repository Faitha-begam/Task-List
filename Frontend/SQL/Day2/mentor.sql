CREATE DATABASE mentor_details;
USE mentor_details;
CREATE TABLE mentor(
   mentor_id int primary key auto_increment,
   mentor_name varchar(50),
   mentor_degree varchar(100),
   mentor_email varchar(100),
   created_by varchar(100) default "user",
   created_at date,
   updated_by varchar(100),
   updated_at date
);
INSERT INTO mentor(mentor_id, mentor_name, mentor_degree, mentor_email, created_by, created_at, updated_by, updated_at,mentor_experience) values(1,"dummy", "BE", "mentor@gmail.com", "user", CURDATE(), "", CURDATE(), 3)
update mentor set mentor_email = "mentor123@gmail.com" where mentor_id = 1; 