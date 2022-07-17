USE [master]
GO
/****** Object:  Database [DBI202_Assignment_SU2022]    Script Date: 7/18/2022 12:29:51 AM ******/
CREATE DATABASE [DBI202_Assignment_SU2022]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBI202_Assignment_SU2022', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBI202_Assignment_SU2022.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBI202_Assignment_SU2022_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DBI202_Assignment_SU2022_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBI202_Assignment_SU2022].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET RECOVERY FULL 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET  MULTI_USER 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBI202_Assignment_SU2022', N'ON'
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET QUERY_STORE = OFF
GO
USE [DBI202_Assignment_SU2022]
GO
/****** Object:  Table [dbo].[Assessment]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessment](
	[AssessmentID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](40) NOT NULL,
	[Type] [nvarchar](15) NOT NULL,
	[Part] [int] NOT NULL,
	[Weight] [decimal](5, 2) NOT NULL,
	[Completion Criteria] [int] NOT NULL,
	[No Question] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassID] [varchar](80) NOT NULL,
	[LectureID] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [varchar](15) NOT NULL,
	[CourseName] [varchar](70) NOT NULL,
	[Number of sessions] [int] NOT NULL,
	[Department] [varchar](70) NOT NULL,
	[Semester] [varchar](15) NOT NULL,
	[Number of credits] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grading]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grading](
	[LectureID] [varchar](25) NOT NULL,
	[OutputID] [int] NOT NULL,
 CONSTRAINT [pk_LectureID_OutputID] PRIMARY KEY CLUSTERED 
(
	[LectureID] ASC,
	[OutputID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[LectureID] [nvarchar](25) NOT NULL,
	[TerritoryID] [int] NOT NULL,
	[LectureFirstName] [nvarchar](30) NOT NULL,
	[LectureLastName] [nvarchar](30) NOT NULL,
	[BirthDay] [date] NULL,
	[Sex] [bit] NOT NULL,
	[WorkedSince] [date] NOT NULL,
	[Report to] [nvarchar](25) NULL,
	[Department] [varchar](70) NULL,
	[ContacMail] [varchar](70) NOT NULL,
 CONSTRAINT [PK__Lecture__B739F69F20AEA2D4] PRIMARY KEY CLUSTERED 
(
	[LectureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Output]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Output](
	[OutputID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [varchar](25) NOT NULL,
	[Category] [varchar](40) NOT NULL,
	[SubmisstionStatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OutputID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PieceOfWork]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PieceOfWork](
	[Category] [varchar](40) NOT NULL,
	[CourseID] [varchar](15) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Process]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Process](
	[StudentID] [varchar](25) NOT NULL,
	[Category] [varchar](40) NOT NULL,
 CONSTRAINT [pk_StudentID_Category] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[Category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Result]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Result](
	[OutputID] [int] NOT NULL,
	[Graded by] [varchar](25) NOT NULL,
	[AssessmentID] [int] NOT NULL,
	[Day of publication] [date] NOT NULL,
	[Mark] [float] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [pk_OutputID_Graded_by_AssessmentID] PRIMARY KEY CLUSTERED 
(
	[OutputID] ASC,
	[Graded by] ASC,
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [varchar](25) NOT NULL,
	[TerritoryID] [int] NOT NULL,
	[StudentFirstName] [nvarchar](30) NOT NULL,
	[StudentLastName] [nvarchar](30) NOT NULL,
	[BirthDay] [date] NOT NULL,
	[Sex] [bit] NOT NULL,
	[Major] [varchar](55) NOT NULL,
	[ContacMail] [varchar](70) NOT NULL,
	[Image] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[GroupID] [varchar](15) NOT NULL,
	[StudentID] [varchar](25) NOT NULL,
	[CourseID] [varchar](15) NOT NULL,
	[EnrolledDate] [date] NOT NULL,
 CONSTRAINT [pk_StudentID_CourseID_GroupID] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC,
	[StudentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studied-in]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studied-in](
	[ClassID] [varchar](80) NOT NULL,
	[StudentID] [varchar](25) NOT NULL,
	[CourseID] [varchar](15) NOT NULL,
	[GroupID] [varchar](15) NOT NULL,
	[Attendance status] [bit] NOT NULL,
 CONSTRAINT [PK_ClassID_LectureID_CourseID_GroupID_StudentID] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[StudentID] ASC,
	[CourseID] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Territory]    Script Date: 7/18/2022 12:29:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Territory](
	[TerritoryID] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TerritoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assessment]  WITH CHECK ADD FOREIGN KEY([Category])
REFERENCES [dbo].[PieceOfWork] ([Category])
GO
ALTER TABLE [dbo].[Grading]  WITH CHECK ADD FOREIGN KEY([OutputID])
REFERENCES [dbo].[Output] ([OutputID])
GO
ALTER TABLE [dbo].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK__Lecture__Territo__2D47B39A] FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Territory] ([TerritoryID])
GO
ALTER TABLE [dbo].[Lecture] CHECK CONSTRAINT [FK__Lecture__Territo__2D47B39A]
GO
ALTER TABLE [dbo].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_Lecture_Lecture1] FOREIGN KEY([Report to])
REFERENCES [dbo].[Lecture] ([LectureID])
GO
ALTER TABLE [dbo].[Lecture] CHECK CONSTRAINT [FK_Lecture_Lecture1]
GO
ALTER TABLE [dbo].[Output]  WITH CHECK ADD  CONSTRAINT [fk_StudentID_Category] FOREIGN KEY([StudentID], [Category])
REFERENCES [dbo].[Process] ([StudentID], [Category])
GO
ALTER TABLE [dbo].[Output] CHECK CONSTRAINT [fk_StudentID_Category]
GO
ALTER TABLE [dbo].[PieceOfWork]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Process]  WITH CHECK ADD FOREIGN KEY([Category])
REFERENCES [dbo].[PieceOfWork] ([Category])
GO
ALTER TABLE [dbo].[Process]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessment] ([AssessmentID])
GO
ALTER TABLE [dbo].[Result]  WITH CHECK ADD  CONSTRAINT [fk_OutputID_Graded_by] FOREIGN KEY([Graded by], [OutputID])
REFERENCES [dbo].[Grading] ([LectureID], [OutputID])
GO
ALTER TABLE [dbo].[Result] CHECK CONSTRAINT [fk_OutputID_Graded_by]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD FOREIGN KEY([TerritoryID])
REFERENCES [dbo].[Territory] ([TerritoryID])
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Studied-in]  WITH CHECK ADD  CONSTRAINT [fk_ClassID] FOREIGN KEY([ClassID])
REFERENCES [dbo].[Class] ([ClassID])
GO
ALTER TABLE [dbo].[Studied-in] CHECK CONSTRAINT [fk_ClassID]
GO
ALTER TABLE [dbo].[Studied-in]  WITH CHECK ADD  CONSTRAINT [fk_StudentID_CourseID_GroupID] FOREIGN KEY([GroupID], [StudentID], [CourseID])
REFERENCES [dbo].[StudentGroup] ([GroupID], [StudentID], [CourseID])
GO
ALTER TABLE [dbo].[Studied-in] CHECK CONSTRAINT [fk_StudentID_CourseID_GroupID]
GO
/****** Object:  StoredProcedure [dbo].[Count_Num_of_Major]    Script Date: 7/18/2022 12:29:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE PROC [dbo].[Count_Num_of_Major]
	@Major VARCHAR(55)
	AS
	BEGIN
		SELECT COUNT(Major) AS [TOTAL OF STUDENT ENROLLED IN THIS MAJOR] FROM Student WHERE Major = @Major
	END
GO
USE [master]
GO
ALTER DATABASE [DBI202_Assignment_SU2022] SET  READ_WRITE 
GO
