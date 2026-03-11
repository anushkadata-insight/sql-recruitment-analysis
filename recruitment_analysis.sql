CREATE DATABASE recruitment_analysis;
USE recruitment_analysis;

CREATE TABLE candidates (
candidate_id INT PRIMARY KEY,
name VARCHAR(50),
skill VARCHAR(50),
experience INT,
location VARCHAR(50)
);

CREATE TABLE recruiters (
recruiters_id INT PRIMARY KEY,
recruiter_name VARCHAR(50)
);
DROP TABLE recruiters;
CREATE TABLE recruiters (
recruiter_id INT PRIMARY KEY,
recruiter_name VARCHAR(50)
);

CREATE TABLE applications (
application_id INT PRIMARY KEY,
candidate_id INT,
recruiter_id INT,
status VARCHAR(50),
application_date DATE,
FOREIGN KEY (candidate_id) REFERENCES candidates(candidate_id),
FOREIGN KEY (recruiter_id) REFERENCES recruiters(recruiter_id)
);

INSERT INTO candidates VALUES
(1,'Rahul', 'SQL', 3, 'Banglore'),
(2,'Priya', 'Python',2,'Pune'),
(3,'Amit','Excel',4,'Mumbai'),
(4,'Neha','Python',3,'Bangalore'),
(5,'Rohan','SQL',1,'Delhi');

INSERT INTO recruiters VALUES
(1,'Anushka'),
(2,'Rahul HR'),
(3,'Priya HR');

INSERT INTO applications VALUES
(1,1,1,'Hired','2025-02-10'),
(2,2,2,'Shortlisted','2025-02-11'),
(3,3,1,'Rejected','2025-02-12'),
(4,4,3,'Interview','2025-02-13'),
(5,5,2,'Applied','2025-02-14');

SELECT COUNT(*) AS total_candidates
FROM candidates;

SELECT skill, COUNT(*) AS total
FROM candidates
GROUP BY skill
ORDER BY total DESC;

SELECT AVG (experience) AS avg_experience
FROM candidates;

SELECT status, COUNT(*) AS total
FROM APPLICATIONS
GROUP BY status;

SELECT r.recruiter_name, COUNT(*) AS hires
FROM applications a
JOIN recruiters r
ON a.recruiter_id = r.recruiter_id
WHERE status = 'Hired'
GROUP BY r.recruiter_name;

SELECT c.name, c.skill, r.recruiter_name, a.status
FROM candidates c
JOIN applications a
ON c.candidate_id = a.candidate_id
JOIN recruiters r
ON a.recruiter_id = r.recruiter_id;






