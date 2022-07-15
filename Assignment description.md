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
  - BirthDay
  - Sex
  - Major
  - Contact Mail
  - Image ( image to identify the student )

### Lecture
  - **_LectureID_**
  - **_TerritoryID_** ( where does this lecture lives )
  - Lecture first name
  - Lecture last name
  - BirthDay
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

### Class
  - **_ClassID_**
  - **_LectureID_**

### Piece of Work ( things must do if student take the course )
  - **_CourseID_**
  - **_Category_** 
  - Start date
  - End date
### Output
  - **_OutputID_**
  - **_StudentID_**
  - **_Category_** 
  - Submission status
### Assessments
  - **_AssessmentID_**
  - **_Category_** 
  - Type (Type of piece of work)
  - Part (How many parts of value point need to pass the course)
  - Weight (this assessment account for ?% of the total point value)
  - Completion criteria (prerequisite condition to pass the assessment)
  - Duraton ( Time needed to do assessment )
  - Number of questions

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
- Class and StudentGroup: 1 group can be assigned into many class,  1 class can also has many groups 
➜ so the relationship here is N-N
➜ so the table called Studied-in is created
```
### Studied-in :baby:
  - **_ClassID_**
  - **_GroupID_**
  - **_StudentID_**
  - **_CourseID_** 
  - Enroll Date (dd/mm/yyyy that this student enroll in this course)
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
- Process and Output: each Student do a piece of work will has an output, each student has many output in many category, but 1 output in 1 category can only be possessed by 1 student
➜ so the relationships here is 1-N
```
```
Lecture and Output: The lecture will give score to students based on their output, many lectures can give marks to many student and vice versa ( for example, the pratical exam and final exam can't be graded by 1 lecture)
➜ so the relationship here is N-N
➜ the new table called "grading" is created
```
### Grading 👶
  - **_LectureID_**
  - **_OutputID_**
  - submission status

```
- Grading and Assessment: After lectures grading scores for students, scores then will be compared with assessment conditions to find out whether the student pass the course or not, 1 gradding score will have to compare to many assessment conditions and 1 assessment conditions will be compared to many gradding score
➜ so the relationship here is N-N
➜ the new table called "result" is created
```
### Result 👶
  - **_OutputID_**
  - **_AssessmentID_**
  - Day of publication
  - Mark
  - Status



