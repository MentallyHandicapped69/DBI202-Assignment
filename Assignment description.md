# DBI202-Assignment

## This is a Student Grading Management Sub-System database,for each subject that attended by the student, the lecture will give score to the assessment to each of their assessment. Below figure shows an Example of the assessments for course DBI202.

![image](https://user-images.githubusercontent.com/100286938/174485972-e70254e7-5249-4ade-bc97-3b25f9b53eca.png)

Students can check their results at the end of semester as following example:

![image](https://user-images.githubusercontent.com/100286938/174486043-76c76bcf-2a98-475c-894f-5ce28482ce22.png)

Each Subject code, student can check their detailed result of as below example:

![image](https://user-images.githubusercontent.com/100286938/174486049-6f73fbd3-7a1b-437f-bb9b-d15edb8c7622.png)

# DATABASE REQUIREMEMTS

> The database must consist of at least six tables that have been populated with data. The database is to support queries that would typically be submitted to the system for the topical area that you have chosen. You must do the following:
 Self-investigation for the requirement of the system. Listed them all as form of reports, business rules.
·	Using UML, Chen’s notation to create an Entity Relationship (ER) model for your relational database. All entity types, their attributes and relationships must be clearly shown. You will also be required to show all cardinality and participation constraints. You should use some enhanced ER features in your conceptual model where it makes sense to do so.
·	Map the EER model devised in part (1) into a relational data model. It must be normalised up to at least 3rd Normal Form.
·	Using appropriate SQL commands create a set of database tables in MS SQL Server 2008+. You should also show all constraints used in the creation of the tables.
·	Populate the database with a small amount of data. The data should be meaningful but does not need to be extensive. The following sites may be useful for quickly generating data:
	http://www.databasetestdata.com/
	http://www.generatedata.com/
•	Your database must contain one view, one trigger, on store procedure and an index (describe why).
•	Create 10 sample queries that demonstrate the expressiveness of your database system. Your queries must demonstrate different aspects of the system.


 a)      A brief description of the database including any assumptions made during the design (THIS IS VERY IMPORTANT TO CLERIFY THE ASSUMTIONS in form of business rules).


 b)      An ERD (Entity Relationship Diagram) that fully describes the database (giving descriptions on your work would be appreciated).


 c)       The relational schema derived from the ERD that is at least in 3NF (Any detail of the process would be appreciated).


 d)      The set of database statements used to create the tables used in your database. You do NOT need to include all the data and insert statements.


 e)      10 queries that demonstrate the usefulness of the database. Also state why and when each query would be used. The following must be demonstrated by at least one of your queries:

o   A query that uses ORDER BY

o   A query that uses INNER JOINS

o   A query that uses aggregate functions

o   A query that uses the GROUP BY and HAVING clauses

o   A query that uses a sub-query as a relation

o   A query that uses a sub-query in the WHERE clause

o   A query that uses partial matching in the WHERE clause

o   A query that uses a self-JOIN


f)        The trigger, store procedure, and the index should be added (explain why you make it)
------------------------------------------------------------------------------------------------------------
## 1. Define Entites
### Student
  - **_StudentID_**
  - **_TerritoryID_** ( where does this student lives )
  - Student frist name
  - Student last name
  - Year of birth
  - Sex
  - Major
  - Contact Mail
  - Image ( image to identify the student )

### Lecture
  - **_LectureID_**
  - **_TerritoryID_** ( where does this lecture lives )
  - Lecture first name
  - Lecture last name
  - Year of birth
  - Sex
  - Worked since ( when lecture started working in this school )
  - Contact mail

### Territory
  - **_TerritoryID_**
  - Territory description

### Course (as known as 'Subject' )
  - **_CourseID_**
  - Course_Name
  - Number of sessions
  - Department
  - Semester
  - Number of credits

### StudentGroup :baby:
  - **_GroupID_**
  - **_StudentID_**
  - **_CourseID_** 
  - Enroll Date (dd/mm/yyyy that this student enroll in this course)

### Class
  - **_ClassID_**
  - **_LectureID_**
  - **_GroupID_**
  - **_CourseID_**
  - **_StudentID_**
  - Attendance Status ( whether if the student is attend to class or not )

