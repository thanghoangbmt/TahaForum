USE [master]
GO
/****** Object:  Database [J3LP0004_SimpleBlog]    Script Date: 2/19/2020 12:24:02 PM ******/
CREATE DATABASE [J3LP0004_SimpleBlog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3LP0004_SimpleBlog', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\J3LP0004_SimpleBlog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'J3LP0004_SimpleBlog_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\J3LP0004_SimpleBlog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3LP0004_SimpleBlog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET  MULTI_USER 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET QUERY_STORE = OFF
GO
USE [J3LP0004_SimpleBlog]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2/19/2020 12:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Email] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Password] [nvarchar](200) NULL,
	[RoleID] [int] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 2/19/2020 12:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[ShortDescription] [nvarchar](200) NULL,
	[Content] [nvarchar](max) NULL,
	[AuthorEmail] [nvarchar](50) NULL,
	[PostingDate] [datetime] NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 2/19/2020 12:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[ArticleID] [int] NULL,
	[CommentatorEmail] [nvarchar](50) NULL,
	[CommentDate] [datetime] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/19/2020 12:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 2/19/2020 12:24:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [RoleID], [StatusID]) VALUES (N'anhtoan010@gmail.com', N'Toàn Hoàng', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, 2)
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [RoleID], [StatusID]) VALUES (N'garenackpno1@gmail.com', N'Th&#7855;ng Hoàng', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, 2)
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [RoleID], [StatusID]) VALUES (N'h3luvj@gmail.com', N'Th&#7855;ng Hoàng', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, 2)
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [RoleID], [StatusID]) VALUES (N'Nguyenthituongvy999@gmail.com', N'Vy Nguy&#7877;n', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, 2)
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [RoleID], [StatusID]) VALUES (N'songhuong150301@gmail.com', N'Song H&#432;&#417;ng', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, 2)
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [RoleID], [StatusID]) VALUES (N'thanghase130566@fpt.edu.vn', N'Admin', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 1, 2)
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [RoleID], [StatusID]) VALUES (N'thanghoang.bmt@gmail.com', N'Th&#7855;ng Hoàng', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, 2)
INSERT [dbo].[Accounts] ([Email], [Name], [Password], [RoleID], [StatusID]) VALUES (N'thanghoang1011@gmail.com', N'Th&#7855;ng Hoàng', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, 2)
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (1, N'Microsoft search revenue growth slows down', N'Microsoft just released its earnings for Q4 2019, and of note is Bing''s continuous slow down.', N'Growth for the quarter''s search advertising dropped to 6%, despite Microsoft''s effort to market Bing as a Google alternative. This could be attributed to the older Chakra-powered Edge browser, which has a usage share of about 6% (NetMarketShare, Nov 2019).

Are you using Bing instead of Google as your default search engine?', N'thanghoang1011@gmail.com', CAST(N'2020-01-31T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (6, N'There are 117 new emojis for launch this year', N'Emojipedia announced that the emoji list for 2020 is completed.', N'New additions include Bubble Tea, Smiling Face with Tear, bottle-feeding parents, and Transgender Flag. Also included are gender-neutral alternatives to Santa Claus and Mrs Claus, called Mx. Claus.', N'anhtoan010@gmail.com', CAST(N'2020-02-01T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (7, N'Google is working on better chatbots', N'Chatbots have a critical design flaw in that they are still incapable of engaging in genuine.', N'Cue in Maena, Google''s new chatbot model trained on "2.6 billion parameter end-to-end neural conversational model." Maena can conduct sensible conversations and respond with more accurate and specific answers than current bots.
Moreover, Google claims that Maena''s performance is close to human-levels of conversation, using an evaluation metric they call "Sensibleness and Specificity Average" or SSA.

We might soon have bots where we can converse akin to how Iron Man talks to his bots (J.A.R.V.I.S. and F.R.I.D.A.Y.).', N'thanghoang1011@gmail.com', CAST(N'2020-02-01T10:29:23.850' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (8, N'TikTok climbs abord the dark mode train', N'Social media guru Matt Navarra tweeted that TikTok has a new dark mode setting, and is now available', N'As with other apps, TikTok''s new dark mode will kick in either manually (user-activated) or match device settings.

Are you using TikTok?', N'thanghoang1011@gmail.com', CAST(N'2020-02-01T10:33:46.460' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (9, N'Microsoft: SEO is most important hard skill for marketers', N'Microsoft published a study which aims to identify the most important marketing trends this year.', N'Based on a LinkedIn poll with 600 senior marketer respondents, Microsoft identified the following hard skills as most important:
   1. SEO
   2. Data analysis
   3. Copywriting
   4. Behavioural analysis
   5. Automation', N'anhtoan010@gmail.com', CAST(N'2020-02-02T09:56:37.663' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (10, N'SEO - Still Worth it?', N'Dicuss about SEO', N'Hi

I am doing my own SEO for years. I go up and down on rankings. But over the past year i have noticed that even if i have the first position for all my relevant keyword, i don`t get a lot of organic traffic. The home page on google is overcrowded with information

4 adword listings
3 maps
Other searches
Wikipedia
SEO

I think people dont go that low on the home page. Any recommendations?

Floor Sanding Dublin', N'anhtoan010@gmail.com', CAST(N'2020-02-02T09:57:55.553' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (11, N'How much important is Article in driving new traffic?', N'Important of Article', N'Sometimes we read articles and sometimes we don''t read them.
Articles provides content on a particular topic.
So, we read them if we want to.

Does it help that much in generating traffic?
Let us know about your ideas on this.', N'anhtoan010@gmail.com', CAST(N'2020-02-02T09:59:06.187' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (12, N'Google My Business Reviews', N'Discuss', N'Hi

I got few bad reviews from people that i dont even know. No comment. Only 1 star. I asked google to remove it but they said that the review is not against google policy so it has to stay. What should i do?', N'songhuong150301@gmail.com', CAST(N'2020-02-02T10:08:30.227' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (13, N'How to get backlinks in 2020?', N'Backlinks', N'Wondering if anything has changed or will change in regards to getting backlinks. Some of the methods I''m aware of are broken link building, blog comments, social media engagement, guest posting, forum posts. Any new strategies or updates to existing strategies?', N'songhuong150301@gmail.com', CAST(N'2020-02-02T10:09:05.147' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (14, N'SMS marketing is something to look at this 2020', N'Text messaging. It''s arguably the fastest way to reach someone.', N'Need to catch up with a friend? You can quickly send them a text. Need to update your manager about a client who didn''t show up to a meeting? Send a text. Want to quickly reach your audience? Send them an SMS blast.

And according to an article from Entrepreneur, "SMS earns four times more revenue than email," while costing a lot less. Here are some key thoughts.', N'songhuong150301@gmail.com', CAST(N'2020-02-02T12:47:01.313' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (15, N'Are phone calls ESSENTIAL when you''re in the B2B sector?', N'Essential phone', N'Can a non-native English speaker sell his advertising services (B2B) via cold emailing without ever needing to make a call? He would completely rely on the written word to make sales. Would he succeed?

I''m willing to sell PPC services to gym owners& personal trainers.

Try it out or just forget about it and go selling my services on Fiverr?', N'songhuong150301@gmail.com', CAST(N'2020-02-02T12:47:42.070' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (16, N'SERP Same Position for 2 Months', N'SERP', N'Hey Warriors,

I have a medium competition keyword with search volume of 22000. It''s on the 3rd page for about two months. It''s not going up and keeps idle with its phrase related match keywords. Did off page with contextual backlinks and also acquired link from wikipedia tooo. But not moved up.. Then I optimized with on page metas, content structures nothing helps. Can anyone help me to improve my ranking better?', N'songhuong150301@gmail.com', CAST(N'2020-02-02T12:48:01.703' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (17, N'How To Build A Successful Company', N'Experence', N'Hi,


I heard a podcast with Tyler Haney about how she came up with her tide for her company (Outdoor Voices) and how she got it going.


I am 100% sure you will find it interesting and useful.


Interestingly? she did not come up with the idea that she wanted to make money but with the idea that sport outfits companies are not making clothes for a particular type of person.


If you''re new(ish) you can get a lot out of this interview.', N'songhuong150301@gmail.com', CAST(N'2020-02-02T12:57:58.347' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (18, N'Best Affiliate Networks? Clickbank still all the rage?', N'Most of my eggs are in the physical product basket.', N'I used to be all digital products, affiliate marketing, but it''s been a while since I''ve dabbled in it. I''d like to see if there''s still a buck to be made.

I had reasonable success in the past with ranking clickbank review videos and landing pages. I just did a quick Google Trends search for clickbank... interest hasn''t plummeted, but its dropped a little over 5 years.

Anyone here still making money promoting clickbank products?

Any other recommendations? Monthly recurring income. No MLM.', N'Nguyenthituongvy999@gmail.com', CAST(N'2020-02-02T12:59:21.003' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (19, N'Beating writer''s block', N'Discuss', N'Okay so I have a personal blog which has been, well, bare for about two years now. Back in its heyday, I''d write tons of stuff about edutech but now I''m in a point where even coming up with a title becomes like an endless game of chess. So yes, I have writer''s block.

Recently I tried writing with coffee, even some beer, to no avail.

How do you deal with it? Do you do motivational mantras and stuff? Any insights or advice?', N'Nguyenthituongvy999@gmail.com', CAST(N'2020-02-02T12:59:45.597' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (20, N'Help to select domain name', N'Question', N'Hello, I have a question to make sure I am doing correctly. My question is, can I choose a domain name starting with the word "warrior"? I just want to know about any legal issues or rules, as warriorforum and warriroplus are big platforms. So is there any problem?
It will be a digital product like PLR, MRR kind of site. Please help me in this area. Thanks in advance.', N'Nguyenthituongvy999@gmail.com', CAST(N'2020-02-02T13:00:10.847' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (21, N'This is why you are stuck -->', N'If you are reading this post, I want to let know you are not alone in being stuck in business', N'Hello fellow Warriors!

If you are reading this post, I want to let know you are not alone in being stuck in business and/or life. I''m sure you''ve read countless articles and watched hours of videos on tactics to being productive. The key word in that sentence was tactics, which suggests those are all surface level ways for those with a healthy personality. Being stuck right now means there''s a misfire in your cognitive processing, which then means you do not have a healthy personality. How are all those tactics suppose to effectively work? They can''t, at least not for the long term.

So, what is cognitive processing in relation to your personality? In short, I''m referencing your personality type (MBTI) and the respective cognitive functions. We''re all familiar with what the 16 personality types are, and you may even know your type; however, what most of us don''t know is that there''s a cognition processing order that creates each specific type. We''re like cars, and like cars there''s a specific wiring order for the engine to run properly. There are 8 cognitive functions, specifically arranged, and are identified as introverted or extroverted and perceiving or judgement. Of the 8, we have a 4 primary set and a 4 shadow set; in other terms, think of a the first 4 as processors and the shadow 4 as cogs that move the information.

Okay, now to get into the science of how the cognitive process is causing you to become stuck. Think of a car and in this car you have the Driver, Parent 2, 2 yr old (behind driver) and a teen behind parent 2. In a normal healthy personality, the flow of data processing starts with the driver -> parent 2 -> 2yr old -> teenager. The driver is dominate and the teenager is inferior (less attention). In an unhealthy process, the 2 yr old starts throwing a temper and starts to distract the driver instead of playing with the teenager. And so, less communication is going to parent 2 and no communication is going to the teenager. In fact, the teenager is tuning everything out! And now you are stuck in a loop from Driver to 2 year old with parent 2 trying to manage.

How do you break this loop? Earlier I mentioned 4 shadow processes and of the 4 the 7th position is the communicator from 2yr old to teenager (position 3 to 4). The 7th position is a very weak position because a 2 yr old is trying to communicate to an unenthused teenager. All you have to do is become consciously aware of your blind spot and intentionally build that communicator up. And as a secondary, the parent 2 position should be strengthen to help better mitigate any future loops.', N'Nguyenthituongvy999@gmail.com', CAST(N'2020-02-02T13:01:47.410' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (22, N'Engaging content for sales funnel', N'Recommend !', N'Can someone please recommend the places from where to get good quality and engaging content used in email sales funnel for promoting aff products like clickbank and jvzoo.

Are there any automated tools also available that can do the same without having the need for hiring content writers.', N'Nguyenthituongvy999@gmail.com', CAST(N'2020-02-02T13:03:11.517' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (23, N'Google Ads mistakes to avoid', N'Not removing the "Unknown" category from Age, Gender, and Household Income', N'One of the most baffling experiences with Google Ads is paying for, well, bot visits to your site. And no, bots do not buy products despite recent advances in AI. Any bot visiting your site is wasted ad spend. However, you can mitigate and filter bot traffic.

Remove the "Unknown" category from Age, Gender, and Income as bots unlike have recorded demographic information.', N'Nguyenthituongvy999@gmail.com', CAST(N'2020-02-02T13:03:43.443' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (24, N'Lets Talk EAT', N'After a long absence from the Warriorforum, I have now returned to talk about the EAT aspect of SEO.', N'This is clearly the "new SEO" and what is working for big websites.

After reading tons of articles they all seem to say the same thing. You need to become an authority by becoming a known expert in your field through various ways.

But, I have yet to come across any information showing technical aspects of this.

For example, many of these articles mention you need to have an author bio on your articles, and the author needs to be a known expert. You need to show this off by linking out to sources that prove this? I dont quite get that.

So are we suppose to have outbound links in the bio box? How many links? To what sites?

They also say we need to have an about us page. Fine, but what information EXACTLY needs to be on this page for it to increase your EAT? Linking out to who? Showing proof how?

Its all kind of weird.

Can anyone explain the specifics on this EAT aspect of SEO?', N'Nguyenthituongvy999@gmail.com', CAST(N'2020-02-02T13:04:30.217' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (25, N'NASA Scientists Confirm Water Vapor on Europa', N'https://www.nasa.gov/feature/goddard...apor-on-europa', N'NASA''s Goddard Space Flight Center in Greenbelt, Maryland, has detected the water vapor for the first time above Europa''s surface. The team measured the vapor by peering at Europa through one of the world''s biggest telescopes in Hawaii.', N'Nguyenthituongvy999@gmail.com', CAST(N'2020-02-02T13:06:51.420' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (26, N'FUHCM: THÔNG BÁO:', N'KÉO DÀI THỜI GIAN TẠM NGHỈ CHO SINH VIÊN ĐẠI HỌC FPT TP.HCM', N'Theo chỉ đạo của UBND TP.HCM trước ảnh hưởng lớn từ dịch bệnh nCov, Đại học FPT thông báo đến toàn thể phụ huynh, sinh viên, học viên về việc kéo dài thời gian nghỉ đến hết ngày 16/02/2020.

Trong thời gian nghỉ, sinh viên tiếp tục các biện pháp bảo vệ sức khỏe và phòng chống bệnh Viêm đường hô hấp cấp cho bản thân và gia đình để có sức khỏe tốt nhất trở lại trường học.

Trân trọng thông báo.

TRƯỜNG ĐẠI HỌC FPT
         P.CTSV', N'thanghoang1011@gmail.com', CAST(N'2020-02-08T23:58:58.070' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (27, N'iPhone 9 sẽ ra mắt cuối tháng 3, giá từ 399 USD', N'Nhiều nguồn tin cho biết iPhone 9 sẽ có ngoại hình tương tự iPhone 8', N'9to5mac dẫn một nguồn tin từ Đức cho biết iPhone 9 sẽ được Apple giới thiệu tại một sự kiện của hãng diễn ra vào ngày 31/3 sắp tới. Model này cũng sẽ được nhanh chóng bán ra thị trường vào ngày 3/4.

Những thông tin rò rỉ trước đây cho biết model này có kiểu dáng và kích thước tương đương iPhone 8, với màn hình 4,7 inch và bảo mật vân tay Touch ID. Máy cũng chỉ có một camera ở mặt lưng.

Nhà phân tích Ming-Chi Kuo từng tiết lộ máy sẽ được trang bị con chip A13 cùng dung lượng RAM 3 GB, bộ nhớ trong tùy chọn 64/128 GB. Đây là bộ xử lý mới nhất được Apple sử dụng trên những chiếc iPhone 11 và 11 Pro.

Ngoài ra, iPhone 9 sẽ được bán ra với 3 tùy chọn màu sắc gồm bạc, xám và đỏ. Kuo cũng đưa ra dự đoán, phiên bản cấu hình thấp nhất sẽ có giá 399 USD. iPhone 9 sẽ nhắm vào các thị trường mới nổi như Ấn Độ. Tuy nhiên, Apple vẫn có thể bán máy tại thị Mỹ và Anh.

Để cắt giảm chi phí sản xuất, iPhone 9 sẽ bị loại bỏ 3D Touch. Trên thực tế, Apple đã ngừng sử dụng công nghệ này trên bộ 3 iPhone 11 vừa ra mắt và thay thế bằng tính năng có tên gọi Haptic Touch.

Năm 2019, Apple từng tổ chức sự kiện vào tháng 3 để giới thiệu hàng loạt dịch vụ như Apple News+, Apple Card hay Apple Arcade. Vì thế, tại sự kiện này, hãng cũng được kỳ vọng sẽ mang đến những sản phẩm mới như phiên bản nâng cấp của iPad Pro, thẻ AirTags...', N'thanghoang1011@gmail.com', CAST(N'2020-02-18T11:56:49.133' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (28, N'Bphone 4 sắp ra mắt', N'Dự kiến Bphone 4 sẽ được Bkav trình làng vào tháng 3. Sự kiện có số lượng khách mời hạn chế', N'Sáng ngày 18/2, CEO Nguyễn Tử Quảng đã xác nhận thông tin ra mắt Bphone 4 trên nhóm kín với hơn 50.000 thành viên.

“Bphone 4 sẽ ra mắt vào Tháng 3. Hơn 2/3 Bfans tham gia khảo sát mong muốn Bphone ra mắt theo đúng kế hoạch. Rất nhiều ý kiến góp ý nhiệt tình và hữu ích. Mình thực sự cảm nhận được tình cảm và sự mong đợi của các bạn như thế nào. Thực sự cảm động”

“Tuy nhiên dịch viêm phổi cấp covid-19 đang ở trong tầm kiểm soát. Theo dự đoán, sang tháng 3 tình hình sẽ khá hơn. Sự kiện sẽ được tổ chức với phong cách hiện đại, công nghệ, số lượng khách mời hạn chế, nhưng sẽ được livestream thật rộng rãi để các bạn có thể theo dõi. Chúng ta hãy cùng chờ đón thành quả của đội ngũ các kỹ sư Bkav, cũng như chính các bạn với những góp ý nhiệt tình trong suốt hơn 1 năm qua”, CEO Nguyễn Tử Quảng viết.', N'thanghoang1011@gmail.com', CAST(N'2020-02-18T11:57:41.713' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (29, N'Các hãng điện thoại quay cuồng trong đại dịch virus corona', N'Ước tính sản lượng smartphone quý I/2020 tại Trung Quốc sẽ giảm 50% so với cùng kỳ năm ngoái.', N'Ngày 13/2 vừa qua, Xiaomi đã trở thành nhà sản xuất smartphone Trung Quốc đầu tiên tổ chức sự kiện ra mắt sản phẩm mới theo hình thức online trong bối cảnh virus viêm phổi chủng corona mới đang diễn biến khó lường.

Lei Jun, đồng sáng lập kiêm CEO Xiaomi sinh ra tại Hồ Bắc, sau đó theo học Đại học Vũ Hán từ 1987 đến 1991. Đây cũng là nơi khởi phát dịch bệnh Covid-19 đang trở thành mối nguy hại trên toàn cầu. Ông đã xúc động khi bước lên sân khấu sự kiện được tường thuật trực tiếp trên khắp thế giới.

"Vũ Hán là thành phố của những anh hùng. Người Vũ Hán rất dũng cảm, tự tin và luôn lạc quan... Cuộc sống có thể bị đảo lộn bởi dịch bệnh, nhưng chúng tôi quyết không khuất phục", CEO Xiaomi chia sẻ trong khi đeo khẩu trang, rớm nước mắt.', N'thanghoang1011@gmail.com', CAST(N'2020-02-18T12:00:02.210' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (32, N'Văn Hậu ghi dấu giày giúp Jong Heerenveen thắng Venlo', N'Đoàn Văn Hậu mở bóng, phát động tấn công bên phần sân nhà giúp tiền đạo Rein Smit ấn định tỷ số 2-0 cho Jong Heerenveen trước VVV Venlo ở phút cuối cùng của trận đấu.', N'Rạng sáng 18/2 (giờ Hà Nội), Jong Heereveen có trận đấu trên sân nhà tiếp đón VVV Venlo ở vòng 5 giải đấu dành cho các đội trẻ tại Hà Lan. Đoàn Văn Hậu tiếp tục được HLV Ronnie Pander tin tưởng trao cơ hội đá chính.

Hậu vệ tuyển Việt Nam một lần nữa được thử sức đá vị trí trung vệ, mang áo số 4 quen thuộc ở đội trẻ. Jong Heerenveen, với lợi thế sân nhà, nhập cuộc chủ động và tạo ra thế trận lấn lướt.

Phút 17, Arjen Van Der Heide đưa được bóng vào lưới của Venlo nhưng bàn thắng bị từ chối do lỗi việt vị. Dù vậy, chủ nhà Heerenveen không phải đợi quá lâu để có bàn mở tỷ số. Phút 31, Runar Espejord dứt điểm ở góc hẹp, hạ gục thủ môn Antunic.

Đoàn quân của HLV Pander suýt chút nữa nâng tỷ số lên thành 2-0 sau khi Rein Smit có tình huống đối mặt với thủ môn đối phương. 45 phút đầu tiên kết thúc với tỷ số 1-0 nghiêng về Heerenveen. Hàng thủ đội chủ nhà có hiệp đầu tiên thi đấu khá nhàn nhã.

Sang hiệp 2, Jong Heerenveen tiếp tục nắm giữ thế trận. Phút 55, Đoàn Văn Hậu có pha chuyền bóng chuẩn xác cho Alen Halilovic để mở ra cơ hội tấn công. Tuy nhiên, Brujin không thắng được thủ môn của Venlo.

Hàng thủ của Venlo liên tục chao đảo trước sức ép của đội chủ nhà, nhưng cơ hội lần lượt trôi qua. Ở phút thi đấu chính thức cuối cùng, Jong Heerenveen mới có bàn nhân đôi cách biệt.

Xuất phát từ pha phát động tấn công của Văn Hậu, Rein Smit nhận được bóng từ đồng đội, dứt điểm hiểm hóc khiến thủ môn Antunic lần thứ 2 vào lưới nhặt bóng.

Trận đấu kết thúc với chiến thắng 2-0 cho Jong Heerenveen. 3 điểm có được giúp thầy trò HLV Pander vươn lên vị trí thứ 2 trên bảng xếp hạng với 3 trận toàn thắng, kém đội dẫn đầu Groningen 2 điểm nhưng thi đấu ít hơn 2 trận. Jong Heerenveen đang là đội duy nhất toàn thắng ở giải đấu này.', N'thanghoang1011@gmail.com', CAST(N'2020-02-18T12:04:03.610' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (33, N'Bruno Fernandes ghi dấu giúp MU thắng Chelsea 2-0', N'Tiền vệ người Bồ Đào Nha kiến tạo cho Harry Maguire ghi bàn quyết định giúp MU đánh bại Chelsea ở trận đấu thuộc vòng 26 Premier League diễn ra rạng sáng 18/2.', N'MU và Chelsea bước vào trận đấu thuộc vòng 26 mà không có sự phục vụ của những tiền đạo cắm tốt nhất. Trước đối thủ được đánh giá cao, Man Utd vẫn trung thành với lối chơi phòng ngự phản công ưa thích. Để đáp lại, HLV Lampard chỉ đạo học trò đẩy cao đội hình, chơi áp sát ngay trên phần sân của đối thủ.

Chelsea sớm chịu tổn thất về lực lượng khi Kante phải rời sân ở phút 13. Tuy nhiên đội chủ nhà vẫn tạo ra những pha lên bóng sắc nét để xuyên thủng hang phòng ngự đội khách. Cơ hội nhiều lần mở ra nhưng Michy Batshuayi lại gây thất vọng bằng những pha đưa bóng đi không trúng đích.
Sau quãng thời gian cầm bóng và thực hiện nhiều đường chuyền ngắn và trung bình, phút 45, MU bất ngờ đổi phương án tấn công và ngay lập tức mang lại hiệu quả. Từ quả tạt của Wan-Bissaka, Anthony Martial băng vào đánh đầu hiểm hóc không cho Caballero cơ hội cản phá. Hiệp đấu đầu tiên khép lại với lợi thế tạm nghiêng về đội khách.

Kịch tính được đẩy lên ở ngay đầu hiệp 2. Chelsea đẩy cao đội hình gây sức ép. Eric Bailly vừa trở lại sau chấn thương nhưng lại có nhiều pha xử lý mạo hiểm khiến khung thành đội nhà chao đảo.

Phút 56, Chelsea có bàn gỡ hòa sau tình huống dứt điểm gọn gàng của Kurt Zouma. Tuy nhiên bàn thắng không được công nhận do VAR phát hiện Azpilicueta đã đẩy ngã hậu vệ đội khách khi tham gia tấn công. Chỉ 7 phút sau, MU sớm có câu trả lời bằng một tình huống đá phạt đưa bóng đi dội cột.

CĐV đội khách không phải tiếc nuối lâu khi MU có bàn nâng tỷ số lên 2-0 ở phút 66. Từ quả đá phạt góc của Bruno Fernandes, Maguire bật cao đánh đầu đánh bại thủ thành Caballero.

Sau bàn thua thứ 2, HLV Lampard rút Batshuayi ra nghỉ để thay bằng Giroud. Tiền đạo người Pháp chỉ cần cú dứt điểm đầu tiên để làm tung mành lưới Man Utd ở phút 77. Tuy nhiên VAR một lần nữa vào cuộc và tước đi bàn thắng của đội chủ nhà vì lỗi việt vị.

Nỗ lực trong những phút cuối trận không thể giúp Chelsea tìm bàn rút ngắn tỷ số. Phút 88, Mason Mount tung cú sút phạt hiểm hóc nhưng bóng lại đi dội cột trong sự tiếc nuối của người hâm mộ.

Tân binh Odion Ighalo của MU vào sân ở phút 90 thay Anthony Martial và suýt chút nữa đã có thể ghi bàn. Trận đấu khép lại với thắng lợi 2-0 dành cho Man Utd. Kết quả này khiến cuộc đua top 4 thêm phần gay cấn khi khoảng cách giữa đội đứng thứ 4 và thứ 7 chỉ là 3 điểm.', N'thanghoang1011@gmail.com', CAST(N'2020-02-18T12:04:55.107' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (34, N'FIFA, AFC điều tra 8 cầu thủ Myanmar vì nghi bán độ', N'Trận thua đậm 0-7 của Myanmar trước Kyrgyzstan ở Vòng loại World Cup khiến hai tổ chức bóng đá FIFA và AFC phải vào cuộc điều tra.', N'Trang Eleven Myanmar dẫn lời Chủ tịch Liên đoàn Bóng đá Myanmar, ông Zaw Zaw nói về cuộc điều tra của FIFA và AFC: "Đây là hoạt động bình thường của FIFA khi tỷ số một vài trận đấu có khoảng cách quá lớn. Chúng tôi đã hỗ trợ cuộc điều tra này. FIFA vẫn thường làm vậy".

Các quan chức FIFA và AFC đã tới Myanmar để tiến hành cuộc điều tra. Dù kết quả điều tra chưa được công bố, thông tin này đang gây rúng động trong khu vực.

"Những cuộc điều tra dàn xếp tỷ số, bán độ diễn ra khắp thế giới. Chúng tôi chưa thể nói gì khi chưa chắc chắn. Theo luật thì họ được điều tra bất cứ người nào bị tình nghi. Nếu chúng tôi tìm được người chịu trách nhiệm thì sẽ có thông báo", ông Zaw Zaw nói.

Myanmar để thua 0-7 trên sân của Kyrgyzstan ở loạt trận Vòng loại World Cup 2022 diễn ra vào ngày 10/10/2019. 8 cầu thủ Myanmar bị triệu tập để làm rõ các nghi vấn cùng với các đoạn video thi đấu. Cuộc điều tra đã hoàn tất nhưng chưa có kết quả.

"Cuộc điều tra không liên quan đến MFF. FIFA và AFC có thủ tục riêng của họ", người đứng đầu Liên đoàn Bóng đá Myanmar (MFF) cho hay.

CĐV Myanmar đã rất phẫn nộ với thành tích thảm họa này của đội nhà. Họ chỉ trích nặng nề "thất bại nhục nhã" này. HLV người Montenegro, ông Miodrag Radulovic bị sa thải chỉ sau 6 tháng làm việc.

Myanmar nằm ở bảng F cùng với Nhật Bản (12 điểm), Kyrgyzstan (7 điểm), Tajikistan (7 điểm), Mông Cổ (6 điểm). Myanmar có 6 điểm sau 5 lượt trận, đứng thứ 4.', N'thanghoang1011@gmail.com', CAST(N'2020-02-18T12:06:52.933' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (37, N'1', N'1', N'1', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (38, N'2', N'2', N'2', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (39, N'3', N'3', N'3', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (40, N'4', N'4', N'4', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (41, N'5', N'5', N'5', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (42, N'6', N'6', N'6', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (43, N'7', N'7', N'7', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (44, N'8', N'8', N'8', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (45, N'9', N'9', N'9', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (46, N'10', N'10', N'10', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (47, N'11', N'11', N'11', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (48, N'12', N'12', N'12', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (49, N'13', N'13', N'13', N'thanghoang1011@gmail.com', CAST(N'2020-01-18T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (50, N'Haaland gây sốt với màn chạy dọc sân trong 10 giây', N'Tiền đạo người Na Uy thể hiện khả năng chạy nước rút như một vận động viên điền kinh trong trận đấu giữa Dortmund và PSG rạng sáng 19/2.', N'Tình huống diễn ra ở phút 14. Erling Haaland là tiền đạo cắm nhưng đã lùi sát về khung thành và cản phá thành công một pha treo bóng từ đội khách PSG. Cơ hội phản công cũng đến với Dortmund ngay sau tình huống giải nguy của tiền đạo người Na Uy.

Haaland cũng nhận thấy điều này. Từ đường biên ngang ở sân nhà, sao trẻ sinh năm 2000 ngay lập tức tăng tốc để cùng đồng đội tấn công. Khi Haaland bắt đầu bứt tốc, đồng hồ đang ở 13 phút 36 giây. Và chỉ cần 10 giây sau, chân sút này đã áp sát vùng cấm PSG.

Tuy nhiên, Jadon Sancho đã phung phí nỗ lực của đồng đội bằng một cú dứt điểm từ xa đưa bóng đi không trúng đích.

Màn bứt tốc của Haaland được CĐV chia sẻ trên mạng xã hội, nhiều fan đã so sánh những bước chạy của tiền đạo 19 tuổi này với vận động viên điền kinh Usain Bolt.

"Usain Bolt chắc cũng chỉ chạy được như Haaland trong pha phản công này", tài khoản Norfbl nhận xét.

"Haaland quá nhanh dù sở hữu thân hình cồng kềnh", người dùng Reece thán phục. Tiền đạo của Dortmund sở hữu chiều cao lên đến 1,94 m cùng cân nặng 87 kg.

Không chỉ sở hữu những bước chạy thần tốc, Haaland còn tiếp tục chứng tỏ duyên ghi bàn ở đấu trường Champions League. Chân sút sinh năm 2000 ghi cả 2 bàn thắng giúp Dortmund đánh bại PSG với tỷ số 2-1, qua đó nắm lợi thế trước khi bước vào trận lượt về trên đất Pháp.', N'thanghoang1011@gmail.com', CAST(N'2020-02-19T11:45:31.910' AS DateTime), 2)
INSERT [dbo].[Articles] ([ID], [Title], [ShortDescription], [Content], [AuthorEmail], [PostingDate], [StatusID]) VALUES (51, N'Honda Giorno về Việt Nam - xe ga nhỏ gọn, tiêu thụ 1,25 lít/100 km', N'Giorno là mẫu xe ga nội địa Nhật Bản có khối lượng 81 kg. Xe sử dụng động cơ 50 cc, tích hợp hệ thống ngắt động cơ tạm thời.', N'Một cửa hàng bán xe máy tại TP.HCM vừa mang về mẫu xe tay ga nhỏ gọn Honda Giorno, phiên bản được mang về được sản xuất vào năm 2018. Nhìn tổng thể, Honda Giorno có kiểu dáng thời trang với các đường nét uốn lượn mềm mại.
Nhìn từ phía trước, chiếc xe nổi bật với dãy đường viền hình chữ U màu đỏ ôm trọn yếm xe. Ở phía trên là cụm đèn chiếu sáng được làm lồi ra, 2 bên là đèn báo rẽ với thiết kế nhỏ gọn. Xe có khối lượng chỉ 81 kg.
Honda chỉ trang bị cho Giorno hệ thống phanh đùm ở phía trước. Mâm xe có kích thước 10 inch với bánh trước và sau đều là 80/100.
Thiết kế trẻ trung, năng động của Honda Giorno dễ dàng nhận thấy với các họa tiết chấm bi dọc theo xe. Cụm đồng hồ cũng được làm đầy màu sắc và chỉ hiển thị thông tin cơ bản như tốc độ, odo, lượng xăng còn lại...', N'thanghoang1011@gmail.com', CAST(N'2020-02-19T12:10:55.947' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Articles] OFF
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([ID], [Content], [ArticleID], [CommentatorEmail], [CommentDate]) VALUES (4, N'Nice!', 25, N'thanghoang1011@gmail.com', CAST(N'2020-02-03T13:45:32.663' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Content], [ArticleID], [CommentatorEmail], [CommentDate]) VALUES (9, N'I love this post!', 25, N'anhtoan010@gmail.com', CAST(N'2020-02-03T13:55:14.073' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Content], [ArticleID], [CommentatorEmail], [CommentDate]) VALUES (10, N'Hello!', 24, N'anhtoan010@gmail.com', CAST(N'2020-02-03T13:55:41.610' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Content], [ArticleID], [CommentatorEmail], [CommentDate]) VALUES (16, N'Hello!', 22, N'thanghoang1011@gmail.com', CAST(N'2020-02-08T23:58:10.033' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Content], [ArticleID], [CommentatorEmail], [CommentDate]) VALUES (19, N'Phê :D', 26, N'thanghoang1011@gmail.com', CAST(N'2020-02-18T11:55:25.387' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Content], [ArticleID], [CommentatorEmail], [CommentDate]) VALUES (20, N'Hello', 34, N'thanghoang.bmt@gmail.com', CAST(N'2020-02-18T23:26:39.807' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Content], [ArticleID], [CommentatorEmail], [CommentDate]) VALUES (21, N'Hello', 29, N'thanghoang1011@gmail.com', CAST(N'2020-02-19T11:45:42.740' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Content], [ArticleID], [CommentatorEmail], [CommentDate]) VALUES (22, N'Dortmund!!!', 50, N'thanghoang1011@gmail.com', CAST(N'2020-02-19T12:11:23.507' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([ID], [Description]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([ID], [Description]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [Description]) VALUES (1, N'New')
INSERT [dbo].[Status] ([ID], [Description]) VALUES (2, N'Actived')
INSERT [dbo].[Status] ([ID], [Description]) VALUES (3, N'Deleted')
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Account_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Account_Status]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Accounts] FOREIGN KEY([AuthorEmail])
REFERENCES [dbo].[Accounts] ([Email])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Accounts]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Status] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Status]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Accounts] FOREIGN KEY([CommentatorEmail])
REFERENCES [dbo].[Accounts] ([Email])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Accounts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Articles] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Articles] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Articles]
GO
USE [master]
GO
ALTER DATABASE [J3LP0004_SimpleBlog] SET  READ_WRITE 
GO
