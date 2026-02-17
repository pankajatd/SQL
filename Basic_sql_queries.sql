SHOW databases;

CREATE DATABASE  if not exists techforallwithpriya;

SELECT database();

USE techforallwithpriya;

CREATE TABLE employee(
        FirstName varchar(20),
		lastName varchar(20),
        Age int,
        Salary int,
        Location varchar(20)
);

DESC employee;

SHOW tables;

INSERT INTO employee VALUES("Priya","Bhatia",26,100000,"Bengaluru");
INSERT INTO employee VALUES("Sumedha","Midha",32,50000,"Gurugram");
INSERT INTO employee VALUES("Rashmi","Tanwar",30,20000,"Bengaluru");
INSERT INTO employee VALUES("Shivam","Mishra",28,10000,"Noida");
INSERT INTO employee VALUES("Ajay","Bhatia",25,5000,"Mumbai");
INSERT INTO employee VALUES("Ankit","Sangwan",34,70000,"Bengaluru");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Alia","Bhatt",29,50000,"Gurugram");

SELECT *FROM employee;

DELETE from employee where FirstName="Priya";

DROP TABLE employee;

SHOW tables;

CREATE TABLE employee(
        FirstName varchar(20) NOT NULL,
		lastName varchar(20) NOT NULL,
        Age int NOT NULL,
        Salary int NOT NULL,
        Location varchar(20) NOT NULL
);

DESC employee;






/*Method1: Creating the employee table with employe ID column*/ 

CREATE TABLE employee(
        EmpID int PRIMARY KEY,
        FirstName varchar(20) NOT NULL,
		LastName varchar(20) NOT NULL,
        Age int NOT NULL,
        Salary int NOT NULL,
        Location varchar(20) NOT NULL
);


/*Method2: Creating the employee table with employe ID column

CREATE TABLE employee(
        EmpID int,
        FirstName varchar(20) NOT NULL,
		LastName varchar(20) NOT NULL,
        Age int NOT NULL,
        Salary int NOT NULL,
        Location varchar(20) NOT NULL,
        PRIMARY KEY(EmpID)
);*/

/*Inserting the data into employee table with Primary key ID*/


INSERT INTO employee VALUES(1,"Priya","Bhatia",26,100000,"Bengaluru");
INSERT INTO employee VALUES(2,"Sumedha","Midha",32,50000,"Gurugram");
INSERT INTO employee VALUES(3,"Rashmi","Tanwar",30,20000,"Bengaluru");
INSERT INTO employee VALUES(4,"Shivam","Mishra",28,10000,"Noida");
INSERT INTO employee VALUES(5,"Ajay","Bhatia",25,5000,"Mumbai");
INSERT INTO employee VALUES(6,"Ankit","Sangwan",34,70000,"Bengaluru");
INSERT INTO employee (EmpID,FirstName,lastName,Age,Salary,Location)VALUES(7,"Alia","Bhatt",29,50000,"Gurugram");




/* Creating table with Auto Increment Feature*/
CREATE TABLE employee(
        EmpID int AUTO_INCREMENT,
        FirstName varchar(20) NOT NULL,
		LastName varchar(20) NOT NULL,
        Age int NOT NULL,
        Salary int NOT NULL,
        Location varchar(20) NOT NULL,
        PRIMARY KEY(EmpID)
);
SHOW tables;

Desc employee;

/*Inserting values into the table with Auto_Increment Feature*/

INSERT INTO employee (FirstName,lastName,Age,Salary,Location) VALUES("Priya","Bhatia",26,100000,"Bengaluru");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Sumedha","Midha",32,50000,"Gurugram");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Rashmi","Tanwar",30,20000,"Bengaluru");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Shivam","Mishra",28,10000,"Noida");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Ajay","Bhatia",25,5000,"Mumbai");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Ankit","Sangwan",34,70000,"Bengaluru");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Alia","Bhatt",29,50000,"Gurugram");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Jitendra","Mishra",21,50000,"Bengaluru");
INSERT INTO employee (FirstName,lastName,Age,Salary,Location)VALUES("Sanya","Bhatt",29,70000,"Gurugram");

