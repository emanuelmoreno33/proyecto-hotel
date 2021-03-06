USE [master]
GO
/****** Object:  Database [proyecto_hotel]    Script Date: 07/01/2021 11:23:53 a. m. ******/
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
/****** Object:  Table [dbo].[RoomType]    Script Date: 07/01/2021 11:23:53 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[roomTypeID] [int] IDENTITY(1,1) NOT NULL,
	[typeName] [varchar](50) NOT NULL,
	[price] [decimal](14, 2) NOT NULL,
	[capacity] [int] NULL,
 CONSTRAINT [PK_RoomType] PRIMARY KEY CLUSTERED 
(
	[roomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomStatus]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  View [dbo].[consulta1]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[consulta1]
AS
SELECT        dbo.RoomType.typeName, COUNT(dbo.Room.roomTypeID) AS Expr1
FROM            dbo.Room INNER JOIN
                         dbo.RoomType ON dbo.Room.roomTypeID = dbo.RoomType.roomTypeID INNER JOIN
                         dbo.RoomStatus ON dbo.Room.roomStatusID = dbo.RoomStatus.roomStatusID
GROUP BY dbo.RoomType.typeName, dbo.Room.roomStatusID
HAVING        (dbo.Room.roomStatusID = 1)
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[GuestCompanion]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  View [dbo].[consulta2]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[consulta2]
AS
SELECT        dbo.Reservation.reservationID, COUNT(dbo.GuestCompanion.reservationID) + 1 AS companion, dbo.Reservation.startDate
FROM            dbo.Reservation LEFT OUTER JOIN
                         dbo.GuestCompanion ON dbo.Reservation.reservationID = dbo.GuestCompanion.reservationID
GROUP BY dbo.Reservation.reservationID, dbo.Reservation.startDate
GO
/****** Object:  Table [dbo].[RoomPromo]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[Promo]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  View [dbo].[reporte3]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[reporte3]
AS
SELECT        dbo.Promo.promoName, COUNT(dbo.Promo.promoName) AS conteo, dbo.Reservation.startDate, dbo.Reservation.endDate
FROM            dbo.Reservation INNER JOIN
                         dbo.RoomPromo ON dbo.Reservation.roomPromoID = dbo.RoomPromo.roomPromoID INNER JOIN
                         dbo.Promo ON dbo.RoomPromo.promoID = dbo.Promo.promoID
GROUP BY dbo.Promo.promoName, dbo.Reservation.startDate, dbo.Reservation.endDate
GO
/****** Object:  View [dbo].[reporte4]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[reporte4]
AS
SELECT        dbo.RoomType.typeName, dbo.RoomType.price, dbo.RoomType.capacity, dbo.Room.roomNumber
FROM            dbo.Room INNER JOIN
                         dbo.RoomType ON dbo.Room.roomTypeID = dbo.RoomType.roomTypeID INNER JOIN
                         dbo.RoomStatus ON dbo.Room.roomStatusID = dbo.RoomStatus.roomStatusID
GROUP BY dbo.RoomType.typeName, dbo.RoomStatus.roomStatusID, dbo.RoomType.price, dbo.RoomType.capacity, dbo.Room.roomNumber, dbo.RoomStatus.statusName
HAVING        (dbo.RoomStatus.roomStatusID = 1)
GO
/****** Object:  Table [dbo].[ReservedFrom]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[Guest]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  View [dbo].[reporte5]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[reporte5]
AS
SELECT        TOP (100) PERCENT dbo.Reservation.reservationID, dbo.Reservation.startDate, dbo.Reservation.endDate, DATEDIFF(day, dbo.Reservation.startDate, dbo.Reservation.endDate) AS diff
FROM            dbo.Reservation INNER JOIN
                         dbo.Guest ON dbo.Reservation.guestID = dbo.Guest.guestID INNER JOIN
                         dbo.Room ON dbo.Reservation.roomID = dbo.Room.roomID INNER JOIN
                         dbo.RoomStatus ON dbo.Room.roomStatusID = dbo.RoomStatus.roomStatusID INNER JOIN
                         dbo.ReservedFrom ON dbo.Reservation.reservedFromID = dbo.ReservedFrom.reservedFromID
GROUP BY dbo.Reservation.startDate, dbo.Reservation.endDate, dbo.Reservation.reservationID
ORDER BY diff DESC
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[Departament]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  View [dbo].[reporte6]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[reporte6]
AS
SELECT        dbo.Employee.departamentID, dbo.Departament.type AS Departamento, COUNT(dbo.Employee.departamentID) AS cantidad
FROM            dbo.Employee INNER JOIN
                         dbo.Departament ON dbo.Employee.departamentID = dbo.Departament.departamentID
GROUP BY dbo.Employee.departamentID, dbo.Departament.type
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[RoomAmenity]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  View [dbo].[reporte8]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[reporte8]
AS
SELECT        dbo.Reservation.reservationID, dbo.Reservation.startDate AS fecha_reservacion, dbo.Service.name, dbo.Service.price, dbo.ServiceType.serviceType, dbo.RoomAmenity.date AS fecha_servicio
FROM            dbo.Reservation FULL OUTER JOIN
                         dbo.ServiceType INNER JOIN
                         dbo.Service ON dbo.ServiceType.serviceTypeID = dbo.Service.serviceTypeID RIGHT OUTER JOIN
                         dbo.RoomAmenity ON dbo.Service.serviceID = dbo.RoomAmenity.serviceID ON dbo.Reservation.reservationID = dbo.RoomAmenity.reservationID
GO
/****** Object:  Table [dbo].[ReservationComplaint]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
	[complaintID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[reporte10]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[reporte10]
AS
SELECT        TOP (100) PERCENT dbo.ReservationComplaint.dateComplaint, dbo.ReservationComplaint.comment, dbo.Departament.type
FROM            dbo.Departament INNER JOIN
                         dbo.ReservationComplaint ON dbo.Departament.departamentID = dbo.ReservationComplaint.departamentID
ORDER BY dbo.Departament.type
GO
/****** Object:  Table [dbo].[RoomPackage]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomPackage](
	[roomPackageID] [int] IDENTITY(1,1) NOT NULL,
	[namePackage] [varchar](50) NOT NULL,
	[price] [decimal](14, 2) NOT NULL,
	[roomTypeID] [int] NOT NULL,
	[frequency] [int] NOT NULL,
 CONSTRAINT [PK_RoomPackage] PRIMARY KEY CLUSTERED 
(
	[roomPackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[consulta11]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[consulta11]
AS
SELECT        dbo.ReservedFrom.reservationMethod, dbo.Reservation.startDate, dbo.Reservation.endDate, DATEDIFF(day, dbo.Reservation.startDate, dbo.Reservation.endDate) AS diferencia, dbo.RoomPackage.namePackage AS paquete, 
                         dbo.RoomPackage.price AS precio_paquete, dbo.RoomType.typeName, dbo.RoomType.price AS precio_cuarto, dbo.Promo.promoName, dbo.RoomPromo.discount AS descuento
FROM            dbo.RoomPackage RIGHT OUTER JOIN
                         dbo.Promo INNER JOIN
                         dbo.RoomPromo ON dbo.Promo.promoID = dbo.RoomPromo.promoID RIGHT OUTER JOIN
                         dbo.Reservation ON dbo.RoomPromo.roomPromoID = dbo.Reservation.roomPromoID ON dbo.RoomPackage.roomPackageID = dbo.Reservation.roomPackageID LEFT OUTER JOIN
                         dbo.RoomType INNER JOIN
                         dbo.Room ON dbo.RoomType.roomTypeID = dbo.Room.roomTypeID ON dbo.Reservation.roomID = dbo.Room.roomID LEFT OUTER JOIN
                         dbo.ReservedFrom ON dbo.Reservation.reservedFromID = dbo.ReservedFrom.reservedFromID
GROUP BY dbo.ReservedFrom.reservationMethod, dbo.Reservation.startDate, dbo.Reservation.endDate, DATEDIFF(day, dbo.Reservation.startDate, dbo.Reservation.endDate), dbo.RoomPackage.namePackage, dbo.RoomPackage.price, 
                         dbo.RoomType.price, dbo.Promo.promoName, dbo.RoomPromo.discount, dbo.RoomType.typeName
GO
/****** Object:  Table [dbo].[ReservationReview]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  View [dbo].[consulta12]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[consulta12]
AS
SELECT        dbo.ReservationReview.reviewRoom AS calificacion, dbo.Departament.type AS departamento, dbo.ReservationReview.dateReview AS fecha
FROM            dbo.ReservationReview INNER JOIN
                         dbo.Departament ON dbo.ReservationReview.departamentID = dbo.Departament.departamentID
GO
/****** Object:  View [dbo].[consulta8]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[consulta8]
AS
select Reservation.startDate as inicio, Reservation.endDate as fin, Service.price as precio, Service.name as nombre
from Reservation 
join RoomAmenity on Reservation.reservationID = RoomAmenity.reservationID
join Service on RoomAmenity.amenityID = Service.serviceID
union
select Reservation.startDate as inicio, 
Reservation.endDate as fin, 
(RoomType.price*(1-(isnull (RoomPromo.discount,0)/100))*datediff(DAY,Reservation.startDate,Reservation.endDate)) as precio, 
'Reservación de habitación' as nombre
from Reservation 
join Room on Reservation.roomID = Room.roomID
join RoomType on Room.roomTypeID = RoomType.roomTypeID
left join RoomPromo on RoomType.roomTypeID = RoomPromo.roomTypeID
GO
/****** Object:  View [dbo].[DetallesFactura]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DetallesFactura]
AS
SELECT 
	ROW_NUMBER() OVER(ORDER BY reservationID ASC) AS coneptoId,
	reservationID,
	concepto,
	importe
FROM (
	SELECT 
		RE.reservationID reservationID,
		CONCAT(
			'HOSPEDAJE ', 
			DATEDIFF(DAY, RE.startDate, RE.endDate), 
			' DÍAS'

		) concepto, 
		(RT.price) * DATEDIFF(DAY, RE.startDate, RE.endDate) importe
	FROM Reservation RE
	JOIN Room RO
	ON RO.roomID = RE.roomID
	JOIN RoomType RT
	ON RT.roomTypeID = RO.roomTypeID
	LEFT JOIN RoomPromo RP
	ON RP.roomPromoID = RE.roomPromoID
	UNION
	SELECT 
		RE.reservationID reservationID,
		UPPER(CONCAT('AMENIDAD ', SE.name)) concepto, 
		SE.price importe
	FROM Reservation RE
	JOIN RoomAmenity RA	
	ON RA.reservationID = RE.reservationID
	JOIN [Service] SE
	ON SE.serviceID = RA.serviceID
	UNION
	SELECT
		RE.reservationID reservationID,
		UPPER(RP.namePackage) concepto, 
		ISNULL(RP.price, 0) importe
	FROM Reservation RE
	LEFT JOIN RoomPackage RP
	ON RP.roomPackageID = RE.roomPackageID
) T;
GO
/****** Object:  Table [dbo].[AmenityComplaint]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[AmenityReview]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[Bonification]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bonification](
	[bonificationID] [int] IDENTITY(1,1) NOT NULL,
	[employeeID] [int] NOT NULL,
	[typeOfBonificationID] [int] NOT NULL,
	[date] [datetime] NOT NULL,
 CONSTRAINT [PK_Bonification] PRIMARY KEY CLUSTERED 
(
	[bonificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[Invoice]    Script Date: 07/01/2021 11:23:54 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[reservationID] [int] NOT NULL,
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
/****** Object:  Table [dbo].[PlaceOfOrigin]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[ReservationStatus]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[RoomServicePackage]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[State]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
/****** Object:  Table [dbo].[TypeOfBonification]    Script Date: 07/01/2021 11:23:54 a. m. ******/
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
SET IDENTITY_INSERT [dbo].[AmenityComplaint] ON 