### Piece of Work ( things must do if student take the course )
  - **_CourseID_**
  - **_Category_** 
  - Start date
  - End date

### Assessments
  - **_AssessmentID_**
  - **_Category_** 
  - Type (Type of piece of work)
  - Part (How many parts of value point need to pass the course)
  - Weight (this assessment account for ?% of the total point value)
  - Completion criteria (prerequisite condition to pass the assessment)
  - Duraton ( Time needed to do assessment )
  - Number of questions

### Process  ( The progress of student when doing Piece of Work ) :baby:
  - **_StudentID_**
  - **_CourseID_**
  - **_Category_**
  - Start date
  - End date

### Grading ( score that lecture give to students based on their assessments ) :baby:
  - **_LectureID_**
  - **_AssessmentID_**

### Result
  - **_ResultID_**
  - **_AssessmentID_**
  - Day of publication
  - Mark
  - Status
## 2. Convert ERD into relational mapping
#### 2.1. Define cardinality constraints/partial constraints
```
   1-1: look for partial constraints if it's total or partial
   1-n/n-1: move the primary key (PK) of the 1-sided table into the n-sided table and set it as foreign key (FK)
   n-n: create a new table that its PKs set is the combination of its relative tables' PKs
```
#### 2.2. Look for relationships between entities
```
- Student and Course: 1 student can enrolls in many course, vice versa, the the relationships is N-N
  ➜ so the table called StudentGroup has been created and its PKs are the PKs set of Student and Course table
```
### StudentGroup :baby:
  - **_GroupID_**
  - **_StudentID_**
  - **_CourseID_** 
  - Enroll Date (dd/mm/yyyy that this student enroll in this course)
```
- Lecture and class: 1 lecture can teaches/instructes in many class, but 1 class can only be teached by 1 lecture 
➜ so the relationship here is 1-N
```

```
- Class and StudentGroup: 1 group can be assigned into many class, but 1 class can only has 1 group 
➜ so the relationship here is 1-N
```
```
- Territory and Student/Lecture: as known as "Person", each person has their own territory that they live, 
 which include region, address, city, distinct,... ect.
 But 1 territory is the place for many people lives in ➜ so the relationships here is 1-N
```
```
- Course and Piece of works ( as known as to-do-Works): in each course include  many pieces of works like assignments, exams,..etc. 
But 1 piece of work is belong to 1 course 
( the assignment of the Database course cannot be same as the assignment of Data structure and algorithms course
, the exam about character of japanese cannot be the same as madarin) 
➜ so the so the relationships here is 1-N
```
```
- Student and Piece of works: if a student wants to pass this course and get the certificate,he/she will have to do all the Piece of works, 
and all Piece of works can be done by many students (many student can take final exam, can do the same assignment ) 
➜ so the relationship here is N-N
➜ the new table called "process" is created
```
### Process  ( The progress of student when doing Piece of Work ) :baby:
  - **_StudentID_**
  - **_CourseID_**
  - **_Category_**
  - Start date
  - End date
```
- Piece of works and Assessment: each Piece of works has their own assessment, assessment is the conditition to specify if the student pass the course or not.
but each assessment is belong to 1 course ( the assessment of madarin course and japanese can't be the same) 
➜ so the relationships here is 1-N
```
```
Lecture and Assessment: The lecture is going to give score to student based on their assessment, 
1 lecture can marking many assessment, 1 assessment also can be marked by many lectures 
( example: final exam is marked by many, many lectures but not only one, 
assignments and home works are also can be marked by other lectures if that lecture have knowledges and skills of that course of that major ) 
➜ so the relationships here is 1-N
➜ so the new table called "Grading (Marking) " is created
```
### Grading ( score that lecture give to students based on their assessments ) :baby:
  - **_LectureID_**
  - **_AssessmentID_**
```
Assessment and Result: in the end of course, after all student have their score of their category, the Result will appear and the whether students passed or not passed are all based on the result, 1 assessment can have many different result, but 1 result is belong to 1 assessment ( your Fundamental programming's result can not equals to your Object oriented programming's) ➜ so the so the relationships here is 1-N.
```


