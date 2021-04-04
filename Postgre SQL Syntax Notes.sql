
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



------ Create stage 

-- create stage table
Create table Stg(player varchar(50), team varchar(50), position varchar(50));

-- load data into stage table
Insert into Stg Values ('Bob', 'Browns', 'Quarterback'),
('Tyrell', 'Reds', 'Full Back'),
('Darrin', 'Blues', 'Kicker'),
('Frank', 'Reds', 'Quarterback');

-- create table and load data into table from stage
-- create a table
Create table Team (
team_id serial primary key,
team_nm varchar(50));

Create table Position (
position_id serial primary key,
position_nm varchar(50));

Create table Player (
player_id serial primary key,
player_nm varchar(50),
team_id int references Team(team_id),
position_id int references Position(position_id));

-- load data
Insert into Team(team_nm) Select distinct team from Stg;

Insert into Position(position_nm) Select distinct position from Stg;

Insert into Player(player_nm, team_id, position_id) Select s.player, t.team_id, p.position_id
From stg as s Join team as t On s.team = t.team_nm
			  Join position as p On s.position = p.position_nm;

