INSERT [dbo].[AmenityComplaint] ([complaintID], [comment], [dateComplaint], [amenityID]) VALUES (1, N'encontre una radio vieja con muchos cables', CAST(N'2021-01-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AmenityComplaint] ([complaintID], [comment], [dateComplaint], [amenityID]) VALUES (2, N'El auto no funciono cuando lo prendieron.', CAST(N'2021-01-05T17:44:33.010' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[AmenityComplaint] OFF
SET IDENTITY_INSERT [dbo].[AmenityReview] ON 

INSERT [dbo].[AmenityReview] ([reviewID], [reviewAmenity], [dataReview], [amenityID]) VALUES (1, 5, CAST(N'2021-01-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[AmenityReview] ([reviewID], [reviewAmenity], [dataReview], [amenityID]) VALUES (2, 4, CAST(N'2021-01-05T17:35:15.043' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[AmenityReview] OFF
SET IDENTITY_INSERT [dbo].[Bonification] ON 

INSERT [dbo].[Bonification] ([bonificationID], [employeeID], [typeOfBonificationID], [date]) VALUES (1005, 1, 2, CAST(N'2021-01-05T19:21:18.480' AS DateTime))
INSERT [dbo].[Bonification] ([bonificationID], [employeeID], [typeOfBonificationID], [date]) VALUES (1006, 1, 1, CAST(N'2021-01-05T19:21:18.480' AS DateTime))
INSERT [dbo].[Bonification] ([bonificationID], [employeeID], [typeOfBonificationID], [date]) VALUES (1007, 1, 1, CAST(N'2021-01-05T19:26:14.100' AS DateTime))
INSERT [dbo].[Bonification] ([bonificationID], [employeeID], [typeOfBonificationID], [date]) VALUES (1013, 1, 1, CAST(N'2021-01-05T19:52:07.003' AS DateTime))
INSERT [dbo].[Bonification] ([bonificationID], [employeeID], [typeOfBonificationID], [date]) VALUES (1014, 2, 1, CAST(N'2021-01-05T19:52:51.257' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bonification] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (1, N'Tijuana', 2)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (2, N'Mexicali', 2)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (3, N'Tecate', 2)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (4, N'Playas De Rosarito', 2)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (5, N'Ensenada', 2)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (6, N'Aguascalientes', 1)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (7, N'La Paz', 1003)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (8, N'Campeche', 1004)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (9, N'Saltillo', 1008)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (10, N'Colima', 1009)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (11, N'Tuxtla Gutiérrez', 1005)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (12, N'Colima', 1009)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (13, N'Victoria de Durango', 1010)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (14, N'Guanajuato', 1011)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (15, N'Chilpancingo de los Bravo', 1012)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (16, N'Pachuca de Soto', 1013)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (17, N'Guadalajara', 1014)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (18, N'Toluca de Lerdo', 1015)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (19, N'Morelia', 1016)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (20, N'Cuernavaca', 1017)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (21, N'Tepic', 1018)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (22, N'Monterrey', 1019)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (23, N'Oaxaca de Juárez', 1020)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (24, N'Puebla de Zaragoza', 1021)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (25, N'Santiago de Querétaro', 1022)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (26, N'Chetumal', 1023)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (27, N'San Luis Potosí', 1024)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (28, N'Culiacán Rosales', 1025)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (29, N'Hermosillo', 1026)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (30, N'Villahermosa', 1027)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (31, N'Ciudad Victoria', 1028)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (32, N'Tlaxcala de Xicohténcatl', 1029)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (33, N'Xalapa-Enríquez', 1030)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (34, N'Mérida', 1031)
INSERT [dbo].[City] ([cityID], [city], [stateID]) VALUES (35, N'Zacatecas', 1032)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Departament] ON 

INSERT [dbo].[Departament] ([departamentID], [type], [admin]) VALUES (1, N'Gerente', N'1')
INSERT [dbo].[Departament] ([departamentID], [type], [admin]) VALUES (2, N'Recepcionista', N'0')
INSERT [dbo].[Departament] ([departamentID], [type], [admin]) VALUES (3, N'Mantenimiento', N'0')
INSERT [dbo].[Departament] ([departamentID], [type], [admin]) VALUES (4, N'Servicios', N'0')
INSERT [dbo].[Departament] ([departamentID], [type], [admin]) VALUES (1002, N'Electronica', N'0')
SET IDENTITY_INSERT [dbo].[Departament] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([employeeID], [name], [lastName], [DOB], [salary], [placeOfOrigin], [cityID], [username], [password], [departamentID]) VALUES (1, N'Emanuel', N'Moreno R', CAST(N'2020-12-21' AS Date), CAST(1000.00 AS Decimal(14, 2)), N'MEX', 3, N'claudespeed21333', N'1234', 1)
INSERT [dbo].[Employee] ([employeeID], [name], [lastName], [DOB], [salary], [placeOfOrigin], [cityID], [username], [password], [departamentID]) VALUES (2, N'Daniel S', N'Aguila T', CAST(N'2021-02-02' AS Date), CAST(1200.00 AS Decimal(14, 2)), N'MEX', 32, N'papermonnoid', N'qwerty', 3)
INSERT [dbo].[Employee] ([employeeID], [name], [lastName], [DOB], [salary], [placeOfOrigin], [cityID], [username], [password], [departamentID]) VALUES (1002, N'John', N'Smith', CAST(N'2020-12-09' AS Date), CAST(3000.00 AS Decimal(14, 2)), N'USA', NULL, N'americaneagle', N'asdf', 4)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Guest] ON 

INSERT [dbo].[Guest] ([guestID], [name], [lastName], [address], [DOB], [sex], [housePhone], [cellPhone], [email], [RFC], [placeOfOrigin], [cityID]) VALUES (1, N'Emanuel', N'Moreno', N'Av. de las flores 1234', CAST(N'2020-12-21' AS Date), N'H', N'123456789', N'123456789', N'asdf@asfd.com', N'1234567894', N'AZE', NULL)
INSERT [dbo].[Guest] ([guestID], [name], [lastName], [address], [DOB], [sex], [housePhone], [cellPhone], [email], [RFC], [placeOfOrigin], [cityID]) VALUES (2, N'Eduardo', N'Castillo', N'Blvd. de las torres 5678', CAST(N'2020-12-16' AS Date), N'H', N'1234', NULL, N'asp@net.com', NULL, N'MEX', 1)
INSERT [dbo].[Guest] ([guestID], [name], [lastName], [address], [DOB], [sex], [housePhone], [cellPhone], [email], [RFC], [placeOfOrigin], [cityID]) VALUES (1002, N'Michael', N'De Santa', N'Av. de las tunas 12', CAST(N'2020-12-23' AS Date), N'H', N'112342234', N'123321', N'adsf@sadf.com', NULL, N'MEX', 6)
INSERT [dbo].[Guest] ([guestID], [name], [lastName], [address], [DOB], [sex], [housePhone], [cellPhone], [email], [RFC], [placeOfOrigin], [cityID]) VALUES (2002, N'Emanuel', N'af', N'Aguila coronada', CAST(N'2020-12-29' AS Date), N'H', N'123412579', N'1234567890', N'af', NULL, N'MEX', 2)
SET IDENTITY_INSERT [dbo].[Guest] OFF
SET IDENTITY_INSERT [dbo].[GuestCompanion] ON 

INSERT [dbo].[GuestCompanion] ([companionID], [name], [lastName], [DOB], [email], [reservationID]) VALUES (1, N'Emanuel', N'Moreno', CAST(N'2020-12-09' AS Date), N'emanuel.moreno16@tec.com', 1)
INSERT [dbo].[GuestCompanion] ([companionID], [name], [lastName], [DOB], [email], [reservationID]) VALUES (2, N'Karen', N'Díaz ', CAST(N'2020-12-02' AS Date), N'fdas@safd.com', 1)
INSERT [dbo].[GuestCompanion] ([companionID], [name], [lastName], [DOB], [email], [reservationID]) VALUES (3, N'Felix', N'Smith', CAST(N'2020-12-12' AS Date), N'ADF@ASDF.COM', 2)
SET IDENTITY_INSERT [dbo].[GuestCompanion] OFF
SET IDENTITY_INSERT [dbo].[Invoice] ON 

INSERT [dbo].[Invoice] ([invoiceID], [reservationID], [dateTime], [subtotal], [discount], [tax], [totalDue]) VALUES (1, 1, CAST(N'2021-01-06' AS Date), CAST(3000.00 AS Decimal(14, 2)), CAST(135.00 AS Decimal(14, 2)), CAST(458.00 AS Decimal(14, 2)), CAST(3323.00 AS Decimal(14, 2)))
INSERT [dbo].[Invoice] ([invoiceID], [reservationID], [dateTime], [subtotal], [discount], [tax], [totalDue]) VALUES (2, 2010, CAST(N'2021-01-06' AS Date), CAST(1400.00 AS Decimal(14, 2)), CAST(180.00 AS Decimal(14, 2)), CAST(195.00 AS Decimal(14, 2)), CAST(1415.00 AS Decimal(14, 2)))
SET IDENTITY_INSERT [dbo].[Invoice] OFF
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ABW', N'Aruba')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'AFG', N'Afganistán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'AGO', N'Angola')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'AIA', N'Anguila')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ALA', N'Islas de Åland')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ALB', N'Albania')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'AND', N'Andorra')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ANT', N'Antillas Neerlandesas')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ARE', N'Emiratos Árabes Unidos')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ARG', N'Argentina')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ARM', N'Armenia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ASM', N'Samoa Americana')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ATA', N'Antártida')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ATF', N'Territorios Australes y Antárticas Franceses')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ATG', N'Antigua y Barbuda')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'AUS', N'Australia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'AUT', N'Austria')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'AZE', N'Azerbayán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BDI', N'Burundi')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BEL', N'Bélgica')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BEN', N'Benín')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BFA', N'Burkina Faso')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BGD', N'Bangladesh')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BGR', N'Bulgaria')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BHR', N'Bahrein')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BHS', N'Bahamas')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BIH', N'Bosnia y Herzegovina')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BLM', N'San Bartolomé')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BLR', N'Bielorrusia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BLZ', N'Belice')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BMU', N'Islas Bermudas')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BOL', N'Bolivia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BRA', N'Brasil')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BRB', N'Barbados')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BRN', N'Brunéi')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BTN', N'Bhután')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BVT', N'Isla Bouvet')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'BWA', N'Botsuana')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CAF', N'República Centroafricana')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CAN', N'Canadá')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CCK', N'Islas Cocos (Keeling)')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CHE', N'Suiza')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CHL', N'Chile')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CHN', N'China')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CIV', N'Costa de Marfil')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CMR', N'Camerún')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'COD', N'Congo')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'COG', N'Congo')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'COK', N'Islas Cook')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'COL', N'Colombia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'COM', N'Comoras')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CPV', N'Cabo Verde')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CRI', N'Costa Rica')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CUB', N'Cuba')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CXR', N'Isla de Navidad')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CYM', N'Islas Caimán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CYP', N'Chipre')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'CZE', N'República Checa')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'DEU', N'Alemania')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'DJI', N'Yibuti')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'DMA', N'Dominica')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'DNK', N'Dinamarca')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'DOM', N'República Dominicana')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'DZA', N'Algeria')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ECU', N'Ecuador')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'EGY', N'Egipto')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ERI', N'Eritrea')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ESH', N'Sahara Occidental')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ESP', N'España')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'EST', N'Estonia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ETH', N'Etiopía')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'FIN', N'Finlandia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'FJI', N'Fiyi')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'FLK', N'Islas Malvinas')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'FRA', N'Francia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'FRO', N'Islas Feroe')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'FSM', N'Micronesia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GAB', N'Gabón')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GBR', N'Reino Unido')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GEO', N'Georgia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GGY', N'Guernsey')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GHA', N'Ghana')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GIB', N'Gibraltar')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GIN', N'Guinea')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GLP', N'Guadalupe')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GMB', N'Gambia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GNB', N'Guinea-Bissau')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GNQ', N'Guinea Ecuatorial')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GRC', N'Grecia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GRD', N'Granada')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GRL', N'Groenlandia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GTM', N'Guatemala')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GUF', N'Guayana Francesa')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GUM', N'Guam')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'GUY', N'Guyana')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'HKG', N'Hong kong')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'HMD', N'Islas Heard y McDonald')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'HND', N'Honduras')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'HRV', N'Croacia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'HTI', N'Haití')
GO
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'HUN', N'Hungría')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'IDN', N'Indonesia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'IMN', N'Isla de Man')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'IND', N'India')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'IOT', N'Territorio Británico del Océano Índico')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'IRL', N'Irlanda')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'IRN', N'Irán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'IRQ', N'Irak')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ISL', N'Islandia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ISR', N'Israel')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ITA', N'Italia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'JAM', N'Jamaica')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'JEY', N'Jersey')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'JOR', N'Jordania')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'JPN', N'Japón')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'KAZ', N'Kazajistán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'KEN', N'Kenia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'KGZ', N'Kirgizstán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'KHM', N'Camboya')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'KIR', N'Kiribati')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'KNA', N'San Cristóbal y Nieves')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'KOR', N'Corea del Sur')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'KWT', N'Kuwait')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LAO', N'Laos')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LBN', N'Líbano')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LBR', N'Liberia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LBY', N'Libia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LCA', N'Santa Lucía')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LIE', N'Liechtenstein')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LKA', N'Sri lanka')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LSO', N'Lesoto')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LTU', N'Lituania')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LUX', N'Luxemburgo')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'LVA', N'Letonia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MAC', N'Macao')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MAF', N'San Martín (Francia)')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MAR', N'Marruecos')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MCO', N'Mónaco')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MDA', N'Moldavia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MDG', N'Madagascar')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MDV', N'Islas Maldivas')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MEX', N'México ')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MHL', N'Islas Marshall')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MKD', N'Macedônia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MLI', N'Mali')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MLT', N'Malta')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MMR', N'Birmania')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MNE', N'Montenegro')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MNG', N'Mongolia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MNP', N'Islas Marianas del Norte')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MOZ', N'Mozambique')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MRT', N'Mauritania')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MSR', N'Montserrat')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MTQ', N'Martinica')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MUS', N'Mauricio')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MWI', N'Malawi')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MYS', N'Malasia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'MYT', N'Mayotte')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NAM', N'Namibia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NAN', N'No Registrado')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NCL', N'Nueva Caledonia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NER', N'Niger')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NFK', N'Isla Norfolk')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NGA', N'Nigeria')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NIC', N'Nicaragua')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NIU', N'Niue')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NLD', N'Países Bajos')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NOR', N'Noruega')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NPL', N'Nepal')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NRU', N'Nauru')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'NZL', N'Nueva Zelanda')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'OMN', N'Omán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PAK', N'Pakistán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PAN', N'Panamá')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PCN', N'Islas Pitcairn')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PER', N'Perú')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PHL', N'Filipinas')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PLW', N'Palau')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PNG', N'Papúa Nueva Guinea')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'POL', N'Polonia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PRI', N'Puerto Rico')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PRK', N'Corea Del Norte')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PRT', N'Portugal')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PRY', N'Paraguay')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PSE', N'Palestina')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'PYF', N'Polinesia Francesa')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'QAT', N'Qatar')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'REU', N'Reunión')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ROU', N'Rumanía')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'RUS', N'Rusia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'RWA', N'Ruanda')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SAU', N'Arabia Saudita')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SDN', N'Sudán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SEN', N'Senegal')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SGP', N'Singapur')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SGS', N'Islas Georgias del Sur y Sandwich del Sur')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SHN', N'Santa Elena')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SJM', N'Svalbard y Jan Mayen')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SLB', N'Islas Salomón')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SLE', N'Sierra Leona')
GO
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SLV', N'El Salvador')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SMR', N'San Marino')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SOM', N'Somalia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SPM', N'San Pedro y Miquelón')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SRB', N'Serbia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'STP', N'Santo Tomé y Príncipe')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SUR', N'Surinám')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SVK', N'Eslovaquia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SVN', N'Eslovenia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SWE', N'Suecia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SWZ', N'Swazilandia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SYC', N'Seychelles')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'SYR', N'Siria')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TCA', N'Islas Turcas y Caicos')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TCD', N'Chad')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TGO', N'Togo')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'THA', N'Tailandia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TJK', N'Tadjikistán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TKL', N'Tokelau')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TKM', N'Turkmenistán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TLS', N'Timor Oriental')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TON', N'Tonga')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TTO', N'Trinidad y Tobago')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TUN', N'Tunez')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TUR', N'Turquía')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TUV', N'Tuvalu')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TWN', N'Taiwán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'TZA', N'Tanzania')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'UGA', N'Uganda')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'UKR', N'Ucrania')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'UMI', N'Islas Ultramarinas Menores de Estados Unidos')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'URY', N'Uruguay')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'USA', N'Estados Unidos de América')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'UZB', N'Uzbekistán')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'VAT', N'Ciudad del Vaticano')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'VCT', N'San Vicente y las Granadinas')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'VEN', N'Venezuela')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'VG', N'Islas Vírgenes Británicas')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'VIR', N'Islas Vírgenes de los Estados Unidos')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'VNM', N'Vietnam')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'VUT', N'Vanuatu')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'WLF', N'Wallis y Futuna')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'WSM', N'Samoa')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'YEM', N'Yemen')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ZAF', N'Sudáfrica')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ZMB', N'Zambia')
INSERT [dbo].[PlaceOfOrigin] ([placeOfOrigin], [country]) VALUES (N'ZWE', N'Zimbabue')
SET IDENTITY_INSERT [dbo].[Promo] ON 

