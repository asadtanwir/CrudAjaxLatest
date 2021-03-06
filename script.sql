USE [master]
GO
/****** Object:  Database [Employee]    Script Date: 10/9/2018 2:02:12 PM ******/
CREATE DATABASE [Employee]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Employee', FILENAME = N'F:\MSSQL\Data\Employee.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Employee_log', FILENAME = N'F:\MSSQL\Log\Employee_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Employee] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employee].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employee] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employee] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employee] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employee] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employee] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employee] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employee] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employee] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employee] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employee] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employee] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employee] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employee] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employee] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employee] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Employee] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employee] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employee] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employee] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employee] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employee] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Employee] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employee] SET RECOVERY FULL 
GO
ALTER DATABASE [Employee] SET  MULTI_USER 
GO
ALTER DATABASE [Employee] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employee] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Employee] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Employee] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Employee] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Employee', N'ON'
GO
ALTER DATABASE [Employee] SET QUERY_STORE = OFF
GO
USE [Employee]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Employee]
GO
/****** Object:  User [owais]    Script Date: 10/9/2018 2:02:20 PM ******/
CREATE USER [owais] FOR LOGIN [owais] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/9/2018 2:02:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Age] [int] NULL,
	[STATE] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 10/9/2018 2:02:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [Name], [Age], [STATE], [Country]) VALUES (1, N'saad', 23, N'ra', N'Pakistan')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Age], [STATE], [Country]) VALUES (2, N'fahad', 34, N'raaa', N'Pakistan')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Age], [STATE], [Country]) VALUES (3, N'gfh gf', 456, N' ghfh', N'hfghfg h gfh')
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Age], [STATE], [Country]) VALUES (4, N'asdada', 4353, N'sdfsdf', N'sdfsdf')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([id], [userName], [password], [isAdmin], [FirstName], [LastName]) VALUES (1, N'asad', N'12345', 1, N'Muhammad', N'Asad')
INSERT [dbo].[UserLogin] ([id], [userName], [password], [isAdmin], [FirstName], [LastName]) VALUES (2, N'attique', N'456789', 0, N'Raja', N'Attique')
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 10/9/2018 2:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Delete Employee
Create Procedure [dbo].[DeleteEmployee] 
( 
 @Id integer 
) 
as  
Begin 
 Delete Employee where EmployeeID=@Id; 
End
GO
/****** Object:  StoredProcedure [dbo].[InsertUpdateEmployee]    Script Date: 10/9/2018 2:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Insert and Update Employee
Create Procedure [dbo].[InsertUpdateEmployee] 
( 
@Id integer, 
@Name nvarchar(50), 
@Age integer, 
@State nvarchar(50), 
@Country nvarchar(50), 
@Action varchar(10) 
) 
As 
Begin 
if @Action='Insert' 
Begin 
 Insert into Employee(Name,Age,[State],Country) values(@Name,@Age,@State,@Country); 
End 
if @Action='Update' 
Begin 
 Update Employee set Name=@Name,Age=@Age,[State]=@State,Country=@Country where EmployeeID=@Id; 
End   
END
GO
/****** Object:  StoredProcedure [dbo].[SelectEmployee]    Script Date: 10/9/2018 2:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Select Employees
Create Procedure [dbo].[SelectEmployee] 
as  
Begin 
Select * from Employee; 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LoginUser]    Script Date: 10/9/2018 2:02:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_LoginUser]
@userName NVARCHAR(50),
@password NVARCHAR(50)

AS
BEGIN
SELECT *,1 AS loggedUser FROM userlogin WHERE username = @userName AND password = @password
end
GO
USE [master]
GO
ALTER DATABASE [Employee] SET  READ_WRITE 
GO
