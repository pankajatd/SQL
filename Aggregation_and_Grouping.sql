SHOW Databases;
Use techforallwithpriya;
show tables;

SELECT *FROM Learners;
SELECT *FROM Course;

/*----Count the Number of Students who joined the Course Via LinkedIN ,YouTube,COmmunity----*/
SELECT SourceOfJoining ,COUNT(*) Total_Studs 
FROM Learners 
GROUP BY SourceOfJoining;

/*----Count the Number of Students who joined the Course Via SourceOfJoining and Location----*/

SELECT SourceOfJoining,Location, COUNT(*) As Num_of_Students FROM Learners
GROUP BY SourceOfJoining ,Location;


/*--------------------Corresponding to each Course how many Students have Enrolled----------------*/
SELECT SelectedCourses,COUNT(*) Students_Per_Course 
FROM Learners
GROUP BY SelectedCourses;


/*---Corresponding to each Source of Joining ,get the Maximum Years of Experience--------*/

SELECT SourceOfJoining ,MAX(YearsOfExp) Max_Yrs_Of_Exp FROM Learners
GROUP BY SourceOFJoining;


/*---Corresponding to each Source of Joining ,get the Minimum Years of Experience--------*/
SELECT SourceOfJoining ,MIN(YearsOfExp) As Min_Yrs_Of_Exp FROM Learners
GROUP BY SourceOfJoining;


/*---Corresponding to each Source of Joining ,get the Average Years of Experience--------*/
SELECT SourceOfJoining ,AVG(YearsOfExp) As AVG_Years_Of_Exp FROM Learners
GROUP BY SourceOfJoining;


/*---Corresponding to each Source of Joining ,get the SUMMATION of Years of Experience--------*/
SELECT SourceOfJoining ,SUM(YearsOfExp) as Tot_Sum_Of_Yrs_Of_Exp FROM Learners
GROUP BY SourceOfJoining;


/*----Display the Records of those learners who have joined the course through More that 1 SourceOfJoining---*/
/**--Whenever Filteration is Required after Aggregation,Use Having Clause After Group BY Clause*/
SELECT SourceOfJoining ,COUNT(*) As Number_of_Students FROM Learners
 GROUP BY SourceOfJoining
 Having Number_of_Students>2;
 

SELECT *FROM Learners;

INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Sidhish","Kumar",'9998827776','sidhish@gmail.com','2024-01-21',1,4,'Amazon','LinkedIn','2024-01-16','Gurugram');

INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExp,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES("Kaneesha","Kumar",'9998857772','kaneesha@gmail.com','2024-01-21',1,5,'Google','LinkedIn','2024-01-16','Bengaluru');


/*----Display the Count of Students whose SourceOfJoining is only through LinkedIn---*/
SELECT SourceOfJoining ,COUNT(*)As Num_Of_Students FROM Learners GROUP BY SourceOfJoining Having SourceOfJoining ="LinkedIn" ;



/**-----USE OF LOGICAL OPERATORS -AND,ORand NOT----**/


/**COMMAND TO DISPALY THE CourseName with SQL**/
SELECT *FROM Course WHERE CourseName LIKE '%SQL%';

/***Display the Course Name that does not includes Excel**/
SELECT *FROM Course 
WHERE CourseName NOT LIKE "Excel";


/***DISPLAY THE RECORDS WHO HAVE 4 Years of Experience and Source Of Joining YouTube and Location is Delhi**/

/**When Multiple Constarints need to be satisfied and all of them have to be Satisfied then Use "AND" Operator**/
SELECT *FROM Learners WHERE SourceOfJoining LIKE "%YouTube%" 
AND YearsOfExp>4 
AND Location LIKE '%Delhi%';


/***Display Records of students who have Experience between 1 and 4 Years**/
SELECT *FROM Learners WHERE YearsOfExp  BETWEEN 1 AND 4;


/***DISPLAY THE RECORDS WHO HAVE 4 Years of Experience OR Source Of Joining YouTube OR Location is Delhi**/

/**When Multiple Constarints need to be satisfied and Any one of them  have to be Satisfied then Use "OR" Operator**/

SELECT *FROM Learners
WHERE yearsOfExp<4
OR SourceOfJoining="YouTube" 
OR Location="Delhi";

DESC employee;

/*******ALTER Command to Modify the Schema of the Table employee-Add a new column jobPosition varchar(50)********/
ALTER TABLE employee ADD Column jobPosition varchar(50);


/**To Modify the Schema in the existiong table columns - Modify the column FirstName from varchar(50) to varchar(40)**/
ALTER TABLE employee MODIFY column  FirstName varchar(40);


/**Drop the PrimaryKey from the table employee**/
ALTER TABLE employee DROP column jobPosition;

DESC employee;



/*--------------TRUNCATE IN SQL---------------------*/


/***-----DATA TYPE IN SQL---***/

INSERT INTO Course(CourseName,CourseDuration_Months,CourseFee) VALUES("Foundations In Machine Learning",3.5,4499);
SELECT *FROM Course;

/**--Create a Table Course_Update with CourseDuration_Months as Decimal Data Type**/
CREATE TABLE Course_Update(
CourseID INT AUTO_INCREMENT,
CourseName varchar(50)NOT NULL,
CourseDuration_Months DECIMAL(3,1) NOT NULL,
CourseFee INT NOT NULL,
Changed_at TIMESTAMP DEFAULT NOW(),
PRIMARY KEY (CourseID)
);

DROP TABLE Course_Update;

INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) VALUES("SQL Bootcamp",1,2999);
INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) VALUES("DSA for Interview Preparation",2,4999);
INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) VALUES("Complete Excel Mastery Course",2.5,1499);
INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) VALUES("Foundations In Machine Learning",3.5,4499);

SELECT *FROM Course_Update;

INSERT INTO Course_Update(CourseName,CourseDuration_Months,CourseFee) VALUES("Statistics for Data Science",1.5,3999);


/*** Command to Update the fees for Couse SQL Boot Camp to 3999***/


UPDATE Course_Update SET CourseFee=3999 
WHERE CourseID=1;

/**--Create a Table Course_Update with CourseDuration_Months as Decimal Data Type**/
CREATE TABLE Course_Update(
CourseID INT AUTO_INCREMENT,
CourseName varchar(50)NOT NULL,
CourseDuration_Months DECIMAL(3,1) NOT NULL,
CourseFee INT NOT NULL,
Changed_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW(),
PRIMARY KEY (CourseID)
);