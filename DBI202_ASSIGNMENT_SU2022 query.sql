USE DBI202_Assignment_SU2022

--- A query that uses ORDER BY
--SORT STUDENT ASCENDING
SELECT * FROM Student ORDER BY StudentID

--- A query that uses INNER JOINS
SELECT C.CourseID, P.Category FROM Course C INNER JOIN PieceOfWork P
ON C.CourseID = P.CourseID

--A query that uses aggregate functions
SELECT C.ClassID,COUNT(StudentID) AS [ATTENDANCE STUDENT] FROM Class C INNER JOIN [Studied-in] SI
ON C.ClassID = SI.ClassID AND SI.[Attendance status] = 1
GROUP BY C.ClassID


--A query that uses the GROUP BY and HAVING clauses
--The difference between the having and
--where clause in SQL is that the where
--clause cannot be used with aggregates(max, min,count,avg,sum), but the having clause can.
--NUMBER OF LECTURE LIVES IN EACH TERRITORY THAT GREATER THAN 1
SELECT T.TerritoryID,T.TerritoryName, COUNT(l.LectureID) AS [NUMBER OF LECTURE LIVES IN] FROM Territory T INNER JOIN Lecture L
ON T.TerritoryID = L.TerritoryID
GROUP BY T.TerritoryID,T.TerritoryName
HAVING COUNT(l.LectureID) > 1

--A query that uses a sub-query as a relation
--COUNT TOTAL MARK OF STUDENT IN EACH COURSE
SELECT StudentID,CourseID,[TOTAL]
FROM(
SELECT O.StudentID,POW.CourseID, SUM(ISNULL(R.Mark * A.Weight/100,0)) AS [TOTAL] FROM Result R INNER JOIN Grading G
ON R.OutputID = G.OutputID INNER JOIN Output O
ON O.OutputID = G.OutputID INNER JOIN Assessment A
ON O.Category = A.Category AND O.Category NOT LIKE 'LAB%' INNER JOIN PieceOfWork POW
ON POW.Category = O.Category GROUP BY O.StudentID,POW.CourseID) AS A 
ORDER BY StudentID

--A query that uses a sub-query in the WHERE clause
--FIND ALL LECTURE THAT THEIR SUPERVISOR'S DEPARTMENT IS 'Machine learning'
SELECT L1.LectureID
FROM Lecture L1
WHERE L1.[Report to] IN (SELECT L2.LectureID
							FROM Lecture L2 
								WHERE L2.Department = 'Machine learning')


--A query that uses partial matching in the WHERE clause
--SELECT CATEGORIES THAT IN CSD OR DBI COURSE
SELECT *
FROM PieceOfWork 
WHERE Category LIKE 'CSD201%' OR Category LIKE 'DBI202%'

--A query that uses a self-JOIN
--The SELF-JOIN is a special kind of joins 
--that allow you to join a table to itself using 
--either LEFT JOIN or INNER JOIN clause. 
--You use self-join to create a result set that joins the rows with the other rows within the same table.
--FIND ALL LECTRUE FULLNAME AND THEIR SUPERVISOR, IF DONT HAVE THEN DISPLAY NULL
SELECT L1.LectureLastName+'	'+L1.LectureFirstName AS [LECTURE NAME],L2.LectureLastName+'	'+L2.LectureFirstName AS [REPORT TO] FROM Lecture L1 LEFT JOIN Lecture L2
ON L1.[Report to] = L2.LectureID

--STORED PROCEDUCE
--COUNT NUMBER OF STUDENT ENROLLED IN EACH MAJOR
GO
	CREATE PROC Count_Num_of_Major
	@Major VARCHAR(55)
	AS
	BEGIN
		SELECT COUNT(Major) AS [TOTAL OF STUDENT ENROLLED IN THIS MAJOR] FROM Student WHERE Major = @Major
	END
GO
EXEC Count_Num_of_Major N'Information Assurance'
EXEC Count_Num_of_Major N'Software Engineering'
EXEC Count_Num_of_Major N'Artificial Intelligence'
SELECT * FROM Student
DROP PROC Count_Num_of_Major

--TRIGGER
--DELETE STUDENT THAT ABSENT
GO
	ALTER TRIGGER DROP_OUT_ABSENT_STUDENT
	ON [Studied-in]
	AFTER DELETE
	AS
	BEGIN
			DECLARE @ATTENDANCE BIT 
			SELECT @ATTENDANCE  = [Attendance status] FROM deleted
			IF(@ATTENDANCE = 1)
			BEGIN
				PRINT N'YOU CANT DELETE THIS STUDENT'
				ROLLBACK TRAN
			END
			ELSE
			BEGIN
				PRINT N'THIS STUDENT HAS BEEN DROPPED OUT BY LECTURE'
			END
			--ELSE
			--BEGIN
			--	ROLLBACK TRAN
			--END
	END
GO
select * from [Studied-in]
select * from StudentGroup
--INSERT SOME TEST STUDENTS TO TEST
INSERT INTO [Studied-in]
VALUES('WED201c_SLOT5_SUMMER2022_TungHT22','XXXX','WED201c','SE1637',0)
INSERT INTO StudentGroup
VALUES('SE1637','XXXX','WED201c','2022-05-21')
select * from Student
insert into Student
values
('XXXX',4,N'水水水水',N'AAAA',GETDATE(),1,'Information Assurance','XXXX123@gmai.com','XXXX.png')
-------------
SELECT * FROM [Studied-in]
DELETE [Studied-in] WHERE StudentID = 'ABCD' -- THIS STUDENT ENROLLED
DELETE [Studied-in] WHERE StudentID = 'XXXX' -- THIS STUDENT ABSENT