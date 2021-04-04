
------ Create command

Create table Table_Name (
	column_name data type,
	column_name2 data type);

-- Example
Create table Employee(
	emp_id int,
	emp_nm, varchar(50));

-- Use Serial data type
Create table Employee(
	emp_id SERIAL,
	emp_nm, varchar(50));

------ Add PK and FK

-- add PK
Create table Employee(
	emp_id SERIAL primary key,
	emp_nm, varchar(50));

-- add FK
Create table Company_Car(
	car_id SERIAL primary key,
	car_desc, varchar(255),
	emp_id int REFERENCES Employee(emp_id));

-- add combined PK
Create table Car_Map (
	emp_id int REFERENCES Employee(emp_id),
	car_id int REFERENCES Company_Car (car_id),
	Primary key (emp_id, car_id));

------ Alter command

-- modify a column
Alter table Employee Alter column emp_id SERIAL;

-- add a column
Alter table Employee Add column Address varchar(255);

-- delete a column
Alter table Employee Drop column Address;


------ Drop command

-- delete a column
Drop column Address;

-- delete a table
Drop table Employee;


















