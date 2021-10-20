-- 1. CCreate tables for the below list given
-- (users
-- codekata
-- attendance
-- topics
-- tasks
-- company_drives
-- mentors
-- students_activated_courses
-- courses)


CREATE DATABASE students;
use students;

-- courses
CREATE TABLE courses(courseid INTEGER AUTO_INCREMENT PRIMARY KEY,coursename VARCHAR(100));

-- mentors
CREATE TABLE mentors(mentorid INTEGER AUTO_INCREMENT PRIMARY KEY,mentorname VARCHAR(100),mentoremail VARCHAR(100));

-- Users
CREATE TABLE users(userid INTEGER AUTO_INCREMENT PRIMARY KEY, username VARCHAR(100),useremail VARCHAR(100)
,mentorid INTEGER, 
FOREIGN KEY (mentorid) REFERENCES mentors(mentorid)
);

-- codekata
CREATE TABLE codekata(codekataid INTEGER AUTO_INCREMENT PRIMARY KEY,userid INTEGER,number_of_problems INTEGER,
 string_problems INTEGER,
 FOREIGN KEY (userid) REFERENCES users(userid)
 );
 
-- topics
CREATE TABLE topics(topicsid INTEGER AUTO_INCREMENT PRIMARY KEY,courseid INTEGER, topic VARCHAR(200),
FOREIGN KEY (courseid) REFERENCES courses(courseid)
);

-- tasks
CREATE TABLE tasks(tasksid INTEGER AUTO_INCREMENT PRIMARY KEY,courseid INTEGER,task VARCHAR(200),
FOREIGN KEY (courseid) REFERENCES courses(courseid)
);

-- Attendance
CREATE TABLE attendance(attendanceid INTEGER AUTO_INCREMENT PRIMARY KEY, userid INTEGER,courseid INTEGER ,topicsid INTEGER, attended BOOLEAN,
FOREIGN KEY (userid) REFERENCES users(userid),
FOREIGN KEY (topicsid) REFERENCES topics(topicsid),
FOREIGN KEY (courseid) REFERENCES courses(courseid)
);

-- Company drives
CREATE TABLE company_drives(drivesid INTEGER AUTO_INCREMENT PRIMARY KEY,userid INTEGER,company VARCHAR(100),
FOREIGN KEY (userid) REFERENCES users(userid)
);

-- students_activated_courses
CREATE TABLE students_activated_courses(id INTEGER AUTO_INCREMENT PRIMARY KEY,userid INTEGER,courseid INTEGER,
FOREIGN KEY (userid) REFERENCES users(userid),
FOREIGN KEY (courseid) REFERENCES courses(courseid)
);