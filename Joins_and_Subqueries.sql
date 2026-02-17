SHOW Databases;
Use techforallwithpriya;
show tables;
Select *from course_update;
SELECT *from learners;

/*---------------Which Courses have highest enrollement rates?(From learners table)?-------*/
SELECT SelectedCourses ,Count(*) As Max_Selected_Courses FROM learners
GROUP BY SelectedCourses 
ORDER BY Max_Selected_Courses DESC LIMIT 1;


/*---------------Which Courses have highest enrollement rates?(From learners table)? 
also  display the Course Name CourseId for the Highest enrolled Course.-----*/

SELECT  course_update.CourseName,course_update.CourseID ,COUNT(*) As Highest_Enrollement FROM learners
JOIN course_update
WHERE course_update.CourseID = learners.SelectedCourses
GROUP BY SelectedCourses
ORDER BY Highest_Enrollement DESC LIMIT 1;

