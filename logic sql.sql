DROP DATABASE IF EXISTS project;
CREATE DATABASE project;
USE project;
CREATE TABLE administrative_staff (
 admin_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 employee_name VARCHAR(500),
 employment_id VARCHAR(10) UNIQUE 
);

CREATE TABLE appointment (
 appointment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 particate_student_id VARCHAR(12),
 instructor_name VARCHAR(500),
 instrument VARCHAR(50),
 student_level VARCHAR(30),
 admin_id INT NOT NULL
);

CREATE TABLE email (
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 e_mail VARCHAR(500) NOT NULL
);

CREATE TABLE instructor (
 instru_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 person_number VARCHAR(12) UNIQUE NOT NULL,
 zip_code CHAR(15),
 country VARCHAR(50),
 city VARCHAR(50),
 street_number INT,
 street_name VARCHAR(100)
);

CREATE TABLE instrument (
 instr_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 instrument_name VARCHAR(50)
);

CREATE TABLE phone (
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 phone_number VARCHAR(15) NOT NULL
);

CREATE TABLE student (
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 person_number VARCHAR(12) UNIQUE NOT NULL,
 first_name VARCHAR(500),
 last_name VARCHAR(500),
 country VARCHAR(50),
 city VARCHAR(50),
 street_number INT,
 street_name VARCHAR(100),
 zip_code CHAR(15)
);

CREATE TABLE total_price (
 price_For_Certain_days DOUBLE PRECISION,
 price_by_type_of_lesson DOUBLE PRECISION,
 price_by_level DOUBLE PRECISION,
 number_of_lessons INT
);


CREATE TABLE application (
 application_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 student_id INT NOT NULL,
 instrument_id INT NOT NULL,
 admin_id INT NOT NULL,
 student_skills VARCHAR(500)
);

CREATE TABLE email_address (
 instructor_id INT NOT NULL,
 student_id INT NOT NULL,
 mail_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE ensembles_lesson (
 ens_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 min_num_of_students INT,
 max_num_of_students INT,
 genre VARCHAR(30),
 avi_seats INT,
 lesson_time TIMESTAMP(6),
 instructor_id INT NOT NULL,
 id INT NOT NULL
);

CREATE TABLE group_lesson (
 grp_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 min_num_of_students INT,
 max_num_of_students INT,
 lesson_time TIMESTAMP(6),
 lesson_level VARCHAR(15),
 instructor_id INT NOT NULL,
 instrument_id INT NOT NULL,
 id INT NOT NULL
);

CREATE TABLE individual_lesson  (
 ind_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 instructor_id INT NOT NULL,
 instrument_id INT NOT NULL,
 lesson_time TIMESTAMP(6),
 appointment_id INT NOT NULL,
 id INT NOT NULL
);

CREATE TABLE instrument_rental (
 instru_rent_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 renting_start_date DATE,
 student_id INT NOT NULL,
 renting_end_date DATE,
 instrument_id INT NOT NULL,
 rent_status VARCHAR(30)
);

CREATE TABLE instrument_stock (
 instru_rent_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 brand_of_instrument varchar(50),
 is_rented INT,
 renting_price DOUBLE PRECISION,
 instrument_id INT NOT NULL
);

CREATE TABLE payment (
 pay_id char(10) NOT NULL ,
 amount DOUBLE PRECISION,
 date DATE,
 student_id INT NOT NULL,
 instructor_id INT NOT NULL
);
ALTER TABLE payment ADD CONSTRAINT PK_payment PRIMARY KEY (pay_id);


CREATE TABLE phone_number (
 student_id INT NOT NULL ,
 instructor_id INT NOT NULL ,
 phone_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);


CREATE TABLE receipt (
 rec_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 date DATE,
 payed_ammount DOUBLE PRECISION,
 pay_id CHAR(10) NOT NULL
);

CREATE TABLE rental_payment (
 instru_rent_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 date DATE,
 amount DOUBLE PRECISION
);

CREATE TABLE sibling (
 sib_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(500),
 student_id INT NOT NULL
);

CREATE TABLE siblings_discount (
 sib_id_0 INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 discount_amount DOUBLE PRECISION
);


ALTER TABLE appointment ADD CONSTRAINT FK_appointment_0 FOREIGN KEY (admin_id) REFERENCES administrative_staff (admin_id);


ALTER TABLE application ADD CONSTRAINT FK_application_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE application ADD CONSTRAINT FK_application_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);
ALTER TABLE application ADD CONSTRAINT FK_application_2 FOREIGN KEY (admin_id) REFERENCES administrative_staff (admin_id);


ALTER TABLE email_address ADD CONSTRAINT FK_email_address_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instru_id);
ALTER TABLE email_address ADD CONSTRAINT FK_email_address_1 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE email_address ADD CONSTRAINT FK_email_address_2 FOREIGN KEY (mail_id) REFERENCES email (id);


ALTER TABLE ensembles_lesson ADD CONSTRAINT FK_ensembles_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instru_id);
ALTER TABLE ensembles_lesson ADD CONSTRAINT FK_ensembles_lesson_1 FOREIGN KEY (id) REFERENCES student (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instru_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_2 FOREIGN KEY (id) REFERENCES student (id);



ALTER TABLE individual_lesson  ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instru_id);
ALTER TABLE individual_lesson  ADD CONSTRAINT FK_individual_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);
ALTER TABLE individual_lesson  ADD CONSTRAINT FK_individual_lesson_2 FOREIGN KEY (appointment_id) REFERENCES appointment (appointment_id);
ALTER TABLE individual_lesson  ADD CONSTRAINT FK_individual_lesson_3 FOREIGN KEY (id) REFERENCES student (id);


ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE instrument_rental ADD CONSTRAINT FK_instrument_rental_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);


ALTER TABLE instrument_stock ADD CONSTRAINT FK_instrument_stock_0 FOREIGN KEY (instru_rent_id) REFERENCES instrument_rental (instru_rent_id);
ALTER TABLE instrument_stock ADD CONSTRAINT FK_instrument_stock_1 FOREIGN KEY (instrument_id) REFERENCES instrument (instr_id);


ALTER TABLE payment ADD CONSTRAINT FK_payment_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE payment ADD CONSTRAINT FK_payment_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instru_id);


ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instru_id);
ALTER TABLE phone_number ADD CONSTRAINT FK_phone_number_2 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE receipt ADD CONSTRAINT FK_receipt_0 FOREIGN KEY (pay_id) REFERENCES payment (pay_id);


ALTER TABLE rental_payment ADD CONSTRAINT FK_rental_payment_0 FOREIGN KEY (instru_rent_id) REFERENCES instrument_rental (instru_rent_id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE siblings_discount ADD CONSTRAINT FK_siblings_discount_0 FOREIGN KEY (sib_id_0) REFERENCES sibling (sib_id);


