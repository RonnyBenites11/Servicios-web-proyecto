USE [master]
GO
/****** Object:  Database [Migracion]    Script Date: 08/11/2022 23:01:09 ******/
CREATE DATABASE [Migracion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Migracion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Migracion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Migracion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Migracion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Migracion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Migracion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Migracion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Migracion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Migracion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Migracion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Migracion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Migracion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Migracion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Migracion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Migracion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Migracion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Migracion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Migracion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Migracion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Migracion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Migracion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Migracion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Migracion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Migracion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Migracion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Migracion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Migracion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Migracion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Migracion] SET RECOVERY FULL 
GO
ALTER DATABASE [Migracion] SET  MULTI_USER 
GO
ALTER DATABASE [Migracion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Migracion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Migracion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Migracion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Migracion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Migracion] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Migracion', N'ON'
GO
ALTER DATABASE [Migracion] SET QUERY_STORE = OFF
GO
USE [Migracion]
GO
/****** Object:  Schema [proyectodsw_202202_2]    Script Date: 08/11/2022 23:01:10 ******/
CREATE SCHEMA [proyectodsw_202202_2]
GO
/****** Object:  Table [dbo].[tb_asiento]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_asiento](
	[Cod_Asiento] [int] IDENTITY(1,1) NOT NULL,
	[Alias_Asiento] [nvarchar](20) NULL,
	[Cod_Bus] [int] NULL,
	[Cod_Tipo_Asiento] [int] NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_tb_asiento_Cod_Asiento] PRIMARY KEY CLUSTERED 
(
	[Cod_Asiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_bus]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_bus](
	[Cod_Bus] [int] IDENTITY(3,1) NOT NULL,
	[Registro] [nvarchar](100) NULL,
	[Cantidad_Asientos] [int] NULL,
	[Marca] [nvarchar](100) NULL,
	[Modelo] [nvarchar](100) NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_tb_bus_Cod_Bus] PRIMARY KEY CLUSTERED 
(
	[Cod_Bus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_cliente]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cliente](
	[id_cli] [int] IDENTITY(2,1) NOT NULL,
	[cod_cli] [int] NULL,
	[tipo] [int] NULL,
	[nombre] [nvarchar](30) NULL,
	[apellido] [nvarchar](30) NULL,
	[edad] [int] NULL,
	[Estado] [int] NULL,
	[tipogen] [int] NULL,
 CONSTRAINT [PK_tb_cliente_id_cli] PRIMARY KEY CLUSTERED 
(
	[id_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_departamento]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_departamento](
	[Cod_Departamento] [int] IDENTITY(26,1) NOT NULL,
	[Nombre_Departamento] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_departamento_Cod_Departamento] PRIMARY KEY CLUSTERED 
(
	[Cod_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_detalleventapasaje]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_detalleventapasaje](
	[Id_Venta] [int] NULL,
	[Cod_Viaje] [int] NULL,
	[id_cli] [int] NULL,
	[Cod_Asiento] [int] NULL,
	[Voucher] [nvarchar](20) NULL,
	[Costo_Ticket] [real] NULL,
	[Descuento] [real] NULL,
	[Sub_total] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_genero]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_genero](
	[id_genero] [int] IDENTITY(3,1) NOT NULL,
	[desc_gen] [nvarchar](20) NULL,
 CONSTRAINT [PK_tb_genero_id_genero] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_ruta]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ruta](
	[Cod_Ruta] [int] IDENTITY(5,1) NOT NULL,
	[Alias_Ruta] [nvarchar](100) NULL,
	[Tiempo_Promedio_Ruta] [bigint] NULL,
	[Cod_Terminal_Origen] [int] NULL,
	[Cod_Terminal_Destino] [int] NULL,
	[DistanciaKm] [real] NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_tb_ruta_Cod_Ruta] PRIMARY KEY CLUSTERED 
(
	[Cod_Ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_terminalterrestre]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_terminalterrestre](
	[Cod_Terminal] [int] IDENTITY(8,1) NOT NULL,
	[Nombre_Terminal] [nvarchar](100) NULL,
	[Cod_Departamento] [int] NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_tb_terminalterrestre_Cod_Terminal] PRIMARY KEY CLUSTERED 
(
	[Cod_Terminal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_tipoasiento]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_tipoasiento](
	[Cod_Tipo_Asiento] [int] NOT NULL,
	[Tipo_ASiento] [nvarchar](50) NULL,
 CONSTRAINT [PK_tb_tipoasiento_Cod_Tipo_Asiento] PRIMARY KEY CLUSTERED 
(
	[Cod_Tipo_Asiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_tipodoc]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_tipodoc](
	[codigo] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
 CONSTRAINT [PK_tb_tipodoc_codigo] PRIMARY KEY CLUSTERED 
(
	[codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[Cod_Usuario] [int] IDENTITY(2,1) NOT NULL,
	[Correo_Usuario] [nvarchar](30) NULL,
	[Contraseña_Usuario] [nvarchar](8) NULL,
 CONSTRAINT [PK_tb_usuario_Cod_Usuario] PRIMARY KEY CLUSTERED 
(
	[Cod_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_ventapasaje]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_ventapasaje](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Usuario] [int] NULL,
	[Fecha_Venta] [datetime2](0) NULL,
	[Monto_Total] [float] NULL,
 CONSTRAINT [PK_tb_ventapasaje_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_viaje]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_viaje](
	[Cod_Viaje] [int] IDENTITY(4,1) NOT NULL,
	[Fecha_Hora_Partida] [datetime2](0) NULL,
	[Fecha_Hora_Llegada] [datetime2](0) NULL,
	[Cod_Ruta] [int] NULL,
	[Cod_Bus] [int] NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_tb_viaje_Cod_Viaje] PRIMARY KEY CLUSTERED 
(
	[Cod_Viaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_bus] ON 

INSERT [dbo].[tb_bus] ([Cod_Bus], [Registro], [Cantidad_Asientos], [Marca], [Modelo], [Estado]) VALUES (3, N'78965', 80, N'Toyota', N'Hilux-520', 1)
SET IDENTITY_INSERT [dbo].[tb_bus] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_departamento] ON 

INSERT [dbo].[tb_departamento] ([Cod_Departamento], [Nombre_Departamento]) VALUES (26, N'Lima')
INSERT [dbo].[tb_departamento] ([Cod_Departamento], [Nombre_Departamento]) VALUES (27, N'Chimbote')
INSERT [dbo].[tb_departamento] ([Cod_Departamento], [Nombre_Departamento]) VALUES (28, N'Trujillo')
INSERT [dbo].[tb_departamento] ([Cod_Departamento], [Nombre_Departamento]) VALUES (29, N'Cajamarca')
INSERT [dbo].[tb_departamento] ([Cod_Departamento], [Nombre_Departamento]) VALUES (30, N'Amazonas')
SET IDENTITY_INSERT [dbo].[tb_departamento] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_ruta] ON 

INSERT [dbo].[tb_ruta] ([Cod_Ruta], [Alias_Ruta], [Tiempo_Promedio_Ruta], [Cod_Terminal_Origen], [Cod_Terminal_Destino], [DistanciaKm], [Estado]) VALUES (5, N'Lima-Trujillo', 8, 8, 9, 1200, 1)
INSERT [dbo].[tb_ruta] ([Cod_Ruta], [Alias_Ruta], [Tiempo_Promedio_Ruta], [Cod_Terminal_Origen], [Cod_Terminal_Destino], [DistanciaKm], [Estado]) VALUES (6, N'Trujillo- Lima', 8, 9, 8, 1200, 1)
SET IDENTITY_INSERT [dbo].[tb_ruta] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_terminalterrestre] ON 

INSERT [dbo].[tb_terminalterrestre] ([Cod_Terminal], [Nombre_Terminal], [Cod_Departamento], [Estado]) VALUES (8, N'Yerbateros', 26, 1)
INSERT [dbo].[tb_terminalterrestre] ([Cod_Terminal], [Nombre_Terminal], [Cod_Departamento], [Estado]) VALUES (9, N'Mochero', 28, 1)
SET IDENTITY_INSERT [dbo].[tb_terminalterrestre] OFF
GO
SET IDENTITY_INSERT [dbo].[tb_viaje] ON 

INSERT [dbo].[tb_viaje] ([Cod_Viaje], [Fecha_Hora_Partida], [Fecha_Hora_Llegada], [Cod_Ruta], [Cod_Bus], [Estado]) VALUES (4, CAST(N'2022-11-08T08:00:00.0000000' AS DateTime2), CAST(N'2022-11-09T08:00:00.0000000' AS DateTime2), 6, 3, 1)
SET IDENTITY_INSERT [dbo].[tb_viaje] OFF
GO
/****** Object:  Index [Cod_Bus]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Bus] ON [dbo].[tb_asiento]
(
	[Cod_Bus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Tipo_Asiento]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Tipo_Asiento] ON [dbo].[tb_asiento]
(
	[Cod_Tipo_Asiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [tipo]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [tipo] ON [dbo].[tb_cliente]
(
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [tipogen]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [tipogen] ON [dbo].[tb_cliente]
(
	[tipogen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Asiento]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Asiento] ON [dbo].[tb_detalleventapasaje]
(
	[Cod_Asiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Viaje]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Viaje] ON [dbo].[tb_detalleventapasaje]
(
	[Cod_Viaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [id_cli]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [id_cli] ON [dbo].[tb_detalleventapasaje]
(
	[id_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Id_Venta]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Id_Venta] ON [dbo].[tb_detalleventapasaje]
(
	[Id_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Terminal_Destino]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Terminal_Destino] ON [dbo].[tb_ruta]
(
	[Cod_Terminal_Destino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Terminal_Origen]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Terminal_Origen] ON [dbo].[tb_ruta]
(
	[Cod_Terminal_Origen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Departamento]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Departamento] ON [dbo].[tb_terminalterrestre]
(
	[Cod_Departamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Usuario]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Usuario] ON [dbo].[tb_ventapasaje]
(
	[Cod_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Bus]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Bus] ON [dbo].[tb_viaje]
(
	[Cod_Bus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Cod_Ruta]    Script Date: 08/11/2022 23:01:10 ******/
