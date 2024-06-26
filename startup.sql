USE [master]
GO
/****** Object:  Database [SonsuzHayal]    Script Date: 28.12.2023 19:40:50 ******/
CREATE DATABASE [SonsuzHayal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SonsuzHayal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SonsuzHayal.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SonsuzHayal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SonsuzHayal_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SonsuzHayal] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SonsuzHayal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SonsuzHayal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SonsuzHayal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SonsuzHayal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SonsuzHayal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SonsuzHayal] SET ARITHABORT OFF 
GO
ALTER DATABASE [SonsuzHayal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SonsuzHayal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SonsuzHayal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SonsuzHayal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SonsuzHayal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SonsuzHayal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SonsuzHayal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SonsuzHayal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SonsuzHayal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SonsuzHayal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SonsuzHayal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SonsuzHayal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SonsuzHayal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SonsuzHayal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SonsuzHayal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SonsuzHayal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SonsuzHayal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SonsuzHayal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SonsuzHayal] SET  MULTI_USER 
GO
ALTER DATABASE [SonsuzHayal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SonsuzHayal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SonsuzHayal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SonsuzHayal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SonsuzHayal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SonsuzHayal] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SonsuzHayal] SET QUERY_STORE = ON
GO
ALTER DATABASE [SonsuzHayal] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SonsuzHayal]
GO
/****** Object:  Table [dbo].[Forum]    Script Date: 28.12.2023 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forum](
	[gonderi_id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_id] [int] NULL,
	[gonderi_basligi] [text] NULL,
	[gonderi_metni] [text] NULL,
	[gonderi_tarihi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[gonderi_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 28.12.2023 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[kullanici_id] [int] IDENTITY(1,1) NOT NULL,
	[KullanıcıAdı] [varchar](50) NOT NULL,
	[Sifre] [varchar](50) NOT NULL,
	[isim] [varchar](50) NOT NULL,
	[Soyİsim] [varchar](50) NOT NULL,
	[Eposta] [varchar](50) NOT NULL,
	[rol_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[kullanici_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projeler]    Script Date: 28.12.2023 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projeler](
	[proje_id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_id] [int] NULL,
	[proje_basligi] [varchar](100) NULL,
	[proje_metni] [text] NULL,
	[proje_tarihi] [datetime] NULL,
	[proje_bitis] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[proje_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roller]    Script Date: 28.12.2023 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roller](
	[rol_id] [int] NOT NULL,
	[rol_adi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[rol_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yatirim_tur]    Script Date: 28.12.2023 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yatirim_tur](
	[yatirim_turu_id] [int] IDENTITY(1,1) NOT NULL,
	[yatirim_adi] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[yatirim_turu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yatirimciler]    Script Date: 28.12.2023 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yatirimciler](
	[yatirimci_id] [int] IDENTITY(1,1) NOT NULL,
	[kullanici_id] [int] NOT NULL,
	[unvan_adi] [varchar](50) NOT NULL,
	[tel] [varchar](15) NULL,
	[sirket_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[yatirimci_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yatirimler]    Script Date: 28.12.2023 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yatirimler](
	[yatirim_id] [int] IDENTITY(1,1) NOT NULL,
	[yatirimci_id] [int] NOT NULL,
	[proje_id] [int] NOT NULL,
	[yatirim_miktari] [int] NOT NULL,
	[yatirim_turu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[yatirim_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ysirketler]    Script Date: 28.12.2023 19:40:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ysirketler](
	[sirket_id] [int] IDENTITY(1,1) NOT NULL,
	[sirket_adi] [varchar](50) NOT NULL,
	[sirket_sektoru] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[sirket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Forum] ON 

INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (1, 1, N'Edutube', N'IP adresinin localhostta açılmaması hakkında yardım istiyorum.', CAST(N'2023-11-27T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (2, 2, N'Cylon', N'Robotik Kodlamalar için JavaScript Framework', CAST(N'2023-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (3, 3, N'LocalStack', N'Yerel Bulut Geliştiricisi için Önde Gelen Platform', CAST(N'2023-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (4, 4, N'OBS Project', N'Açık Kaynak Kodlu ve Tamamen Ücretsiz Canlı Yayınlar ve Ekran Kayıtları İçin Uygulama', CAST(N'2023-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (5, 5, N'Curl', N'URL İle Veri Aktarımı İçin Komut Satırı Aracı', CAST(N'2023-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (6, 6, N'CodeCrafters', N'Yazılım geliştiricilerin bir araya gelip projelerini paylaştığı ve birbirlerine destek verdiği website.', CAST(N'2023-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (7, 7, N'Flutter ile Rota Cizimi', N'Flutter Kullanarak Google Maps Entegrasyonu Ve Rota Çizimi Hazırladım.', CAST(N'2023-12-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (8, 8, N'Yazılım Güncelleme Süreçlerinde Kullanıcı Geri Bildirimini Nasıl Daha Etkin Alabiliriz?', N'Yazılım güncellemeleri sırasında kullanıcı geri bildirimini almakta yaşanan zorluklar ve daha etkili geri bildirim stratejileri hakkında.', CAST(N'2023-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (9, 9, N'AI Alchemists Assembly', N'Yapay zeka ve makine öğrenimi konularında uzmanların birbirleriyle iletişim kurduğu bir bilgi platformu.', CAST(N'2023-12-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (10, 10, N'VeggieVoyage', N'Vegan ve vejetaryen restoranlarını bulmayı kolaylaştıran mobil uygulama.', CAST(N'2023-12-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (11, 11, N'LearnLocal', N'Yerel halkın, yerel uzmanlardan çeşitli becerileri öğrenebileceği pazar yeri iOS uygulaması.', CAST(N'2023-12-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (12, 12, N'Yazılım Test Otomasyonunda Hangi Araçları Tercih Ediyorsunuz?', N'Test mühendislerinin yazılım test otomasyon araçları seçmede yaşadıkları süreçler', CAST(N'2023-12-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (13, 13, N'DroneGuard', N'Drone kullanıcılarına, uçuş güvenliği ve düzenlemeler konusunda rehberlik eden bir danışmanlık hizmeti.', CAST(N'2023-12-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (14, 14, N'LocalBlend', N'Yerel kahve dükkanlarından çeşitli kahve çekirdekleri satan bir çevrimiçi kahve mağazası.', CAST(N'2023-12-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (15, 15, N'EcoDelivery', N'Çevre dostu ambalaj ve taşıma yöntemleri kullanarak sürdürülebilir kurye ve teslimat hizmetleri sunma.', CAST(N'2023-12-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (16, 16, N'Photography Passion', N'Fotoğrafçılık tutkunlarının çalışmalarını paylaştığı, teknik konuları tartıştığı bir topluluk.', CAST(N'2023-12-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (17, 17, N'Music Mania', N'Müzik tutkunlarının favori şarkıları, sanatçılar ve müzik dünyası üzerine konuştuğu website.', CAST(N'2023-12-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (18, 18, N'Pet Pals Plaza', N'Evcil hayvan sahiplerinin deneyimlerini paylaştığı, pet care konularını konuştuğu iOS ve Android Uygulaması.', CAST(N'2023-12-14T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (19, 19, N'Gaming Galaxy', N'Oyun tutkunlarının favori oyunları, stratejiler ve oyun dünyasıyla ilgili konularda sohbet ettiği araç', CAST(N'2023-12-15T00:00:00.000' AS DateTime))
INSERT [dbo].[Forum] ([gonderi_id], [kullanici_id], [gonderi_basligi], [gonderi_metni], [gonderi_tarihi]) VALUES (20, 20, N'BookWorms Corner', N'Kitap okumayı sevenlerin buluştuğu bir blog sayfası; kitap önerileri, yazarlar ve edebiyat üzerine makaleler.', CAST(N'2023-12-16T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Forum] OFF
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON 

INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (1, N'eypsrkc', N'eyp123444444', N'Eyüp', N'Sirkeci', N'eypsrkc@gmail.com', 1)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (2, N'emrkaf', N'emr345', N'Emir', N'Kaftancıoğlu', N'emrkaf53@gmail.com', 2)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (3, N'ibosfr', N'sfr789', N'İbrahim', N'Sefer', N'sfr_ibo@hotmail.com', 2)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (4, N'uno63', N'brk098', N'Berke', N'Ünalan', N'unoberke@outlook.com', 2)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (5, N'ratrat', N'brt765', N'Berat', N'İpek', N'ipek@gmail.com', 3)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (6, N'sıkıntı_123', N'bst432', N'Emir', N'Başot', N'emirbaşot@windowslive.com', 3)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (7, N'mali!?', N'mami_**12', N'Muhammed Ali', N'Bekiroğlu', N'mab53@gmail.com', 3)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (8, N'osman21', N'osm_123', N'Osman', N'Oğuz', N'osmnog@hotmail.com', 3)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (9, N'serdar0852', N'srdrar.*', N'Serdar', N'Ali', N'aliserdar@gmail.com', 3)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (10, N'ah_met', N'et427', N'Ahmet', N'Tecimer', N'rastat@gmail.com', 3)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (11, N'mmb', N'53mmb21', N'Muhammed', N'Mustafa', N'mmb53@gmail.com', 3)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (12, N'valhalla', N'ycl1992', N'Yücel', N'Eğim', N'ycl1992@gmail.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (13, N'iss1903', N'kartal531903', N'İsmet', N'Selim', N'ssiss53@gmail.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (14, N'furki_2', N'fb_qwe123', N'Furkan', N'Bostan', N'furkanb@gmail.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (15, N'sinir12890', N'safi_m53', N'Safa', N'Kaya', N'safisafi@gmail.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (16, N'winner_87', N'pas123456', N'Sinan', N'Bayhan', N'sinanbay@hotmail.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (17, N'poyraz_karayel53', N'laz_53341903', N'Poyraz', N'Ekşi', N'eksipoyraz@outlook.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (18, N'ayse_gül1', N'gul;0*.', N'Ayşe', N'Duman', N'aysdmn@gmail.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (19, N'fatmatakar34', N'tkrrftm0987', N'Fatma', N'Takar', N'fatmatakr@hotmail.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (20, N'zey_ep', N'zey987567', N'Zeynep', N'Ayaz', N'zypayz@gmail.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (21, N'mls_smyr', N'melisa-9', N'Melisa', N'Özen', N'ozenmls@outlook.com', 4)
INSERT [dbo].[Kullanicilar] ([kullanici_id], [KullanıcıAdı], [Sifre], [isim], [Soyİsim], [Eposta], [rol_id]) VALUES (22, N'pelin777', N'pk253412', N'Pelin', N'Kurt', N'plnkrt@gmail.com', 4)
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
GO
SET IDENTITY_INSERT [dbo].[Projeler] ON 

INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (1, 1, N'BioHarvest', N'Biyolojik tarım yöntemleriyle bitki yetiştirmeyi amaçlayan bir proje. Yenilikçi tarım teknolojileri ve biyolojik süreçleri kullanarak, daha sürdürülebilir ve verimli tarım yöntemleri geliştirilmesini hedefliyoruz. Bu proje, gıda üretiminde çevre dostu çözümler arayan bir dünyada önemli bir adımı temsil ediyor.', CAST(N'2023-11-28T00:00:00.000' AS DateTime), CAST(N'2024-11-28T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (2, 2, N'AeroScan', N'AeroScan, drone teknolojisi kullanarak endüstriyel alanlarda hava kalitesi ve çevresel faktörleri izleyen bir projedir. Havadaki kirleticileri, sera gazlarını ve diğer çevresel değişkenleri izleyerek endüstriyel bölgelerin çevresel etkilerini belirlemeyi ve azaltmayı amaçlamaktadır.', CAST(N'2023-11-29T00:00:00.000' AS DateTime), CAST(N'2024-11-29T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (3, 3, N'CodeHarbor', N'CodeHarbor, yazılım geliştirme süreçlerini iyileştirmeyi amaçlayan bir proje. Ekip işbirliğini artıran, kod kalitesini kontrol eden ve yazılım projelerini daha etkili yönetmeyi sağlayan bir platform geliştiriyoruz. CodeHarbor, yazılım geliştirme dünyasında daha düzenli ve verimli bir deneyim sunmayı hedefliyor.', CAST(N'2023-11-30T00:00:00.000' AS DateTime), CAST(N'2023-11-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (4, 4, N'EduVista', N' EduVista, eğitimde dijital dönüşümü destekleyen bir projedir.
 Öğrencilerin, öğretmenlerin ve eğitim kurumlarının daha etkili bir şekilde öğrenmelerini, öğretmelerini ve
 yönetmelerini sağlamak amacıyla geliştirilen yenilikçi eğitim teknolojileri içermektedir.
 EduVista, eğitimde daha erişilebilir ve etkili bir geleceğe doğru bir adımı temsil ediyor.', CAST(N'2023-11-11T00:00:00.000' AS DateTime), CAST(N'2024-11-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (5, 5, N'HealHub', N'  HealHub, sağlık sektöründe dijital dönüşümü hedefleyen bir projedir.
 Hastaların sağlık verilerini güvenli bir şekilde saklayan, sağlık hizmetlerine daha kolay erişim sağlayan
 ve sağlık profesyonelleri ile etkileşimi kolaylaştıran bir sağlık platformu geliştiriyoruz.
 HealHub, sağlık hizmetlerini daha etkili, kişiselleştirilmiş ve erişilebilir kılmayı amaçlamaktadır.', CAST(N'2023-01-11T00:00:00.000' AS DateTime), CAST(N'2024-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (6, 6, N'CleanEnergy Solutions', N'CleanEnergy Solutions,temiz enerji teknolojilerini geliştirmeye odaklanan bir proje.
 Yenilenebilir enerji kaynaklarından yararlanarak enerji üretimini artırmayı,
 enerji depolama teknolojilerini geliştirmeyi ve enerji tüketimini optimize etmeyi amaçlıyoruz.
 Bu proje, enerji sektöründe sürdürülebilir ve çevre dostu çözümler arayan bir dünyaya katkıda bulunmayı hedefliyor.', CAST(N'2023-11-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (7, 7, N'MindSync', N'MindSync, yapay zeka (YZ) ve insan zekası arasında etkileşimi
 artırmayı amaçlayan bir projedir. YZ nin insanlarla daha etkili bir şekilde iletişim kurmasını,
 öğrenmesini ve işbirliği yapmasını sağlayan teknolojileri araştırıyoruz.
 MindSync, YZnin insan yaşamını daha iyi anlamasına ve desteklemesine olanak tanıyarak,
 yeni nesil yapay zeka çözümleri geliştirmeyi hedefliyor.', CAST(N'2023-06-05T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (8, 8, N'AquaGuard', N'AquaGuard, su kaynaklarını korumaya yönelik bir proje.
Su kalitesini izleyen, su kirliliğini tespit eden ve su kaynaklarını sürdürülebilir bir şekilde yönetmeyi
amaçlayan bir su izleme ve yönetim sistemi geliştiriyoruz. AquaGuard, su kaynaklarının korunmasına ve
su kaynaklarıyla ilgili sorunlara çözümler sunarak, su kaynakları konusundaki küresel zorluklara
katkıda bulunmayı hedefliyor.', CAST(N'2023-04-12T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (9, 9, N'UrbanHarmony', N'UrbanHarmony, şehir planlamasında sürdürülebilirlik ve yaşanabilirlik
konularında çözümler sunmayı amaçlayan bir projedir. Akıllı şehir teknolojileri ve veri analitiği kullanarak,
şehirlerin daha etkili ve çevre dostu bir şekilde yönetilmesine katkıda bulunmayı hedefliyoruz.
UrbanHarmony, şehirlerin gelecekteki zorluklarını ele alarak, sürdürülebilir kentsel gelişimi
desteklemeyi amaçlamaktadır.', CAST(N'2023-05-06T00:00:00.000' AS DateTime), CAST(N'2024-05-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (10, 10, N'RoboCompanion', N'RoboCompanion, sosyal robot teknolojisi kullanarak insanlarla
etkileşimde bulunan bir proje. Yalnızlık, depresyon ve sosyal izolasyon gibi sorunları ele alarak,
insanlarla duygusal bağ kurabilen ve destek sağlayabilen sosyal robotlar geliştiriyoruz.
RoboCompanion, insan-robot etkileşimini daha anlamlı ve duygusal bir deneyim haline getirerek,
sosyal refahı artırmayı amaçlamaktadır.', CAST(N'2023-04-24T00:00:00.000' AS DateTime), CAST(N'2024-04-24T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (11, 11, N' SolarHarvest', N'SolarHarvest, güneş enerjisini daha etkili bir şekilde kullanmayı
hedefleyen bir proje. Geliştirdiğimiz güneş panelleri ve enerji depolama sistemleri sayesinde,
yenilenebilir enerji kaynaklarından elde edilen enerjiyi depolama ve dağıtma konusunda çığır
açan bir çözüm sunuyoruz. SolarHarvest, enerji verimliliğini artırarak çevre dostu enerji
kullanımını teşvik ediyor.', CAST(N'2023-12-04T00:00:00.000' AS DateTime), CAST(N'2024-12-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Projeler] ([proje_id], [kullanici_id], [proje_basligi], [proje_metni], [proje_tarihi], [proje_bitis]) VALUES (12, 12, N'HealthSync', N'HealthSync, kişisel sağlık kayıtlarını merkezi bir platformda birleştiren
bir sağlık yönetim projesidir. Kullanıcılar, sağlık verilerini güvenli bir şekilde saklayabilir,
sağlık geçmişlerini takip edebilir ve sağlık profesyonelleriyle veri paylaşımını kolayca yönetebilir.
HealthSync, sağlık hizmetlerinde koordinasyonu artırarak daha etkili bir sağlık yönetimi
sunmayı amaçlamaktadır.', CAST(N'2023-12-08T00:00:00.000' AS DateTime), CAST(N'2024-12-08T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Projeler] OFF
GO
INSERT [dbo].[Roller] ([rol_id], [rol_adi]) VALUES (1, N'Admin')
INSERT [dbo].[Roller] ([rol_id], [rol_adi]) VALUES (3, N'Kullanıcı')
INSERT [dbo].[Roller] ([rol_id], [rol_adi]) VALUES (4, N'Misafir')
INSERT [dbo].[Roller] ([rol_id], [rol_adi]) VALUES (2, N'Yatırımcı')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roller__604EFF73B1C79C3B]    Script Date: 28.12.2023 19:40:51 ******/
ALTER TABLE [dbo].[Roller] ADD UNIQUE NONCLUSTERED 
(
	[rol_adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Forum]  WITH CHECK ADD FOREIGN KEY([kullanici_id])
REFERENCES [dbo].[Kullanicilar] ([kullanici_id])
GO
ALTER TABLE [dbo].[Kullanicilar]  WITH CHECK ADD FOREIGN KEY([rol_id])
REFERENCES [dbo].[Roller] ([rol_id])
GO
ALTER TABLE [dbo].[Projeler]  WITH CHECK ADD FOREIGN KEY([kullanici_id])
REFERENCES [dbo].[Kullanicilar] ([kullanici_id])
GO
ALTER TABLE [dbo].[yatirimciler]  WITH CHECK ADD FOREIGN KEY([kullanici_id])
REFERENCES [dbo].[Kullanicilar] ([kullanici_id])
GO
ALTER TABLE [dbo].[yatirimciler]  WITH CHECK ADD FOREIGN KEY([sirket_id])
REFERENCES [dbo].[Ysirketler] ([sirket_id])
GO
ALTER TABLE [dbo].[Yatirimler]  WITH CHECK ADD FOREIGN KEY([yatirim_turu])
REFERENCES [dbo].[Yatirim_tur] ([yatirim_turu_id])
GO
USE [master]
GO
ALTER DATABASE [SonsuzHayal] SET  READ_WRITE 
GO
