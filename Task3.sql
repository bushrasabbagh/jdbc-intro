-- ///////////////////////Task1///////////////////////
-- ////////////// 1.1 number of total lessons per month during a specified year////
CREATE VIEW total_number_of_lessons AS
SELECT SUM(total_number_of_lessons), month
FROM(
SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 

  UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 

 UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time) AS month , COUNT(*) AS total_number_of_lessons
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 

) AS total_number_of_lessons
GROUP BY month
ORDER BY month
;


-- /////////// 1.2 Number of lessons and the specific number of individual lessons, group lessons and ensembles monthly during a year/////
CREATE VIEW total_number_of_lessons_specific_type_monthly AS
SELECT lesson_type ,SUM(number_of_lessons) AS number_of_lessons,month
FROM(
SELECT EXTRACT(MONTH FROM lesson_time) AS month , COUNT(*) AS number_of_lessons, 'group_lesson' AS lesson_type
FROM group_lesson AS gro
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 

  UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time) AS month , COUNT(*) AS number_of_lessons, 'ensembles_lesson' AS lesson_type
FROM ensembles_lesson AS ens
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time)  

 UNION ALL
SELECT EXTRACT(MONTH FROM lesson_time) AS month , COUNT(*) AS number_of_lessons, 'individual_lesson' AS lesson_type
FROM individual_lesson AS ind
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time)   

) AS number_of_lessons
GROUP BY  lesson_type, month;



-- ///////////Number of lessons and the specific number of individual lessons, group lessons and ensembles/////EXTRA/////
CREATE VIEW total_number_of_lessons_specific_type AS
SELECT lesson_type ,SUM(total_number_of_lessons) AS number_of_lessons
FROM(
SELECT  COUNT(*) AS total_number_of_lessons,'group_lesson' AS lesson_type
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'


  UNION ALL
 SELECT  COUNT(*) AS total_number_of_lessons,'individual_lesson' AS lesson_type
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'


 UNION ALL
 SELECT COUNT(*) AS total_number_of_lessons,'ensembles_lesson' AS lesson_type
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'


) AS total_number_of_lessons
GROUP BY  lesson_type;



-- ////Number of lesson per year(just one number) ˆˆˆEXTRAˆˆˆ////
CREATE VIEW total_number_of_lessons_per_year AS
SELECT SUM(total_number_of_lessons) AS number_of_lessons, year
FROM(
SELECT EXTRACT(YEAR FROM lesson_time)AS year , COUNT(*) AS total_number_of_lessons
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) 
GROUP BY EXTRACT(YEAR FROM lesson_time)

  UNION ALL
 SELECT EXTRACT(YEAR FROM lesson_time)AS year , COUNT(*) AS total_number_of_lessons
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)
GROUP BY EXTRACT(YEAR FROM lesson_time)

 UNION ALL
 SELECT EXTRACT(YEAR FROM lesson_time) AS month , COUNT(*) AS total_number_of_lessons
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)
GROUP BY EXTRACT(YEAR FROM lesson_time)

) AS total_number_of_lessons
GROUP BY year
;


-- /////TASK2/////
-- /////////The avg number of lessons per month during the entire year//////
CREATE VIEW avg_number_of_lessons_per_month AS
SELECT month ,SUM(total_number_of_lessons)/12 AS avg_number_of_lessons,SUM(total_number_of_lessons) AS total_num_of_lessons
FROM(
SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
  UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
 UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month ,COUNT(*) AS total_number_of_lessonns
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
) AS total_number_of_lessons
GROUP BY month
ORDER BY month;

-- ///The avg number of lessons per month during the entire year divided by lesson type////EXTRA///
CREATE VIEW avg_number_of_lessons_specific_type AS
SELECT lesson_type,month ,AVG(total_number_of_lessons)/12 AS avg_number_of_lessons,SUM(total_number_of_lessons) AS total_num_of_lessons
FROM(
SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons,'group_lesson' AS lesson_type
FROM group_lesson 
WHERE EXTRACT(YEAR FROM lesson_time) = '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
  UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month , COUNT(*) AS total_number_of_lessons,'individual_lesson' AS lesson_type
FROM individual_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
 UNION ALL
 SELECT EXTRACT(MONTH FROM lesson_time)AS month ,COUNT(*) AS total_number_of_lessons,'ensembles_lesson' AS lesson_type
FROM ensembles_lesson 
WHERE EXTRACT(YEAR FROM lesson_time)= '2019'
GROUP BY EXTRACT(MONTH FROM lesson_time) 
) AS total_number_of_lessons
GROUP BY  lesson_type,month
ORDER BY month
;

