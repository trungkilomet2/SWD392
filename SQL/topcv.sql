USE [master]
GO
/****** Object:  Database [SWP391_G3]    Script Date: 5/27/2025 11:57:26 AM ******/
CREATE DATABASE [SWP391_G3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_G3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SWP391_G3.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_G3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SWP391_G3_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391_G3] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_G3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_G3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_G3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_G3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_G3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_G3] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_G3] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391_G3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_G3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_G3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_G3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_G3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_G3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_G3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_G3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_G3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_G3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_G3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_G3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_G3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_G3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_G3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_G3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_G3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391_G3] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_G3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_G3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_G3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_G3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_G3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_G3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391_G3] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP391_G3] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP391_G3]
GO
/****** Object:  Table [dbo].[app_authority]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[app_authority](
	[name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[app_user]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[app_user](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[password] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[applicationId] [int] IDENTITY(1,1) NOT NULL,
	[jobId] [int] NULL,
	[cvId] [int] NULL,
	[submitDate] char(8) NULL DEFAULT '00000000',
	[status] int NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[applicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](255) NULL,
	[categoryImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[companyId] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [nvarchar](255) NULL,
	[city] [nvarchar](100) NULL,
	[district] [nvarchar](100) NULL,
	[commune] [nvarchar](100) NULL,
	[address] [nvarchar](100) NULL,
	[location] [nvarchar](100) NULL,
	[phone] [varchar](15) NULL,
	[email] [nvarchar](100) NULL,
	[website] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[detail] [nvarchar](max) NULL,
	[companyType] [nvarchar](255) NULL,
	[imageCompany] [nvarchar](255) NULL,
	[logoCompany] [nvarchar](255) NULL,
	[statusCompany] int NULL,
 CONSTRAINT [PK__Company__AD545990684A5AFC] PRIMARY KEY CLUSTERED 
(
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[cvId] [int] IDENTITY(1,1) NOT NULL,
	[seekerId] [int] NULL,
	[cvStatus] tinyint NULL, -- 0: accept 1: pending 2: tu choi
	[cvLink] [varbinary](max) NULL,
 CONSTRAINT [PK_CV] PRIMARY KEY CLUSTERED 
(
	[cvId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQUser]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQUser](
	[faqUserId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[id] [int] NULL,
	[answerUser] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[faqUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[companyId] [int] NULL,
	[rating] [int] NULL,
	[message] [text] NULL,
	[feedbackDate] char(8) NULL DEFAULT '00000000',
	[statusFeedback] [nvarchar](255) NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedbackId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[jobId] [int] IDENTITY(1,1) NOT NULL,
	[recruiterId] [int] NULL,
	[categoryId] [int] NULL,
	[jobTitle] [nvarchar](255) NULL,
	[jobDescription] [nvarchar](max) NULL,
	[requirements] [nvarchar](max) NULL,
	[location] [nvarchar](255) NULL,
	[position] [nvarchar](255) NULL,
	[experience] [nvarchar](255) NULL,
	[skills] [nvarchar](max) NULL,
	[gender] [nvarchar](20) NULL,
	[profession] [nvarchar](255) NULL,
	[jobType] [nvarchar](255) NULL,
	[numberOfSeeker] [int] NULL,
	[salary] [nvarchar](255) NULL,
	[workingTime] [nvarchar](255) NULL,
	[createDate] char(8) NULL,
	[endDate] char(8) NULL,
	[status] int NULL,
 CONSTRAINT [PK__Job__164AA1A8F0AA0CA1] PRIMARY KEY CLUSTERED 
(
	[jobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobSeeker]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobSeeker](
	[seekerId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[skills] [nvarchar](255) NULL,
	[industry] [nvarchar](255) NOT NULL,
	[experience] [nvarchar](255) NOT NULL,
	[position] [nvarchar](255) NOT NULL,
	[profession] [nvarchar](255) NOT NULL,
	[location] [nvarchar](255) NOT NULL,
	[salary] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK__JobSeeke__789B9750FFEF85D0] PRIMARY KEY CLUSTERED 
(
	[seekerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recruiter]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruiter](
	[recruiterId] [int] IDENTITY(1,1) NOT NULL,
	[companyId] [int] NULL,
	[userId] [int] NOT NULL,
	[position2] [nvarchar](255) NOT NULL,
	[companyEmail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Recruiter] PRIMARY KEY CLUSTERED 
(
	[recruiterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SaveJob]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaveJob](
	[saveJobId] [int] IDENTITY(1,1) NOT NULL,
	[seekerId] [int] NOT NULL,
	[jobId] [int] NOT NULL,
	[saveDate] char(8) NOT NULL,
 CONSTRAINT [PK_SaveJob] PRIMARY KEY CLUSTERED 
(
	[saveJobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suggestFAQ]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suggestFAQ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](max) NULL,
	[answer] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tokenForgetPassword]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tokenForgetPassword](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[token] [nvarchar](255) NULL,
	[expiryTime] [datetime] NULL,
	[isUsed] [bit] NULL,
	[userId] [int] NULL,
 CONSTRAINT [PK_tokenForgetPassword] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_authorities_mapping]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_authorities_mapping](
	[app_user_id] [bigint] NOT NULL,
	[app_authority_id] [varchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/27/2025 11:57:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[roleId] [int] NULL,
	[username] [nvarchar](255) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](255) NULL,
	[dateOfBirth] [date] NULL,
	[gender] int NULL, -- 0: nam 1: nu
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](255) NULL,
	[status] int NULL,
	[resetToken] [nvarchar](255) NULL,
	[tokenExpiry] [timestamp] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_CV] FOREIGN KEY([cvId])
REFERENCES [dbo].[CV] ([cvId])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_CV]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Job] FOREIGN KEY([jobId])
REFERENCES [dbo].[Job] ([jobId])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Job]
GO
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CV_JobSeeker1] FOREIGN KEY([seekerId])
REFERENCES [dbo].[JobSeeker] ([seekerId])
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CV_JobSeeker1]
GO
ALTER TABLE [dbo].[FAQUser]  WITH CHECK ADD FOREIGN KEY([id])
REFERENCES [dbo].[suggestFAQ] ([id])
GO
ALTER TABLE [dbo].[FAQUser]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[Company] ([companyId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Company]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Users]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Category]
GO
ALTER TABLE [dbo].[Job]  WITH CHECK ADD  CONSTRAINT [FK_Job_Recruiter] FOREIGN KEY([recruiterId])
REFERENCES [dbo].[Recruiter] ([recruiterId])
GO
ALTER TABLE [dbo].[Job] CHECK CONSTRAINT [FK_Job_Recruiter]
GO
ALTER TABLE [dbo].[JobSeeker]  WITH CHECK ADD  CONSTRAINT [FK_JobSeeker_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[JobSeeker] CHECK CONSTRAINT [FK_JobSeeker_Users]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_Company] FOREIGN KEY([companyId])
REFERENCES [dbo].[Company] ([companyId])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_Recruiter_Company]
GO
ALTER TABLE [dbo].[Recruiter]  WITH CHECK ADD  CONSTRAINT [FK_Recruiter_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[Recruiter] CHECK CONSTRAINT [FK_Recruiter_Users]
GO
ALTER TABLE [dbo].[SaveJob]  WITH CHECK ADD  CONSTRAINT [FK_SaveJob_Job] FOREIGN KEY([jobId])
REFERENCES [dbo].[Job] ([jobId])
GO
ALTER TABLE [dbo].[SaveJob] CHECK CONSTRAINT [FK_SaveJob_Job]
GO
ALTER TABLE [dbo].[SaveJob]  WITH CHECK ADD  CONSTRAINT [FK_SaveJob_JobSeeker] FOREIGN KEY([seekerId])
REFERENCES [dbo].[JobSeeker] ([seekerId])
GO
ALTER TABLE [dbo].[SaveJob] CHECK CONSTRAINT [FK_SaveJob_JobSeeker]
GO
ALTER TABLE [dbo].[tokenForgetPassword]  WITH CHECK ADD  CONSTRAINT [FK_tokenForgetPassword_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([userId])
GO
ALTER TABLE [dbo].[tokenForgetPassword] CHECK CONSTRAINT [FK_tokenForgetPassword_Users]
GO
ALTER TABLE [dbo].[user_authorities_mapping]  WITH CHECK ADD  CONSTRAINT [FKmy9tvljmm3fj1j30667sgllda] FOREIGN KEY([app_user_id])
REFERENCES [dbo].[app_user] ([id])
GO
ALTER TABLE [dbo].[user_authorities_mapping] CHECK CONSTRAINT [FKmy9tvljmm3fj1j30667sgllda]
GO
ALTER TABLE [dbo].[user_authorities_mapping]  WITH CHECK ADD  CONSTRAINT [FKoxekmynme35207fox4kb4cmex] FOREIGN KEY([app_authority_id])
REFERENCES [dbo].[app_authority] ([name])
GO
ALTER TABLE [dbo].[user_authorities_mapping] CHECK CONSTRAINT [FKoxekmynme35207fox4kb4cmex]
GO
USE [master]
GO
ALTER DATABASE [SWP391_G3] SET  READ_WRITE 
GO

