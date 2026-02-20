SHOW Databases;
Use techforallwithpriya;
show tables;

SELECT *FROM course_update;


/**---_CASE STATEMENTS IN SQL------**/
/**** Create a new coulmn as course_fee_Status.

****Course_fee >3999 --Course is Expensive
****Course_fee >1499 --Course is Moderate
****ELSE Course is Cheap Course ***/


SELECT CourseID,CourseName,CourseFee,
	CASE
        WHEN CourseFee>3999 THEN "Expensive Course"
        WHEN CourseFee>1499 THEN "Moderate Course"
	    ELSE "Cheap Course"
	END AS CourseFeeStatus 
FROM course_update;
    
/***CASE EXPRESSION IN SQL***/
/******Categorizing the Course based on Course Fees.--
       CourseType: Premium Course,Plus Course,Regular Course.**/
       
       SELECT CourseID,CourseFee,CourseName ,
			CASE CourseFee
                WHEN 4999 THEN "Premium Course"
                WHEN 3999 THEN "Plus Course"
                ELSE "Regular Course"
			END AS CourseType
	  FROM course_update;
            
             
/*------CREATE TABLE Orders in techforallwithpriya database----*/
/*****Fields : OrderID --PrimaryKey (AutoIncrement)
               Order_Date
               Order_Student_ID
               Order_Status-->Complete,Pending,Closed******/
               
               


 
 
 CREATE TABLE Orders (OrderID int AUTO_INCREMENT,
                     Order_Date timestamp NOT NULL,
                     Order_Learner_Id int NOT NULL,
                     Order_Status varchar(30) NOT NULL,
                     PRIMARY KEY(OrderID),
                     FOREIGN KEY(Order_Learner_Id) REFERENCES learners(Learner_Id));
 
SHOW tables;
Desc Orders;

/*-------------------Insert Records into the Orders Table----------------------*/
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-22',3,'Complete');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-15',4,'Complete');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-12',5,'Complete');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-16',7,'Complete');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-13',8,'Complete');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-14',9,'Complete');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-22',1,'Pending');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-12',5,'Pending');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-25',1,'Pending');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-11',7,'Closed');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-11',7,'Closed');

INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-10',5,'Complete');
INSERT INTO Orders(Order_Date,Order_Learner_Id,Order_Status) values('2024-01-19',4,'Pending');

SELECT *FROM Orders;

/*****Total orders Per Student-----*/
/**--- Display Order_learner_Id,Total_Orders----*/
SELECT Order_learner_Id,COUNT(*) As Total_Orders
FROM Orders
GROUP BY Order_learner_Id;

/*****Total orders Per Student-----*/
/**--- Display Order_learner_Id,LearnersFirstName,LearnersLastName,Total_Orders----*/

SELECT *FROM learners;
Select Orders.Order_learner_Id,learners.LearnerFirstName,learners.LearnerLastName,COUNT(OrderID) as Total_Orders 
FROM learners
JOIN Orders
WHERE Orders.Order_learner_Id =learners.Learner_Id
GROUP BY Order_learner_Id;


/*****Total orders Per Student-----*/
/**--- Display Order_learner_Id,LearnersFirstName,LearnersLastName,Total_Orders Avg_Orders----*/
SELECT temp.Order_learner_Id,learners.LearnerFirstName,learners.LearnerLastName,temp.Total_Orders,AVG(SUM(temp.Total_Orders)) OVER()
as Avg_SUM_Orders_Per_Students 
FROM
(Select Order_learner_Id,COUNT(*) as Total_Orders 
FROM Orders
GROUP BY Order_learner_Id)  as temp
JOIN learners
ON temp.Order_learner_Id = learners.Learner_Id
GROUP BY temp.Order_learner_Id;


/****Display the premium Users for techforallwithpriya
/***---total_orders >avg_orders
