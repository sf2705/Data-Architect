
------ Create Tables
CREATE TABLE "Position" (
  "Job_ID" serial primary key,
  "Job_Title" Varchar(100)
);

CREATE TABLE "Department" (
  "Department_ID" serial primary key,
  "Department" Varchar(100)
);

CREATE TABLE "Employee" (
  "Emp_ID" Varchar(10) primary key,
  "Emp_NM" Varchar(100),
  "Email" Varchar(50),
  "Hire_DT" Date,
  "Education_lvl" Varchar(50)
);

CREATE TABLE "City" (
  "City_ID" serial primary key,
  "City" Varchar(50),
  "State" Varchar(50)
);

CREATE TABLE "Salary" (
  "Salary_ID" serial primary key,
  "Salary" Int
);


CREATE TABLE "Location" (
  "Location_ID" serial primary key,
  "Location" Varchar(100),
  "Address" Varchar(200),
  "City_ID" Int references "City"("City_ID")
);

CREATE TABLE "History" (
  "Emp_ID" Varchar(10) references "Employee"("Emp_ID"),
  "Start_DT" Date,
  "End_DT" Date,
  "Job_ID" Int references "Position"("Job_ID"),
  "Department_ID" Int references "Department"("Department_ID"),
  "Location_ID" Int references "Location"("Location_ID"),
  "Salary_ID" Int references "Salary"("Salary_ID"),
  "Manager_ID" Varchar(10) references "Employee"("Emp_ID"),
  Primary key ("Emp_ID", "Start_DT")
);


------ Insert Data

Insert into "Employee"("Emp_ID","Emp_NM", "Email", "Hire_DT", "Education_lvl") 
Select distinct emp_id, emp_nm, email, hire_dt, education_lvl from proj_stg;


Insert into "Position"("Job_Title") select distinct job_title from proj_stg;

Insert into "Department"("Department") select distinct department_nm from proj_stg;

Insert into "City"("City", "State") select distinct city, state from proj_stg;

Insert into "Salary"("Salary") select distinct Salary from proj_stg;

Insert into "Location"("Location", "Address", "City_ID") select distinct p."location", p."address", c."City_ID"
 from proj_stg as p JOIN "City" as c on p."city" = c."City";

Insert into "History"("Emp_ID", "Start_DT", "End_DT", "Job_ID", "Department_ID", "Location_ID", 
                      "Salary_ID", "Manager_ID")
select distinct p.emp_id, p.start_dt, p.end_dt, pos."Job_ID", dep."Department_ID", loc."Location_ID", 
                sal."Salary_ID", emp."Emp_ID"
from proj_stg as p LEFT JOIN "Position" as pos on p.job_title = pos."Job_Title"
                   LEFT JOIN "Department" as dep on p.department_nm = dep."Department"
                   LEFT JOIN "Location" as loc on p.location = loc."Location"
                   LEFT JOIN "Salary" as sal on p.salary = sal."Salary"
                   LEFT JOIN "Employee" as emp on p.manager = emp."Emp_NM";




------ CRUD

-- Question 1: Return a list of employees with Job Titles and Department Names
Select distinct emp."Emp_NM", pos."Job_Title", dep."Department"
from "History" as his JOIN "Employee" as emp on his."Emp_ID" = emp."Emp_ID"
                      JOIN "Position" as pos on his."Job_ID" = pos."Job_ID"
                      JOIN "Department" as dep on his."Department_ID" = dep."Department_ID";

-- Question 2: Insert Web Programmer as a new job title
Insert into "Position"("Job_Title") Values ('Web Programmer');
Select distinct "Job_Title" from "Position";

-- Question 3: Correct the job title from web programmer to web developer
Update "Position" Set "Job_Title" = 'web developer' where "Job_Title" = 'Web Programmer';
Select distinct "Job_Title" from "Position";

-- Question 4: Delete the job title Web Developer from the database
Delete from "Position" Where "Job_Title" = 'web developer';
Select distinct "Job_Title" from "Position";

-- Question 5: How many employees are in each department? 
Select dep."Department",Count(his."Emp_ID") from "History" as his JOIN "Department" as dep
on his."Department_ID" = dep."Department_ID"
where extract(year from his."End_DT" ) >= 2100
group by dep."Department";

--Question 6: Write a query that returns current and past jobs (include employee name, 
--job title, department, manager name, start and end date for position) for employee 
--Toni Lembeck.
Select emp."Emp_NM", pos."Job_Title", dep."Department", mng."Emp_NM", his."Start_DT", his."End_DT"
from "History" as his JOIN "Employee" as emp on his."Emp_ID" = emp."Emp_ID"
                      JOIN "Position" as pos on his."Job_ID" = pos."Job_ID"
                      JOIN "Department" as dep on his."Department_ID" = dep."Department_ID"
                      JOIN "Employee" as mng on his."Manager_ID" = mng."Emp_ID"
Where emp."Emp_NM" = 'Toni Lembeck';












