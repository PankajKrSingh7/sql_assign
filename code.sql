--Question1

--creating table
create table employees (EmpID int, Name varchar(10), gender varchar(10), department varchar(10));

--inserting data into tables
Insert into employees values 
  (1, 'X', 'Female', 'Finance'), 
  (2, 'Y', 'Male', 'IT'), 
  (3, 'Z', 'Male', 'HR'), 
  (4, 'W', 'Female', 'IT');
  
--query  
SELECT Department,
SUM(CASE WHEN Gender = 'Male' THEN 1 ELSE 0 END) AS "Num of male",
SUM(CASE WHEN Gender = 'Female' THEN 1 ELSE 0 END) AS "Num of Female"
FROM employees
GROUP BY Department;


--Question2
--creating table 
CREATE TABLE emp_salary (   Name VARCHAR(50),   Jan INT,   Feb INT,   Mar INT );

--inserting data into table
Insert into emp_salary
values 
  ('X', 5200, 9093, 3832), 
  ('Y', 9023, 8942, 4000), 
  ('Z', 9834, 8197, 9903), 
  ('W', 3244, 4321, 0293);
 
 --query
 SELECT Name, 
  ANY_VALUE(CASE 
    WHEN Jan = GREATEST(Jan, Feb, Mar) THEN 'Jan'
    WHEN Feb = GREATEST(Jan, Feb, Mar) THEN 'Feb'
    WHEN Mar = GREATEST(Jan, Feb, Mar) THEN 'Mar'
  END) AS Month,
  GREATEST(Jan, Feb, Mar) AS Value
FROM emp_salary;


--Question3

--creating table
CREATE TABLE candidate_marks ( Candidate_ID INT not null, Marks INT );

--inserting data into table
INSERT INTO candidate_marks (Candidate_ID, Marks) VALUES 
    (1, 98),
    (2, 78),
    (3, 87), 
    (4, 98), 
    (5, 78);
    
 --query
 SELECT Marks, 
       DENSE_RANK() OVER (ORDER BY Marks DESC) AS `Ranking`, 
       GROUP_CONCAT(Candidate_ID ORDER BY Candidate_ID ASC) AS Candidate_ID
FROM candidate_marks
GROUP BY Marks
ORDER BY `Ranking`;

--Question4

--Creating table
CREATE TABLE candidate_emails (Candidate_ID INT not null,   Email VARCHAR(255) not null);

--inserting data into table
insert into INSERT INTO candidate_emails (Candidate_ID, Email) VALUES
     (45, 'abc@gmail.com'),   
     (23, 'def@yahoo.com'), 
     (34, 'abc@gmail.com'),
     (21, 'bcf@gmail.com'),   
     (94, 'def@yahoo.com');
     
--query
DELETE c1
FROM candidate_emails c1
JOIN candidate_emails c2
ON c1.Email = c2.Email AND c1.Candidate_ID > c2.Candidate_ID;

