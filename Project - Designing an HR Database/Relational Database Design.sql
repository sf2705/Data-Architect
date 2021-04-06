
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
  "Emp_ID" serial primary key,
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
  "Salary" Float
);


CREATE TABLE "Location" (
  "Location_ID" serial primary key,
  "Location" Varchar(100),
  "Address" Varchar(200),
  "City_ID" Int references "City"("City_ID")
);

CREATE TABLE "History" (
  "Emp_ID" Int references "Employee"("Emp_ID"),
  "Start_DT" Date,
  "End_DT" Date,
  "Job_ID" Int references "Position"("Job_ID"),
  "Department_ID" Int references "Department"("Department_ID"),
  "Location_ID" Int references "Location"("Location_ID"),
  "Salary_ID" Int references "Salary"("Salary_ID"),
  "Manager_ID" Int references "Employee"("Emp_ID"),
  Primary key ("Emp_ID", "Start_DT")
);