SELECt *from employee;


/*Retrieve only the Firstname and Lastname column data from the Employee table*/
SELECT FirstName,LastName from employee;


/*Retrieve Firstname and Lastname of the Employee whose Salary >=50000 from the Employee table*/
SELECT FirstName,LastName from employee WHERE Salary>=50000;

/*Retrieve Firstname and Lastname of the Employee whose Salary >=50000 .Display the records in the Descending Order*/
SELECT FirstName,LastName,Salary  from employee where Salary>=50000 ORDER BY Salary DESC;




/*Retrieve Firstname and Lastname of the Employee whose Salary >=50000 .Display the recordsin the Default Order*/
SELECT FirstName,LastName,Salary  from employee where Salary>=50000 ORDER BY Salary;


/*Retrieve Firstname and Lastname of the Employee whose Salary >=50000 .Display the records in the Descending Order*/
SELECT FirstName,LastName,Salary  from employee WHERE Salary>=50000 ORDER BY  Salary DESC LIMIT 2;



/***************** UPDATE COMMANDS*************************/
/** Update lastName of EmpId =6 to "Tanwar"**/
UPDATE employee SET LastName ="Tanwar" WHERE
EmpID=6;

SELECT *from employee;


/** Update Salary ofAjay Bhatia from 5000 to 50000"**/

UPDATE employee set Salary =50000 WHERE EmpID=5;

SELECT *from employee;

/** Delete Employee with EmpID=6**/

DELETE from employee where EmpID=6;
SELECT *from employee;



/* Modifying the schema of the employee table . change the length of the column FirstName from varchar(50 ) to varchar(20)**/

ALTER TABLE employee MODIFY FirstName varchar(20) ;
DESC employee;


/*Count /*Count the number of employees working in a company in the employee table*/

SELECT COUNT(*) FROM employee;

/*Provide an Alias name to the COUNT(*) */
SELECT COUNT(*) As Total_Num_Employee FROM employee;


SELECT *from employee;


/**Get maximum Salary of an Employee in the employee table*/

SELECT MAX(Salary) FROM employee;

SELECT MAX(Salary) As Max_Salary FROM employee;

/*Get the MinimumSalary of an Employee in the company*/

SELECT MIN(Salary) As Min_Salary FROM employee;

/*Get the Aggregrated Salary of all the Employees in the company*/
SELECT SUM(Salary) As Total_Cost_Company FROM employee;



/* CREATE TABLE COURSE*/

CREATE TABLE Course(
CourseID INT AUTO_INCREMENT,
CourseName varchar(50)NOT NULL,
CourseDuration_Months INT NOT NULL,
CourseFee INT NOT NULL,
PRIMARY KEY (CourseID)
);
DESC Course;
SHOW TABLES;

INSERT INTO Course(CourseName,CourseDuration_Months,CourseFee) VALUES("SQL Bootcamp",1,2999);
INSERT INTO Course(CourseName,CourseDuration_Months,CourseFee) VALUES("DSA for Interview Preparation",2,4999);
INSERT INTO Course(CourseName,CourseDuration_Months,CourseFee) VALUES("Complete Excel Mastery Course",3,1499);

SELECT *FROM Course;

CREATE TABLE Learners(
Learner_Id INT AUTO_INCREMENT,
LearnerFirstName VARCHAR(50) NOT NULL,
LearnerLastName VARCHAR(50) NOT NULL,
LearnerEmailID VARCHAR(50) NOT NULL,
LearnerPhoneNo VARCHAR(15) NOT NULL,
LearnerEnrollmentDate TIMESTAMP NOT NULL,
SelectedCourses INT NOT NULL,
YearsOfExp INT NOT NULL,
LearnerCompany VARCHAR(50),
SourceOfJoining VARCHAR(50) NOT NULL,
Batch_Start_Date TIMESTAMP NOT NULL,
Location VARCHAR(50) NOT NULL,
PRIMARY KEY (Learner_Id),
UNIQUE KEY(LearnerEmailID),
FOREIGN KEY(SelectedCourses) REFERENCES Course(CourseID)
);

DESC Learners;
SHOW tables;