-- /////TASK3//////
-- /////instructors that gave more that one lesson during the current month /////

CREATE VIEW number_of_instructor_lessons_during_amonth AS
SELECT first_name,last_name,instructor_id,SUM(num_lessons)AS num_lessons,month
FROM(
SELECT gro.instructor_id,ins.first_name AS first_name,ins.last_name AS last_name ,COUNT(gro.instructor_id) AS num_lessons, EXTRACT(MONTH FROM lesson_time) AS month
FROM group_lesson AS gro, instructor AS ins
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE) AND gro.instructor_id=ins.instru_id
GROUP BY instructor_id,month,first_name,last_name
HAVING  COUNT(instructor_id)>1
UNION ALL
SELECT ens.instructor_id,ins.first_name AS first_name,ins.last_name AS last_name ,COUNT(ens.instructor_id) AS num_lessons, EXTRACT(MONTH FROM lesson_time) AS month
FROM ensembles_lesson AS ens, instructor AS ins
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE) AND ens.instructor_id=ins.instru_id
GROUP BY instructor_id,month,first_name,last_name
HAVING  COUNT(instructor_id)>1
UNION ALL
SELECT ind.instructor_id,ins.first_name AS first_name,ins.last_name AS last_name, COUNT(ind.instructor_id) AS num_lessons, EXTRACT(MONTH FROM lesson_time) AS month
FROM individual_lesson As ind, instructor AS ins
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE) AND ind.instructor_id=ins.instru_id
GROUP BY instructor_id,month,first_name,last_name
HAVING  COUNT(instructor_id)>1) AS num_lessons
GROUP BY instructor_id,month,first_name,last_name
;

-- //////////Sum all lessons, independent of type///////
CREATE VIEW sum_lessons_depending_on_type AS
SELECT instructor_id,SUM(num_lessons)AS num_lessons, lesson_type,month
FROM(
SELECT instructor_id, COUNT(instructor_id) AS num_lessons, 'group_lesson' AS lesson_type,EXTRACT(MONTH FROM lesson_time) AS month
FROM group_lesson
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)
UNION ALL
SELECT instructor_id, COUNT(instructor_id) AS num_lessons,'ensembles_lesson' AS lesson_type, EXTRACT(MONTH FROM lesson_time) AS month
FROM ensembles_lesson 
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)
UNION ALL
SELECT instructor_id, COUNT(instructor_id) AS num_lessons, 'individual_lesson' AS lesson_type,EXTRACT(MONTH FROM lesson_time) AS month
FROM individual_lesson
WHERE EXTRACT(MONTH FROM lesson_time)=EXTRACT(MONTH FROM CURRENT_DATE) AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY instructor_id,month
HAVING  COUNT(instructor_id)) AS num_lessons
GROUP BY instructor_id,month, lesson_type
ORDER BY num_lessons DESC
;

-- /////////////////////TASK4/////////////
CREATE VIEW ensembles_lesson_next_week AS
SELECT genre, COUNT(genre) AS num_lessons_of_same_genre, DAYNAME(lesson_time) AS day, 
(CASE
    WHEN (avi_seats =1 )THEN 'There are 1-2 seats available'
    WHEN (avi_seats =2 )THEN 'There are 1-2 seats available'
    WHEN  (avi_seats > 2) THEN 'More than 2 seats are available'
    ELSE 'Full booked'
END) AS status_of_seats
FROM ensembles_lesson
WHERE EXTRACT(WEEK FROM lesson_time)= EXTRACT(WEEK FROM CURRENT_DATE)+1 AND EXTRACT(YEAR FROM lesson_time)=EXTRACT(YEAR FROM CURRENT_DATE)
GROUP BY genre,day,status_of_seats
ORDER BY day DESC;