INSERT [dbo].[Promo] ([promoID], [promoName], [description], [startDate], [endDate]) VALUES (1, N'Buen Fin', N'Fin de semana mas barato del año', CAST(N'2020-11-19' AS Date), CAST(N'2020-11-23' AS Date))
INSERT [dbo].[Promo] ([promoID], [promoName], [description], [startDate], [endDate]) VALUES (2, N'Año nuevo', N'Fin de año e inicio de otro', CAST(N'2020-12-31' AS Date), CAST(N'2021-01-02' AS Date))
INSERT [dbo].[Promo] ([promoID], [promoName], [description], [startDate], [endDate]) VALUES (1002, N'San Valentín', N'Fecha de febrero', CAST(N'2020-02-14' AS Date), CAST(N'2020-02-14' AS Date))
INSERT [dbo].[Promo] ([promoID], [promoName], [description], [startDate], [endDate]) VALUES (1003, N'Navidad', N'Dia de navidad', CAST(N'2020-12-24' AS Date), CAST(N'2020-12-25' AS Date))
INSERT [dbo].[Promo] ([promoID], [promoName], [description], [startDate], [endDate]) VALUES (1004, N'Semana santa 2020', N'Vacaciones de dos semanas', CAST(N'2020-04-05' AS Date), CAST(N'2020-04-18' AS Date))
INSERT [dbo].[Promo] ([promoID], [promoName], [description], [startDate], [endDate]) VALUES (1005, N'Revolucion mexicana', N'Fin de semana dado por el inicio de revolución mexicana', CAST(N'2020-11-13' AS Date), CAST(N'2020-11-15' AS Date))
INSERT [dbo].[Promo] ([promoID], [promoName], [description], [startDate], [endDate]) VALUES (1006, N'Independencia Mexicana', N'Fin de semana dado por el inicio de la independencia', CAST(N'2021-09-17' AS Date), CAST(N'2021-09-20' AS Date))
INSERT [dbo].[Promo] ([promoID], [promoName], [description], [startDate], [endDate]) VALUES (1007, N'Independencia Estados Unidos', N'Fin de semana del dia de la independencia de los EUA', CAST(N'2021-07-02' AS Date), CAST(N'2021-07-05' AS Date))
SET IDENTITY_INSERT [dbo].[Promo] OFF
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (1, 1, 1, CAST(N'2020-12-11T00:00:00.000' AS DateTime), CAST(N'2020-12-14T00:00:00.000' AS DateTime), 3, 3, 1002, 2, 1)
INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (2, 1, 2, CAST(N'2020-12-14T00:00:00.000' AS DateTime), CAST(N'2020-12-31T00:00:00.000' AS DateTime), 5, 2, 2, 1, 1)
INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (3, 1, 3, CAST(N'2020-12-14T00:00:00.000' AS DateTime), CAST(N'2020-12-17T00:00:00.000' AS DateTime), 4, 1, 1, 2, 2)
INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (4, 1, 4, CAST(N'2020-12-14T00:00:00.000' AS DateTime), CAST(N'2020-12-17T00:00:00.000' AS DateTime), 1, 3, 1, 1, 1)
INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (5, 1, 5, CAST(N'2020-12-14T00:00:00.000' AS DateTime), CAST(N'2020-12-18T00:00:00.000' AS DateTime), 6, 2, 2, NULL, NULL)
INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (2005, 1002, 1, CAST(N'2021-01-04T00:00:00.000' AS DateTime), CAST(N'2021-01-06T00:00:00.000' AS DateTime), 1, 1, 1, 1, 1)
INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (2008, 1, 1, CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(N'2021-01-09T00:00:00.000' AS DateTime), 6, 2, 1, 2, 1)
INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (2009, 2, 7, CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(N'2021-01-16T00:00:00.000' AS DateTime), 3, 4, 1, 2, 1)
INSERT [dbo].[Reservation] ([reservationID], [guestID], [roomID], [startDate], [endDate], [reservationStatusID], [reservedFromID], [employeeID], [roomPackageID], [roomPromoID]) VALUES (2010, 2, 1, CAST(N'2021-01-05T00:00:00.000' AS DateTime), CAST(N'2021-01-09T00:00:00.000' AS DateTime), 3, 1, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
SET IDENTITY_INSERT [dbo].[ReservationComplaint] ON 

INSERT [dbo].[ReservationComplaint] ([complaintID], [reservationID], [comment], [dateComplaint], [departamentID]) VALUES (1, 1, N'se tardaron en atender', CAST(N'2020-12-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ReservationComplaint] ([complaintID], [reservationID], [comment], [dateComplaint], [departamentID]) VALUES (2, 2, N'no se llevaron mis maletas al cuarto', CAST(N'2020-12-23T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[ReservationComplaint] ([complaintID], [reservationID], [comment], [dateComplaint], [departamentID]) VALUES (3, 3, N'encontre una radio vieja con muchos cables', CAST(N'2020-12-17T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[ReservationComplaint] ([complaintID], [reservationID], [comment], [dateComplaint], [departamentID]) VALUES (9, 4, N'deberian', CAST(N'2020-12-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ReservationComplaint] ([complaintID], [reservationID], [comment], [dateComplaint], [departamentID]) VALUES (10, 5, N'funciono!', CAST(N'2020-12-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ReservationComplaint] ([complaintID], [reservationID], [comment], [dateComplaint], [departamentID]) VALUES (11, 1, N'funciono!', CAST(N'2020-12-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[ReservationComplaint] ([complaintID], [reservationID], [comment], [dateComplaint], [departamentID]) VALUES (1011, 2, N'funciono!', CAST(N'2021-01-05T15:53:20.413' AS DateTime), 1)
INSERT [dbo].[ReservationComplaint] ([complaintID], [reservationID], [comment], [dateComplaint], [departamentID]) VALUES (1012, 2005, N'no esta limpia la habitación', CAST(N'2021-01-05T15:56:39.717' AS DateTime), 3)
SET IDENTITY_INSERT [dbo].[ReservationComplaint] OFF
SET IDENTITY_INSERT [dbo].[ReservationReview] ON 

INSERT [dbo].[ReservationReview] ([reviewID], [reviewRoom], [dateReview], [reservationID], [departamentID]) VALUES (1, 4, CAST(N'2021-01-02T23:00:13.723' AS DateTime), 1, 1)
INSERT [dbo].[ReservationReview] ([reviewID], [reviewRoom], [dateReview], [reservationID], [departamentID]) VALUES (2, 3, CAST(N'2021-01-02T23:03:24.063' AS DateTime), 2, 2)
INSERT [dbo].[ReservationReview] ([reviewID], [reviewRoom], [dateReview], [reservationID], [departamentID]) VALUES (3, 5, CAST(N'2021-01-02T23:03:38.567' AS DateTime), 2, 3)
INSERT [dbo].[ReservationReview] ([reviewID], [reviewRoom], [dateReview], [reservationID], [departamentID]) VALUES (4, 2, CAST(N'2021-01-02T23:03:47.563' AS DateTime), 2, 1)
SET IDENTITY_INSERT [dbo].[ReservationReview] OFF
SET IDENTITY_INSERT [dbo].[ReservationStatus] ON 

INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (1, N'En proceso')
INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (2, N'En proceso de pago')
INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (3, N'Pagado')
INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (4, N'Con retraso')
INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (5, N'Cancelado')
INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (6, N'Realizo Check in')
INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (7, N'Realizo Check out')
INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (8, N'Realizo Check out anticipadamente')
INSERT [dbo].[ReservationStatus] ([reservationStatusID], [status]) VALUES (1002, N'Desconocido')
SET IDENTITY_INSERT [dbo].[ReservationStatus] OFF
SET IDENTITY_INSERT [dbo].[ReservedFrom] ON 

INSERT [dbo].[ReservedFrom] ([reservedFromID], [reservationMethod]) VALUES (1, N'En línea ')
INSERT [dbo].[ReservedFrom] ([reservedFromID], [reservationMethod]) VALUES (2, N'Por teléfono')
INSERT [dbo].[ReservedFrom] ([reservedFromID], [reservationMethod]) VALUES (3, N'En mostrador')
INSERT [dbo].[ReservedFrom] ([reservedFromID], [reservationMethod]) VALUES (4, N'Por reservación en línea externa')
INSERT [dbo].[ReservedFrom] ([reservedFromID], [reservationMethod]) VALUES (5, N'Por agencia de viajes')
INSERT [dbo].[ReservedFrom] ([reservedFromID], [reservationMethod]) VALUES (1002, N'Por aplicación')
SET IDENTITY_INSERT [dbo].[ReservedFrom] OFF
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (2, 2, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (3, 3, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (4, 4, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (5, 5, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (6, 6, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (7, 7, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (8, 8, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (9, 9, 1, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (10, 10, 2, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (11, 11, 2, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (12, 12, 2, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (13, 13, 3, 5)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (14, 14, 3, 1)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (15, 15, 3, 3)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (16, 16, 4, 4)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (17, 17, 4, 2)
INSERT [dbo].[Room] ([roomID], [roomNumber], [roomTypeID], [roomStatusID]) VALUES (18, 18, 5, 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
SET IDENTITY_INSERT [dbo].[RoomAmenity] ON 

INSERT [dbo].[RoomAmenity] ([amenityID], [reservationID], [serviceID], [date]) VALUES (1, 1, 1, CAST(N'2020-12-31T12:00:00.000' AS DateTime))
INSERT [dbo].[RoomAmenity] ([amenityID], [reservationID], [serviceID], [date]) VALUES (2, 1, 2, CAST(N'2020-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[RoomAmenity] ([amenityID], [reservationID], [serviceID], [date]) VALUES (4, 2005, 4, CAST(N'2021-01-05T05:03:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[RoomAmenity] OFF
SET IDENTITY_INSERT [dbo].[RoomPackage] ON 

INSERT [dbo].[RoomPackage] ([roomPackageID], [namePackage], [price], [roomTypeID], [frequency]) VALUES (1, N'paquete 1', CAST(200.00 AS Decimal(14, 2)), 1, 8)
INSERT [dbo].[RoomPackage] ([roomPackageID], [namePackage], [price], [roomTypeID], [frequency]) VALUES (2, N'paquete 2', CAST(300.00 AS Decimal(14, 2)), 1, 7)
INSERT [dbo].[RoomPackage] ([roomPackageID], [namePackage], [price], [roomTypeID], [frequency]) VALUES (3, N'paquete 3', CAST(400.00 AS Decimal(14, 2)), 1, 0)
INSERT [dbo].[RoomPackage] ([roomPackageID], [namePackage], [price], [roomTypeID], [frequency]) VALUES (4, N'paquete 4', CAST(150.00 AS Decimal(14, 2)), 1, 0)
INSERT [dbo].[RoomPackage] ([roomPackageID], [namePackage], [price], [roomTypeID], [frequency]) VALUES (5, N'paquete 6', CAST(100.50 AS Decimal(14, 2)), 2, 0)
SET IDENTITY_INSERT [dbo].[RoomPackage] OFF
SET IDENTITY_INSERT [dbo].[RoomPromo] ON 

INSERT [dbo].[RoomPromo] ([roomPromoID], [promoID], [roomTypeID], [discount]) VALUES (1, 2, 1, 15)
INSERT [dbo].[RoomPromo] ([roomPromoID], [promoID], [roomTypeID], [discount]) VALUES (2, 2, 2, 25)
INSERT [dbo].[RoomPromo] ([roomPromoID], [promoID], [roomTypeID], [discount]) VALUES (3, 2, 5, 30)
INSERT [dbo].[RoomPromo] ([roomPromoID], [promoID], [roomTypeID], [discount]) VALUES (4, 1003, 1, 5)
SET IDENTITY_INSERT [dbo].[RoomPromo] OFF
SET IDENTITY_INSERT [dbo].[RoomServicePackage] ON 

INSERT [dbo].[RoomServicePackage] ([roomServicePackageID], [roomPackageID], [serviceID]) VALUES (1, 1, 1)
INSERT [dbo].[RoomServicePackage] ([roomServicePackageID], [roomPackageID], [serviceID]) VALUES (2, 3, 1003)
SET IDENTITY_INSERT [dbo].[RoomServicePackage] OFF
SET IDENTITY_INSERT [dbo].[RoomStatus] ON 

INSERT [dbo].[RoomStatus] ([roomStatusID], [statusName]) VALUES (1, N'Limpio')
INSERT [dbo].[RoomStatus] ([roomStatusID], [statusName]) VALUES (2, N'Desalojado')
INSERT [dbo].[RoomStatus] ([roomStatusID], [statusName]) VALUES (3, N'En uso')
INSERT [dbo].[RoomStatus] ([roomStatusID], [statusName]) VALUES (4, N'Mantenimiento')
INSERT [dbo].[RoomStatus] ([roomStatusID], [statusName]) VALUES (5, N'Deshabilitado')
INSERT [dbo].[RoomStatus] ([roomStatusID], [statusName]) VALUES (1002, N'En construcción')
SET IDENTITY_INSERT [dbo].[RoomStatus] OFF
SET IDENTITY_INSERT [dbo].[RoomType] ON 

INSERT [dbo].[RoomType] ([roomTypeID], [typeName], [price], [capacity]) VALUES (1, N'Sencilla', CAST(300.00 AS Decimal(14, 2)), 2)
INSERT [dbo].[RoomType] ([roomTypeID], [typeName], [price], [capacity]) VALUES (2, N'Doble', CAST(400.00 AS Decimal(14, 2)), 4)
INSERT [dbo].[RoomType] ([roomTypeID], [typeName], [price], [capacity]) VALUES (3, N'Doble con sencilla', CAST(600.00 AS Decimal(14, 2)), 6)
INSERT [dbo].[RoomType] ([roomTypeID], [typeName], [price], [capacity]) VALUES (4, N'Suite', CAST(800.00 AS Decimal(14, 2)), 6)
INSERT [dbo].[RoomType] ([roomTypeID], [typeName], [price], [capacity]) VALUES (5, N'Penhouse', CAST(10000.00 AS Decimal(14, 2)), 8)
INSERT [dbo].[RoomType] ([roomTypeID], [typeName], [price], [capacity]) VALUES (1002, N'Colchoneta', CAST(100.00 AS Decimal(14, 2)), 2)
SET IDENTITY_INSERT [dbo].[RoomType] OFF
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([serviceID], [serviceTypeID], [name], [price]) VALUES (1, 2, N'Paseo al Zoológico', CAST(1200.00 AS Decimal(14, 2)))
INSERT [dbo].[Service] ([serviceID], [serviceTypeID], [name], [price]) VALUES (2, 2, N'Paseo al Taller Mecánico', CAST(600.00 AS Decimal(14, 2)))
INSERT [dbo].[Service] ([serviceID], [serviceTypeID], [name], [price]) VALUES (3, 1, N'Psicina', CAST(150.00 AS Decimal(14, 2)))
INSERT [dbo].[Service] ([serviceID], [serviceTypeID], [name], [price]) VALUES (4, 1, N'Sala de conferencias', CAST(750.00 AS Decimal(14, 2)))
INSERT [dbo].[Service] ([serviceID], [serviceTypeID], [name], [price]) VALUES (5, 1, N'Uso de computadoras', CAST(100.00 AS Decimal(14, 2)))
INSERT [dbo].[Service] ([serviceID], [serviceTypeID], [name], [price]) VALUES (6, 2, N'Visita a la frontera', CAST(2000.00 AS Decimal(14, 2)))
INSERT [dbo].[Service] ([serviceID], [serviceTypeID], [name], [price]) VALUES (7, 1, N'Desayuno', CAST(700.00 AS Decimal(14, 2)))
INSERT [dbo].[Service] ([serviceID], [serviceTypeID], [name], [price]) VALUES (1003, 2, N'Cine', CAST(199.99 AS Decimal(14, 2)))
SET IDENTITY_INSERT [dbo].[Service] OFF
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([serviceTypeID], [serviceType]) VALUES (1, N'Interno')
INSERT [dbo].[ServiceType] ([serviceTypeID], [serviceType]) VALUES (2, N'Externo')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
SET IDENTITY_INSERT [dbo].[State] ON 

INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1, N'Aguascalientes', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (2, N'Baja California', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1003, N'Baja California Sur', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1004, N'Campeche', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1005, N'Chiapas', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1006, N'Chihuahua', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1007, N'Ciudad De México', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1008, N'Coahuila', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1009, N'Colima', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1010, N'Durango', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1011, N'Guanajuato', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1012, N'Guerrero', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1013, N'Hidalgo', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1014, N'Jalisco', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1015, N'Estado de México', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1016, N'Michoacán', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1017, N'Morelos', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1018, N'Nayarit', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1019, N'Nuevo León', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1020, N'Oaxaca', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1021, N'Puebla', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1022, N'Querétaro', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1023, N'Quintana Roo', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1024, N'San Luis Potosí', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1025, N'Sinaloa', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1026, N'Sonora', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1027, N'Tabasco', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1028, N'Tamaulipas', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1029, N'Tlaxcala', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1030, N'Veracruz', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1031, N'Yucatán', N'MEX')
INSERT [dbo].[State] ([stateID], [state], [placeOfOrigin]) VALUES (1032, N'Zacatecas', N'MEX')
SET IDENTITY_INSERT [dbo].[State] OFF
SET IDENTITY_INSERT [dbo].[TypeOfBonification] ON 

INSERT [dbo].[TypeOfBonification] ([typeOfBonificationID], [daysLodging], [bonus]) VALUES (1, 3, CAST(380.00 AS Decimal(12, 2)))
INSERT [dbo].[TypeOfBonification] ([typeOfBonificationID], [daysLodging], [bonus]) VALUES (2, 5, CAST(500.00 AS Decimal(12, 2)))
INSERT [dbo].[TypeOfBonification] ([typeOfBonificationID], [daysLodging], [bonus]) VALUES (3, 10, CAST(1500.00 AS Decimal(12, 2)))
INSERT [dbo].[TypeOfBonification] ([typeOfBonificationID], [daysLodging], [bonus]) VALUES (1002, 14, CAST(2000.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[TypeOfBonification] OFF
ALTER TABLE [dbo].[Bonification] ADD  CONSTRAINT [DF_Bonification_date]  DEFAULT (getdate()) FOR [date]
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
ALTER TABLE [dbo].[ReservationComplaint]  WITH CHECK ADD  CONSTRAINT [FK_ReservationComplaint_Reservation1] FOREIGN KEY([reservationID])
REFERENCES [dbo].[Reservation] ([reservationID])
GO
ALTER TABLE [dbo].[ReservationComplaint] CHECK CONSTRAINT [FK_ReservationComplaint_Reservation1]
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
/****** Object:  StoredProcedure [dbo].[busqueda_reporte10]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[busqueda_reporte10]
	@inicio date,
	@final date
AS
BEGIN
	SET NOCOUNT ON;

    SELECT [dateComplaint]
      ,[comment]
      ,[type]
  FROM [proyecto_hotel].[dbo].[reporte10]
  where dateComplaint between @inicio and @final
  order by type,dateComplaint
END
GO
/****** Object:  StoredProcedure [dbo].[busqueda_reporte11]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[busqueda_reporte11]
	@inicio datetime,
	@fin datetime
AS
BEGIN
	SET NOCOUNT ON;
SELECT        reservationMethod, SUM(ISNULL(precio_paquete, precio_cuarto) * (1 - ISNULL(descuento, 0) / 100)) AS ganancia
FROM            dbo.consulta11
WHERE        (startDate BETWEEN @inicio AND @fin)
GROUP BY reservationMethod
END
GO
/****** Object:  StoredProcedure [dbo].[busqueda_reporte12]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[busqueda_reporte12]
	@inicio datetime,
	@fin datetime
AS
BEGIN
	SELECT        avg(calificacion) AS promedio, departamento
FROM            dbo.consulta12
where fecha between @inicio and @fin
group by departamento
order by promedio desc
END
GO
/****** Object:  StoredProcedure [dbo].[busqueda_reporte3]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[busqueda_reporte3]
@inicio datetime,
@final datetime
AS
BEGIN
	SELECT [promoName]
      ,[conteo]
      ,[startDate]
      ,[endDate]
  FROM [proyecto_hotel].[dbo].[reporte3]
  where startDate between @inicio and @final 
END
GO
/****** Object:  StoredProcedure [dbo].[busqueda_reporte4]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[busqueda_reporte4]
	@inicio datetime,
	@fin datetime
AS
BEGIN
	SET NOCOUNT ON;
 SELECT TOP (1) [reservationID]
      ,[startDate]
      ,[endDate]
      ,[diff]
  FROM [proyecto_hotel].[dbo].[reporte5]
  where startDate between @inicio and @fin
  order by diff desc
END
GO
/****** Object:  StoredProcedure [dbo].[busqueda_reporte5]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[busqueda_reporte5]
	@inicio datetime,
	@final datetime
AS
BEGIN
	SET NOCOUNT ON;
	SELECT TOP (1) [reservationID]
      ,[startDate]
      ,[endDate]
      ,[diff]
  FROM [proyecto_hotel].[dbo].[reporte5]
  where startDate between @inicio and @final
  order by diff desc
END
GO
/****** Object:  StoredProcedure [dbo].[busqueda_reporte7]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[busqueda_reporte7]
	@inicio datetime,
	@final datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT top 1 [bonificationID]
      ,[employeeID]
      ,[typeOfBonificationID]
      ,[date]
  FROM [proyecto_hotel].[dbo].[Bonification]
  where date between @inicio and @final
  order by typeOfBonificationID desc
END
GO
/****** Object:  StoredProcedure [dbo].[busqueda_reporte8]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[busqueda_reporte8]
	@inicio datetime,
	@fin datetime
AS
BEGIN
	SET NOCOUNT ON;

   SELECT [inicio]
      ,[fin]
      ,[precio]
      ,[nombre]
  FROM [proyecto_hotel].[dbo].[consulta8]
  where inicio  between @inicio and @fin
END
GO
/****** Object:  StoredProcedure [dbo].[busqueda_reporte9]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[busqueda_reporte9]
	@inicio date,
	@fin date
AS
BEGIN
SELECT 
      sum([precio])as ganancia
      ,[nombre]
  FROM [proyecto_hotel].[dbo].[consulta8]
  where inicio between @inicio and @fin
  group by nombre
END
GO
/****** Object:  StoredProcedure [dbo].[tipo_compra]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[tipo_compra]

AS
BEGIN
select reservationMethod as metodo,count(ReservedFrom.reservedFromID)as conteo from Reservation inner join ReservedFrom on Reservation.reservedFromID = ReservedFrom.reservedFromID group by ReservedFrom.reservationMethod;
END
GO
/****** Object:  Trigger [dbo].[TRG_RESERVATION_BI01]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ROOM PACKAGE SUGGESTION INSERT TRIGGER
CREATE   TRIGGER [dbo].[TRG_RESERVATION_BI01]
ON [dbo].[Reservation]
FOR INSERT
AS
BEGIN
	DECLARE @newRoomPackage INT;

	SET @newRoomPackage = (SELECT ISNULL(roomPackageID, 0) FROM inserted);

	UPDATE RoomPackage
	SET frequency = frequency + 1
	WHERE roomPackageID = @newRoomPackage;
END;
GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TRG_RESERVATION_BI01]
GO
/****** Object:  Trigger [dbo].[TRG_RESERVATION_BI02]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EMPLOYEE BONIFICATION
CREATE   TRIGGER [dbo].[TRG_RESERVATION_BI02]
ON [dbo].[Reservation]
FOR INSERT
AS
BEGIN
	DECLARE @days INT;
	DECLARE @employeeID INT;

	SET @days = (SELECT DATEDIFF(DAY,startDate,endDate) FROM inserted);
	SET @employeeID = (SELECT employeeID FROM inserted);

	INSERT INTO Bonification(employeeID, typeOfBonificationID)
	SELECT @employeeID, T.typeOfBonificationID
	FROM (
		SELECT TOP (1)
			typeOfBonificationID AS typeOfBonificationID, 
			daysLodging AS maxDaysLodging
		FROM TypeOfBonification
		WHERE @days >= daysLodging
		ORDER BY daysLodging DESC
	) T;
END;
GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TRG_RESERVATION_BI02]
GO
/****** Object:  Trigger [dbo].[TRG_RESERVATION_BU01]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[TRG_RESERVATION_BU01]
ON [dbo].[Reservation]
FOR UPDATE
AS
BEGIN
	DECLARE @cancelledStatus INT = 5;

	DECLARE @days INT;
	DECLARE @employeeID INT;

	SET @days = (SELECT DATEDIFF(DAY,startDate,endDate ) FROM deleted);
	SET @employeeID = (SELECT employeeID FROM deleted);

	IF EXISTS(
		SELECT *
		FROM inserted i
		JOIN deleted d 
		ON i.reservationID = d.reservationID
		WHERE d.reservationStatusID != @cancelledStatus 
			AND i.reservationStatusID = @cancelledStatus
	)
	BEGIN
		DELETE Bonification
		WHERE bonificationID = (
			SELECT TOP 1 bonificationID
			FROM Bonification B
			JOIN (
				SELECT TOP 1 
					typeOfBonificationID AS typeOfBonificationID, 
				 daysLodging AS maxDaysLodging
				FROM TypeOfBonification
				WHERE @days >= daysLodging
				ORDER BY daysLodging DESC
			) T
			ON B.typeOfBonificationID = T.typeOfBonificationID
			WHERE employeeId = @employeeID ORDER BY B.date
		);
	END;
END;
GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TRG_RESERVATION_BU01]
GO
/****** Object:  Trigger [dbo].[TRG_RESERVATION_BU02]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[TRG_RESERVATION_BU02]
ON [dbo].[Reservation]
FOR UPDATE
AS
BEGIN
	DECLARE @oldRoomPackage INT;
	DECLARE @newRoomPackage INT;

	SET @oldRoomPackage = (SELECT ISNULL(roomPackageID, 0) FROM deleted);
	SET @newRoomPackage = (SELECT ISNULL(roomPackageID, 0) FROM inserted);

	IF @oldRoomPackage = 0 AND @newRoomPackage > 0
	BEGIN
		UPDATE RoomPackage
		SET frequency = frequency + 1
		WHERE roomPackageID = @newRoomPackage;
	END
	ELSE IF @oldRoomPackage > 0 AND @newRoomPackage = 0
	BEGIN
		UPDATE RoomPackage
		SET frequency = frequency - 1
		WHERE roomPackageID = @oldRoomPackage;
	END
	ELSE IF @oldRoomPackage > 0 AND @newRoomPackage > 0 AND @oldRoomPackage != @newRoomPackage
	BEGIN
		UPDATE RoomPackage
		SET frequency = frequency - 1
		WHERE roomPackageID = @oldRoomPackage;

		UPDATE RoomPackage
		SET frequency = frequency + 1
		WHERE roomPackageID = @newRoomPackage;
	END;
END;
GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TRG_RESERVATION_BU02]
GO
/****** Object:  Trigger [dbo].[TRG_RESERVATION_BU03]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[TRG_RESERVATION_BU03]
ON [dbo].[Reservation]
FOR UPDATE
AS
BEGIN
	DECLARE @oldDays INT;
	DECLARE @oldEmployeeID INT;

	DECLARE @newDays INT;
	DECLARE @newEmployeeID INT;
	
	SET @oldDays = (SELECT DATEDIFF(DAY,startDate ,endDate ) FROM deleted);
	SET @oldEmployeeID = (SELECT employeeID FROM deleted);

	SET @newDays = (SELECT DATEDIFF(DAY,startDate ,endDate ) FROM inserted);
	SET @newEmployeeID = (SELECT employeeID FROM inserted);

	IF @oldDays != @newDays OR @oldEmployeeID != @newEmployeeID
	BEGIN
		DELETE Bonification
		WHERE bonificationID = (
			SELECT TOP 1 bonificationID
			FROM Bonification B
			JOIN (
				SELECT TOP(1)
					typeOfBonificationID AS typeOfBonificationID, 
					daysLodging AS maxDaysLodging
				FROM TypeOfBonification
				WHERE @oldDays >= daysLodging
				ORDER BY daysLodging DESC
			) T
			ON B.typeOfBonificationID = T.typeOfBonificationID
			WHERE employeeId = @oldEmployeeID ORDER BY B.date
		);

		INSERT INTO Bonification(employeeID, typeOfBonificationID)
		SELECT @newEmployeeID, T.typeOfBonificationID
		FROM (
			SELECT TOP(1)
				typeOfBonificationID AS typeOfBonificationID, 
			daysLodging AS maxDaysLodging
			FROM TypeOfBonification
			WHERE @newDays >= daysLodging
			ORDER BY daysLodging DESC
		) T;
	END;
END;
GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TRG_RESERVATION_BU03]
GO
/****** Object:  Trigger [dbo].[TRG_RESERVATION_BU04]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- AUTOFILL INVOICE
CREATE   TRIGGER [dbo].[TRG_RESERVATION_BU04]
ON [dbo].[Reservation]
FOR INSERT, UPDATE
AS
BEGIN

	DECLARE @paidStatus INT;
	DECLARE @oldStatus  INT;
	DECLARE @newStatus  INT;

	SET @paidStatus = 3;

	SELECT @oldStatus = reservationStatusID
	FROM deleted;

	SELECT @newStatus = reservationStatusID
	FROM inserted;

	IF @oldStatus != @newStatus AND @newStatus = @paidStatus
	BEGIN
		DECLARE @reservationID INT;
		DECLARE @subtotal  DECIMAL;
		DECLARE @discount  DECIMAL;
		DECLARE @tax       DECIMAL;
		DECLARE @totalDue  DECIMAL;


		SELECT @reservationID = reservationID
		FROM inserted;

		SELECT
			@subtotal = (RT.price) * DATEDIFF(DAY, RE.startDate, RE.endDate),
			@discount = (RT.price) * DATEDIFF(DAY, RE.startDate, RE.endDate) * 
						(ISNULL(RP.discount, 0.0) / 100.0)
		FROM inserted RE
		JOIN Room RO
		ON RO.roomID = RE.roomID
		JOIN RoomType RT
		ON RT.roomTypeID = RO.roomTypeID
		LEFT JOIN RoomPromo RP
		ON RP.roomPromoID = RE.roomPromoID;


		SELECT
			@subtotal = ISNULL(@subtotal + SUM(SE.price), @subtotal)
		FROM inserted RE
		JOIN RoomAmenity RA	
		ON RA.reservationID = RE.reservationID
		JOIN [Service] SE
		ON SE.serviceID = RA.serviceID;


		SELECT
			@subtotal = @subtotal + ISNULL(RP.price, 0)
		FROM inserted RE
		LEFT JOIN RoomPackage RP
		ON RP.roomPackageID = RE.roomPackageID;


		SET @tax = (@subtotal - @discount) * 0.16;
		SET @totalDue = @subtotal - @discount + @tax;


		INSERT INTO Invoice(
			reservationID, 
			dateTime, 
			subtotal, 
			discount, 
			tax, 
			totalDue
		) 
		VALUES(
			@reservationID, 
			GETDATE(), 
			@subtotal, 
			@discount, 
			@tax, 
			@totalDue
		);

	END;

END;
GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TRG_RESERVATION_BU04]
GO
/****** Object:  Trigger [dbo].[TRG_RESERVATION_BU05]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- AUTOFILL ROOM STATUS
CREATE   TRIGGER [dbo].[TRG_RESERVATION_BU05]
ON [dbo].[Reservation]
FOR INSERT, UPDATE
AS
BEGIN

	DECLARE @roomId			INT;
	DECLARE @checkInStatus  INT;
	DECLARE @checkOutStatus INT;
	DECLARE @oldStatus		INT;
	DECLARE @newStatus		INT;
	DECLARE @notUsed		INT;
	DECLARE @used			INT;

	
	SET @notUsed = 2;
	SET @used = 3;
	SET @checkInStatus = 6;
	SET @checkOutStatus = 7;


	SELECT @oldStatus = RE.reservationStatusID
	FROM deleted RE
	JOIN Room RO
	ON RE.roomID = RO.roomID;
	
	SELECT 
		@newStatus = RE.reservationStatusID,
		@roomId = RE.roomId
	FROM inserted RE
	JOIN Room RO
	ON RE.roomID = RO.roomID;

	IF @oldStatus != @newStatus AND @newStatus = @checkInStatus
	BEGIN
		UPDATE Room
		SET roomStatusID = @used
		WHERE roomID = @roomId;
	END;
	
	IF @oldStatus != @newStatus AND @newStatus = @checkOutStatus
	BEGIN
		UPDATE Room
		SET roomStatusID = @notUsed
		WHERE roomID = @roomId;
	END;

END;
GO
ALTER TABLE [dbo].[Reservation] ENABLE TRIGGER [TRG_RESERVATION_BU05]
GO
/****** Object:  Trigger [dbo].[TRG_ROOMPACKAGE_BI01]    Script Date: 07/01/2021 11:23:55 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   TRIGGER [dbo].[TRG_ROOMPACKAGE_BI01]
ON [dbo].[RoomPackage]
FOR INSERT
AS
BEGIN
	DECLARE @roomPackageID INT;

	SET @roomPackageID = (SELECT ISNULL(roomPackageID, 0) FROM inserted);

	UPDATE RoomPackage
	SET frequency = 0
	WHERE roomPackageID = @roomPackageID;
END;
GO
ALTER TABLE [dbo].[RoomPackage] ENABLE TRIGGER [TRG_ROOMPACKAGE_BI01]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Room"
            Begin Extent = 
               Top = 5
               Left = 232
               Bottom = 135
               Right = 402
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomType"
            Begin Extent = 
               Top = 12
               Left = 0
               Bottom = 142
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomStatus"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 102
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3165
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[21] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Reservation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 215
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ReservedFrom"
            Begin Extent = 
               Top = 69
               Left = 350
               Bottom = 179
               Right = 539
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomPromo"
            Begin Extent = 
               Top = 284
               Left = 260
               Bottom = 414
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomPackage"
            Begin Extent = 
               Top = 193
               Left = 481
               Bottom = 342
               Right = 654
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room"
            Begin Extent = 
               Top = 6
               Left = 986
               Bottom = 136
               Right = 1156
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomType"
            Begin Extent = 
               Top = 177
               Left = 719
               Bottom = 307
               Right = 889
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Promo"
            Begin Extent = 
               Top = 354
               Left = 493
               Bottom = 484
               Right = 663
            End
            Dis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'playFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 5640
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ReservationReview"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 166
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Departament"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Reservation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 220
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GuestCompanion"
            Begin Extent = 
               Top = 4
               Left = 445
               Bottom = 172
               Right = 615
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 27
         Width = 284
         Width = 1500
         Width = 2160
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 2190
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[15] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'consulta8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Departament"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ReservationComplaint"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 181
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Reservation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 220
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomPromo"
            Begin Extent = 
               Top = 6
               Left = 266
               Bottom = 136
               Right = 436
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Promo"
            Begin Extent = 
               Top = 6
               Left = 474
               Bottom = 182
               Right = 644
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Room"
            Begin Extent = 
               Top = 30
               Left = 517
               Bottom = 160
               Right = 687
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomType"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomStatus"
            Begin Extent = 
               Top = 33
               Left = 786
               Bottom = 128
               Right = 956
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Reservation"
            Begin Extent = 
               Top = 6
               Left = 205
               Bottom = 220
               Right = 550
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Guest"
            Begin Extent = 
               Top = 16
               Left = 0
               Bottom = 146
               Right = 170
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Room"
            Begin Extent = 
               Top = 0
               Left = 634
               Bottom = 130
               Right = 804
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomStatus"
            Begin Extent = 
               Top = 13
               Left = 843
               Bottom = 109
               Right = 1013
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ReservedFrom"
            Begin Extent = 
               Top = 136
               Left = 632
               Bottom = 232
               Right = 821
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3495
         Alias = 900
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Table = 1170
         Output = 2085
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[14] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Departament"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 3900
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte6'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Reservation"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 217
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "RoomAmenity"
            Begin Extent = 
               Top = 0
               Left = 299
               Bottom = 152
               Right = 469
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Service"
            Begin Extent = 
               Top = 6
               Left = 581
               Bottom = 136
               Right = 751
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ServiceType"
            Begin Extent = 
               Top = 6
               Left = 789
               Bottom = 102
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte8'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'reporte8'
GO
USE [master]
GO
ALTER DATABASE [proyecto_hotel] SET  READ_WRITE 
GO
