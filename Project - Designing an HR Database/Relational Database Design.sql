
------ Create Tables
CREATE TABLE "Position" (
  "Job_ID" serial primary key,
  "Job_Title" Varchar(100)
);

CREATE TABLE "Department" (
  "Department_ID(" serial primary key,
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
  "Salary_ID(PK)" serial primary key,
  "Salary" Float
);


CREATE TABLE "Location" (
  "Location_ID" serial primary key,
  "Location" Varchar(100),
  "Address" Varchar(200),
  "City_ID" Int references City(City_ID))
);

CREATE TABLE "History" (
  "Emp_ID(PK)(FK)" Int references Employee(employee_id)),
  "Start_DT(PK)" Date,
  "End_DT" Date,
  "Job_ID(FK)" Int references Position(job_id)),
  "Department_ID(FK)" Int references Department(department_id)),
  "Location_ID(FK)" Int references Location(location_id)),
  "Salary_ID(FK)" Int references Salary(salary_id)),
  "Manager_ID(FK)" Int references Employee(employee_id))
);



