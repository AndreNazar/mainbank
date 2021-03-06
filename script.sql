USE [master]
GO
/****** Object:  Database [ATM_NAZAROV]    Script Date: 24.02.2022 8:07:32 ******/
CREATE DATABASE [ATM_NAZAROV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATM_NAZAROV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ATM_NAZAROV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATM_NAZAROV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ATM_NAZAROV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ATM_NAZAROV] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATM_NAZAROV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATM_NAZAROV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATM_NAZAROV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATM_NAZAROV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATM_NAZAROV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATM_NAZAROV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ATM_NAZAROV] SET  MULTI_USER 
GO
ALTER DATABASE [ATM_NAZAROV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATM_NAZAROV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATM_NAZAROV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATM_NAZAROV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATM_NAZAROV] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATM_NAZAROV] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ATM_NAZAROV', N'ON'
GO
ALTER DATABASE [ATM_NAZAROV] SET QUERY_STORE = OFF
GO
USE [ATM_NAZAROV]
GO
/****** Object:  Table [dbo].[bank_account]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bank_account](
	[number_account] [varchar](50) NOT NULL,
	[id_user] [int] NULL,
	[id_client] [int] NULL,
	[money] [int] NULL,
 CONSTRAINT [PK_bank_account] PRIMARY KEY CLUSTERED 
(
	[number_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clients]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clients](
	[id_client] [int] IDENTITY(1,1) NOT NULL,
	[FIO] [varchar](max) NULL,
	[number_passport] [varchar](15) NULL,
	[pass_issued_by] [varchar](max) NULL,
	[tel] [varchar](50) NULL,
	[DOB] [date] NULL,
 CONSTRAINT [PK_clients_1] PRIMARY KEY CLUSTERED 
(
	[id_client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contracts]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contracts](
	[id_contract] [int] IDENTITY(1,1) NOT NULL,
	[id_client] [int] NULL,
	[date_of_conclusion] [datetime] NULL,
	[amount] [int] NULL,
	[term] [int] NULL,
	[id_user] [int] NULL,
 CONSTRAINT [PK_contracts] PRIMARY KEY CLUSTERED 
(
	[id_contract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mades]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mades](
	[made] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_mades] PRIMARY KEY CLUSTERED 
(
	[made] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[number_card] [varchar](16) NULL,
	[info_loan] [varchar](max) NULL,
	[amount] [int] NULL,
	[term] [int] NULL,
	[id_user] [int] NULL,
	[id_client] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prod_ord_of_card]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prod_ord_of_card](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[number_card] [varchar](16) NULL,
	[application_date] [datetime] NULL,
	[id_user] [int] NULL,
	[type] [int] NULL,
	[valid_thru] [varchar](50) NULL,
	[cvv] [int] NULL,
	[pin] [int] NULL,
	[approved] [bit] NULL,
	[made] [int] NULL,
	[id_client] [int] NULL,
 CONSTRAINT [PK_production_order] PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role] [int] NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[types](
	[id_type] [int] NOT NULL,
	[type_name] [varchar](50) NULL,
 CONSTRAINT [PK_types] PRIMARY KEY CLUSTERED 
(
	[id_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 24.02.2022 8:07:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[login] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[FIO] [varchar](max) NULL,
	[role] [int] NULL,
	[processed] [int] NULL,
 CONSTRAINT [PK_clients] PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[bank_account] ([number_account], [id_user], [id_client], [money]) VALUES (N'13783104541530166303', 4, 6, 500000)
INSERT [dbo].[bank_account] ([number_account], [id_user], [id_client], [money]) VALUES (N'17153878435278178442', 4, 11, 0)
INSERT [dbo].[bank_account] ([number_account], [id_user], [id_client], [money]) VALUES (N'18576447214422241217', 4, 13, 0)
INSERT [dbo].[bank_account] ([number_account], [id_user], [id_client], [money]) VALUES (N'56607038158416032800', 4, 12, 0)
INSERT [dbo].[bank_account] ([number_account], [id_user], [id_client], [money]) VALUES (N'85084441845457523420', 4, 12, 0)
GO
SET IDENTITY_INSERT [dbo].[clients] ON 

INSERT [dbo].[clients] ([id_client], [FIO], [number_passport], [pass_issued_by], [tel], [DOB]) VALUES (1, N'Романов Борис Виталиевич', N'2044784678', N'УФМС Ачинск', N'89304589495', CAST(N'2000-05-08' AS Date))
INSERT [dbo].[clients] ([id_client], [FIO], [number_passport], [pass_issued_by], [tel], [DOB]) VALUES (2, N'Романов Сергей Романович', N'74893674', N'УФМС', N'89345787744', CAST(N'2004-06-16' AS Date))
INSERT [dbo].[clients] ([id_client], [FIO], [number_passport], [pass_issued_by], [tel], [DOB]) VALUES (7, N'Курышев Андрей Евгеньевич', N'8473890389', N'УФМС Красноярск', N'89034578345', CAST(N'1994-06-15' AS Date))
INSERT [dbo].[clients] ([id_client], [FIO], [number_passport], [pass_issued_by], [tel], [DOB]) VALUES (9, N'Коняев Роман Геннадьевич', N'6345634563', N'УФМС Ачинск', N'83920457823', CAST(N'2022-06-08' AS Date))
INSERT [dbo].[clients] ([id_client], [FIO], [number_passport], [pass_issued_by], [tel], [DOB]) VALUES (10, N'Романова Елена Ильична', N'7218950318', N'УФМС Москва', N'89028342678', CAST(N'2000-03-03' AS Date))
INSERT [dbo].[clients] ([id_client], [FIO], [number_passport], [pass_issued_by], [tel], [DOB]) VALUES (12, N'Селиванов Леонид Романович', N'7238945709', N'УФМС Петрозаводск', N'89034578394', CAST(N'1990-02-15' AS Date))
SET IDENTITY_INSERT [dbo].[clients] OFF
GO
SET IDENTITY_INSERT [dbo].[contracts] ON 

INSERT [dbo].[contracts] ([id_contract], [id_client], [date_of_conclusion], [amount], [term], [id_user]) VALUES (7, 12, CAST(N'2022-02-23T16:46:57.000' AS DateTime), 0, 0, 4)
INSERT [dbo].[contracts] ([id_contract], [id_client], [date_of_conclusion], [amount], [term], [id_user]) VALUES (9, 12, CAST(N'2022-02-23T17:34:53.000' AS DateTime), 0, 0, 4)
SET IDENTITY_INSERT [dbo].[contracts] OFF
GO
INSERT [dbo].[mades] ([made], [name]) VALUES (1, N'Не изготовлена')
INSERT [dbo].[mades] ([made], [name]) VALUES (2, N'Ожидается')
INSERT [dbo].[mades] ([made], [name]) VALUES (3, N'Изготовлена')
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id_order], [number_card], [info_loan], [amount], [term], [id_user], [id_client]) VALUES (6, N'3232837235848314', N'0', 0, 0, 4, 12)
INSERT [dbo].[orders] ([id_order], [number_card], [info_loan], [amount], [term], [id_user], [id_client]) VALUES (8, N'6685423313620166', N'0', 0, 0, 4, 12)
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[prod_ord_of_card] ON 

INSERT [dbo].[prod_ord_of_card] ([id_order], [number_card], [application_date], [id_user], [type], [valid_thru], [cvv], [pin], [approved], [made], [id_client]) VALUES (10, N'3232837235848314', CAST(N'2022-02-23T16:47:40.000' AS DateTime), 4, 1, N'02/26', 700, 5030, 1, 3, 12)
INSERT [dbo].[prod_ord_of_card] ([id_order], [number_card], [application_date], [id_user], [type], [valid_thru], [cvv], [pin], [approved], [made], [id_client]) VALUES (12, N'6685423313620166', CAST(N'2026-02-23T00:00:00.000' AS DateTime), 4, 1, N'02/26', 398, 6666, 0, 1, 12)
SET IDENTITY_INSERT [dbo].[prod_ord_of_card] OFF
GO
INSERT [dbo].[roles] ([role], [name]) VALUES (0, N'Администратор')
INSERT [dbo].[roles] ([role], [name]) VALUES (1, N'Консультант')
INSERT [dbo].[roles] ([role], [name]) VALUES (2, N'Кредитный отдел')
GO
INSERT [dbo].[types] ([id_type], [type_name]) VALUES (1, N'Дебетовая')
INSERT [dbo].[types] ([id_type], [type_name]) VALUES (2, N'Кредитная')
INSERT [dbo].[types] ([id_type], [type_name]) VALUES (3, N'Расчетная')
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id_user], [login], [password], [FIO], [role], [processed]) VALUES (1, N'1', N'1', N'Назаров Андрей Андреевич', 0, 0)
INSERT [dbo].[users] ([id_user], [login], [password], [FIO], [role], [processed]) VALUES (4, N'123', N'123', N'Жирков Сергей Леонидович', 1, 8)
INSERT [dbo].[users] ([id_user], [login], [password], [FIO], [role], [processed]) VALUES (5, N'400', N'400', N'Летов Олег Ан', 2, 5)
INSERT [dbo].[users] ([id_user], [login], [password], [FIO], [role], [processed]) VALUES (7, N'serega', N'serega', N'Сергей Сергеевич Сергеев', 1, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[bank_account]  WITH CHECK ADD  CONSTRAINT [FK_bank_account_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[bank_account] CHECK CONSTRAINT [FK_bank_account_users]
GO
ALTER TABLE [dbo].[contracts]  WITH CHECK ADD  CONSTRAINT [FK_contracts_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contracts] CHECK CONSTRAINT [FK_contracts_users]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_clients] FOREIGN KEY([id_client])
REFERENCES [dbo].[clients] ([id_client])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_clients]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_users]
GO
ALTER TABLE [dbo].[prod_ord_of_card]  WITH CHECK ADD  CONSTRAINT [FK_prod_ord_of_card_mades] FOREIGN KEY([made])
REFERENCES [dbo].[mades] ([made])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prod_ord_of_card] CHECK CONSTRAINT [FK_prod_ord_of_card_mades]
GO
ALTER TABLE [dbo].[prod_ord_of_card]  WITH CHECK ADD  CONSTRAINT [FK_prod_ord_of_card_types] FOREIGN KEY([type])
REFERENCES [dbo].[types] ([id_type])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prod_ord_of_card] CHECK CONSTRAINT [FK_prod_ord_of_card_types]
GO
ALTER TABLE [dbo].[prod_ord_of_card]  WITH CHECK ADD  CONSTRAINT [FK_prod_ord_of_card_users] FOREIGN KEY([id_user])
REFERENCES [dbo].[users] ([id_user])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[prod_ord_of_card] CHECK CONSTRAINT [FK_prod_ord_of_card_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([role])
REFERENCES [dbo].[roles] ([role])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
USE [master]
GO
ALTER DATABASE [ATM_NAZAROV] SET  READ_WRITE 
GO