CREATE NONCLUSTERED INDEX [Cod_Ruta] ON [dbo].[tb_viaje]
(
	[Cod_Ruta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_asiento] ADD  DEFAULT (NULL) FOR [Alias_Asiento]
GO
ALTER TABLE [dbo].[tb_asiento] ADD  DEFAULT (NULL) FOR [Cod_Bus]
GO
ALTER TABLE [dbo].[tb_asiento] ADD  DEFAULT (NULL) FOR [Cod_Tipo_Asiento]
GO
ALTER TABLE [dbo].[tb_asiento] ADD  DEFAULT (NULL) FOR [Estado]
GO
ALTER TABLE [dbo].[tb_bus] ADD  DEFAULT (NULL) FOR [Registro]
GO
ALTER TABLE [dbo].[tb_bus] ADD  DEFAULT (NULL) FOR [Cantidad_Asientos]
GO
ALTER TABLE [dbo].[tb_bus] ADD  DEFAULT (NULL) FOR [Marca]
GO
ALTER TABLE [dbo].[tb_bus] ADD  DEFAULT (NULL) FOR [Modelo]
GO
ALTER TABLE [dbo].[tb_bus] ADD  DEFAULT (NULL) FOR [Estado]
GO
ALTER TABLE [dbo].[tb_cliente] ADD  DEFAULT (NULL) FOR [cod_cli]
GO
ALTER TABLE [dbo].[tb_cliente] ADD  DEFAULT (NULL) FOR [tipo]
GO
ALTER TABLE [dbo].[tb_cliente] ADD  DEFAULT (NULL) FOR [nombre]
GO
ALTER TABLE [dbo].[tb_cliente] ADD  DEFAULT (NULL) FOR [apellido]
GO
ALTER TABLE [dbo].[tb_cliente] ADD  DEFAULT (NULL) FOR [edad]
GO
ALTER TABLE [dbo].[tb_cliente] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[tb_cliente] ADD  DEFAULT (NULL) FOR [tipogen]
GO
ALTER TABLE [dbo].[tb_departamento] ADD  DEFAULT (NULL) FOR [Nombre_Departamento]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] ADD  DEFAULT (NULL) FOR [Id_Venta]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] ADD  DEFAULT (NULL) FOR [Cod_Viaje]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] ADD  DEFAULT (NULL) FOR [id_cli]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] ADD  DEFAULT (NULL) FOR [Cod_Asiento]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] ADD  DEFAULT (NULL) FOR [Voucher]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] ADD  DEFAULT (NULL) FOR [Costo_Ticket]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] ADD  DEFAULT (NULL) FOR [Descuento]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] ADD  DEFAULT (NULL) FOR [Sub_total]
GO
ALTER TABLE [dbo].[tb_genero] ADD  DEFAULT (NULL) FOR [desc_gen]
GO
ALTER TABLE [dbo].[tb_ruta] ADD  DEFAULT (NULL) FOR [Alias_Ruta]
GO
ALTER TABLE [dbo].[tb_ruta] ADD  DEFAULT (NULL) FOR [Tiempo_Promedio_Ruta]
GO
ALTER TABLE [dbo].[tb_ruta] ADD  DEFAULT (NULL) FOR [Cod_Terminal_Origen]
GO
ALTER TABLE [dbo].[tb_ruta] ADD  DEFAULT (NULL) FOR [Cod_Terminal_Destino]
GO
ALTER TABLE [dbo].[tb_ruta] ADD  DEFAULT (NULL) FOR [DistanciaKm]
GO
ALTER TABLE [dbo].[tb_ruta] ADD  DEFAULT (NULL) FOR [Estado]
GO
ALTER TABLE [dbo].[tb_terminalterrestre] ADD  DEFAULT (NULL) FOR [Nombre_Terminal]
GO
ALTER TABLE [dbo].[tb_terminalterrestre] ADD  DEFAULT (NULL) FOR [Cod_Departamento]
GO
ALTER TABLE [dbo].[tb_terminalterrestre] ADD  DEFAULT (NULL) FOR [Estado]
GO
ALTER TABLE [dbo].[tb_tipoasiento] ADD  DEFAULT (NULL) FOR [Tipo_ASiento]
GO
ALTER TABLE [dbo].[tb_tipodoc] ADD  DEFAULT (NULL) FOR [descripcion]
GO
ALTER TABLE [dbo].[tb_usuario] ADD  DEFAULT (NULL) FOR [Correo_Usuario]
GO
ALTER TABLE [dbo].[tb_usuario] ADD  DEFAULT (NULL) FOR [Contraseña_Usuario]
GO
ALTER TABLE [dbo].[tb_ventapasaje] ADD  DEFAULT (NULL) FOR [Cod_Usuario]
GO
ALTER TABLE [dbo].[tb_ventapasaje] ADD  DEFAULT (NULL) FOR [Fecha_Venta]
GO
ALTER TABLE [dbo].[tb_ventapasaje] ADD  DEFAULT (NULL) FOR [Monto_Total]
GO
ALTER TABLE [dbo].[tb_viaje] ADD  DEFAULT (NULL) FOR [Fecha_Hora_Partida]
GO
ALTER TABLE [dbo].[tb_viaje] ADD  DEFAULT (NULL) FOR [Fecha_Hora_Llegada]
GO
ALTER TABLE [dbo].[tb_viaje] ADD  DEFAULT (NULL) FOR [Cod_Ruta]
GO
ALTER TABLE [dbo].[tb_viaje] ADD  DEFAULT (NULL) FOR [Cod_Bus]
GO
ALTER TABLE [dbo].[tb_viaje] ADD  DEFAULT (NULL) FOR [Estado]
GO
ALTER TABLE [dbo].[tb_asiento]  WITH CHECK ADD  CONSTRAINT [tb_asiento$tb_asiento_ibfk_1] FOREIGN KEY([Cod_Bus])
REFERENCES [dbo].[tb_bus] ([Cod_Bus])
GO
ALTER TABLE [dbo].[tb_asiento] CHECK CONSTRAINT [tb_asiento$tb_asiento_ibfk_1]
GO
ALTER TABLE [dbo].[tb_asiento]  WITH CHECK ADD  CONSTRAINT [tb_asiento$tb_asiento_ibfk_2] FOREIGN KEY([Cod_Tipo_Asiento])
REFERENCES [dbo].[tb_tipoasiento] ([Cod_Tipo_Asiento])
GO
ALTER TABLE [dbo].[tb_asiento] CHECK CONSTRAINT [tb_asiento$tb_asiento_ibfk_2]
GO
ALTER TABLE [dbo].[tb_cliente]  WITH CHECK ADD  CONSTRAINT [tb_cliente$tb_cliente_ibfk_1] FOREIGN KEY([tipo])
REFERENCES [dbo].[tb_tipodoc] ([codigo])
GO
ALTER TABLE [dbo].[tb_cliente] CHECK CONSTRAINT [tb_cliente$tb_cliente_ibfk_1]
GO
ALTER TABLE [dbo].[tb_cliente]  WITH CHECK ADD  CONSTRAINT [tb_cliente$tb_cliente_ibfk_2] FOREIGN KEY([tipogen])
REFERENCES [dbo].[tb_genero] ([id_genero])
GO
ALTER TABLE [dbo].[tb_cliente] CHECK CONSTRAINT [tb_cliente$tb_cliente_ibfk_2]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje]  WITH CHECK ADD  CONSTRAINT [tb_detalleventapasaje$tb_detalleventapasaje_ibfk_1] FOREIGN KEY([Id_Venta])
REFERENCES [dbo].[tb_ventapasaje] ([Id])
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] CHECK CONSTRAINT [tb_detalleventapasaje$tb_detalleventapasaje_ibfk_1]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje]  WITH CHECK ADD  CONSTRAINT [tb_detalleventapasaje$tb_detalleventapasaje_ibfk_2] FOREIGN KEY([Cod_Viaje])
REFERENCES [dbo].[tb_viaje] ([Cod_Viaje])
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] CHECK CONSTRAINT [tb_detalleventapasaje$tb_detalleventapasaje_ibfk_2]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje]  WITH CHECK ADD  CONSTRAINT [tb_detalleventapasaje$tb_detalleventapasaje_ibfk_3] FOREIGN KEY([id_cli])
REFERENCES [dbo].[tb_cliente] ([id_cli])
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] CHECK CONSTRAINT [tb_detalleventapasaje$tb_detalleventapasaje_ibfk_3]
GO
ALTER TABLE [dbo].[tb_detalleventapasaje]  WITH CHECK ADD  CONSTRAINT [tb_detalleventapasaje$tb_detalleventapasaje_ibfk_4] FOREIGN KEY([Cod_Asiento])
REFERENCES [dbo].[tb_asiento] ([Cod_Asiento])
GO
ALTER TABLE [dbo].[tb_detalleventapasaje] CHECK CONSTRAINT [tb_detalleventapasaje$tb_detalleventapasaje_ibfk_4]
GO
ALTER TABLE [dbo].[tb_ruta]  WITH CHECK ADD  CONSTRAINT [tb_ruta$tb_ruta_ibfk_1] FOREIGN KEY([Cod_Terminal_Origen])
REFERENCES [dbo].[tb_terminalterrestre] ([Cod_Terminal])
GO
ALTER TABLE [dbo].[tb_ruta] CHECK CONSTRAINT [tb_ruta$tb_ruta_ibfk_1]
GO
ALTER TABLE [dbo].[tb_ruta]  WITH CHECK ADD  CONSTRAINT [tb_ruta$tb_ruta_ibfk_2] FOREIGN KEY([Cod_Terminal_Destino])
REFERENCES [dbo].[tb_terminalterrestre] ([Cod_Terminal])
GO
ALTER TABLE [dbo].[tb_ruta] CHECK CONSTRAINT [tb_ruta$tb_ruta_ibfk_2]
GO
ALTER TABLE [dbo].[tb_terminalterrestre]  WITH CHECK ADD  CONSTRAINT [tb_terminalterrestre$tb_terminalterrestre_ibfk_1] FOREIGN KEY([Cod_Departamento])
REFERENCES [dbo].[tb_departamento] ([Cod_Departamento])
GO
ALTER TABLE [dbo].[tb_terminalterrestre] CHECK CONSTRAINT [tb_terminalterrestre$tb_terminalterrestre_ibfk_1]
GO
ALTER TABLE [dbo].[tb_ventapasaje]  WITH CHECK ADD  CONSTRAINT [tb_ventapasaje$tb_ventapasaje_ibfk_1] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[tb_usuario] ([Cod_Usuario])
GO
ALTER TABLE [dbo].[tb_ventapasaje] CHECK CONSTRAINT [tb_ventapasaje$tb_ventapasaje_ibfk_1]
GO
ALTER TABLE [dbo].[tb_viaje]  WITH CHECK ADD  CONSTRAINT [tb_viaje$tb_viaje_ibfk_1] FOREIGN KEY([Cod_Ruta])
REFERENCES [dbo].[tb_ruta] ([Cod_Ruta])
GO
ALTER TABLE [dbo].[tb_viaje] CHECK CONSTRAINT [tb_viaje$tb_viaje_ibfk_1]
GO
ALTER TABLE [dbo].[tb_viaje]  WITH CHECK ADD  CONSTRAINT [tb_viaje$tb_viaje_ibfk_2] FOREIGN KEY([Cod_Bus])
REFERENCES [dbo].[tb_bus] ([Cod_Bus])
GO
ALTER TABLE [dbo].[tb_viaje] CHECK CONSTRAINT [tb_viaje$tb_viaje_ibfk_2]
GO
/****** Object:  StoredProcedure [dbo].[Sp_BusActualizar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_BusActualizar]
@CodBus int, @registro varchar(100), @cantidadAsientos int, @marca varchar(100),
@modelo varchar(100)
As
Begin
	Update dbo.tb_Bus set 
	Registro = @registro, 
	Cantidad_Asientos = @cantidadAsientos, 
	Marca = @marca, 
	Modelo = @modelo
	where Cod_Bus = @CodBus
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_BusBaja]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_BusBaja]
@CodBus int
As
Begin	
	Update dbo.tb_Bus set 
	Estado = 0
	where Cod_Bus = @CodBus		
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_BusDetalle]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_BusDetalle]
@CodBus int
As
Begin	
	select Cod_Bus, Registro, Cantidad_Asientos, Marca, Modelo, Estado
	from dbo.tb_Bus
	where Cod_Bus = @CodBus and Estado = 1	
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_BusInsertar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_BusInsertar]
@registro varchar(100), @cantidadAsientos int, @marca varchar(100),
@modelo varchar(100)
As
Begin
		Insert dbo.tb_Bus(Registro, Cantidad_Asientos, Marca, Modelo, Estado)
		values (@registro, @cantidadAsientos, @marca, @modelo, 1)
End		
GO
/****** Object:  StoredProcedure [dbo].[Sp_BusListar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_BusListar]
as 
Begin
	select Cod_Bus, Registro, Cantidad_Asientos, Marca, Modelo, Estado
	from dbo.tb_Bus where Estado = 1
End 

select * from tb_Bus 
--update tb_Bus set Estado = 1 where Cod_Bus = 1
GO
/****** Object:  StoredProcedure [dbo].[Sp_DepartamentoListar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_DepartamentoListar]
as 
Begin
	select * from dbo.tb_Departamento
End 
GO
/****** Object:  StoredProcedure [dbo].[Sp_RutaActualizar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_RutaActualizar]
@CodRuta int, @aliasRuta varchar(100), @tiempoPromedioRuta bigint, @codTerminalOrigen int, @codTerminalDestino int
,@distanciaKm float 
As
Begin
	Update dbo.tb_Ruta set 
	Alias_Ruta = @aliasRuta, 
	Tiempo_Promedio_Ruta = @tiempoPromedioRuta, 
	Cod_Terminal_Origen = @codTerminalOrigen, 
	Cod_Terminal_Destino = @codTerminalDestino,
	DistanciaKm = @distanciaKm
	where Cod_Ruta = @CodRuta
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_RutaBaja]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_RutaBaja]
@CodRuta int
As
Begin	
	Update dbo.tb_Ruta set 
	Estado = 0
	where Cod_Ruta = @CodRuta		
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_RutaDetalle]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_RutaDetalle]
@CodRuta int
As
Begin	
	select Cod_Ruta, Alias_Ruta, Tiempo_Promedio_Ruta, Cod_Terminal_Origen, tt2.Nombre_Terminal, 
	Cod_Terminal_Destino, tt.Nombre_Terminal, DistanciaKm, r.Estado
	from dbo.tb_Ruta r inner join dbo.tb_TerminalTerrestre tt
	on tt.Cod_Terminal = r.Cod_Terminal_Destino
	inner join dbo.tb_TerminalTerrestre tt2
	on tt2.Cod_Terminal = r.Cod_Terminal_Origen
	where Cod_Ruta = @CodRuta and r.Estado = 1	
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_RutaInsertar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_RutaInsertar]
@aliasRuta varchar(100), @tiempoPromedioRuta bigint, @codTerminalOrigen int, @codTerminalDestino int, @distanciaKm float 
As
Begin
		Insert dbo.tb_Ruta(Alias_Ruta, Tiempo_Promedio_Ruta, Cod_Terminal_Origen, Cod_Terminal_Destino, DistanciaKm, Estado)
		values (@aliasRuta, @tiempoPromedioRuta, @codTerminalOrigen, @codTerminalDestino, @distanciaKm, 1)
End		
GO
/****** Object:  StoredProcedure [dbo].[Sp_RutaListar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_RutaListar]
as 
Begin
	select Cod_Ruta, Alias_Ruta, Tiempo_Promedio_Ruta, Cod_Terminal_Origen, tt2.Nombre_Terminal, 
	Cod_Terminal_Destino, tt.Nombre_Terminal, DistanciaKm, r.Estado
	from dbo.tb_Ruta r inner join dbo.tb_TerminalTerrestre tt
	on tt.Cod_Terminal = r.Cod_Terminal_Destino
	inner join dbo.tb_TerminalTerrestre tt2
	on tt2.Cod_Terminal = r.Cod_Terminal_Origen
	where r.Estado = 1
End 

select * from tb_Ruta 
--update tb_Ruta set Estado = 1 where Cod_Ruta = 1
GO
/****** Object:  StoredProcedure [dbo].[Sp_TerminalActualizar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_TerminalActualizar]
@CodTerminal int, @nombreTerminal varchar(100), @codDepartamento int
As
Begin
	Update dbo.tb_TerminalTerrestre set 
	Nombre_Terminal = @nombreTerminal, 
	Cod_Departamento = @codDepartamento
	where Cod_Terminal = @CodTerminal
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_TerminalBaja]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_TerminalBaja]
@CodTerminal int
As
Begin	
	Update dbo.tb_TerminalTerrestre set 
	Estado = 0
	where Cod_Terminal = @CodTerminal		
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_TerminalDetalle]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_TerminalDetalle]
@CodTerminal int
As
Begin	
	select Cod_Terminal, Nombre_Terminal, tt.Cod_Departamento, d.Nombre_Departamento, Estado
	from dbo.tb_TerminalTerrestre tt inner join dbo.tb_Departamento d
	on tt.Cod_Departamento = d.Cod_Departamento
	where Cod_Terminal = @CodTerminal and Estado = 1	
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_TerminalInsertar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_TerminalInsertar]
@nombreTerminal varchar(100), @codDepartamento int
As
Begin
		Insert dbo.tb_TerminalTerrestre(Nombre_Terminal, Cod_Departamento, Estado)
		values (@nombreTerminal, @codDepartamento, 1)
End		
GO
/****** Object:  StoredProcedure [dbo].[Sp_TerminalListar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_TerminalListar]
as 
Begin
	select Cod_Terminal, Nombre_Terminal, tt.Cod_Departamento, d.Nombre_Departamento, Estado
	from dbo.tb_TerminalTerrestre tt inner join dbo.tb_Departamento d
	on tt.Cod_Departamento = d.Cod_Departamento
	where Estado = 1
End 

select * from tb_TerminalTerrestre
--update tb_TerminalTerrestre set Estado = 1 where Cod_Terminal = 1
--update tb_TerminalTerrestre set Estado = 1 where Cod_Terminal = 2
GO
/****** Object:  StoredProcedure [dbo].[Sp_ViajeActualizar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_ViajeActualizar]
@CodViaje int, @fechaHoraPartida datetime, @fechaHoraLlegada datetime, @codRuta int, @codBus int
As
Begin
	Update dbo.tb_Viaje set 
	Fecha_Hora_Partida = @fechaHoraPartida, 
	Fecha_Hora_Llegada = @fechaHoraLlegada, 
	Cod_Ruta = @codRuta, 
	Cod_Bus = @codBus
	where Cod_Viaje = @CodViaje
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_ViajeBaja]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_ViajeBaja]
@CodViaje int
As
Begin	
	Update dbo.tb_Viaje set 
	Estado = 0
	where Cod_Viaje = @CodViaje		
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_ViajeDetalle]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_ViajeDetalle]
@CodViaje int
As
Begin	
	select Cod_Viaje, Fecha_Hora_Partida, Fecha_Hora_Llegada, v.Cod_Ruta, b.Registro, 
	v.Cod_Bus, r.Alias_Ruta, DistanciaKm, v.Estado
	from dbo.tb_Viaje v inner join dbo.tb_Bus b
	on v.Cod_Bus = b.Cod_Bus
	inner join dbo.tb_Ruta r
	on v.Cod_Ruta = r.Cod_Ruta
	where Cod_Viaje = @CodViaje and v.Estado = 1	
End			
GO
/****** Object:  StoredProcedure [dbo].[Sp_ViajeInsertar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_ViajeInsertar]
@fechaHoraPartida datetime, @fechaHoraLlegada datetime, @codRuta int, @codBus int
As
Begin
		Insert dbo.tb_Viaje(Fecha_Hora_Partida, Fecha_Hora_Llegada, Cod_Ruta, Cod_Bus, Estado)
		values (@fechaHoraPartida, @fechaHoraLlegada, @codRuta, @codBus, 1)
End		
GO
/****** Object:  StoredProcedure [dbo].[Sp_ViajeListar]    Script Date: 08/11/2022 23:01:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   Proc [dbo].[Sp_ViajeListar]
as 
Begin
	select Cod_Viaje, Fecha_Hora_Partida, Fecha_Hora_Llegada, v.Cod_Ruta, b.Registro, 
	v.Cod_Bus, r.Alias_Ruta, v.Estado
	from dbo.tb_Viaje v inner join dbo.tb_Bus b
	on v.Cod_Bus = b.Cod_Bus
	inner join dbo.tb_Ruta r
	on v.Cod_Ruta = r.Cod_Ruta
	where v.Estado = 1
End 

select * from tb_Viaje 
--update tb_Viaje set Estado = 1 where Cod_Viaje = 1
--update tb_Viaje set Fecha_Hora_Partida = '2022-02-10 04:00:00', Fecha_Hora_Llegada = '2022-02-10 08:00:00' where Cod_Viaje = 1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_asiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_asiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_bus' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_bus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_cliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_departamento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_departamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_detalleventapasaje' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_detalleventapasaje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_genero' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_genero'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_ruta' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ruta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_terminalterrestre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_terminalterrestre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_tipoasiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_tipoasiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_tipodoc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_tipodoc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_usuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_ventapasaje' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_ventapasaje'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'proyectodsw_202202_2.tb_viaje' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tb_viaje'
GO
USE [master]
GO
ALTER DATABASE [Migracion] SET  READ_WRITE 
GO
