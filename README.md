# DBI202-Assignment

## This is a Student Grading Management Sub-System database,for each subject that attended by the student, the lecture will give score to the assessment to each of their assessment. Below figure shows an Example of the assessments for course DBI202.

![image](https://user-images.githubusercontent.com/100286938/174485972-e70254e7-5249-4ade-bc97-3b25f9b53eca.png)

Students can check their results at the end of semester as following example:

![image](https://user-images.githubusercontent.com/100286938/174486043-76c76bcf-2a98-475c-894f-5ce28482ce22.png)

Each Subject code, student can check their detailed result of as below example:

![image](https://user-images.githubusercontent.com/100286938/174486049-6f73fbd3-7a1b-437f-bb9b-d15edb8c7622.png)

# DATABASE REQUIREMEMTS

[x] a)      A brief description of the database including any assumptions made during the design (THIS IS VERY IMPORTANT TO CLERIFY THE ASSUMTIONS in form of business rules).


[x] b)      An ERD (Entity Relationship Diagram) that fully describes the database (giving descriptions on your work would be appreciated).


[ ] c)       The relational schema derived from the ERD that is at least in 3NF (Any detail of the process would be appreciated).


[ ] d)      The set of database statements used to create the tables used in your database. You do NOT need to include all the data and insert statements.


[ ] e)      10 queries that demonstrate the usefulness of the database. Also state why and when each query would be used. The following must be demonstrated by at least one of your queries:

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
  - Student_Name
  - DOB
  - Sex
  - Major
  - Contact_Mail
  - Image
  - Address
  - City
  - Region
  - Country

### Lecture
  - **_LectureID_**
  - Lecture_Name
  - DOB
  - Sex
  - Hired_Date
  - Instructed_Subject
  - Contact_Mail
  - Address
  - City
  - Region
  - Country

### Course (as known as 'Subject' )
  - **_CourseID_**
  - Course_Name
  - Department
  - LectureID
  - Semester

## Enroll
  - **_StudentID_**
  - **_CourseID_**
  - Enroll_Date
## Assessments
  - **_CourseID_**
  - **_Assessment_Category_**
  - Type
  - Part
  - Weight
  - Completion_Criteria
  - Duraton
  - Question_Type
  - Number_of_Questions
  - Knowledge_and_Skills
  - Grading_Guide
  - Note