``` sql
USE DBI202_Assignment_SU2022

CREATE TABLE Territory(
	TerritoryID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	TerritoryName NVARCHAR(30) NOT NULL
)
CREATE TABLE Student(
	StudentID VARCHAR(25) NOT NULL PRIMARY KEY,
	TerritoryID INT NOT NULL FOREIGN KEY REFERENCES Territory(TerritoryID),
	StudentFirstName NVARCHAR(30) NOT NULL,
	StudentLastName NVARCHAR(30) NOT NULL,
	BirthDay DATE NOT NULL,
	Sex BIT NOT NULL,
	Major VARCHAR(55) NOT NULL,
	ContacMail VARCHAR(70) NOT NULL,
	[Image] NVARCHAR(255) NOT NULL,
)

CREATE TABLE Lecture(
	LectureID VARCHAR(25) NOT NULL PRIMARY KEY,
	TerritoryID INT NOT NULL FOREIGN KEY REFERENCES Territory(TerritoryID),
	LectureFirstName NVARCHAR(30) NOT NULL,
	LectureLastName NVARCHAR(30) NOT NULL,
	BirthDay DATE,
	Sex BIT NOT NULL,
	WorkedSince DATE NOT NULL,
	ContacMail VARCHAR(70) NOT NULL,
)
CREATE TABLE Course(
	CourseID VARCHAR(15) NOT NULL PRIMARY KEY,
	CourseName VARCHAR(70) NOT NULL,
	[Number of sessions] INT NOT NULL,
	Department VARCHAR(70) NOT NULL,
	Semester VARCHAR(15) NOT NULL,
	[Number of credits] INT NOT NULL,
)

CREATE TABLE StudentGroup(
	GroupID VARCHAR(15) NOT NULL,
	StudentID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Student(StudentID),
	CourseID VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES Course(CourseID),
	CONSTRAINT pk_StudentID_CourseID_GroupID PRIMARY KEY (GroupID,StudentID,CourseID),
	EnrolledDate DATE NOT NULL,
)
CREATE TABLE Class(
	ClassID VARCHAR(80) NOT NULL PRIMARY KEY,
	LectureID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Lecture(LectureID),
)
CREATE TABLE [Studied-in](
	ClassID VARCHAR(80) NOT NULL,
	StudentID VARCHAR(25) NOT NULL ,
	CourseID VARCHAR(15) NOT NULL ,
	GroupID VARCHAR(15) NOT NULL,
	[Attendance status] BIT NOT NULL,
	CONSTRAINT PK_ClassID_LectureID_CourseID_GroupID_StudentID PRIMARY KEY (ClassID,StudentID,CourseID,GroupID),
	CONSTRAINT fk_StudentID_CourseID_GroupID FOREIGN KEY (GroupID,StudentID,CourseID) 
	REFERENCES StudentGroup(GroupID,StudentID,CourseID),
	CONSTRAINT fk_ClassID FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
)

CREATE TABLE PieceOfWork(
	Category VARCHAR(40) NOT NULL PRIMARY KEY,
	CourseID VARCHAR(15) NOT NULL FOREIGN KEY REFERENCES Course(CourseID),
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
)

CREATE TABLE Assessment(
	AssessmentID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Category VARCHAR(40) NOT NULL FOREIGN KEY REFERENCES PieceOfWork(Category),
	[Type] NVARCHAR(15) NOT NULL,
	Part INT NOT NULL,
	[Weight] DECIMAL(5,2) NOT NULL,
	[Completion Criteria] INT NOT NULL,
	[No Question] INT,
)

CREATE TABLE Process(
	StudentID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Student(StudentID),
	Category VARCHAR(40) NOT NULL FOREIGN KEY REFERENCES PieceOfWork(Category),
	CONSTRAINT pk_StudentID_Category PRIMARY KEY (StudentID,Category),
)

CREATE TABLE [Output](
	OutputID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	StudentID VARCHAR(25) NOT NULL,
	Category VARCHAR(40) NOT NULL,
	CONSTRAINT fk_StudentID_Category FOREIGN KEY (StudentID,Category) REFERENCES Process(StudentID,Category),
	SubmisstionStatus BIT NOT NULL,
)

CREATE TABLE Grading(
	LectureID VARCHAR(25) NOT NULL FOREIGN KEY REFERENCES Lecture(LectureID),
	OutputID INT NOT NULL FOREIGN KEY REFERENCES [Output](OutputID),
	CONSTRAINT pk_LectureID_OutputID PRIMARY KEY (LectureID,OutputID),
)

CREATE TABLE Result(
	OutputID INT NOT NULL,
	[Graded by] VARCHAR(25) NOT NULL,
	CONSTRAINT fk_OutputID_Graded_by FOREIGN KEY ([Graded by],OutputID) REFERENCES Grading(LectureID,OutputID),
	AssessmentID INT NOT NULL FOREIGN KEY REFERENCES Assessment(AssessmentID),
	CONSTRAINT pk_OutputID_Graded_by_AssessmentID PRIMARY KEY (OutputID,[Graded by],AssessmentID),
	[Day of publication] DATE NOT NULL,
	Mark FLOAT,
	[Status] BIT,
)

---BEGIN INSERT 
-- TERRITORY
INSERT INTO Territory(TerritoryName)
VALUES
(N'North'),
(N'South'),
(N'East'),
(N'West')
SELECT * FROM Territory

--STUDENT
INSERT INTO Student(StudentID,TerritoryID,StudentLastName,StudentFirstName,BirthDay,Sex,Major,ContacMail,[Image])
VALUES
('DucCNHE161106',1,N'Chau Ngoc','Duc','2002-09-17',1,N'Software Engineering','duccnhe161106@fpt.edu.vn','he161106.png'),
('ChungDVHE160136',2,N'Do Van','Chung','2002-01-15',1,N'Information Assurance','chungdvhe160136@fpt.edu.vn','he160136.png'),
('DucNVHE160307',3,N'Nguyen Van','Duc','2002-05-03',1,N'Information Assurance','ducvnhe160307@fpt.edu.vn','he160307.png'),
('AnhLVHE160318',4,N'Le Viet','Anh','2002-06-10',1,N'Information Assurance','anhvlhe160318@fpt.edu.vn','he160318.png'),
('HuyNNHE161198',4,N'Nguyen Nhat','Huy','2002-05-27',1,N'Information Assurance','huynnhe161198@fpt.edu.vn','he161198.png'),
('DatHMHE160594',3,N'Ha Manh','Dat','2002-01-1',1,N'Information Assurance','dathmhe160594@fpt.edu.vn','he160594.png'),
('TamTTTHE161665',3,N'Tran Thi Thanh','Tam','2002-08-08',0,N'Information Assurance','tamttthe161665@fpt.edu.vn','he161665.png'),
('ThinhNDHE161890',2,N'Nguyen Doanh','Thinh','2002-09-06',1,N'Information Assurance','thinhndhe161890@fpt.edu.vn','he161890.png'),
('HiepDVHE163693',1,N'Dao Vu','Hiep','2002-12-10',1,N'Information Assurance','hiepdvhe163693@fpt.edu.vn','he163693.png'),
('VuongNVHE163581',1,N'Nguyen Van','Vuong','2002-11-11',1,N'Artificial Intelligence','vuongvnhe163581@fpt.edu.vn','he163581.png')
SELECT * FROM Student
--LECTURE
INSERT INTO Lecture(LectureID,TerritoryID,LectureLastName,LectureFirstName,BirthDay,Sex,WorkedSince,ContacMail)
VALUES
('annt79',1,N'Nguyen Tan','An',NULL,1,'2013-09-20','annt79@fpt.edu.vn'),
('sonnt5',2,N'Ngo Tung','Son',NULL,1,'2009-01-01','sonnt69@fe.edu.vn'),
('NangNTH',1,N'Nguyen Thi Hai','Nang',NULL,0,'2010-11-11','NangNTH@fe.edu.vn'),
('vandt',3,N'Do Thi','Van',NULL,0,'2016-12-09','vandt4@fe.edu.vn'),
('TungHT22',2,N'Hoang Thanh','Tung',NULL,1,'2019-04-28','TungHT22@fe.edu.vn'),
('bantq6969',4,N'Tran Quy','Ban',NULL,1,'2010-01-25','bantq6969@fpt.edu.vn')
SELECT * FROM Lecture
--COURSE
INSERT INTO Course(CourseID,CourseName,[Number of sessions],Department,Semester,[Number of credits])
VALUES 
('CSD201',N'Data Structures and Algorithms',30,N'Information Technology',3,3),
('DBI202',N'Introduction to Database systems',30,N'Information Technology',3,3),
('JPD113',N'Elementary Japanese',30,N'Languages',3,3),
('LAB211',N'Object Oriented Programming practices with JAVA',30,N'Information Technology',3,3),
('WED201c',N'Web design',5,N'Information Technology',3,3)
SELECT * FROM Course
---STUDENT GROUP
INSERT INTO StudentGroup(GroupID,StudentID,CourseID,EnrolledDate)
VALUES
--CSD
('IA1604','AnhLVHE160318','CSD201','2022-05-09'),
('IA1604','ChungDVHE160136','CSD201','2022-05-09'),
('IA1604','DatHMHE160594','CSD201','2022-05-09'),
('IA1604','DucCNHE161106','CSD201','2022-05-09'),
('IA1604','DucNVHE160307','CSD201','2022-05-09'),
('IA1604','HiepDVHE163693','CSD201','2022-05-09'),
('IA1604','HuyNNHE161198','CSD201','2022-05-09'),
('IA1604','TamTTTHE161665','CSD201','2022-05-09'),
('IA1604','ThinhNDHE161890','CSD201','2022-05-09'),
('IA1604','VuongNVHE163581','CSD201','2022-05-09'),
--DBI
('IA1604','AnhLVHE160318','DBI202','2022-05-10'),
('IA1604','ChungDVHE160136','DBI202','2022-05-10'),
('IA1604','DatHMHE160594','DBI202','2022-05-10'),
('IA1604','DucCNHE161106','DBI202','2022-05-10'),
('IA1604','DucNVHE160307','DBI202','2022-05-10'),
('IA1604','HiepDVHE163693','DBI202','2022-05-10'),
('IA1604','HuyNNHE161198','DBI202','2022-05-10'),
('IA1604','TamTTTHE161665','DBI202','2022-05-10'),
('IA1604','ThinhNDHE161890','DBI202','2022-05-10'),
('IA1604','VuongNVHE163581','DBI202','2022-05-10'),
--JPD
('IA1604','AnhLVHE160318','JPD113','2022-05-10'),
('IA1604','ChungDVHE160136','JPD113','2022-05-10'),
('IA1604','DatHMHE160594','JPD113','2022-05-10'),
('IA1604','DucCNHE161106','JPD113','2022-05-10'),
('IA1604','DucNVHE160307','JPD113','2022-05-10'),
('IA1604','HiepDVHE163693','JPD113','2022-05-10'),
('IA1604','HuyNNHE161198','JPD113','2022-05-10'),
('IA1604','TamTTTHE161665','JPD113','2022-05-10'),
('IA1604','ThinhNDHE161890','JPD113','2022-05-10'),
('IA1604','VuongNVHE163581','JPD113','2022-05-10'),
--LAB
('IA1604','AnhLVHE160318','LAB211','2022-05-09'),
('IA1604','ChungDVHE160136','LAB211','2022-05-09'),
('IA1604','DatHMHE160594','LAB211','2022-05-09'),
('IA1604','DucCNHE161106','LAB211','2022-05-09'),
('IA1604','DucNVHE160307','LAB211','2022-05-09'),
('IA1604','HiepDVHE163693','LAB211','2022-05-09'),
('IA1604','HuyNNHE161198','LAB211','2022-05-09'),
('IA1604','TamTTTHE161665','LAB211','2022-05-09'),
('IA1604','ThinhNDHE161890','LAB211','2022-05-09'),
('IA1604','VuongNVHE163581','LAB211','2022-05-09'),
--WED
('SE1637','DucCNHE161106','WED201c','2022-05-21')
SELECT * FROM StudentGroup ORDER BY CourseID
---CLASS
select * from Lecture
select * from Course
select * from StudentGroup
select * from Student
INSERT INTO Class(ClassID,LectureID)
VALUES
('CSD201_SLOT1_SUMMER2022_annt79','annt79'),
('DBI202_SLOT2_SUMMER2022_sonnt5','sonnt5'),
('LAB211_SLOT3_SUMMER2022_NangNTH','NangNTH'),
('JPD113_SLOT4_SUMMER2022_vandt','vandt'),
('WED201c_SLOT5_SUMMER2022_TungHT22','TungHT22')

INSERT INTO [Studied-in](ClassID,CourseID,GroupID,StudentID,[Attendance status])
VALUES
--CSD
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','AnhLVHE160318',1),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','ChungDVHE160136',1),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','DatHMHE160594',1),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','DucCNHE161106',1),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','DucNVHE160307',1),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','HiepDVHE163693',1),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','HuyNNHE161198',0),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','TamTTTHE161665',1),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','ThinhNDHE161890',1),
('CSD201_SLOT1_SUMMER2022_annt79','CSD201','IA1604','VuongNVHE163581',1),
--DBI
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','AnhLVHE160318',1),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','ChungDVHE160136',1),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','DatHMHE160594',0),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','DucCNHE161106',1),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','DucNVHE160307',1),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','HiepDVHE163693',0),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','HuyNNHE161198',1),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','TamTTTHE161665',0),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','ThinhNDHE161890',1),
('DBI202_SLOT2_SUMMER2022_sonnt5','DBI202','IA1604','VuongNVHE163581',1),
--LAB
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','AnhLVHE160318',1),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','ChungDVHE160136',1),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','DatHMHE160594',0),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','DucCNHE161106',1),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','DucNVHE160307',1),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','HiepDVHE163693',0),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','HuyNNHE161198',0),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','TamTTTHE161665',0),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','ThinhNDHE161890',1),
('LAB211_SLOT3_SUMMER2022_NangNTH','LAB211','IA1604','VuongNVHE163581',1),
--JPD
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','AnhLVHE160318',1),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','ChungDVHE160136',0),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','DatHMHE160594',0),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','DucCNHE161106',1),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','DucNVHE160307',1),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','HiepDVHE163693',1),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','HuyNNHE161198',0),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','TamTTTHE161665',0),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','ThinhNDHE161890',1),
('JPD113_SLOT4_SUMMER2022_vandt','JPD113','IA1604','VuongNVHE163581',0),
--WED
('WED201c_SLOT5_SUMMER2022_TungHT22','WED201c','SE1637','DucCNHE161106',0)
SELECT * FROM Class

INSERT INTO PieceOfWork(Category,CourseID,StartDate,EndDate)
VALUES
--csd
(N'CSD201_pt','CSD201','2022-05-18','2022-06-18'),
(N'CSD201_as','CSD201','2022-05-25','2022-06-23'),
(N'CSD201_pe','CSD201','2022-07-16','2022-07-16'),
(N'CSD201_fe','CSD201','2022-08-02','2022-08-02'),
--dbi
(N'DBI202_as','DBI202','2022-07-08','2022-08-02'),
(N'DBI202_lab','DBI202','2022-05-18','2022-06-18'),
(N'DBI202_pt','DBI202','2022-05-23','2022-06-21'),
(N'DBI202_pe','DBI202','2022-07-23','2022-07-23'),
(N'DBI202_fe','DBI202','2022-08-01','2022-08-01'),
--jpd
(N'JPD113_mt','JPD113','2022-06-11','2022-06-11'),
(N'JPD113_ptcpt','JPD113','2022-05-10','2022-07-21'), --participation
(N'JPD113_pt','JPD113','2022-05-23','2022-06-21'),
(N'JPD113_fe','JPD113','2022-07-24','2022-07-24'),
--wed
(N'WED201c_pe','WED201c','2022-08-14','2022-08-14'),
(N'WED201c_fe','WED201c','2022-08-21','2022-08-21'),
--lab
(N'LAB211_pratices','LAB211','2022-05-9','2022-07-22')

--PROCESS
INSERT INTO Process(StudentID,Category)
VALUES
('AnhLVHE160318','CSD201_as'),
('AnhLVHE160318','CSD201_fe'),
('AnhLVHE160318','CSD201_pe'),
('AnhLVHE160318','CSD201_pt'),
('AnhLVHE160318','DBI202_as'),
('AnhLVHE160318','DBI202_fe'),
('AnhLVHE160318','DBI202_lab'),
('AnhLVHE160318','DBI202_pe'),
('AnhLVHE160318','DBI202_pt'),
('AnhLVHE160318','JPD113_fe'),
('AnhLVHE160318','JPD113_mt'),
('AnhLVHE160318','JPD113_pt'),
('AnhLVHE160318','JPD113_ptcpt'),
('AnhLVHE160318','LAB211_pratices'),

('ChungDVHE160136','CSD201_as'),
('ChungDVHE160136','CSD201_fe'),
('ChungDVHE160136','CSD201_pe'),
('ChungDVHE160136','CSD201_pt'),
('ChungDVHE160136','DBI202_as'),
('ChungDVHE160136','DBI202_fe'),
('ChungDVHE160136','DBI202_lab'),
('ChungDVHE160136','DBI202_pe'),
('ChungDVHE160136','DBI202_pt'),
('ChungDVHE160136','JPD113_fe'),
('ChungDVHE160136','JPD113_mt'),
('ChungDVHE160136','JPD113_pt'),
('ChungDVHE160136','JPD113_ptcpt'),
('ChungDVHE160136','LAB211_pratices'),

('DatHMHE160594','CSD201_as'),
('DatHMHE160594','CSD201_fe'),
('DatHMHE160594','CSD201_pe'),
('DatHMHE160594','CSD201_pt'),
('DatHMHE160594','DBI202_as'),
('DatHMHE160594','DBI202_fe'),
('DatHMHE160594','DBI202_lab'),
('DatHMHE160594','DBI202_pe'),
('DatHMHE160594','DBI202_pt'),
('DatHMHE160594','JPD113_fe'),
('DatHMHE160594','JPD113_mt'),
('DatHMHE160594','JPD113_pt'),
('DatHMHE160594','JPD113_ptcpt'),
('DatHMHE160594','LAB211_pratices'),

('DucCNHE161106','CSD201_as'),
('DucCNHE161106','CSD201_fe'),
('DucCNHE161106','CSD201_pe'),
('DucCNHE161106','CSD201_pt'),
('DucCNHE161106','DBI202_as'),
('DucCNHE161106','DBI202_fe'),
('DucCNHE161106','DBI202_lab'),
('DucCNHE161106','DBI202_pe'),
('DucCNHE161106','DBI202_pt'),
('DucCNHE161106','JPD113_fe'),
('DucCNHE161106','JPD113_mt'),
('DucCNHE161106','JPD113_pt'),
('DucCNHE161106','JPD113_ptcpt'),
('DucCNHE161106','LAB211_pratices'),
('DucCNHE161106','WED201c_fe'),
('DucCNHE161106','WED201c_pe'),

('DucNVHE160307','CSD201_as'),
('DucNVHE160307','CSD201_fe'),
('DucNVHE160307','CSD201_pe'),
('DucNVHE160307','CSD201_pt'),
('DucNVHE160307','DBI202_as'),
('DucNVHE160307','DBI202_fe'),
('DucNVHE160307','DBI202_lab'),
('DucNVHE160307','DBI202_pe'),
('DucNVHE160307','DBI202_pt'),
('DucNVHE160307','JPD113_fe'),
('DucNVHE160307','JPD113_mt'),
('DucNVHE160307','JPD113_pt'),
('DucNVHE160307','JPD113_ptcpt'),
('DucNVHE160307','LAB211_pratices'),

('HiepDVHE163693','CSD201_as'),
('HiepDVHE163693','CSD201_fe'),
('HiepDVHE163693','CSD201_pe'),
('HiepDVHE163693','CSD201_pt'),
('HiepDVHE163693','DBI202_as'),
('HiepDVHE163693','DBI202_fe'),
('HiepDVHE163693','DBI202_lab'),
('HiepDVHE163693','DBI202_pe'),
('HiepDVHE163693','DBI202_pt'),
('HiepDVHE163693','JPD113_fe'),
('HiepDVHE163693','JPD113_mt'),
('HiepDVHE163693','JPD113_pt'),
('HiepDVHE163693','JPD113_ptcpt'),
('HiepDVHE163693','LAB211_pratices'),

('HuyNNHE161198','CSD201_as'),
('HuyNNHE161198','CSD201_fe'),
('HuyNNHE161198','CSD201_pe'),
('HuyNNHE161198','CSD201_pt'),
('HuyNNHE161198','DBI202_as'),
('HuyNNHE161198','DBI202_fe'),
('HuyNNHE161198','DBI202_lab'),
('HuyNNHE161198','DBI202_pe'),
('HuyNNHE161198','DBI202_pt'),
('HuyNNHE161198','JPD113_fe'),
('HuyNNHE161198','JPD113_mt'),
('HuyNNHE161198','JPD113_pt'),
('HuyNNHE161198','JPD113_ptcpt'),
('HuyNNHE161198','LAB211_pratices'),

('TamTTTHE161665','CSD201_as'),
('TamTTTHE161665','CSD201_fe'),
('TamTTTHE161665','CSD201_pe'),
('TamTTTHE161665','CSD201_pt'),
('TamTTTHE161665','DBI202_as'),
('TamTTTHE161665','DBI202_fe'),
('TamTTTHE161665','DBI202_lab'),
('TamTTTHE161665','DBI202_pe'),
('TamTTTHE161665','DBI202_pt'),
('TamTTTHE161665','JPD113_fe'),
('TamTTTHE161665','JPD113_mt'),
('TamTTTHE161665','JPD113_pt'),
('TamTTTHE161665','JPD113_ptcpt'),
('TamTTTHE161665','LAB211_pratices'),

('ThinhNDHE161890','CSD201_as'),
('ThinhNDHE161890','CSD201_fe'),
('ThinhNDHE161890','CSD201_pe'),
('ThinhNDHE161890','CSD201_pt'),
('ThinhNDHE161890','DBI202_as'),
('ThinhNDHE161890','DBI202_fe'),
('ThinhNDHE161890','DBI202_lab'),
('ThinhNDHE161890','DBI202_pe'),
('ThinhNDHE161890','DBI202_pt'),
('ThinhNDHE161890','JPD113_fe'),
('ThinhNDHE161890','JPD113_mt'),
('ThinhNDHE161890','JPD113_pt'),
('ThinhNDHE161890','JPD113_ptcpt'),
('ThinhNDHE161890','LAB211_pratices'),

('VuongNVHE163581','CSD201_as'),
('VuongNVHE163581','CSD201_fe'),
('VuongNVHE163581','CSD201_pe'),
('VuongNVHE163581','CSD201_pt'),
('VuongNVHE163581','DBI202_as'),
('VuongNVHE163581','DBI202_fe'),
('VuongNVHE163581','DBI202_lab'),
('VuongNVHE163581','DBI202_pe'),
('VuongNVHE163581','DBI202_pt'),
('VuongNVHE163581','JPD113_fe'),
('VuongNVHE163581','JPD113_mt'),
('VuongNVHE163581','JPD113_pt'),
('VuongNVHE163581','JPD113_ptcpt'),
('VuongNVHE163581','LAB211_pratices')
---output
INSERT INTO [Output](StudentID,Category,SubmisstionStatus)
VALUES
('AnhLVHE160318','CSD201_as',1),
('AnhLVHE160318','CSD201_fe',0),
('AnhLVHE160318','CSD201_pe',0),
('AnhLVHE160318','CSD201_pt',1),
('AnhLVHE160318','DBI202_as',0),
('AnhLVHE160318','DBI202_fe',0),
('AnhLVHE160318','DBI202_lab',1),
('AnhLVHE160318','DBI202_pe',0),
('AnhLVHE160318','DBI202_pt',1),
('AnhLVHE160318','JPD113_fe',0),
('AnhLVHE160318','JPD113_mt',1),
('AnhLVHE160318','JPD113_pt',1),
('AnhLVHE160318','JPD113_ptcpt',1),
('AnhLVHE160318','LAB211_pratices',0),

('ChungDVHE160136','CSD201_as',1),
('ChungDVHE160136','CSD201_fe',0),
('ChungDVHE160136','CSD201_pe',0),
('ChungDVHE160136','CSD201_pt',1),
('ChungDVHE160136','DBI202_as',0),
('ChungDVHE160136','DBI202_fe',0),
('ChungDVHE160136','DBI202_lab',1),
('ChungDVHE160136','DBI202_pe',0),
('ChungDVHE160136','DBI202_pt',1),
('ChungDVHE160136','JPD113_fe',0),
('ChungDVHE160136','JPD113_mt',1),
('ChungDVHE160136','JPD113_pt',1),
('ChungDVHE160136','JPD113_ptcpt',1),
('ChungDVHE160136','LAB211_pratices',0),

('DatHMHE160594','CSD201_as',1),
('DatHMHE160594','CSD201_fe',0),
('DatHMHE160594','CSD201_pe',0),
('DatHMHE160594','CSD201_pt',1),
('DatHMHE160594','DBI202_as',0),
('DatHMHE160594','DBI202_fe',0),
('DatHMHE160594','DBI202_lab',1),
('DatHMHE160594','DBI202_pe',0),
('DatHMHE160594','DBI202_pt',1),
('DatHMHE160594','JPD113_fe',0),
('DatHMHE160594','JPD113_mt',1),
('DatHMHE160594','JPD113_pt',1),
('DatHMHE160594','JPD113_ptcpt',0),
('DatHMHE160594','LAB211_pratices',0),

('DucCNHE161106','CSD201_as',1),
('DucCNHE161106','CSD201_fe',0),
('DucCNHE161106','CSD201_pe',0),
('DucCNHE161106','CSD201_pt',1),
('DucCNHE161106','DBI202_as',0),
('DucCNHE161106','DBI202_fe',0),
('DucCNHE161106','DBI202_lab',1),
('DucCNHE161106','DBI202_pe',0),
('DucCNHE161106','DBI202_pt',1),
('DucCNHE161106','JPD113_fe',0),
('DucCNHE161106','JPD113_mt',1),
('DucCNHE161106','JPD113_pt',1),
('DucCNHE161106','JPD113_ptcpt',1),
('DucCNHE161106','LAB211_pratices',1),
('DucCNHE161106','WED201c_fe',0),
('DucCNHE161106','WED201c_pe',0),

('DucNVHE160307','CSD201_as',1),
('DucNVHE160307','CSD201_fe',0),
('DucNVHE160307','CSD201_pe',0),
('DucNVHE160307','CSD201_pt',1),
('DucNVHE160307','DBI202_as',1),
('DucNVHE160307','DBI202_fe',0),
('DucNVHE160307','DBI202_lab',1),
('DucNVHE160307','DBI202_pe',0),
('DucNVHE160307','DBI202_pt',1),
('DucNVHE160307','JPD113_fe',0),
('DucNVHE160307','JPD113_mt',1),
('DucNVHE160307','JPD113_pt',1),
('DucNVHE160307','JPD113_ptcpt',1),
('DucNVHE160307','LAB211_pratices',1),

('HiepDVHE163693','CSD201_as',1),
('HiepDVHE163693','CSD201_fe',0),
('HiepDVHE163693','CSD201_pe',0),
('HiepDVHE163693','CSD201_pt',1),
('HiepDVHE163693','DBI202_as',0),
('HiepDVHE163693','DBI202_fe',0),
('HiepDVHE163693','DBI202_lab',1),
('HiepDVHE163693','DBI202_pe',0),
('HiepDVHE163693','DBI202_pt',1),
('HiepDVHE163693','JPD113_fe',0),
('HiepDVHE163693','JPD113_mt',1),
('HiepDVHE163693','JPD113_pt',1),
('HiepDVHE163693','JPD113_ptcpt',0),
('HiepDVHE163693','LAB211_pratices',0),

('HuyNNHE161198','CSD201_as',1),
('HuyNNHE161198','CSD201_fe',0),
('HuyNNHE161198','CSD201_pe',0),
('HuyNNHE161198','CSD201_pt',1),
('HuyNNHE161198','DBI202_as',0),
('HuyNNHE161198','DBI202_fe',0),
('HuyNNHE161198','DBI202_lab',1),
('HuyNNHE161198','DBI202_pe',0),
('HuyNNHE161198','DBI202_pt',1),
('HuyNNHE161198','JPD113_fe',0),
('HuyNNHE161198','JPD113_mt',1),
('HuyNNHE161198','JPD113_pt',0),
('HuyNNHE161198','JPD113_ptcpt',0),
('HuyNNHE161198','LAB211_pratices',1),

('TamTTTHE161665','CSD201_as',1),
('TamTTTHE161665','CSD201_fe',0),
('TamTTTHE161665','CSD201_pe',0),
('TamTTTHE161665','CSD201_pt',1),
('TamTTTHE161665','DBI202_as',0),
('TamTTTHE161665','DBI202_fe',0),
('TamTTTHE161665','DBI202_lab',1),
('TamTTTHE161665','DBI202_pe',0),
('TamTTTHE161665','DBI202_pt',1),
('TamTTTHE161665','JPD113_fe',0),
('TamTTTHE161665','JPD113_mt',1),
('TamTTTHE161665','JPD113_pt',1),
('TamTTTHE161665','JPD113_ptcpt',1),
('TamTTTHE161665','LAB211_pratices',0),

('ThinhNDHE161890','CSD201_as',1),
('ThinhNDHE161890','CSD201_fe',0),
('ThinhNDHE161890','CSD201_pe',0),
('ThinhNDHE161890','CSD201_pt',1),
('ThinhNDHE161890','DBI202_as',1),
('ThinhNDHE161890','DBI202_fe',0),
('ThinhNDHE161890','DBI202_lab',1),
('ThinhNDHE161890','DBI202_pe',0),
('ThinhNDHE161890','DBI202_pt',1),
('ThinhNDHE161890','JPD113_fe',0),
('ThinhNDHE161890','JPD113_mt',1),
('ThinhNDHE161890','JPD113_pt',1),
('ThinhNDHE161890','JPD113_ptcpt',1),
('ThinhNDHE161890','LAB211_pratices',1),

('VuongNVHE163581','CSD201_as',1),
('VuongNVHE163581','CSD201_fe',0),
('VuongNVHE163581','CSD201_pe',0),
('VuongNVHE163581','CSD201_pt',1),
('VuongNVHE163581','DBI202_as',1),
('VuongNVHE163581','DBI202_fe',0),
('VuongNVHE163581','DBI202_lab',1),
('VuongNVHE163581','DBI202_pe',0),
('VuongNVHE163581','DBI202_pt',1),
('VuongNVHE163581','JPD113_fe',0),
('VuongNVHE163581','JPD113_mt',1),
('VuongNVHE163581','JPD113_pt',1),
('VuongNVHE163581','JPD113_ptcpt',0),
('VuongNVHE163581','LAB211_pratices',1)
--ASSESSMENT
INSERT INTO Assessment(Category,[Type],Part,[Weight],[Completion Criteria],[No Question])

VALUES
('CSD201_as','on-going',2,20.00,0,null),
('CSD201_fe',N'final exam',1,30.00,4,50),
('CSD201_pe','on-going',1,30.00,0,4),
('CSD201_pt','quiz',2,20.00,0,30),

('DBI202_as','on-going',1,20.00,0,null),
('DBI202_fe',N'final exam',1,30.00,4,50),
('DBI202_lab','on-going',5,10.00,4,null),
('DBI202_pe','on-going',1,30.00,0,null),
('DBI202_pt','on-going',2,10.00,0,20),

('JPD113_fe',N'final exam',2,40.00,4,null),
('JPD113_mt','on-going',1,30.00,0,45),
('JPD113_pt','on-going',2,20.00,0,20),
('JPD113_ptcpt','on-going',1,10.00,750,null),

('LAB211_pratices','on-going',1,100.00,0,null),

('WED201c_fe',N'final exam',1,50.00,4,null),
('WED201c_pe',N'final exam',1,50.00,4,60)
--GRADING
INSERT INTO Grading(LectureID,OutputID)
VALUES
('annt79',1),
('annt79',2),
('annt79',3),
('annt79',4),
('annt79',15),
('annt79',16),
('annt79',17),
('annt79',18),
('annt79',29),
('annt79',30),
('annt79',31),
('annt79',32),
('annt79',43),
('annt79',44),
('annt79',45),
('annt79',46),
('annt79',59),
('annt79',60),
('annt79',61),
('annt79',62),
('annt79',73),
('annt79',74),
('annt79',75),
('annt79',76),
('annt79',87),
('annt79',88),
('annt79',89),
('annt79',90),
('annt79',101),
('annt79',102),
('annt79',103),
('annt79',104),
('annt79',115),
('annt79',116),
('annt79',117),
('annt79',118),
('annt79',129),
('annt79',130),
('annt79',131),
('annt79',132),


('sonnt5',5),
('sonnt5',6),
('sonnt5',7),
('sonnt5',8),
('sonnt5',9),
('sonnt5',19),
('sonnt5',20),
('sonnt5',21),
('sonnt5',22),
('sonnt5',23),
('sonnt5',33),
('sonnt5',34),
('sonnt5',35),
('sonnt5',36),
('sonnt5',37),
('sonnt5',47),
('sonnt5',48),
('sonnt5',49),
('sonnt5',50),
('sonnt5',51),
('sonnt5',63),
('sonnt5',64),
('sonnt5',65),
('sonnt5',66),
('sonnt5',67),
('sonnt5',77),
('sonnt5',78),
('sonnt5',79),
('sonnt5',80),
('sonnt5',81),
('sonnt5',91),
('sonnt5',92),
('sonnt5',93),
('sonnt5',94),
('sonnt5',95),
('sonnt5',105),
('sonnt5',106),
('sonnt5',107),
('sonnt5',108),
('sonnt5',109),
('sonnt5',119),
('sonnt5',120),
('sonnt5',121),
('sonnt5',122),
('sonnt5',123),
('sonnt5',133),
('sonnt5',134),
('sonnt5',135),
('sonnt5',136),
('sonnt5',137),

('vandt',10),
('vandt',11),
('vandt',12),
('vandt',13),
('vandt',24),
('vandt',25),
('vandt',26),
('vandt',27),
('vandt',38),
('vandt',39),
('vandt',40),
('vandt',41),
('vandt',52),
('vandt',53),
('vandt',54),
('vandt',55),
('vandt',68),
('vandt',69),
('vandt',70),
('vandt',71),
('vandt',82),
('vandt',83),
('vandt',84),
('vandt',85),
('vandt',96),
('vandt',97),
('vandt',98),
('vandt',99),
('vandt',110),
('vandt',111),
('vandt',112),
('vandt',113),
('vandt',124),
('vandt',125),
('vandt',126),
('vandt',127),
('vandt',138),
('vandt',139),
('vandt',140),
('vandt',141),

('NangNTH',14),
('NangNTH',28),
('NangNTH',42),
('NangNTH',56),
('NangNTH',72),
('NangNTH',86),
('NangNTH',100),
('NangNTH',114),
('NangNTH',128),
('NangNTH',142),

('TungHT22',57),
('TungHT22',58)

--RESULT
INSERT INTO Result(OutputID,[Graded by],AssessmentID,[Day of publication],Mark,[Status])
VALUES
(1,'annt79',1,'2022-06-26',8,1),
(2,'annt79',2,'2022-08-05',NULL,0),
(3,'annt79',3,'2022-07-30',NULL,0),
(4,'annt79',4,'2022-06-20',8,1),
(15,'annt79',1,'2022-06-26',6,1),
(16,'annt79',2,'2022-08-05',NULL,0),
(17,'annt79',3,'2022-07-30',NULL,0),
(18,'annt79',4,'2022-06-20',7.5,1),
(29,'annt79',1,'2022-06-26',10,1),
(30,'annt79',2,'2022-08-05',NULL,0),
(31,'annt79',3,'2022-07-30',NULL,0),
(32,'annt79',4,'2022-06-20',5,1),
(43,'annt79',1,'2022-06-26',8,1),
(44,'annt79',2,'2022-08-05',NULL,0),
(45,'annt79',3,'2022-07-30',NULL,0),
(46,'annt79',4,'2022-06-20',7.5,1),
(59,'annt79',1,'2022-06-26',10,1),
(60,'annt79',2,'2022-08-05',NULL,0),
(61,'annt79',3,'2022-07-30',NULL,0),
(62,'annt79',4,'2022-06-20',9.5,1),
(73,'annt79',1,'2022-06-26',6,1),
(74,'annt79',2,'2022-08-05',NULL,0),
(75,'annt79',3,'2022-07-30',NULL,0),
(76,'annt79',4,'2022-06-20',7,1),
(87,'annt79',1,'2022-06-26',5,1),
(88,'annt79',2,'2022-08-05',NULL,0),
(89,'annt79',3,'2022-07-30',NULL,0),
(90,'annt79',4,'2022-06-20',6.5,1),
(101,'annt79',1,'2022-06-26',7,1),
(102,'annt79',2,'2022-08-05',NULL,0),
(103,'annt79',3,'2022-07-30',NULL,0),
(104,'annt79',4,'2022-06-20',8.5,1),
(115,'annt79',1,'2022-06-26',9,1),
(116,'annt79',2,'2022-08-05',NULL,0),
(117,'annt79',3,'2022-07-30',NULL,0),
(118,'annt79',4,'2022-06-20',9.5,1),
(129,'annt79',1,'2022-06-26',8,1),
(130,'annt79',2,'2022-08-05',NULL,0),
(131,'annt79',3,'2022-07-30',NULL,0),
(132,'annt79',4,'2022-06-20',8,1),
--dbi
(5,'sonnt5',5,'2022-08-02',NULL,0),
(6,'sonnt5',6,'2022-08-27',NULL,0),
(7,'sonnt5',7,'2022-06-20',7,1),
(8,'sonnt5',8,'2022-07-30',NULL,0),
(9,'sonnt5',9,'2022-06-28',6.5,1),
(19,'sonnt5',5,'2022-08-02',NULL,0),
(20,'sonnt5',6,'2022-08-27',NULL,0),
(21,'sonnt5',7,'2022-06-20',7.5,1),
(22,'sonnt5',8,'2022-07-30',NULL,0),
(23,'sonnt5',9,'2022-06-28',7.5,1),
(33,'sonnt5',5,'2022-08-02',NULL,0),
(34,'sonnt5',6,'2022-08-27',NULL,0),
(35,'sonnt5',7,'2022-06-20',6,1),
(36,'sonnt5',8,'2022-07-30',NULL,0),
(37,'sonnt5',9,'2022-06-28',7,1),
(47,'sonnt5',5,'2022-08-02',NULL,0),
(48,'sonnt5',6,'2022-08-27',NULL,0),
(49,'sonnt5',7,'2022-06-20',7,1),
(50,'sonnt5',8,'2022-07-30',NULL,0),
(51,'sonnt5',9,'2022-06-28',7,1),
(63,'sonnt5',5,'2022-08-02',NULL,0),
(64,'sonnt5',6,'2022-08-27',NULL,0),
(65,'sonnt5',7,'2022-06-20',9,1),
(66,'sonnt5',8,'2022-07-30',NULL,0),
(67,'sonnt5',9,'2022-06-28',8,1),
(77,'sonnt5',5,'2022-08-02',NULL,0),
(78,'sonnt5',6,'2022-08-27',NULL,0),
(79,'sonnt5',7,'2022-06-20',7,1),
(80,'sonnt5',8,'2022-07-30',NULL,0),
(81,'sonnt5',9,'2022-06-28',6.5,1),
(91,'sonnt5',5,'2022-08-02',NULL,0),
(92,'sonnt5',6,'2022-08-27',NULL,0),
(93,'sonnt5',7,'2022-06-20',5,1),
(94,'sonnt5',8,'2022-07-30',NULL,0),
(95,'sonnt5',9,'2022-06-28',5.5,1),
(105,'sonnt5',5,'2022-08-02',NULL,0),
(106,'sonnt5',6,'2022-08-27',NULL,0),
(107,'sonnt5',7,'2022-06-20',7,1),
(108,'sonnt5',8,'2022-07-30',NULL,0),
(109,'sonnt5',9,'2022-06-28',6.5,1),
(119,'sonnt5',5,'2022-08-02',NULL,0),
(120,'sonnt5',6,'2022-08-27',NULL,0),
(121,'sonnt5',7,'2022-06-20',9,1),
(122,'sonnt5',8,'2022-07-30',NULL,0),
(123,'sonnt5',9,'2022-06-28',10,1),
(133,'sonnt5',5,'2022-08-02',NULL,0),
(134,'sonnt5',6,'2022-08-27',NULL,0),
(135,'sonnt5',7,'2022-06-20',8,1),
(136,'sonnt5',8,'2022-07-30',NULL,0),
(137,'sonnt5',9,'2022-06-28',9,1),
--JPD
(10,'vandt',10,'2022-07-31',NULL,0),
(11,'vandt',11,'2022-06-16',9.75,1),
(12,'vandt',12,'2022-05-23',8.5,1),
(13,'vandt',13,'2022-07-21',10,1),
(24,'vandt',10,'2022-07-31',NULL,0),
(25,'vandt',11,'2022-06-16',6.75,1),
(26,'vandt',12,'2022-05-23',5.5,1),
(27,'vandt',13,'2022-07-21',8,1),
(38,'vandt',10,'2022-07-31',NULL,0),
(39,'vandt',11,'2022-06-16',5.75,1),
(40,'vandt',12,'2022-05-23',4.5,1),
(41,'vandt',13,'2022-07-21',7,1),
(52,'vandt',10,'2022-07-31',NULL,0),
(53,'vandt',11,'2022-06-16',9.5,1),
(54,'vandt',12,'2022-05-23',8.75,1),
(55,'vandt',13,'2022-07-21',10,1),
(68,'vandt',10,'2022-07-31',NULL,0),
(69,'vandt',11,'2022-06-16',8,1),
(70,'vandt',12,'2022-05-23',7.75,1),
(71,'vandt',13,'2022-07-21',10,1),
(82,'vandt',10,'2022-07-31',NULL,0),
(82,'vandt',11,'2022-06-16',7,1),
(84,'vandt',12,'2022-05-23',6.75,1),
(85,'vandt',13,'2022-07-21',7.5,1),
(96,'vandt',10,'2022-07-31',NULL,0),
(97,'vandt',11,'2022-06-16',5,1),
(98,'vandt',12,'2022-05-23',5.75,1),
(99,'vandt',13,'2022-07-21',6.5,1),
(110,'vandt',10,'2022-07-31',NULL,0),
(111,'vandt',11,'2022-06-16',6,1),
(112,'vandt',12,'2022-05-23',6.75,1),
(113,'vandt',13,'2022-07-21',7,1),
(124,'vandt',10,'2022-07-31',NULL,0),
(125,'vandt',11,'2022-06-16',10,1),
(126,'vandt',12,'2022-05-23',8.75,1),
(127,'vandt',13,'2022-07-21',10,1),
(138,'vandt',10,'2022-07-31',NULL,0),
(139,'vandt',11,'2022-06-16',5,1),
(140,'vandt',12,'2022-05-23',4.75,1),
(141,'vandt',13,'2022-07-21',7,1),
--LAB
(14,'NangNTH',14,'2022-07-22',660,0),
(28,'NangNTH',14,'2022-07-22',570,0),
(42,'NangNTH',14,'2022-07-22',420,0),
(56,'NangNTH',14,'2022-07-22',725,0),
(72,'NangNTH',14,'2022-07-22',760,1),
(86,'NangNTH',14,'2022-07-22',550,0),
(100,'NangNTH',14,'2022-07-22',773,1),
(114,'NangNTH',14,'2022-07-22',60,0),
(128,'NangNTH',14,'2022-07-22',750,1),
(142,'NangNTH',14,'2022-07-22',752,1),
--WED
(57,'TungHT22',15,'2022-08-29',NULL,0),
(58,'TungHT22',16,'2022-07-21',NULL,0)
```
