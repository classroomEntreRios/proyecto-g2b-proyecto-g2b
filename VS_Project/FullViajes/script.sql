ALTER DATABASE [FullViajes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FullViajes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FullViajes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FullViajes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FullViajes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FullViajes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FullViajes] SET ARITHABORT OFF 
GO
ALTER DATABASE [FullViajes] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FullViajes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FullViajes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FullViajes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FullViajes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FullViajes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FullViajes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FullViajes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FullViajes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FullViajes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FullViajes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FullViajes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FullViajes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FullViajes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FullViajes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FullViajes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FullViajes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FullViajes] SET RECOVERY FULL 
GO
ALTER DATABASE [FullViajes] SET  MULTI_USER 
GO
ALTER DATABASE [FullViajes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FullViajes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FullViajes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FullViajes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FullViajes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FullViajes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FullViajes] SET QUERY_STORE = OFF
GO
USE [FullViajes]
GO
/****** Object:  Table [dbo].[Alojamiento]    Script Date: 16/04/2021 16:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alojamiento](
	[id_alojamiento] [bigint] IDENTITY(0,1) NOT NULL,
	[id_ciudad] [bigint] NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [text] NOT NULL,
	[telefono] [varchar](100) NULL,
	[direccion] [varchar](200) NOT NULL,
	[itinerario] [binary](1) NOT NULL,
 CONSTRAINT [Alojamiento_PK] PRIMARY KEY CLUSTERED 
(
	[id_alojamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Atracciones]    Script Date: 16/04/2021 16:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Atracciones](
	[id_atraccion] [bigint] IDENTITY(0,1) NOT NULL,
	[id_ciudad] [bigint] NOT NULL,
	[nombre] [varchar](250) NOT NULL,
	[descripcion] [text] NULL,
	[direccion] [varchar](300) NOT NULL,
	[itinerario] [binary](1) NOT NULL,
 CONSTRAINT [Atracciones_PK] PRIMARY KEY CLUSTERED 
(
	[id_atraccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 16/04/2021 16:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ciudad](
	[id_ciudad] [bigint] IDENTITY(0,1) NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[cp] [varchar](10) NOT NULL,
	[coordenadas] [varchar](100) NOT NULL,
	[descripcion] [text] NULL,
	[menu] [bit] NULL,
 CONSTRAINT [Ciudad_PK] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clima]    Script Date: 16/04/2021 16:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clima](
	[id_clima] [bigint] IDENTITY(0,1) NOT NULL,
	[id_ciudad] [bigint] NOT NULL,
	[fecha] [date] NOT NULL,
	[estado] [varchar](100) NOT NULL,
	[tempmax] [smallint] NOT NULL,
	[tempmin] [smallint] NOT NULL,
 CONSTRAINT [Clima_PK] PRIMARY KEY CLUSTERED 
(
	[id_clima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagen]    Script Date: 16/04/2021 16:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagen](
	[id_imagen] [bigint] IDENTITY(0,1) NOT NULL,
	[id_ciudad] [bigint] NOT NULL,
	[url] [varchar](300) NOT NULL,
	[descripcion] [varchar](300) NULL,
	[seccion] [smallint] NOT NULL,
 CONSTRAINT [Imagen_PK] PRIMARY KEY CLUSTERED 
(
	[id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 16/04/2021 16:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[id_respuesta] [bigint] IDENTITY(0,1) NOT NULL,
	[id_topics] [bigint] NOT NULL,
	[id_usuario] [bigint] NOT NULL,
	[contenido] [text] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NULL,
 CONSTRAINT [Respuestas_PK] PRIMARY KEY CLUSTERED 
(
	[id_respuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topicos]    Script Date: 16/04/2021 16:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topicos](
	[id_topics] [bigint] IDENTITY(0,1) NOT NULL,
	[id_usuario] [bigint] NOT NULL,
	[titulo] [varchar](200) NOT NULL,
	[contenido] [text] NOT NULL,
	[fecha_creacion] [datetime] NOT NULL,
	[fecha_modificacion] [datetime] NULL,
 CONSTRAINT [Topicos_PK] PRIMARY KEY CLUSTERED 
(
	[id_topics] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 16/04/2021 16:44:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id_usuario] [bigint] IDENTITY(0,1) NOT NULL,
	[nickname] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](100) NOT NULL,
	[rol] [tinyint] NOT NULL,
	[user_foto] [varchar](250) NOT NULL,
	[user_descripcion] [varchar](300) NOT NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](100) NULL,
	[active] [bit] NULL,
	[token] [varchar](100) NULL,
 CONSTRAINT [Usuario_PK] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Respuestas] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Topicos] ADD  DEFAULT (getdate()) FOR [fecha_creacion]
GO
ALTER TABLE [dbo].[Alojamiento]  WITH CHECK ADD  CONSTRAINT [Alojamiento_FK] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[Ciudad] ([id_ciudad])
GO
ALTER TABLE [dbo].[Alojamiento] CHECK CONSTRAINT [Alojamiento_FK]
GO
ALTER TABLE [dbo].[Atracciones]  WITH CHECK ADD  CONSTRAINT [Atracciones_FK] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[Ciudad] ([id_ciudad])
GO
ALTER TABLE [dbo].[Atracciones] CHECK CONSTRAINT [Atracciones_FK]
GO
ALTER TABLE [dbo].[Clima]  WITH CHECK ADD  CONSTRAINT [Clima_FK] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[Ciudad] ([id_ciudad])
GO
ALTER TABLE [dbo].[Clima] CHECK CONSTRAINT [Clima_FK]
GO
ALTER TABLE [dbo].[Imagen]  WITH CHECK ADD  CONSTRAINT [Imagen_FK] FOREIGN KEY([id_ciudad])
REFERENCES [dbo].[Ciudad] ([id_ciudad])
GO
ALTER TABLE [dbo].[Imagen] CHECK CONSTRAINT [Imagen_FK]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [Respuestas_FK] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [Respuestas_FK]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [RespuestasT_FK] FOREIGN KEY([id_topics])
REFERENCES [dbo].[Topicos] ([id_topics])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [RespuestasT_FK]
GO
ALTER TABLE [dbo].[Topicos]  WITH CHECK ADD  CONSTRAINT [Topicos_FK] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[Topicos] CHECK CONSTRAINT [Topicos_FK]
GO
USE [master]
GO
ALTER DATABASE [FullViajes] SET  READ_WRITE 
GO
