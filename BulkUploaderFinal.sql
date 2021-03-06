USE [Test]
GO
/****** Object:  Table [dbo].[BU_AMS_Master]    Script Date: 3/26/2019 5:24:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_AMS_Master](
	[Auto_Id] [int] IDENTITY(1,1) NOT NULL,
	[Excel_Id] [int] NULL,
	[Date] [date] NULL,
	[Day] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[StartDate] [varchar](50) NULL,
	[EndDate] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Inserted_By] [nvarchar](50) NULL,
	[Inserted_On] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_Configuration]    Script Date: 3/26/2019 5:24:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_Configuration](
	[ConfigurationName] [nvarchar](50) NOT NULL,
	[ConfigurationValue] [nvarchar](200) NULL,
	[Status] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_Entity_Master]    Script Date: 3/26/2019 5:24:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_Entity_Master](
	[EntityId] [int] IDENTITY(1,1) NOT NULL,
	[ExactName] [varchar](200) NULL,
	[NameToBeUpload] [varchar](200) NULL,
	[SheetName] [nvarchar](50) NULL,
	[IsElimCategory] [bit] NULL,
	[SessionId] [int] NULL,
	[Status] [bit] NULL,
	[Inserted_On] [datetime] NULL,
	[Inserted_By] [varchar](50) NULL,
	[Updated_On] [datetime] NULL,
	[Updated_By] [varchar](50) NULL,
 CONSTRAINT [PK_BC_Entity_Master] PRIMARY KEY CLUSTERED 
(
	[EntityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_Exception_Detail]    Script Date: 3/26/2019 5:24:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_Exception_Detail](
	[ExceptionCode] [int] NOT NULL,
	[Message] [varchar](500) NULL,
	[ProcessingStep] [varchar](500) NULL,
	[Reason] [varchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_BC_Exception_Detail] PRIMARY KEY CLUSTERED 
(
	[ExceptionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_Session]    Script Date: 3/26/2019 5:24:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_Session](
	[SessionId] [int] NOT NULL,
	[Year] [varchar](20) NOT NULL,
	[Status] [tinyint] NOT NULL,
	[ProcessedOn] [datetime] NULL,
	[Exception] [int] NULL,
	[ProcessingComments] [varchar](200) NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_BC_Session] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_Status]    Script Date: 3/26/2019 5:24:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_Status](
	[StatusID] [tinyint] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_BC_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BU_Uploader]    Script Date: 3/26/2019 5:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BU_Uploader](
	[AutoId] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [varchar](200) NULL,
	[SheetName] [varchar](200) NULL,
	[TableName] [varchar](200) NULL,
	[Year] [int] NULL,
	[Month] [nvarchar](50) NULL,
	[SessionId] [int] NULL,
	[StatusId] [tinyint] NULL,
	[ProcessedOn] [datetime] NULL,
	[ExceptionCode] [int] NULL,
	[ProcessingComments] [varchar](500) NULL,
	[AttemptNo] [tinyint] NULL,
	[Comments] [varchar](500) NULL,
	[InsertedOn] [datetime] NULL,
	[InsertedBy] [varchar](50) NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_BU_Uploader] PRIMARY KEY CLUSTERED 
(
	[AutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'FolderPath', N'C:\Projects\BulkUploader\ExcelFolder', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'FolderName', N'InputFile', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'NovMonth', N'-1', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'DecMonth', N'-2', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'PrcoessedFilePath', N'Processed', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'UnPrcoessedFilePath', N'UnProcessed', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'IsNeedSheetName', N'No', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'IsRequireReProcessPass', N'No', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'IsNeedEntityID', N'Yes', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'ElimYes', N'\Elim Entity\', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'ElimNo', N'\Non Elim Entity\', 1)
INSERT [dbo].[BU_Configuration] ([ConfigurationName], [ConfigurationValue], [Status]) VALUES (N'ExceptionFilePath', N'\Exception\', 1)
INSERT [dbo].[BU_Session] ([SessionId], [Year], [Status], [ProcessedOn], [Exception], [ProcessingComments], [InsertedOn], [InsertedBy], [UpdatedOn], [UpdatedBy]) VALUES (2019, N'2019', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
ALTER TABLE [dbo].[BU_Entity_Master] ADD  CONSTRAINT [DF_BC_Entity_Master_Inserted_On]  DEFAULT (getdate()) FOR [Inserted_On]
GO
/****** Object:  StoredProcedure [dbo].[USP_BU_AMS_INSERT_MASTER]    Script Date: 3/26/2019 5:24:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
-- execute  [USP_BU_AMS_INSERT_MASTER] 'BU_TEMP_2019_InputFile_BAMSFile_Sheet1', 'SDEASVH'
CREATE PROCEDURE [dbo].[USP_BU_AMS_INSERT_MASTER] 
	(
	@TableName NVARCHAR(500)     = '',
	@HostName nvarchar(50)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	
	declare @sqlQuery varchar(max) ='';
	declare @AutoID int;
SET NOCOUNT ON;
    -- Insert Details into Maste Table from Temp Table
	set @sqlQuery='INSERT INTO BU_AMS_Master([Date] ,[Day],[Status],[StartDate],[EndDate],[Time]) 
	SELECT * FROM ['+ @TableName +']'
	-- Execute @sqlQuery
	execute (@sqlQuery);


	--Update TempTable ID into Main Table
	
	SET @AutoID= (SELECT Top(1) AutoID FROM BU_Uploader WHERE [TableName] like @TableName ORDER BY InsertedOn DESC);

	UPDATE BU_AMS_Master SET [Excel_Id] =@AutoID,Inserted_By=@HostName, Inserted_On=GetDate() WHERE [Excel_Id] is NULL;

	


END
GO
/****** Object:  StoredProcedure [dbo].[USP_BU_Configuration_Get]    Script Date: 3/26/2019 5:24:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<AMIT RAJAWAT>
-- Create date: <2/9/2019>
-- Description:	<Description,,>
-- =============================================
--EXEC [USP_BulkUploader_Configuration_Get] 'FolderPath'
CREATE PROCEDURE [dbo].[USP_BU_Configuration_Get]
	@ConfigurationName nvarchar(100)
AS
BEGIN
	SELECT TOP (1) 
	ConfigurationValue
	FROM BU_Configuration 
	WHERE
	ConfigurationName=@ConfigurationName 
	AND Status=1
END
GO
/****** Object:  StoredProcedure [dbo].[USP_BU_DropTempTableBulkInsert]    Script Date: 3/26/2019 5:24:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Amit Rajawat>
-- Create date: <2/10/2019>
-- Description:	<Description,,>
-- =============================================
-- 
-- execute  [USP_BU_DropTempTableBulkInsert] 'TempTable2'

CREATE PROCEDURE [dbo].[USP_BU_DropTempTableBulkInsert]                                                
   (                         
     @TableName NVARCHAR(500)     = '' 
    
      )                                                          
AS                                                                  
BEGIN 
	 declare @sqlQuery varchar(max) =''  
	 set @sqlQuery ='DROP TABLE [' +@TableName +']'
-- PRINT @sqlQuery
 execute (@sqlQuery)
  END

GO
/****** Object:  StoredProcedure [dbo].[USP_BU_Uploader_Get]    Script Date: 3/26/2019 5:24:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Amit Rajawat>
-- Create date: <02/09/2019>
-- Description:	<Description,,>
-- =============================================
-- 
-- execute  [[USP_BU_Uploader_Get]] '2018'
-- select * from BU_Uploader
CREATE PROCEDURE [dbo].[USP_BU_Uploader_Get]                                                
   (  
     @SessionId NVARCHAR(100)     = ''      
      )                                                          
AS   
BEGIN 
  SELECT [AutoId]
      ,[FileName]
      ,[SheetName]
      ,[TableName]
      ,[Year]
      ,[Month]
      ,[SessionId]
      ,[StatusId]
      ,[ProcessedOn]
      ,[ExceptionCode]
      ,[ProcessingComments]
      ,[AttemptNo]
      ,[Comments]
      ,[InsertedOn]
      ,[InsertedBy]
      ,[UpdatedOn]
      ,[UpdatedBy]
  FROM [dbo].[BU_Uploader]
WHERE [SessionId]=@SessionId

END
GO
/****** Object:  StoredProcedure [dbo].[USP_BU_Uploader_Insert]    Script Date: 3/26/2019 5:24:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Amit Rajawat>
-- Create date: <02/10/2019>
-- Description:	<Description,,>
-- =============================================
-- 
-- execute  [USP_BU_Uploader_Insert] 'FolderPath'
-- select * from BU_Uploader
CREATE PROCEDURE [dbo].[USP_BU_Uploader_Insert]                                                
   (                         
     @FileName NVARCHAR(100)     = '' 
     ,@SheetName NVARCHAR(100)     = '' 
      ,@TableName NVARCHAR(100)     = '' 
        ,@Year NVARCHAR(100)     = '' 
          ,@Month NVARCHAR(100)     = '' 
          ,@SessionId NVARCHAR(100)     = ''          
          ,@StatusId NVARCHAR(100)     = ''          
          ,@ExceptionCode NVARCHAR(100)     = '' 
          ,@ProcessingComments NVARCHAR(100)     = ''
          ,@InsertedBy NVARCHAR(100)     = ''
    
      )                                                          
AS   
BEGIN 
  IF EXISTS (SELECT * FROM [dbo].[BU_Uploader] WHERE FileName=@FileName AND Year=@Year AND Month=@Month AND SessionId=@SessionId) 
  BEGIN
  UPDATE [dbo].[BU_Uploader] 
  SET AttemptNo=AttemptNo+1, Comments='Same file, year and month already process for  this session', UpdatedBy=@InsertedBy ,UpdatedOn=GETDATE()
  WHERE FileName=@FileName AND Year=@Year AND Month=@Month AND SessionId=@SessionId 
  END
ELSE                                                            
BEGIN 
INSERT INTO [dbo].[BU_Uploader]
           ([FileName]
           ,[SheetName]
           ,[TableName]
           ,[Year]
           ,[Month]
           ,[SessionId]
           ,[StatusId]
           ,[ProcessedOn]
           ,[ExceptionCode]
           ,[ProcessingComments]
           ,[InsertedOn]
           ,[InsertedBy]
          )
     VALUES
           (@FileName
           ,@SheetName
           ,@TableName
           ,@Year
           ,@Month
           ,(select SessionId from dbo.BU_Session where Year=@SessionId)
           ,@StatusId
          ,GETDATE()
           ,@ExceptionCode
           ,@ProcessingComments
           ,GETDATE()
           ,@InsertedBy
        )
 END
END
GO
