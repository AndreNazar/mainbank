USE [master]
GO
/****** Object:  Database [autoschool]    Script Date: 14.03.2022 12:13:11 ******/
CREATE DATABASE [autoschool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'autoschool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\autoschool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'autoschool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\autoschool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [autoschool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [autoschool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [autoschool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [autoschool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [autoschool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [autoschool] SET ARITHABORT OFF 
GO
ALTER DATABASE [autoschool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [autoschool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [autoschool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [autoschool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [autoschool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [autoschool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [autoschool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [autoschool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [autoschool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [autoschool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [autoschool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [autoschool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [autoschool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [autoschool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [autoschool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [autoschool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [autoschool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [autoschool] SET RECOVERY FULL 
GO
ALTER DATABASE [autoschool] SET  MULTI_USER 
GO
ALTER DATABASE [autoschool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [autoschool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [autoschool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [autoschool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [autoschool] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'autoschool', N'ON'
GO
USE [autoschool]
GO
/****** Object:  Table [dbo].[autos]    Script Date: 14.03.2022 12:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[number] [varchar](max) NULL,
 CONSTRAINT [PK_autos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[classroom]    Script Date: 14.03.2022 12:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[classroom](
	[number] [int] NOT NULL,
	[name] [text] NULL,
 CONSTRAINT [PK_classroom] PRIMARY KEY CLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[driving]    Script Date: 14.03.2022 12:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[driving](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[instructor] [int] NULL,
	[auto] [int] NULL,
	[date] [datetime] NULL,
	[student] [int] NULL,
 CONSTRAINT [PK_driving] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[enroll_theory]    Script Date: 14.03.2022 12:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enroll_theory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[theory] [int] NULL,
	[student] [int] NULL,
 CONSTRAINT [PK_enroll_theory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[instructor]    Script Date: 14.03.2022 12:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[instructor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[category] [int] NULL,
	[login] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[img] [varchar](max) NULL,
	[tel] [varchar](50) NULL,
	[status_msg] [varchar](50) NULL,
	[accept] [bit] NULL,
 CONSTRAINT [PK_instructor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 14.03.2022 12:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[category] [int] NULL,
	[login] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[img] [nvarchar](max) NULL,
	[tel] [varchar](50) NULL,
	[status_msg] [varchar](max) NULL,
	[payment] [bit] NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 14.03.2022 12:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[category] [int] NULL,
	[login] [varchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[img] [nvarchar](max) NULL,
	[tel] [varchar](50) NULL,
	[status_msg] [varchar](max) NULL,
	[accept] [bit] NULL,
 CONSTRAINT [PK_teacher] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[theory]    Script Date: 14.03.2022 12:13:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[theory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](max) NULL,
	[teacher] [int] NULL,
	[classroom] [int] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_theory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[autos] ON 

INSERT [dbo].[autos] ([id], [name], [number]) VALUES (1, N'Volkswagen Polo', N'В138ТС_35')
INSERT [dbo].[autos] ([id], [name], [number]) VALUES (2, N'RACER RC-200', N'9397РН_61')
INSERT [dbo].[autos] ([id], [name], [number]) VALUES (3, N'Scania S730 V8', N'А100ВМ_35')
INSERT [dbo].[autos] ([id], [name], [number]) VALUES (4, N'7249РН_62', N'7249РН_61')
SET IDENTITY_INSERT [dbo].[autos] OFF
GO
INSERT [dbo].[classroom] ([number], [name]) VALUES (432, N'Кабинет с тренажером')
INSERT [dbo].[classroom] ([number], [name]) VALUES (456, N'Кабинет теории')
GO
SET IDENTITY_INSERT [dbo].[driving] ON 

INSERT [dbo].[driving] ([id], [name], [instructor], [auto], [date], [student]) VALUES (9, N'Змейка №3', 1, 2, CAST(N'2022-03-13T08:00:00.000' AS DateTime), 0)
INSERT [dbo].[driving] ([id], [name], [instructor], [auto], [date], [student]) VALUES (10, N'Занятие №7. Город', 5, 1, CAST(N'2022-03-13T09:00:00.000' AS DateTime), 0)
INSERT [dbo].[driving] ([id], [name], [instructor], [auto], [date], [student]) VALUES (11, N'Занятие №3. Перекресток.', 6, 1, CAST(N'2022-03-13T15:30:00.000' AS DateTime), 9)
INSERT [dbo].[driving] ([id], [name], [instructor], [auto], [date], [student]) VALUES (13, N'Урок №7. Шоссе', 4, 1, CAST(N'2022-03-17T14:30:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[driving] OFF
GO
SET IDENTITY_INSERT [dbo].[enroll_theory] ON 

INSERT [dbo].[enroll_theory] ([id], [theory], [student]) VALUES (26, 26, 1)
INSERT [dbo].[enroll_theory] ([id], [theory], [student]) VALUES (27, 26, 6)
SET IDENTITY_INSERT [dbo].[enroll_theory] OFF
GO
SET IDENTITY_INSERT [dbo].[instructor] ON 

INSERT [dbo].[instructor] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (1, N'Леонов Артем Виталиевич', 12, N'aso', N'aso', N'sdfgkjln@gmail.com', N'0', N'78349890234', N'0', 0)
INSERT [dbo].[instructor] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (2, N'Шац Петр Сергеевич', 41, N'uwioer84', N'winjk84', N'rjuo@gmail.com', N'0', N'0', N'0', 0)
INSERT [dbo].[instructor] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (3, N'Ульянова Ульяна Сергеевна', 23, N'123', N'123', N'tutnwe@gmail.com', N'0', N'0', N'0', 0)
INSERT [dbo].[instructor] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (4, N'Петров Олег Леонидович', 12, N'serf', N'serf', N'asjdfn@gmail.com', N'https://delai-vibor.com/wp-content/uploads/2017/12/%D0%B2%D0%BE%D0%B4%D0%B8%D1%82%D0%B5%D0%BB%D1%8C.jpg', N'89034578478', N'0', 0)
INSERT [dbo].[instructor] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (5, N'Дмитриев Олег Валентинович', 3142, N'cart', N'cart', N'sdkfjn@gmail.com', N'0', N'0', N'0', 0)
INSERT [dbo].[instructor] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (6, N'Салов Никита Николаевич', 23, N'qzvqzvt', N'qzvqzvt', N'pochta812974@gmail.com', N'0', N'890345290453', N'0', 0)
SET IDENTITY_INSERT [dbo].[instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (0, N'0', 0, N'0', N'0', N'0', N'0', N'0', N'0', 0)
INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (1, N'Галин Артем Иванович', 12, N'1', N'2', N'ajsdnf@gmail.com
', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaqi0PjpdURyUMtj7cfmWRNqdezHL8GJt5vA&usqp=CAU', N'89080245096', N'0', 1)
INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (4, N'Шилов Олег Петрович', 0, N'noqno', N'cb2uyid2', N'hjf93@mail.ru', N'0', N'0', N'0', 1)
INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (5, N'Трехгон Даниил Сергеевич', 0, N'xmrov', N'zpvwoe89884', N'fnjklqwe@mail.ru', N'0', N'0', N'0', 0)
INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (6, N'Невров Петр Семенович', 23, N'keep', N'keep', N'asdfkjn@gmail.com', N'0', N'0', N'0', 1)
INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (7, N'Омаров Никита Константинович', 12, N'babg', N'babg', N'omarov@gmail.com', N'0', N'0', N'0', 1)
INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (8, N'Глаз Антон Павлович', 1342, N'rttr', N'rttr', N'jiji@gmail.com', N'0', N'0', N'0', 0)
INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (9, N'Палкина Наталия Сергеевна', 23, N'pwoef', N'pwoef', N'pwoef@gmail.com', N'0', N'89037484422', N'0', 1)
INSERT [dbo].[student] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [payment]) VALUES (10, N'Федоров Леонид Павлович', 12, N'iop', N'iop', N'asdfjn@gmail.com', N'0', N'89076783474', N'0', 1)
SET IDENTITY_INSERT [dbo].[student] OFF
GO
SET IDENTITY_INSERT [dbo].[teacher] ON 

INSERT [dbo].[teacher] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (1, N'Хвалов Геннадий Андреевич', 13, N'qwer', N'qwer', N'asdfl33k45m@gmail.com', N'https://st.focusedcollection.com/3839757/i/650/focused_178411440-stock-photo-male-office-worker-working-laptop.jpg', N'89997836411', N'0', 0)
INSERT [dbo].[teacher] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (2, N'Ногов Максим Александрович', 14, N'qmwo', N'qmwo0202', N'sjakdlf@mail.ru', N'0', N'0', N'0', 0)
INSERT [dbo].[teacher] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (3, N'Зинина Татьяна Сергеевна', 14, N'2', N'2', N'zinina23849@gmail.com', N'0', N'0', N'0', 0)
INSERT [dbo].[teacher] ([id], [name], [category], [login], [password], [email], [img], [tel], [status_msg], [accept]) VALUES (4, N'Боров Олег Николаевич', 14, N'njwe', N'njwe', N'njwe@gmail.com', N'0', N'0', N'0', 0)
SET IDENTITY_INSERT [dbo].[teacher] OFF
GO
SET IDENTITY_INSERT [dbo].[theory] ON 

INSERT [dbo].[theory] ([id], [name], [teacher], [classroom], [date]) VALUES (26, N'Урок №7. Как ездить', 4, 456, CAST(N'2022-03-13T21:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[theory] OFF
GO
ALTER TABLE [dbo].[driving]  WITH CHECK ADD  CONSTRAINT [FK_driving_autos] FOREIGN KEY([auto])
REFERENCES [dbo].[autos] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[driving] CHECK CONSTRAINT [FK_driving_autos]
GO
ALTER TABLE [dbo].[driving]  WITH CHECK ADD  CONSTRAINT [FK_driving_instructor] FOREIGN KEY([instructor])
REFERENCES [dbo].[instructor] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[driving] CHECK CONSTRAINT [FK_driving_instructor]
GO
ALTER TABLE [dbo].[driving]  WITH CHECK ADD  CONSTRAINT [FK_driving_student] FOREIGN KEY([student])
REFERENCES [dbo].[student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[driving] CHECK CONSTRAINT [FK_driving_student]
GO
ALTER TABLE [dbo].[enroll_theory]  WITH CHECK ADD  CONSTRAINT [FK_enroll_theory_student] FOREIGN KEY([student])
REFERENCES [dbo].[student] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[enroll_theory] CHECK CONSTRAINT [FK_enroll_theory_student]
GO
ALTER TABLE [dbo].[enroll_theory]  WITH CHECK ADD  CONSTRAINT [FK_enroll_theory_theory] FOREIGN KEY([theory])
REFERENCES [dbo].[theory] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[enroll_theory] CHECK CONSTRAINT [FK_enroll_theory_theory]
GO
ALTER TABLE [dbo].[theory]  WITH CHECK ADD  CONSTRAINT [FK_theory_classroom] FOREIGN KEY([classroom])
REFERENCES [dbo].[classroom] ([number])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[theory] CHECK CONSTRAINT [FK_theory_classroom]
GO
ALTER TABLE [dbo].[theory]  WITH CHECK ADD  CONSTRAINT [FK_theory_teacher] FOREIGN KEY([teacher])
REFERENCES [dbo].[teacher] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[theory] CHECK CONSTRAINT [FK_theory_teacher]
GO
USE [master]
GO
ALTER DATABASE [autoschool] SET  READ_WRITE 
GO
