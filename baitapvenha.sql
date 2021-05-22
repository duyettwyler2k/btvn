create database quanlyhocvien;
use quanlyhocvien;
CREATE TABLE Classes(
id INT PRIMARY KEY,
name VARCHAR(50),
language VARCHAR(50),
description VARCHAR(50)
);
INSERT INTO classes
VALUES 
(1,'SQL','Viet Nam','Xanh'),
(2,'Java','Han Quoc','Vang'),
(3,'PHP','Brazil','Do'),
(4,'C','Indonesia','Trang'),
(5,'Python','Duc','Den');
CREATE TABLE Address
(
id INT PRIMARY KEY,
address VARCHAR(50));
INSERT INTO address
VALUES 
(1,'Viet Nam'),
(2,'Trung Quoc'),
(3,'Han Quoc'),
(4,'My'),
(5,'Nhat Ban'),
(6,'An Do'),
(7,'Argentina');
CREATE TABLE Course
(
id INT PRIMARY KEY,
name VARCHAR(50) , 
description VARCHAR(50)
);
INSERT INTO course
VALUES 
(1,'Nau an','Black'),
(2,'My thuat','Puple'),
(3,'Cong Nghe','Blue'),
(4,'Tin hoc','Yellow'),
(5,'Co khi','Red');
CREATE TABLE Student 
(
id INT PRIMARY KEY,
fullname VARCHAR(50),
address_id INT,
phone VARCHAR(30) UNIQUE,
class_id INT,
CONSTRAINT FK_address_id FOREIGN KEY (address_id) REFERENCES address(id),
CONSTRAINT FK_class_id FOREIGN KEY (class_id) REFERENCES classes(id)
);
INSERT INTO student
VALUES 
(1,'Tran Ngoc Anh',2,'09212083084',2),
(2,'Tong Van Son',1,'0121212121',4),
(3,'Vu Van Chinh',5,'09892736262',3),
(4,'Lai Ngoc Huyen',3,'0943123812',1),
(5,'Ha Anh Tuan',2,'01284782847',2),
(6,'Dinh Hong Hanh',3,'0123123123',1),
(7,'Nguyen Tuan Vu',4,'0978326973',4),
(8,'Kha Tran Hai',1,'09838272384',3),
(9,'Lam Chi Dinh',2,'09677626262',2),
(10,'Luu Diec Phi',1,'01233787439',1);
CREATE TABLE Point
(
id INT PRIMARY KEY,
course_id INT,
student_id INT,
point FLOAT DEFAULT 0,
CONSTRAINT FK_course_id FOREIGN KEY (course_id) REFERENCES course(id),
CONSTRAINT FK_student_id FOREIGN KEY (student_id) REFERENCES student(id)
);
INSERT INTO point
VALUES 
(1,1,7,10),
(2,1,10,11),
(3,5,2,13),
(4,4,3,7),
(5,2,4,8),
(6,5,1,9),
(7,1,2,7.5),
(8,2,5,17),
(9,4,8,3),
(10,5,1,14),
(11,3,2,13.3),
(12,2,5,6),
(13,2,4,7),
(14,4,7,9),
(15,1,3,21);
select student.class_id,count(id) as'so luong'
from student
group by class_id;
select address,count(id) as 'so luong'
from address
group by address;
select course.name,avg(point)
from point join course on point.id=course.id
group by course.name;
create view diemtrunbinh as
select course.name,avg(point) as diemtrungbinh
from point join course on point.id=course.id
group by course.name
order by diemtrungbinh desc;
select *
from diemtrunbinh limit 1;