/*------Insert the Learners details in the Learners table-----*/
/*--Batch Start Date '1' - '2024-02-29'
/*--Batch Start Date '2' - '2024-01-16'
/*--Batch Start Date '3' - '2024-03-25'--*/


INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Akash","Mishra",'9998887776','akash@gmail.com','2024-01-21',1,4,'Amazon','LinkedIn','2024-01-16','Bengaluru');
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Akhil","George",'9998881112','akhil.george.8743@gmail.com','2024-02-10',2,3,'Microsoft','LinkedIn','2024-02-29','Gurugram');
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Madhuram","Ravichandran",'9898887716','ravichandran.madhuram@gmail.com','2024-03-21',3,5,'CapGemini','YouTube','2024-03-25','Delhi');
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Jeevan","Hegde",'9888887776','jeevanhegde@yahoo.co.in','2024-02-01',1,6,'Cisco','Instagram','2024-02-29','Mumbai');
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Sidhish","Kumar",'9917887726','sidhishkumar@gmail.com','2024-03-15',3,1,'FaceBook','LinkedIn','2024-03-25','Lucknow');
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("NagaSai"," Sreedhar",'9888887112','saisreedhar2001@gmail.com','2024-01-02',2,8,'Cognizant','YouTube','2024-01-16','Pune');
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Rishikesh"," Joshi",'9788887152','carjkop@gmail.com','2024-01-02',2,1,'Infosys','YouTube','2024-01-16','Indore');

SELECT *FROM Learners;
SHOW TABLES;

/*--------DATA ANALYSIS-------[Employee,Learners,Course]*/

/*-------1. Get the Record of the Employee getting the Highest Salary-------*/

/*--EXECUTION ORDER OF THE COMMAND--*/
 /*  **FROM(Fetch the Table) ==>SELECT(Selects the Columns)=>ORDER BY (Sorts the column Data)==>LIMIT(Restricts the Data Dispaly to 1)***/
SELECT *FROM employee ORDER BY Salary DESC LIMIT 1;

/**--ALTERNATE COMMAND**/
SELECT *FROM employee WHERE Salary =(SELECT MAX(SALARY) FROM employee);


/*-------2. Get the Record of the Employee getting the Highest Salary where age of the employee is greater than 25-------*/

/*--EXECUTION ORDER OF THE COMMAND--*/
 /*  **FROM(Fetch the Table) ==>WHERE Clause To Filter the Data by Age(gets all the Records with Age >25) SELECT(Selects all the Columns)=>
     =>ORDER BY (Sorts the column Salary Data for those Records)==>LIMIT(Restricts the Data Dispaly to 1)***/

SELECT *FROM employee WHERE Age>25 ORDER BY Salary  DESC LIMIT 1;

/*-------3. Display the Number of enrollements in techForAllWithPriya.Fetch from Learners Table,As Enrollement details are in Learners table-------*/
SELECT COUNT(*) Num_of_Enrollements FROM Learners;

/***--Dispaly the Number of enrollements where CourseID=3***/
SELECT COUNT(*) Num_of_Enrollements_SQL FROM Learners  where SelectedCourses=3;

/**Count the Number of Enrollements in the Month of JAN**/

/** QUERIES WITH PATTERN MATCHNG--USING LIKE ---**/
SELECT COUNT(*) Num_Jan_Enrollements FROM Learners WHERE LearnerEnrollmentDate LIKE '%-01-%';


/**Count the Number of Enrollements in the Month of JAN 21**/
SELECT COUNT(*) Num_Jan_Enrollements FROM Learners WHERE LearnerEnrollmentDate LIKE '%-01-21%';

SELECT *FROm Learners;

/** UPDATE THE LearnersCompany of Jeevan to LinkedIN and YearsOfExp to 1**/
UPDATE Learners SET YearsOfExp=3 , LearnerCompany ="Amazon"
WHERE Learner_Id=4; 

SELECT *FROm Learners;

/** Count the Number of Companies the learner s belong to**/
SELECT COUNT(LearnerCompany) FROM Learners; 

SELECT COUNT(DISTINCT LearnerCompany) as Distinct_Companies FROM Learners; 


