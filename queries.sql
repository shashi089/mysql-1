-- 3. get number problems solved in codekata by combining the users
use students;

SELECT users.userid, users.username,users.useremail, codekata.number_of_problems 
FROM users
INNER JOIN codekata ON users.userid = codekata.userid;

-- 4.display the no of company drives attended by a user
use students;

SELECT userid ,COUNT(userid) FROM company_drives GROUP BY userid;

-- 5. combine and display students_activated_courses and courses for a specific user groping them based on the course
use students;

SELECT students_activated_courses.userid,students_activated_courses.courseid,
COUNT(students_activated_courses.courseid) ,courses.coursename
FROM students_activated_courses
INNER JOIN courses 
ON students_activated_courses.courseid=courses.courseid
WHERE students_activated_courses.userid=1
GROUP BY courses.courseid;

-- 6 .list all the mentors
use students;

SELECT mentorname FROM mentors;

-- 7. list the number of students that are assigned for a mentor
USE students;

SELECT mentors.mentorid,mentors.mentorname,COUNT(users.mentorid) 
FROM mentors,users
WHERE mentors.mentorid=users.mentorid 
GROUP BY mentors.mentorid;