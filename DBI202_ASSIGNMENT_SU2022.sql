use DBI202_Assignment_SU2022

CREATE TABLE Student(
	StudentID NVARCHAR(10) NOT NULL PRIMARY KEY,
	StudentFirstName NVARCHAR(10) NOT NULL,
	StudentLastName NVARCHAR(10) NOT NULL,
	TerritoryID INT NOT NULL,
	CONSTRAINT FK_Student_Territory FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID),
	BirthDay DATE NOT NULL,
	Sex BIT NOT NULL, -- 1 IS MALE, 0 IS FEMALE
	Major NVARCHAR(35) NOT NULL,
	ContactMail NVARCHAR(50) NOT NULL,
	[Image] NVARCHAR(255) NOT NULL, -- co img datatype nhung ko lay dc file anh :(
)

CREATE TABLE Course(
	CourseID NVARCHAR(10) NOT NULL PRIMARY KEY,
	CourseName NVARCHAR(20) NOT NULL,
	NumberOfSessions INT NOT NULL,
	Department NVARCHAR(30) NOT NULL,
	Semester INT NOT NULL,
	NoOfCredits INT NOT NULL,
)

CREATE TABLE Lecture(
	LectureID NVARCHAR(10) NOT NULL PRIMARY KEY,
	TerritoryID INT NOT NULL,
	LectureFirstName NVARCHAR(10) NOT NULL,
	LectureLastName NVARCHAR(10) NOT NULL,
	CONSTRAINT FK_Lecture_Territory FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID),
	BirthDay DATE,
	Sex BIT NOT NULL, -- 1 IS MALE, 0 IS FEMALE
	WorkedSince DATE NOT NULL,
	ContactMail NVARCHAR(50) NOT NULL,
)

CREATE TABLE Territory(
	TerritoryID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	TerritoryName NVARCHAR(20) NOT NULL,
)

CREATE TABLE StudentGroup(
	GroupID NVARCHAR(10) NOT NULL,
	StudentID NVARCHAR(10) NOT NULL,
	CourseID NVARCHAR(10) NOT NULL,
	CONSTRAINT PK_Group_Student_Course PRIMARY KEY (GroupID,StudentID,CourseID),
	CONSTRAINT FK_Student FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
	CONSTRAINT FK_Course FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
)

CREATE TABLE Class(
	ClassID NVARCHAR(10) NOT NULL,
	GroupID NVARCHAR(10) NOT NULL,
	StudentID NVARCHAR(10) NOT NULL,
	CourseID NVARCHAR(10) NOT NULL,
	LectureID NVARCHAR(10) NOT NULL,
	CONSTRAINT PK_Lecture_Group_Course_Student PRIMARY KEY (ClassID,LectureID,GroupID,CourseID,StudentID),
	CONSTRAINT FK_Lecture_Class FOREIGN KEY (LectureID) REFERENCES Lecture(LectureID),
	CONSTRAINT FK_Group FOREIGN KEY (GroupID,StudentID,CourseID) REFERENCES StudentGroup(GroupID,StudentID,CourseID),
)

CREATE TABLE PieceOfWork(
	Category NVARCHAR(20) NOT NULL PRIMARY KEY,
	CourseID NVARCHAR(10) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL,
	CONSTRAINT FK_PieceOfWork_In_Course FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
)

CREATE TABLE Process(
	StudentID NVARCHAR(10) NOT NULL,
	Category NVARCHAR(20) NOT NULL
	CONSTRAINT PK_StudentID_Category PRIMARY KEY (StudentID,Category),
	CONSTRAINT FK_StudentID FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
	CONSTRAINT FK_Category FOREIGN KEY (Category) REFERENCES PieceOfWork(Category),
)

CREATE TABLE Assessment(
	AssessmentID INT NOT NULL IDENTITY(1,1),
	CONSTRAINT FK_AssessmentID PRIMARY KEY (AssessmentID),
	Category NVARCHAR(20) NOT NULL,
	CONSTRAINT FK_Category_In_Assessment FOREIGN KEY (Category) REFERENCES PieceOfWork(Category),
	[Type] NVARCHAR(25) NOT NULL,
	Part INT NOT NULL,
	[Weight] DECIMAL(3,2) NOT NULL, -- 3 DIGITS AND 2 DECIMALS
	CompletionCriteria BIT NOT NULL, -- PASS OR FAILED
	NumberOfQuestions INT NOT NULL,
)

CREATE TABLE Grading(
	LectureID NVARCHAR(10) NOT NULL,
	AssessmentID INT NOT NULL,
	CONSTRAINT PK_LectureID_AssessmentID PRIMARY KEY (LectureID,AssessmentID),
	CONSTRAINT FK_LectureID FOREIGN KEY (LectureID) REFERENCES Lecture(LectureID),
	CONSTRAINT FK_Grading_to_AssessmentID FOREIGN KEY (AssessmentID) REFERENCES Assessment(AssessmentID),
)

CREATE TABLE Result(
	ResultID INT NOT NULL IDENTITY(1,1),
	AssessmentID INT NOT NULL,
	CONSTRAINT PK_ResultID PRIMARY KEY (ResultID),
	CONSTRAINT FK_Result_of_AssessmentID FOREIGN KEY (AssessmentID) REFERENCES Assessment(AssessmentID),
	Day_of_Publication DATE NOT NULL,
	Mark FLOAT NOT NULL,
	[Status] BIT NOT NULL,
)





