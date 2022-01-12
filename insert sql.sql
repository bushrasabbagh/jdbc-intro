INSERT INTO administrative_staff(employee_name,employment_id)
VALUES ('Elen','1256784903');
INSERT INTO administrative_staff(employee_name,employment_id) VALUES('Leenea','1258784903');
INSERT INTO administrative_staff(employee_name,employment_id) VALUES ('Nemar','1258784900');
INSERT INTO administrative_staff(employee_name,employment_id) VALUES ('Simon','1258787900');

INSERT INTO appointment(particate_student_id,instructor_name,instrument,student_level,admin_id)
VALUES(2,'Filip','piano','begginer',4);
INSERT INTO appointment(particate_student_id,instructor_name,instrument,student_level,admin_id) VALUES(1,'Gustav','Guitar','begginer',1);
INSERT INTO appointment(particate_student_id,instructor_name,instrument,student_level,admin_id) VALUES(4,'Gustav','Cello','intermediate',2);
INSERT INTO appointment(particate_student_id,instructor_name,instrument,student_level,admin_id) VALUES(5,'Leo','Violin','begginer',1);
INSERT INTO appointment(particate_student_id,instructor_name,instrument,student_level,admin_id) VALUES(6,'Bebe','Grand piano','advanced',3);


INSERT INTO instrument(instrument_name) VALUES
('piano');
INSERT INTO instrument(instrument_name) VALUES('piano');
INSERT INTO instrument(instrument_name) VALUES('piano');
INSERT INTO instrument(instrument_name) VALUES('cello');
INSERT INTO instrument(instrument_name) VALUES('grand piano');
INSERT INTO instrument(instrument_name) VALUES('guitar');
INSERT INTO instrument(instrument_name) VALUES('violin');
INSERT INTO instrument(instrument_name) VALUES('maracas');
INSERT INTO instrument(instrument_name) VALUES('bongo drums');
INSERT INTO instrument(instrument_name) VALUES('drums');
INSERT INTO instrument(instrument_name) VALUES('sax');
INSERT INTO instrument(instrument_name) VALUES('fluet');


INSERT INTO instructor(first_name,last_name,person_number,zip_code,country,city,street_number,street_name) VALUES
('Loay','Hanson',198809438010,'Sweden','Stockholm','46046',8,'Sollentunavagen');
INSERT INTO instructor(first_name,last_name,person_number,zip_code,country,city,street_number,street_name)
 VALUES ('Leif','Larssonn',196809438012,'Sweden','Stockholm','46066',8,'Solna');
INSERT INTO instructor(first_name,last_name,person_number,zip_code,country,city,street_number,street_name)
 VALUES ('Nina','Hedberg',196909438012,'Sweden','Stockholm','11166',9,'Kadettgatan');
INSERT INTO instructor(first_name,last_name,person_number,zip_code,country,city,street_number,street_name)
 VALUES ('Samo','Lindberg',197709438012,'Sweden','Stockholm','11163',2,'Kadettgatan');
INSERT INTO instructor(first_name,last_name,person_number,zip_code,country,city,street_number,street_name)
 VALUES ('Salma','Lindqvist',197009438012,'Sweden','Stockholm','11103',2,'Kronansgatan');





INSERT INTO student (person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
VALUES (199709238767,'Rami','jakl','Sweden','Stockholm',3,'faljl','12463');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (199669238067,'Louise','jal','Sweden','Stockholm',3,'faljl','12403');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (199909938027,'Noura','Andersson','Sweden','Stockholm',2,'Arvingevagen','12483');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (199509938010,'Nour','Anders','Sweden','Stockholm',8,'Arvingevagen','16446');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (199800938026,'Sara','Warra','Sweden','Stockholm',5,'Langsgatan','12403');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (199509438012,'Anders','Svensson','Sweden','Stockholm',8,'Kungsvagen','46446');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (199109930027,'Nour','Berg','Sweden','Stockholm',2,'Arvingevagen','12483');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (198109938010,'Silina','Anders','Sweden','Stockholm',3,'Halsovagen','16476');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (198900938026,'William','Warra','Sweden','Stockholm',5,'Solnavagen','12402');
INSERT INTO student(person_number,first_name,last_name,country,city,street_number,street_name,zip_code)
 VALUES (198809438012,'Leif','Svensson','Sweden','Stockholm',8,'Sollentunavagen','46046');


INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id) 
VALUES (1,10,'jazz',5,'2020-01-02 00-11-30',2,1);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,12,'Rock',7,'2020-01-15 00-15-30',1,2);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,10,'Classical',3,'2020-02-12 00-11-30',3,3);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,12,'Pop',6,'2021-01-07 00-14-30',5,4);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,20,'Classical',1,'2021-01-08 00-12-30',4,5);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,12,'Pop',8,'2019-11-15 00-14-30',5,6);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,12,'Pop',3,'2019-11-12 00-14-30',5,7);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,20,'Classical',0,'2019-01-3 00-12-30',3,8);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,12,'Rock',4,'2021-01-09 00-14-30',1,9);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,12,'Pop',9,'2021-01-12 00-14-30',1,10);
INSERT INTO ensembles_lesson(min_num_of_students,max_num_of_students,genre,avi_seats,lesson_time,instructor_id,id)
 VALUES (1,20,'Classical',1,'2021-01-08 00-12-30',4,1);


INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
VALUES (1,10,'2019-01-02 00-11-30',2,'intermediate',2,1);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,20,'2021-01-12 00-11-30',2,'begginers',3,2);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2019-03-02 00-11-30',1,'intermediate',4,3);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,5,'2020-01-22 00-11-30',4,'advanced',1,4);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,20,'2019-03-07 00-11-30',3,'advanced',1,5);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,20,'2021-12-02 00-11-30',3,'advanced',3,6);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2019-03-02 00-11-30',1,'intermediate',2,7);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2019-03-02 00-11-30',1,'intermediate',4,8);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2019-03-02 00-11-30',1,'intermediate',2,9);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2021-01-02 00-11-30',1,'intermediate',4,10);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2021-01-03 00-11-30',1,'intermediate',4,1);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2021-01-03 00-11-30',1,'intermediate',3,2);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2021-01-04 00-11-30',1,'intermediate',3,3);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2021-01-05 00-11-30',1,'intermediate',1,4);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2021-01-05 00-12-30',1,'intermediate',1,5);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2019-03-08 00-11-30',1,'intermediate',3,6);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2019-03-09 00-11-30',1,'intermediate',2,7);
INSERT INTO group_lesson(min_num_of_students,max_num_of_students,lesson_time,instrument_id,lesson_level,instructor_id,id)
 VALUES (1,15,'2021-01-08 00-09-30',1,'intermediate',3,8);


INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
VALUES(3,2,'2019-02-02 00-01-30',1,10);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,4,'2019-03-17 00-11-30',2,1);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(4,1,'2020-01-12 00-11-30',5,2);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(3,5,'2020-03-02 00-11-30',4,3);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(2,3,'2020-12-02 00-11-30',5,4);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,4,'2019-03-12 00-11-30',2,5);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,4,'2019-03-11 00-11-30',1,6);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,2,'2019-03-11 00-11-30',5,7);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,2,'2019-03-14 00-11-30',1,8);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,2,'2019-03-19 00-11-30',1,9);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,2,'2021-01-20 00-11-30',2,10);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,3,'2021-01-18 00-11-30',3,5);
INSERT INTO individual_lesson(instrument_id,instructor_id,lesson_time,appointment_id,id)
 VALUES(1,3,'2021-01-10 00-11-30',4,7);

INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status)
VALUES('2022-01-01',1,1,'2023-01-01','ONGOING');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2019-06-01',3,6,'2020-04-15','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2019-12-15',7,7,'2020-3-15','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2019-12-15',8,8,'2020-3-15','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2019-12-15',4,1,'2020-3-15','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2019-12-15',4,2,'2020-05-15','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2019-12-15',6,3,'2020-3-15','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2019-12-15',9,4,'2020-3-15','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2020-11-15',1,5,'2020-12-30','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2020-11-15',1,10,'2020-12-30','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2020-11-15',3,11,'2020-12-30','TERMINATED');
INSERT INTO instrument_rental (renting_start_date,student_id,instrument_id,renting_end_date,rent_status) VALUES('2020-11-15',6,12,'2020-12-30','TERMINATED');


INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
VALUES ('Yamaha',1,399,1);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
 VALUES ('Gibson',0,70,2);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
 VALUES ('Yamaha',0,100,3);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
 VALUES ('Yamaha',0,250,4);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
 VALUES ('Gibson',0,75,5);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
 VALUES ('Gibson',0,500,6);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
 VALUES ('Yamaha',0,250,7);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
 VALUES ('Gibson',0,154,8);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
 VALUES ('Yamaha',0,122,9);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
VALUES ('Drums',0,122,10);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
VALUES ('fff',0,122,11);
INSERT INTO instrument_stock(brand_of_instrument,is_rented,renting_price,instrument_id)
VALUES ('llll',0,122,12);

