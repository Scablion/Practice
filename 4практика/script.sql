USE [master]
GO
/****** Object:  Database [Больница]    Script Date: 03.01.2024 16:09:20 ******/
CREATE DATABASE [Больница]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Больница', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Больница.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Больница_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Больница_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Больница] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Больница].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Больница] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Больница] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Больница] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Больница] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Больница] SET ARITHABORT OFF 
GO
ALTER DATABASE [Больница] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Больница] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Больница] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Больница] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Больница] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Больница] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Больница] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Больница] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Больница] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Больница] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Больница] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Больница] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Больница] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Больница] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Больница] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Больница] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Больница] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Больница] SET RECOVERY FULL 
GO
ALTER DATABASE [Больница] SET  MULTI_USER 
GO
ALTER DATABASE [Больница] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Больница] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Больница] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Больница] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Больница] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Больница] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Больница', N'ON'
GO
ALTER DATABASE [Больница] SET QUERY_STORE = OFF
GO
USE [Больница]
GO
/****** Object:  Table [dbo].[Doctors]    Script Date: 03.01.2024 16:09:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctors](
	[ФИО_врача] [nvarchar](50) NOT NULL,
	[Специальнось_врача] [tinyint] NULL,
	[Процент_отчисляемый_на_зарплату] [float] NULL,
 CONSTRAINT [PK_Doctors] PRIMARY KEY CLUSTERED 
(
	[ФИО_врача] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job title]    Script Date: 03.01.2024 16:09:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job title](
	[ID_job] [tinyint] IDENTITY(1,1) NOT NULL,
	[Специальность_доктора] [nvarchar](50) NOT NULL,
	[Стоимость_услуги] [money] NULL,
 CONSTRAINT [PK_job title_1] PRIMARY KEY CLUSTERED 
(
	[ID_job] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patient reception]    Script Date: 03.01.2024 16:09:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient reception](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия_Пациента] [int] NULL,
	[Фио_врача] [nvarchar](50) NULL,
	[Дата_приёма] [date] NULL,
 CONSTRAINT [PK_patient reception] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 03.01.2024 16:09:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Фамилия_Пациента] [nvarchar](50) NULL,
	[Имя_пациента] [nvarchar](50) NULL,
	[Отчество_пациента] [nvarchar](50) NULL,
	[Дата_рождения_пациета] [date] NULL,
	[Адрец_пациента] [nvarchar](50) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Гончаров Г.Т.', 9, 0.1)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Дмитриев М.М.', 1, 0.2)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Журавлева В.А.', 10, 0.15)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Иванов А.Д.', 6, 0.17)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Измайлов М.П', 5, 0.17)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Кузнецов В.И.', 7, 0.15)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Кузнецова Э.М.', 11, 0.17)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Логинова С.Д.', 4, 0.11)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Матвеев И.И.', 8, 0.12)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Сидорова М.Л.', 3, 0.15)
INSERT [dbo].[Doctors] ([ФИО_врача], [Специальнось_врача], [Процент_отчисляемый_на_зарплату]) VALUES (N'Титов И.А.', 2, 0.18)
GO
SET IDENTITY_INSERT [dbo].[job title] ON 

INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (1, N'ЛОР', 1300.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (2, N'Массажист	', 3000.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (3, N'Невролог	', 2800.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (4, N'Окулист', 535.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (5, N'Офтальмолог	', 1750.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (6, N'Педиатр', 1000.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (7, N'Психиатр	', 2000.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (8, N'Стамотолог	', 3200.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (9, N'Терапевт	', 1750.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (10, N'Уролог	', 2500.0000)
INSERT [dbo].[job title] ([ID_job], [Специальность_доктора], [Стоимость_услуги]) VALUES (11, N'Хирург	', 2550.0000)
SET IDENTITY_INSERT [dbo].[job title] OFF
GO
SET IDENTITY_INSERT [dbo].[patient reception] ON 

INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (1, 1, N'Гончаров Г.Т.', CAST(N'2023-03-12' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (2, 4, N'Журавлева В.А.', CAST(N'2023-11-10' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (3, 2, N'Кузнецова Э.М.', CAST(N'2023-12-10' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (4, 3, N'Иванов А.Д.', CAST(N'2023-03-22' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (5, 5, N'Дмитриев М.М.', CAST(N'2023-04-06' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (6, 8, N'Измайлов М.П', CAST(N'2023-07-14' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (7, 6, N'Кузнецов В.И.', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (8, 7, N'Матвеев И.И.', CAST(N'2023-11-30' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (10, 9, N'Сидорова М.Л.', CAST(N'2023-02-06' AS Date))
INSERT [dbo].[patient reception] ([ID], [Фамилия_Пациента], [Фио_врача], [Дата_приёма]) VALUES (11, 10, N'Логинова С.Д.', CAST(N'2023-05-12' AS Date))
SET IDENTITY_INSERT [dbo].[patient reception] OFF
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (1, N'Павлова', N'Дарья', N'Константиновна', CAST(N'1990-03-12' AS Date), N'ул.Гоголя д.24')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (2, N'Позднякова', N'Елизавета', N'Степановна', CAST(N'1986-10-24' AS Date), N'ул.Ленина д.124')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (3, N'Покровский', N'Мирон', N'Егорович', CAST(N'1976-04-02' AS Date), N'ул.Баумана д.56')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (4, N'Постникова', N'София', N'Романовна', CAST(N'1984-05-21' AS Date), N'ул.Грибоедова д.77')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (5, N'Григорьев', N'Дмитрий', N'Миронович', CAST(N'1995-06-23' AS Date), N'ул.Гоголя д.57')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (6, N'Макарова', N'Дарина', N'Артёмовна', CAST(N'1985-11-15' AS Date), N'ул.Караулова д.74')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (7, N'Шульгина ', N'София ', N'Александровна', CAST(N'1996-01-05' AS Date), N'ул.Свердлова д.27')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (8, N'Баранов ', N'Дмитрий ', N'Артёмович', CAST(N'2005-12-31' AS Date), N'ул.Кремлёвская д.57а')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (9, N'Грекова', N'Алиса ', N'Артёмовна', CAST(N'2002-04-30' AS Date), N'ул.Грибоедова д.34')
INSERT [dbo].[Patients] ([ID], [Фамилия_Пациента], [Имя_пациента], [Отчество_пациента], [Дата_рождения_пациета], [Адрец_пациента]) VALUES (10, N'Лукьянов ', N'Артур ', N'Егорович', CAST(N'1974-12-15' AS Date), N'ул.Гоголя д.20')
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
ALTER TABLE [dbo].[Doctors]  WITH CHECK ADD  CONSTRAINT [FK_Doctors_job title] FOREIGN KEY([Специальнось_врача])
REFERENCES [dbo].[job title] ([ID_job])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Doctors] CHECK CONSTRAINT [FK_Doctors_job title]
GO
ALTER TABLE [dbo].[patient reception]  WITH CHECK ADD  CONSTRAINT [FK_patient reception_Doctors] FOREIGN KEY([Фио_врача])
REFERENCES [dbo].[Doctors] ([ФИО_врача])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[patient reception] CHECK CONSTRAINT [FK_patient reception_Doctors]
GO
ALTER TABLE [dbo].[patient reception]  WITH CHECK ADD  CONSTRAINT [FK_patient reception_Patients] FOREIGN KEY([Фамилия_Пациента])
REFERENCES [dbo].[Patients] ([ID])
GO
ALTER TABLE [dbo].[patient reception] CHECK CONSTRAINT [FK_patient reception_Patients]
GO
USE [master]
GO
ALTER DATABASE [Больница] SET  READ_WRITE 
GO
