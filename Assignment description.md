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
  - Student_name
  - Birthday
  - Sex
  - Major
  - Contact_Mail
  - Image
  - Address

### Lecture
  - **_LectureID_**
  - Lecture_name
  - Birthday
  - Sex
  - Hired_date
  - Instructed_subject
  - Contact_mail
  - Address

### Course (as known as 'Subject' )
  - **_CourseID_**
  - Course_Name
  - Session_no
  - Student_materials
  - Department
  - Semester

## Group
  - **_GroupID_**
  - **_StudentID_**
  - **_LectureID_**
  - **_CourseID_** 
  - Enroll_Date (dd/mm/yyyy that this student enroll in this course)

## Instruction
  - **_GroupID_**
  - **_LectureID_**

## Assessments
  - **_CourseID_**
  - **_Category_** (Type of assessment)
  - Type (TYpe of category of assessment)
  - Part (How many parts of value point need to pass the course)
  - Weight (this assessment account for ?% of the total point value)
  - Completion_Criteria (prerequisite condition to pass the assessment)
  - Duraton ( Time needed to do assessment)
  - Question_type
  - Number_of_questions
  - Knowledge_and_Skills
  - Grading_guide
  - Note (As known as description)

## Examination
  - **_StudentID_**
  - **_Category_**

## Grade Report
  - **_CourseID_**
  - **_Category_**
  - Semester
  - Grade_item(s)
  - Weight
  - Value
  - Comment
  - Course_total_average_status

## Result
  - **_CourseID_**
  - **_GroupID_**
  - Semester
  - Start_date
  - End_date
  - Average_mark
  - Status

