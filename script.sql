USE [master]
GO
/****** Object:  Database [proyecto_hotel]    Script Date: 02/12/2020 04:49:48 p. m. ******/
CREATE DATABASE [proyecto_hotel]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyecto_hotel', FILENAME = N'D:\Archivos de programa\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\proyecto_hotel.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyecto_hotel_log', FILENAME = N'D:\Archivos de programa\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\proyecto_hotel_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [proyecto_hotel] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyecto_hotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyecto_hotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyecto_hotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyecto_hotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyecto_hotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyecto_hotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyecto_hotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyecto_hotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyecto_hotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyecto_hotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyecto_hotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyecto_hotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyecto_hotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyecto_hotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyecto_hotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyecto_hotel] SET  DISABLE_BROKER 
GO
ALTER DATABASE [proyecto_hotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyecto_hotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyecto_hotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyecto_hotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyecto_hotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyecto_hotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyecto_hotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyecto_hotel] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [proyecto_hotel] SET  MULTI_USER 
GO
ALTER DATABASE [proyecto_hotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyecto_hotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyecto_hotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyecto_hotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyecto_hotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [proyecto_hotel] SET QUERY_STORE = OFF
GO
USE [proyecto_hotel]
GO
/****** Object:  Table [dbo].[AmenityComplaint]    Script Date: 02/12/2020 04:49:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmenityComplaint](
	[complaintID] [int] IDENTITY(1,1) NOT NULL,
	[comment] [text] NOT NULL,
	[dateComplaint] [datetime] NOT NULL,
	[amenityID] [int] NOT NULL,
 CONSTRAINT [PK_AmenityComplaint_1] PRIMARY KEY CLUSTERED 
(
	[complaintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AmenityReview]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AmenityReview](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[reviewAmenity] [int] NOT NULL,
	[dataReview] [datetime] NOT NULL,
	[amenityID] [int] NOT NULL,
 CONSTRAINT [PK_AmenityReview_1] PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bonification]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bonification](
	[bonificationID] [int] IDENTITY(1,1) NOT NULL,
	[employeeID] [int] NOT NULL,
	[typeOfBonificationID] [int] NOT NULL,
 CONSTRAINT [PK_Bonification] PRIMARY KEY CLUSTERED 
(
	[bonificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[cityID] [int] IDENTITY(1,1) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[stateID] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[cityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departament]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departament](
	[departamentID] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](50) NOT NULL,
	[admin] [char](1) NOT NULL,
 CONSTRAINT [PK_Departament] PRIMARY KEY CLUSTERED 
(
	[departamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[salary] [decimal](14, 2) NOT NULL,
	[placeOfOrigin] [varchar](3) NOT NULL,
	[cityID] [int] NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[departamentID] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[employeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guest]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guest](
	[guestID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[address] [varchar](200) NOT NULL,
	[DOB] [date] NOT NULL,
	[sex] [char](1) NOT NULL,
	[housePhone] [varchar](13) NULL,
	[cellPhone] [varchar](13) NULL,
	[email] [varchar](50) NULL,
	[RFC] [varchar](13) NULL,
	[placeOfOrigin] [varchar](3) NOT NULL,
	[cityID] [int] NULL,
 CONSTRAINT [PK_Guest] PRIMARY KEY CLUSTERED 
(
	[guestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GuestCompanion]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GuestCompanion](
	[companionID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[DOB] [date] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[reservationID] [int] NOT NULL,
 CONSTRAINT [PK_GuestCompanion] PRIMARY KEY CLUSTERED 
(
	[companionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[reservationID] [int] NOT NULL,
	[guestID] [int] NOT NULL,
	[dateTime] [date] NOT NULL,
	[subtotal] [decimal](14, 2) NOT NULL,
	[discount] [decimal](14, 2) NOT NULL,
	[tax] [decimal](14, 2) NOT NULL,
	[totalDue] [decimal](14, 2) NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaceOfOrigin]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaceOfOrigin](
	[placeOfOrigin] [varchar](3) NOT NULL,
	[country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PlaceOfOrigin] PRIMARY KEY CLUSTERED 
(
	[placeOfOrigin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promo]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promo](
	[promoID] [int] IDENTITY(1,1) NOT NULL,
	[promoName] [varchar](50) NOT NULL,
	[description] [text] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
 CONSTRAINT [PK_Promo] PRIMARY KEY CLUSTERED 
(
	[promoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[reservationID] [int] IDENTITY(1,1) NOT NULL,
	[guestID] [int] NOT NULL,
	[roomID] [int] NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[reservationStatusID] [int] NOT NULL,
	[reservedFromID] [int] NOT NULL,
	[employeeID] [int] NOT NULL,
	[roomPackageID] [int] NULL,
	[roomPromoID] [int] NULL,
 CONSTRAINT [PK_Reservation] PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationComplaint]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationComplaint](
	[complaintID] [int] IDENTITY(1,1) NOT NULL,
	[reservationID] [int] NOT NULL,
	[comment] [text] NOT NULL,
	[dateComplaint] [datetime] NOT NULL,
	[departamentID] [int] NOT NULL,
 CONSTRAINT [PK_ReservationComplaint] PRIMARY KEY CLUSTERED 
(
	[reservationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationReview]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationReview](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[reviewRoom] [int] NOT NULL,
	[dateReview] [datetime] NOT NULL,
	[reservationID] [int] NOT NULL,
	[departamentID] [int] NOT NULL,
 CONSTRAINT [PK_ReservationReview] PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatus]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatus](
	[reservationStatusID] [int] IDENTITY(1,1) NOT NULL,
	[status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ReservationStatus] PRIMARY KEY CLUSTERED 
(
	[reservationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservedFrom]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservedFrom](
	[reservedFromID] [int] IDENTITY(1,1) NOT NULL,
	[reservationMethod] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ReservedFrom] PRIMARY KEY CLUSTERED 
(
	[reservedFromID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[roomID] [int] IDENTITY(1,1) NOT NULL,
	[roomNumber] [int] NOT NULL,
	[roomTypeID] [int] NOT NULL,
	[roomStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[roomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomAmenity]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomAmenity](
	[amenityID] [int] IDENTITY(1,1) NOT NULL,
	[reservationID] [int] NOT NULL,
	[serviceID] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_RoomAmenity] PRIMARY KEY CLUSTERED 
(
	[amenityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomPackage]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomPackage](
	[roomPackageID] [int] IDENTITY(1,1) NOT NULL,
	[namePackage] [varchar](50) NOT NULL,
	[price] [decimal](14, 2) NOT NULL,
	[roomTypeID] [int] NOT NULL,
	[frecuency] [int] NOT NULL,
 CONSTRAINT [PK_RoomPackage] PRIMARY KEY CLUSTERED 
(
	[roomPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomPromo]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomPromo](
	[roomPromoID] [int] IDENTITY(1,1) NOT NULL,
	[promoID] [int] NOT NULL,
	[roomTypeID] [int] NOT NULL,
	[discount] [float] NOT NULL,
 CONSTRAINT [PK_RoomPromo] PRIMARY KEY CLUSTERED 
(
	[roomPromoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomServicePackage]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomServicePackage](
	[roomServicePackageID] [int] IDENTITY(1,1) NOT NULL,
	[roomPackageID] [int] NOT NULL,
	[serviceID] [int] NOT NULL,
 CONSTRAINT [PK_RoomServicePackage] PRIMARY KEY CLUSTERED 
(
	[roomServicePackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomStatus]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomStatus](
	[roomStatusID] [int] IDENTITY(1,1) NOT NULL,
	[statusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RoomStatus] PRIMARY KEY CLUSTERED 
(
	[roomStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[roomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
	[price] [decimal](14, 2) NOT NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[roomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 02/12/2020 04:49:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[serviceID] [int] IDENTITY(1,1) NOT NULL,
	[serviceTypeID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[price] [decimal](14, 2) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[serviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 02/12/2020 04:49:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[serviceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[serviceType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[serviceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 02/12/2020 04:49:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[stateID] [int] IDENTITY(1,1) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[placeOfOrigin] [varchar](3) NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[stateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfBonification]    Script Date: 02/12/2020 04:49:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfBonification](
	[typeOfBonificationID] [int] IDENTITY(1,1) NOT NULL,
	[daysLodging] [int] NOT NULL,
	[bonus] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_TypeOfBonification] PRIMARY KEY CLUSTERED 
(
	[typeOfBonificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AmenityComplaint]  WITH CHECK ADD  CONSTRAINT [FK_AmenityComplaint_RoomAmenity] FOREIGN KEY([amenityID])
REFERENCES [dbo].[RoomAmenity] ([amenityID])
GO
ALTER TABLE [dbo].[AmenityComplaint] CHECK CONSTRAINT [FK_AmenityComplaint_RoomAmenity]
GO
ALTER TABLE [dbo].[AmenityReview]  WITH CHECK ADD  CONSTRAINT [FK_AmenityReview_RoomAmenity] FOREIGN KEY([amenityID])
REFERENCES [dbo].[RoomAmenity] ([amenityID])
GO
ALTER TABLE [dbo].[AmenityReview] CHECK CONSTRAINT [FK_AmenityReview_RoomAmenity]
GO
ALTER TABLE [dbo].[Bonification]  WITH CHECK ADD  CONSTRAINT [FK_Bonification_Employee] FOREIGN KEY([employeeID])
REFERENCES [dbo].[Employee] ([employeeID])
GO
ALTER TABLE [dbo].[Bonification] CHECK CONSTRAINT [FK_Bonification_Employee]
GO
ALTER TABLE [dbo].[Bonification]  WITH CHECK ADD  CONSTRAINT [FK_Bonification_TypeOfBonification] FOREIGN KEY([typeOfBonificationID])
REFERENCES [dbo].[TypeOfBonification] ([typeOfBonificationID])
GO
ALTER TABLE [dbo].[Bonification] CHECK CONSTRAINT [FK_Bonification_TypeOfBonification]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([stateID])
REFERENCES [dbo].[State] ([stateID])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_City] FOREIGN KEY([cityID])
REFERENCES [dbo].[City] ([cityID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_City]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Departament] FOREIGN KEY([departamentID])
REFERENCES [dbo].[Departament] ([departamentID])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Departament]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_PlaceOfOrigin] FOREIGN KEY([placeOfOrigin])
REFERENCES [dbo].[PlaceOfOrigin] ([placeOfOrigin])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_PlaceOfOrigin]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FK_Guest_City] FOREIGN KEY([cityID])
REFERENCES [dbo].[City] ([cityID])
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FK_Guest_City]
GO
ALTER TABLE [dbo].[Guest]  WITH CHECK ADD  CONSTRAINT [FK_Guest_PlaceOfOrigin] FOREIGN KEY([placeOfOrigin])
REFERENCES [dbo].[PlaceOfOrigin] ([placeOfOrigin])
GO
ALTER TABLE [dbo].[Guest] CHECK CONSTRAINT [FK_Guest_PlaceOfOrigin]
GO
ALTER TABLE [dbo].[GuestCompanion]  WITH CHECK ADD  CONSTRAINT [FK_GuestCompanion_Reservation] FOREIGN KEY([reservationID])
REFERENCES [dbo].[Reservation] ([reservationID])
GO
ALTER TABLE [dbo].[GuestCompanion] CHECK CONSTRAINT [FK_GuestCompanion_Reservation]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Guest] FOREIGN KEY([guestID])
REFERENCES [dbo].[Guest] ([guestID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Guest]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Reservation] FOREIGN KEY([reservationID])
REFERENCES [dbo].[Reservation] ([reservationID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Reservation]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Employee] FOREIGN KEY([employeeID])
REFERENCES [dbo].[Employee] ([employeeID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Employee]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Guest] FOREIGN KEY([guestID])
REFERENCES [dbo].[Guest] ([guestID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Guest]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_ReservationStatus] FOREIGN KEY([reservationStatusID])
REFERENCES [dbo].[ReservationStatus] ([reservationStatusID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_ReservationStatus]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_ReservedFrom] FOREIGN KEY([reservedFromID])
REFERENCES [dbo].[ReservedFrom] ([reservedFromID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_ReservedFrom]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Room] FOREIGN KEY([roomID])
REFERENCES [dbo].[Room] ([roomID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Room]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_RoomPackage] FOREIGN KEY([roomPackageID])
REFERENCES [dbo].[RoomPackage] ([roomPackageID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_RoomPackage]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_RoomPromo] FOREIGN KEY([roomPromoID])
REFERENCES [dbo].[RoomPromo] ([roomPromoID])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_RoomPromo]
GO
ALTER TABLE [dbo].[ReservationComplaint]  WITH CHECK ADD  CONSTRAINT [FK_ReservationComplaint_Departament] FOREIGN KEY([departamentID])
REFERENCES [dbo].[Departament] ([departamentID])
GO
ALTER TABLE [dbo].[ReservationComplaint] CHECK CONSTRAINT [FK_ReservationComplaint_Departament]
GO
ALTER TABLE [dbo].[ReservationComplaint]  WITH CHECK ADD  CONSTRAINT [FK_ReservationComplaint_Reservation] FOREIGN KEY([reservationID])
REFERENCES [dbo].[Reservation] ([reservationID])
GO
ALTER TABLE [dbo].[ReservationComplaint] CHECK CONSTRAINT [FK_ReservationComplaint_Reservation]
GO
ALTER TABLE [dbo].[ReservationReview]  WITH CHECK ADD  CONSTRAINT [FK_ReservationReview_Departament] FOREIGN KEY([departamentID])
REFERENCES [dbo].[Departament] ([departamentID])
GO
ALTER TABLE [dbo].[ReservationReview] CHECK CONSTRAINT [FK_ReservationReview_Departament]
GO
ALTER TABLE [dbo].[ReservationReview]  WITH CHECK ADD  CONSTRAINT [FK_ReservationReview_Reservation] FOREIGN KEY([reservationID])
REFERENCES [dbo].[Reservation] ([reservationID])
GO
ALTER TABLE [dbo].[ReservationReview] CHECK CONSTRAINT [FK_ReservationReview_Reservation]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomStatus] FOREIGN KEY([roomStatusID])
REFERENCES [dbo].[RoomStatus] ([roomStatusID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomStatus]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomType] FOREIGN KEY([roomTypeID])
REFERENCES [dbo].[RoomType] ([roomTypeID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomType]
GO
ALTER TABLE [dbo].[RoomAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenity_Reservation] FOREIGN KEY([reservationID])
REFERENCES [dbo].[Reservation] ([reservationID])
GO
ALTER TABLE [dbo].[RoomAmenity] CHECK CONSTRAINT [FK_RoomAmenity_Reservation]
GO
ALTER TABLE [dbo].[RoomAmenity]  WITH CHECK ADD  CONSTRAINT [FK_RoomAmenity_Service] FOREIGN KEY([serviceID])
REFERENCES [dbo].[Service] ([serviceID])
GO
ALTER TABLE [dbo].[RoomAmenity] CHECK CONSTRAINT [FK_RoomAmenity_Service]
GO
ALTER TABLE [dbo].[RoomPackage]  WITH CHECK ADD  CONSTRAINT [FK_RoomPackage_RoomType] FOREIGN KEY([roomTypeID])
REFERENCES [dbo].[RoomType] ([roomTypeID])
GO
ALTER TABLE [dbo].[RoomPackage] CHECK CONSTRAINT [FK_RoomPackage_RoomType]
GO
ALTER TABLE [dbo].[RoomPromo]  WITH CHECK ADD  CONSTRAINT [FK_RoomPromo_Promo] FOREIGN KEY([promoID])
REFERENCES [dbo].[Promo] ([promoID])
GO
ALTER TABLE [dbo].[RoomPromo] CHECK CONSTRAINT [FK_RoomPromo_Promo]
GO
ALTER TABLE [dbo].[RoomPromo]  WITH CHECK ADD  CONSTRAINT [FK_RoomPromo_RoomType] FOREIGN KEY([roomTypeID])
REFERENCES [dbo].[RoomType] ([roomTypeID])
GO
ALTER TABLE [dbo].[RoomPromo] CHECK CONSTRAINT [FK_RoomPromo_RoomType]
GO
ALTER TABLE [dbo].[RoomServicePackage]  WITH CHECK ADD  CONSTRAINT [FK_RoomServicePackage_RoomPackage] FOREIGN KEY([roomPackageID])
REFERENCES [dbo].[RoomPackage] ([roomPackageID])
GO
ALTER TABLE [dbo].[RoomServicePackage] CHECK CONSTRAINT [FK_RoomServicePackage_RoomPackage]
GO
ALTER TABLE [dbo].[RoomServicePackage]  WITH CHECK ADD  CONSTRAINT [FK_RoomServicePackage_Service] FOREIGN KEY([serviceID])
REFERENCES [dbo].[Service] ([serviceID])
GO
ALTER TABLE [dbo].[RoomServicePackage] CHECK CONSTRAINT [FK_RoomServicePackage_Service]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_ServiceType] FOREIGN KEY([serviceTypeID])
REFERENCES [dbo].[ServiceType] ([serviceTypeID])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_ServiceType]
GO
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_PlaceOfOrigin] FOREIGN KEY([placeOfOrigin])
REFERENCES [dbo].[PlaceOfOrigin] ([placeOfOrigin])
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_PlaceOfOrigin]
GO
USE [master]
GO
ALTER DATABASE [proyecto_hotel] SET  READ_WRITE 
GO
