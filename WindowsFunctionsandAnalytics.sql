/**---Write a command to find the total number of employees corresponding to each Location**/

SHOW Databases;
Use techforallwithpriya;
show tables;

SELECt *FROm employee;

SELECT Location ,COUNT(*) as Tot_Emp_Per_Loc 
FROM employee 
GROUP BY Location;

/**---Write a command to find the total number of employees corresponding to each Location and Avg Salary in those Locations**/
SELECT Location,COUNT(*) As Tot_Emp_Per_Loc ,SUM(Salary) As Avg_Salary FROM employee 
GROUP BY Location;

/**---Write a command to find the total number of employees corresponding to each Location and Avg Salary in those Locations
Also display Firstname ,LastName corresponding to each record.**/

SELECT FirstName,Lastname ,employee.Location ,Tot_Emp_Per_Loc,Avg_Salary
FROM employee
JOIN
(SELECT Location,COUNT(Location) As Tot_Emp_Per_Loc ,AVG(Salary) As Avg_Salary FROM employee 
GROUP BY Location) As temp_tbl
ON employee.Location =temp_tbl.Location;


/*** OPTIMIZE the above Query Using Window Functions--/**---Write a command to find the total number of employees corresponding to each Location and Avg Salary in those Locations
Also display Firstname ,LastName corresponding to each record.**/


/** PARTION BY is USED WHEN WE WANT TO DISPALY THE NON_AGGREGATE COLUMNS**/
SELECT FirstName,LastName,Location,
COUNT(Location) OVER (PARTITION BY Location) AS Total ,
AVG(Salary) OVER(PARTITION BY Location) As AVG_Salary
FROM employee;

SeleCT *FROM employee;



INSERT INTO employee (FirstName,lastName,Age,Salary,Location) VALUES("Jeevan","Mishra",27,100000,"Chennai");

INSERT INTO employee (FirstName,lastName,Age,Salary,Location) VALUES("Akash","Kumar",32,50000,"Mumbai");

/*******CReate a New Column "Priority" and Number it based on hte Salary of the Employee. For the Highest paid employee ,
the Priority should be Set as ! and So on**/

SELECT FirstName,LastName,Salary,
ROW_NUMBER() OVER (ORDER BY Salary DESC) AS Priority_Emp
FROM employee;

/** RANK is USed to handle the issue that is seen with ROW_NUMBER**/

SELECT FirstName,LastName,Salary,
RANK() OVER(ORDER BY Salary DESC) As Priority_Emp
FROM employee;

/** DENSE_RANK() is USed to handle the issue that is seen with RANK()**/
/**- IF there are no diuplicate records, ROW_NUMBER(),RANK(),DENSE_RANK() will all work the same**/

SELECT FirstName,LastName,Salary,
DENSE_RANK() OVER(ORDER BY Salary DESC) As Priority_Emp
FROM employee;

/** Extract the all employees who gets the Third Highest Salary**/
SELECT *FROM
(SELECT FirstName,LastName,Salary,
DENSE_RANK() OVER(ORDER BY Salary DESC) As Priority_Emp
FROM employee) as temp
WHERE Priority_Emp=3;

/** Give the First employee who gets the Third Highest Salary**/
SELECT *FROM
(SELECT FirstName,LastName,Salary,
ROW_NUMBER() OVER(ORDER BY Salary DESC) As Priority_Emp
FROM employee) as temp
WHERE Priority_Emp=3;

/******Specify the Highest Salary from each Location**/
SELECT *FROM
(SELECT FirstName,LastName,Salary,Location,
ROW_NUMBER() OVER(PARTITION BY Location ORDER BY Salary DESC) As Priority_Emp
FROM employee) as temp
WHERE Priority_Emp=1;



