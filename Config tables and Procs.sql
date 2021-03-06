USE [Test]
GO
/****** Object:  Table [Config].[AuditPackageInformation]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[AuditPackageInformation](
	[AuditPackageID] [bigint] IDENTITY(1,1) NOT NULL,
	[ETLBatchID] [bigint] NULL,
	[PackageID] [int] NULL,
	[SkipPackageLoad] [bit] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[LoadStatus] [varchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Config].[AuditTableInformation]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[AuditTableInformation](
	[AuditTableID] [bigint] IDENTITY(1,1) NOT NULL,
	[ETLBatchID] [bigint] NULL,
	[PackageID] [int] NULL,
	[AuditPackageID] [bigint] NULL,
	[TableID] [int] NULL,
	[InsertRowCount] [bigint] NULL,
	[UpdateRowCount] [bigint] NULL,
	[DeleteRowCount] [bigint] NULL,
	[UnChangedRowCount] [bigint] NULL,
	[IntegrityErrorRowCount] [bigint] NULL,
	[LoadStatus] [varchar](20) NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[PreLoadTableRowCount] [bigint] NULL,
	[PostLoadTableRowCount] [bigint] NULL,
	[PreLoadTableSize] [bigint] NULL,
	[PostLoadTableSize] [bigint] NULL,
	[PreLoadIndexSize] [bigint] NULL,
	[PostLoadIndexSize] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Config].[DataSource]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[DataSource](
	[DataSourceID] [int] IDENTITY(1,1) NOT NULL,
	[DataSource] [varchar](50) NOT NULL,
	[SkipLoad] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Config].[DiskSpaceInfo]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[DiskSpaceInfo](
	[DiskSpaceID] [bigint] IDENTITY(1,1) NOT NULL,
	[ETLBatchID] [bigint] NOT NULL,
	[DatabaseName] [varchar](100) NOT NULL,
	[DatabaseFile] [varchar](100) NOT NULL,
	[DatabaseLogicalName] [varchar](100) NULL,
	[DatabasePhysicalFileLocation] [varchar](1000) NULL,
	[DriveName] [varchar](5) NULL,
	[PreDatabaseSizeMB] [bigint] NOT NULL,
	[PreFreeSpaceMB] [bigint] NOT NULL,
	[PostDatabaseSizeMB] [bigint] NULL,
	[PostFreeSpaceMB] [bigint] NULL,
	[PreTotalDriveSpaceMB] [bigint] NULL,
	[PreDiskSpaceMB] [bigint] NULL,
	[PostTotalDriveSpaceMB] [bigint] NULL,
	[PostDiskSpaceMB] [bigint] NULL,
	[ProcessDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DiskSpaceInfo] PRIMARY KEY CLUSTERED 
(
	[DiskSpaceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Config].[EmailConfiguration]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[EmailConfiguration](
	[Environment] [varchar](50) NULL,
	[MailCategory] [varchar](100) NULL,
	[Recipients] [varchar](500) NULL,
	[ServerName] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Config].[ETLBatch]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[ETLBatch](
	[ETLBatchID] [bigint] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[BatchStatus] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ETLBatch] PRIMARY KEY CLUSTERED 
(
	[ETLBatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Config].[PackageInformation]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[PackageInformation](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[PackageName] [varchar](255) NOT NULL,
	[ETLStage] [char](1) NOT NULL,
	[SkipPackageLoad] [bit] NOT NULL,
	[PackageStatus] [varchar](50) NOT NULL,
	[ExecutionThread] [smallint] NOT NULL,
 CONSTRAINT [PK_PackageInformation] PRIMARY KEY CLUSTERED 
(
	[PackageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Config].[StageLoadInformation]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[StageLoadInformation](
	[StageLoadInformationID] [int] IDENTITY(1,1) NOT NULL,
	[RecentKeyTableLoadDate] [datetime] NOT NULL,
	[RecentReportTableLoadDate] [datetime] NULL,
	[LastUpdatedOn] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Config].[TableInformation]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[TableInformation](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[DataSource] [varchar](50) NOT NULL,
	[TableSchema] [varchar](50) NOT NULL,
	[TableName] [varchar](150) NOT NULL,
	[ETLStage] [char](1) NOT NULL,
	[SourceSchema] [varchar](50) NULL,
	[SourceTable] [varchar](150) NULL,
	[LastSuccessfulStartDate] [datetime] NULL,
	[LastSuccessfulEndDate] [datetime] NULL,
	[IsCompleted] [bit] NOT NULL,
 CONSTRAINT [PK_TableInformation] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [Config].[DataSource] ADD  CONSTRAINT [DF_DataSource_SkipLoad]  DEFAULT ((0)) FOR [SkipLoad]
GO
ALTER TABLE [Config].[DiskSpaceInfo] ADD  CONSTRAINT [DF_DiskSpaceInfo_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [Config].[ETLBatch] ADD  CONSTRAINT [DF_ETLBatch_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO
ALTER TABLE [Config].[ETLBatch] ADD  CONSTRAINT [DF_ETLBatch_BatchStatus]  DEFAULT ('Running') FOR [BatchStatus]
GO
ALTER TABLE [Config].[PackageInformation] ADD  CONSTRAINT [DF_PackageInformation_SkipPackageLoad]  DEFAULT ((0)) FOR [SkipPackageLoad]
GO
ALTER TABLE [Config].[PackageInformation] ADD  CONSTRAINT [DF_PackageInformation_PackageStatus]  DEFAULT ('Waiting') FOR [PackageStatus]
GO
ALTER TABLE [Config].[PackageInformation] ADD  DEFAULT ((0)) FOR [ExecutionThread]
GO
ALTER TABLE [Config].[StageLoadInformation] ADD  DEFAULT (getdate()) FOR [LastUpdatedOn]
GO
ALTER TABLE [Config].[TableInformation] ADD  CONSTRAINT [DF_TableInformation_IsCompleted]  DEFAULT ((0)) FOR [IsCompleted]
GO
/****** Object:  StoredProcedure [Config].[usp_Finalize]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Config].[usp_Finalize]
AS
BEGIN
        
    SET NOCOUNT ON
	--update config.TableInformation set LastSuccessfulStartDate=Null , LastSuccessfulEndDate =Null ,IsCompleted=1
    IF EXISTS ( SELECT  *
                FROM    Config.PackageInformation
                WHERE   PackageStatus = 'Failed'  )
        BEGIN
		
		DECLARE @Reipients VARCHAR(500), @ServerName VARCHAR(50) = @@SERVERNAME, @Environment VARCHAR(50)
		SELECT TOP 1 @Reipients = Recipients, @Environment = Environment FROM Config.EmailConfiguration 
		WHERE MailCategory='ETL Job Message' AND ServerName = @ServerName AND Environment='Production'

		DECLARE @Subject VARCHAR(200) = @ServerName + ' (' + @Environment + ' Server) - WCG ETL Notification - ETL Job Failed'

	DECLARE @Message VARCHAR(4000)
	SET @Message = '<table border="0"><tr><td>Following packages were failed.</td></tr>'
	SET @Message = @Message + '<tr><td>------------------------------------------------</td></tr>'
	SET @Message  = @Message + '<tr><td>' + REPLACE(SUBSTRING((SELECT '!' + PackageName + '.dtsx' FROM Config.PackageInformation WHERE PackageStatus='Failed' FOR XML PATH('')),2,4000),'!','</td></tr><tr><td>')
	SET @Message=  @Message + '<tr><td>&nbsp;</td></tr>'
	
	SET @Message=  @Message + '<tr><td>Error information is written into the package log file located at D:\WCG_Reporting\LogFiles</td></tr></table>'
	--print @Message
	EXEC msdb.dbo.sp_send_dbmail
    @profile_name = 'ETLJOBMessage',
    @recipients = @Reipients,
    @body = @Message ,
	@body_format = 'HTML',
    @subject = @Subject

	;THROW 50001,' Unable to finalize the job. ETL job failed, check notification email and logs files for more information',1

        END

		
 IF EXISTS ( SELECT  *
                FROM    Config.PackageInformation
                WHERE   PackageStatus = 'Active'  )
        BEGIN
		;THROW 50001,'An attempt is made to finalize the WCG ETL packages when the job is in active state. Unable to finalize the job.',1
            
		   RETURN
        END
    
    IF EXISTS ( SELECT  *
                FROM    Config.ETLBatch
                WHERE   BatchStatus = 'Active' )
        BEGIN

            BEGIN TRY
                BEGIN TRAN

                DECLARE @ETLBatchID BIGINT

                SELECT  @ETLBatchID = ETLBatchID
                FROM    Config.ETLBatch
                WHERE   BatchStatus = 'Active'

                UPDATE  DiskSpc
                SET     DiskSpc.PostDatabaseSizeMB = DBSize.CurrentSizeMB, DiskSpc.PostFreeSpaceMB = DBSize.FreeSpaceMB
                FROM    Config.DiskSpaceInfo DiskSpc
                INNER JOIN ( SELECT @ETLBatchID AS ETLBatchID
                             ,      DB_NAME() AS DatabaseName
                             ,      name AS DatabaseFile
                             ,      size / 128.0 AS CurrentSizeMB
                             ,      size / 128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS INT) / 128.0 AS FreeSpaceMB
                             FROM   sys.database_files ) DBSize ON DiskSpc.ETLBatchID = DBSize.ETLBatchID AND DiskSpc.DatabaseFile = DBSize.DatabaseFile
        
                UPDATE  Config.ETLBatch
                SET     BatchStatus = 'Success', EndDate = GETDATE()
                WHERE   ( BatchStatus = 'Failed' OR BatchStatus = 'Active' )
 
                UPDATE  Config.PackageInformation
                SET     PackageStatus = 'Waiting'

                IF OBJECT_ID('tempdb..#T1') IS NOT NULL
                    DROP TABLE #T1;
 
                SELECT DISTINCT
                        @ETLBatchID AS ETLBatchID, REPLACE(REPLACE(REPLACE(REVERSE(SUBSTRING(REVERSE(mf.physical_name), 1, CHARINDEX('\', REVERSE(mf.physical_name)) - 1)), '.mdf', ''), '.ndf', ''), '.ldf', '') AS DatabaseFile, CONVERT(BIGINT, osvolume.total_bytes / 1048576.0) AS TotalDriveSpaceMB, CONVERT(BIGINT, osvolume.available_bytes / 1048576.0) AS FreeDriveSpaceInMB
                INTO    #T1
                FROM    sys.master_files mf
                CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) osvolume
                WHERE   DB_NAME(osvolume.database_id) = 'WCG_Stage'
                ORDER BY FreeDriveSpaceInMB ASC
 
                UPDATE  DI
                SET     DI.PostTotalDriveSpaceMB = T.TotalDriveSpaceMB, DI.PostDiskSpaceMB = T.FreeDriveSpaceInMB
                FROM    Config.DiskSpaceInfo DI
                INNER JOIN #T1 T ON DI.ETLBatchID = T.ETLBatchID AND DI.DatabaseFile = T.DatabaseFile
                WHERE   DI.PostTotalDriveSpaceMB = 0 AND DI.PostDiskSpaceMB = 0

                COMMIT

            END TRY
            BEGIN CATCH

                IF @@TRANCOUNT > 0
                    BEGIN
                        ROLLBACK
                    END

                DECLARE @ErrorMessage NVARCHAR(4000)
                ,   @ErrorSeverity INT
                ,   @ErrorState INT;

                SELECT  @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

                RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);

            END CATCH

        END
END


GO
/****** Object:  StoredProcedure [Config].[usp_Initialize]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [Config].[usp_Initialize]
AS
BEGIN

SET NOCOUNT ON

    IF NOT EXISTS ( SELECT  *
                    FROM    Config.ETLBatch
                    WHERE   BatchStatus = 'Active' OR BatchStatus = 'Failed' )
        BEGIN
    
           
            INSERT  INTO Config.ETLBatch ( BatchStatus )
            VALUES  ( 'Active' )

            DECLARE @ETLBatchID BIGINT

            SELECT  @ETLBatchID = ETLBatchID
            FROM    Config.ETLBatch
            WHERE   BatchStatus = 'Active'

            BEGIN TRY
                BEGIN TRAN
				
                INSERT  INTO Config.DiskSpaceInfo ( ETLBatchID, DatabaseName, DatabaseFile, PreDatabaseSizeMB, PreFreeSpaceMB, ProcessDate )
                        SELECT  @ETLBatchID AS ETLBatchID, DB_NAME() AS DatabaseName, name AS DatabaseFile, size / 128.0 AS CurrentSizeMB, size / 128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS INT) / 128.0 AS FreeSpaceMB, GETDATE() AS ProcessDate
                        FROM    sys.database_files; 


                IF OBJECT_ID('tempdb..#T1') IS NOT NULL
                    DROP TABLE #T1;
 
                SELECT DISTINCT
                        @ETLBatchID AS ETLBatchID, DB_NAME(osvolume.database_id) DatabaseName, mf.physical_name PhysicalFileLocation, REPLACE(REPLACE(REPLACE(REVERSE(SUBSTRING(REVERSE(mf.physical_name), 1, CHARINDEX('\', REVERSE(mf.physical_name)) - 1)), '.mdf', ''), '.ndf', ''),'.ldf','') AS DatabaseFile, osvolume.logical_volume_name AS LogicalName, osvolume.volume_mount_point AS Drive, CONVERT(BIGINT, osvolume.total_bytes / 1048576.0) AS TotalDriveSpaceMB, CONVERT(BIGINT, osvolume.available_bytes / 1048576.0) AS FreeDriveSpaceInMB
                INTO    #T1
                FROM    sys.master_files mf
                CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) osvolume
                WHERE   DB_NAME(osvolume.database_id) = 'WCG_Stage'
                ORDER BY FreeDriveSpaceInMB ASC
 
 
                UPDATE  DI
                SET     DI.DatabasePhysicalFileLocation = T.PhysicalFileLocation, DI.DatabaseLogicalName = T.LogicalName, DI.DriveName = T.Drive, DI.PreTotalDriveSpaceMB = T.TotalDriveSpaceMB, DI.PreDiskSpaceMB = T.FreeDriveSpaceInMB, DI.PostTotalDriveSpaceMB = 0, DI.PostDiskSpaceMB = 0
                FROM    Config.DiskSpaceInfo DI
                INNER JOIN #T1 T ON DI.ETLBatchID = T.ETLBatchID AND DI.DatabaseFile = T.DatabaseFile

                COMMIT

            END TRY
            BEGIN CATCH

                IF @@TRANCOUNT > 0
                    BEGIN
                        ROLLBACK TRAN
                    END

                DECLARE @ErrorMessage NVARCHAR(4000)
                ,   @ErrorSeverity INT
                ,   @ErrorState INT;

                SELECT  @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();

                RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);

            END CATCH

        END
END


GO
/****** Object:  StoredProcedure [dbo].[usp_AuditEnd]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AuditEnd](@PackageName VARCHAR(50) , @TableSchema VARCHAR(50) , @TableName VARCHAR(50), @InsertRowCount BIGINT, @UpdateRowCount BIGINT = NULL, @DeleteRowCount BIGINT = NULL, @UnchangedRowCount BIGINT = NULL)
AS
BEGIN
SET NOCOUNT ON

DECLARE @ETLBatchID INT, @PackageID INT, @ETLStage CHAR(1), @SkipPackageLoad CHAR(1), @AuditPackageID BIGINT,@AuditTableID BIGINT, @TableID INT

BEGIN TRY
BEGIN TRAN

SELECT @ETLBatchID = ETLBatchID FROM Config.ETLBatch WHERE   BatchStatus = 'Active' OR BatchStatus = 'Failed' 

SELECT @PackageID = PackageID, @ETLStage = ETLStage, @SkipPackageLoad = SkipPackageLoad FROM Config.PackageInformation WHERE PackageName = @PackageName 
 
SELECT @TableID = TableID FROM Config.TableInformation WHERE TableSchema= @TableSchema AND TableName = @TableName

SELECT @AuditPackageID = MAX(AuditPackageID) FROM Config.AuditPackageInformation WHERE PackageID = @PackageID AND ETLBatchID = @ETLBatchID AND LoadStatus = 'Active' 
 
SELECT @AuditTableID = MAX(AuditTableID) FROM Config.AuditTableInformation WHERE TableID = @TableID AND PackageID = @PackageID AND ETLBatchID = @ETLBatchID AND LoadStatus = 'Active'

UPDATE Config.PackageInformation
SET PackageStatus = 'Success'
WHERE PackageID = @PackageID

UPDATE Config.AuditPackageInformation
SET LoadStatus = 'Success', EndTime = GETDATE()
WHERE AuditPackageID = @AuditPackageID

DECLARE @TotalRows BIGINT, @DataSize BIGINT, @IndexSize BIGINT
EXEC usp_GetTableSize @TableSchema,@TableName,@TotalRows  OUTPUT, @DataSize  OUTPUT, @IndexSize  OUTPUT

UPDATE Config.AuditTableInformation
SET LoadStatus = 'Success', EndTime = GETDATE(), InsertRowCount = @InsertRowCount, UpdateRowCount = @UpdateRowCount, DeleteRowCount = @DeleteRowCount, UnChangedRowCount = @UnchangedRowCount, PostLoadTableRowCount= @TotalRows, PostLoadTableSize = @DataSize, PostLoadIndexSize = @IndexSize
WHERE AuditTableID = @AuditTableID

UPDATE Config.PackageInformation SET PackageStatus = 'Success' WHERE PackageID = @PackageID

COMMIT
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0 ROLLBACK
END CATCH

SET NOCOUNT OFF
END


GO
/****** Object:  StoredProcedure [dbo].[usp_AuditSkipped]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AuditSkipped](@PackageName VARCHAR(50) , @TableSchema VARCHAR(50) , @TableName VARCHAR(50))
AS
BEGIN
SET NOCOUNT ON
DECLARE @ETLBatchID INT, @PackageID INT, @ETLStage CHAR(1), @SkipPackageLoad CHAR(1), @AuditPackageID BIGINT, @TableID INT

BEGIN TRY
BEGIN TRAN

IF NOT EXISTS ( SELECT  *
                FROM    Config.ETLBatch
                WHERE   BatchStatus = 'Active' OR BatchStatus = 'Failed' )
    BEGIN
        INSERT  INTO Config.ETLBatch ( BatchStatus )
        VALUES  ( 'Active' )
    END
  
SELECT @ETLBatchID = ETLBatchID FROM Config.ETLBatch WHERE   BatchStatus = 'Active' OR BatchStatus = 'Failed' 
 
SELECT @PackageID = PackageID, @ETLStage = ETLStage, @SkipPackageLoad = SkipPackageLoad FROM Config.PackageInformation WHERE PackageName = @PackageName 
SELECT @TableID = TableID FROM Config.TableInformation WHERE TableSchema= @TableSchema AND TableName = @TableName
  
UPDATE Config.AuditPackageInformation
SET LoadStatus = 'Overridden'
WHERE (LoadStatus = 'Active' OR LoadStatus = 'Failed') AND PackageID = @PackageID
 
UPDATE Config.AuditTableInformation
SET LoadStatus = 'Overridden'
WHERE (LoadStatus = 'Active' OR LoadStatus = 'Failed') AND TableID = @TableID
 
INSERT INTO Config.AuditPackageInformation ( ETLBatchID, PackageID, SkipPackageLoad, StartTime, EndTime, LoadStatus )
VALUES  (@ETLBatchID, @PackageID, @SkipPackageLoad, GETDATE(), NULL, 'Skipped')
 
SET @AuditPackageID = IDENT_CURRENT('Config.AuditPackageInformation')
  
INSERT INTO Config.AuditTableInformation ( ETLBatchID, PackageID, AuditPackageID, TableID, InsertRowCount, UpdateRowCount, DeleteRowCount, IntegrityErrorRowCount, LoadStatus, StartTime, EndTime )
VALUES  (@ETLBatchID, @PackageID, @AuditPackageID,@TableID,NULL,NULL,NULL,NULL,'Skipped',GETDATE(),NULL )
 
COMMIT
END TRY
BEGIN CATCH

END CATCH
SET NOCOUNT OFF
END


GO
/****** Object:  StoredProcedure [dbo].[usp_AuditStart]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_AuditStart](@PackageName VARCHAR(50) , @TableSchema VARCHAR(50) , @TableName VARCHAR(50))
AS
BEGIN
SET NOCOUNT ON
DECLARE @ETLBatchID INT, @PackageID INT, @ETLStage CHAR(1), @SkipPackageLoad CHAR(1), @AuditPackageID BIGINT, @TableID INT

IF  EXISTS ( SELECT  *
                FROM    Config.ETLBatch
                WHERE   BatchStatus = 'Failed' )
BEGIN
	UPDATE Config.ETLBatch SET BatchStatus='Active' WHERE BatchStatus='Failed'
END

SELECT @ETLBatchID = ETLBatchID FROM Config.ETLBatch WHERE   BatchStatus = 'Active' OR BatchStatus = 'Failed' 

IF @ETLBatchID IS NULL
BEGIN
	DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

    SELECT 
        @ErrorMessage = 'Cannot process with ETLBatchID having NULL value. Ensure that the Initialize.dtsx package is executed before executing other packages.',
        @ErrorSeverity = 10,
        @ErrorState = 1

    RAISERROR (@ErrorMessage, -- Message text.
               @ErrorSeverity, -- Severity.
               @ErrorState -- State.
               );
END

BEGIN TRY
BEGIN TRAN

SELECT @PackageID = PackageID, @ETLStage = ETLStage, @SkipPackageLoad = SkipPackageLoad FROM Config.PackageInformation WHERE PackageName = @PackageName 
SELECT @TableID = TableID FROM Config.TableInformation WHERE TableSchema = @TableSchema AND TableName = @TableName

UPDATE Config.PackageInformation
SET PackageStatus = 'Active'
WHERE PackageID = @PackageID

UPDATE Config.AuditPackageInformation
SET LoadStatus = 'Overridden', EndTime = GETDATE()
WHERE (LoadStatus = 'Active' OR LoadStatus = 'Failed') AND PackageID = @PackageID
 
UPDATE Config.AuditTableInformation
SET LoadStatus = 'Overridden', EndTime = GETDATE()
WHERE (LoadStatus = 'Active' OR LoadStatus = 'Failed') AND TableID = @TableID
 
INSERT INTO Config.AuditPackageInformation ( ETLBatchID, PackageID, SkipPackageLoad, StartTime, EndTime, LoadStatus )
VALUES  (@ETLBatchID, @PackageID, @SkipPackageLoad, GETDATE(), NULL, 'Active')
 
SET @AuditPackageID = IDENT_CURRENT('Config.AuditPackageInformation')
  
INSERT INTO Config.AuditTableInformation ( ETLBatchID, PackageID, AuditPackageID, TableID, InsertRowCount, UpdateRowCount, DeleteRowCount, IntegrityErrorRowCount, LoadStatus, StartTime, EndTime )
VALUES  (@ETLBatchID, @PackageID, @AuditPackageID,@TableID,NULL,NULL,NULL,NULL,'Active',GETDATE(),NULL )

DECLARE @TotalRows BIGINT, @DataSize BIGINT, @IndexSize BIGINT
EXEC usp_GetTableSize @TableSchema,@TableName,@TotalRows  OUTPUT, @DataSize  OUTPUT, @IndexSize  OUTPUT

UPDATE Config.AuditTableInformation
SET PreLoadTableRowCount = @TotalRows, PreLoadTableSize = @DataSize, PreLoadIndexSize = @IndexSize
WHERE ETLBatchID = @ETLBatchID
AND PackageID = @PackageID
AND AuditPackageID = @AuditPackageID
AND TableID = @TableID
AND LoadStatus = 'Active'

 
COMMIT
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0 ROLLBACK
END CATCH
SET NOCOUNT OFF
END





GO
/****** Object:  StoredProcedure [dbo].[usp_GetLoadInformation]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetLoadInformation] (@DataSource VARCHAR(50), @TableSchema VARCHAR(50), @TableName VARCHAR(150), @PackageName VARCHAR(255), @ETLStage CHAR(1))
AS
BEGIN
SET NOCOUNT ON
DECLARE @LastSuccessfulStartDate VARCHAR(50),@LastSuccessfulEndDate VARCHAR(50), @PackageStatus VARCHAR(50), @IsCompleted BIT, @ETLBatchID BIGINT

SET @PackageName = REPLACE(@PackageName,'.dtsx','')
SET @TableName = @DataSource + '_' + @TableName


SELECT 
@LastSuccessfulStartDate = REPLACE(CONVERT(VARCHAR(50),LastSuccessfulStartDate,111),'/','-')   + ' ' + CONVERT(VARCHAR(8),LastSuccessfulStartDate,108), 
@LastSuccessfulEndDate   = REPLACE(CONVERT(VARCHAR(50),LastSuccessfulEndDate,111),'/','-')   + ' ' + CONVERT(VARCHAR(8),LastSuccessfulEndDate,108) ,
@IsCompleted = IsCompleted
FROM Config.TableInformation 
WHERE DataSource = @DataSource AND TableSchema = @TableSchema AND TableName = @TableName AND ETLStage = @ETLStage



IF @LastSuccessfulStartDate IS NULL OR @LastSuccessfulEndDate IS NULL 
BEGIN
	SET @LastSuccessfulStartDate = '1900-01-01'
	SET @LastSuccessfulEndDate = REPLACE(CONVERT(VARCHAR(50),GETDATE(),111),'/','-')+ ' ' + CONVERT(VARCHAR(8),GETDATE(),108)
END

--Subsequent successful loads 
IF @LastSuccessfulStartDate <> '1900-01-01' AND DATEDIFF(SS,@LastSuccessfulEndDate,GETDATE()) > 0 --AND @IsCompleted = 1
BEGIN
	SET @LastSuccessfulStartDate = @LastSuccessfulEndDate
	SET @LastSuccessfulEndDate = REPLACE(CONVERT(VARCHAR(50),GETDATE(),111),'/','-') + ' ' + CONVERT(VARCHAR(8),GETDATE(),108)
END

----if the package fails
--IF @LastSuccessfulStartDate <> '1900-01-01' AND DATEDIFF(SS,@LastSuccessfulEndDate,GETDATE()) > 0 AND @IsCompleted = 0
--BEGIN
--	UPDATE Config.TableInformation
--	SET LastSuccessfulEndDate = GETDATE()
--	WHERE DataSource = @DataSource AND TableSchema = @TableSchema AND TableName = @TableName AND ETLStage = @ETLStage
--END
  
SELECT 
@LastSuccessfulStartDate = REPLACE(CONVERT(VARCHAR(50),@LastSuccessfulStartDate,111),'/','-') ,--  + ' ' + CONVERT(VARCHAR(8),@LastSuccessfulStartDate,108), 
@LastSuccessfulEndDate   = REPLACE(CONVERT(VARCHAR(50),@LastSuccessfulEndDate,111),'/','-')   --+ ' ' + CONVERT(VARCHAR(8),@LastSuccessfulEndDate,108) 

SELECT @PackageStatus = ISNULL(PackageStatus,'Waiting') FROM Config.PackageInformation 
WHERE PackageName = @PackageName


SET NOCOUNT OFF

SELECT @ETLBatchID = ETLBatchID FROM Config.ETLBatch WHERE BatchStatus='Active' OR BatchStatus='Failed'

IF EXISTS (SELECT * FROM Config.PackageInformation 
WHERE PackageName <> @PackageName AND PackageStatus='Failed')
BEGIN
	SET @PackageStatus= 'NoExecute'
END

SELECT @PackageStatus AS PackageStatus, @LastSuccessfulStartDate AS StartDate, @LastSuccessfulEndDate AS EndDate, @ETLBatchID AS ETLBatchID

END





GO
/****** Object:  StoredProcedure [dbo].[usp_GetTableSize]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetTableSize](@TableSchema VARCHAR(200), @TableName VARCHAR(200)
,@outTotalRows BIGINT OUTPUT, @outDataSize BIGINT OUTPUT, @outIndexSize BIGINT OUTPUT
)
AS
BEGIN
SET NOCOUNT ON
DECLARE @Table VARCHAR(400) = @TableSchema + '.' + @TableName

IF(OBJECT_ID('tempdb..#Temp')) IS NOT NULL DROP TABLE #Temp;
IF(OBJECT_ID('tempdb..#Space')) IS NOT NULL DROP TABLE #Space;

CREATE TABLE #Space(TableName VARCHAR(50), TotalRows BIGINT, reserved BIGINT, DataSize BIGINT, IndexSize BIGINT, Unused BIGINT)
CREATE TABLE #Temp(TableName VARCHAR(50), Totalrows VARCHAR(50), Reserved VARCHAR(50), DataSize VARCHAR(50), IndexSize VARCHAR(50), Unused VARCHAR(50))

INSERT INTO #Temp EXEC sp_spaceused @Table;

INSERT INTO #Space( TableName ,TotalRows ,Reserved ,DataSize ,IndexSize ,Unused)
SELECT  TableName ,CAST(totalrows AS BIGINT) AS TotalRows ,CAST(REPLACE(reserved,' KB','') AS BIGINT) AS Reserved, 
CAST(REPLACE(DataSize,' KB','') AS BIGINT) AS DataSize , CAST(REPLACE(IndexSize,' KB','') AS BIGINT) AS Index_Size ,
CAST(REPLACE(Unused,' KB','') AS BIGINT) AS Unused FROM #Temp;

SELECT  TOP 1 @outTotalRows = TotalRows, @outDataSize = DataSize, @outIndexSize = IndexSize FROM #Space ORDER BY totalrows DESC, DataSize DESC;
SET NOCOUNT OFF
END



GO
/****** Object:  StoredProcedure [dbo].[usp_UpdateLoadDates]    Script Date: 9/28/2016 2:58:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_UpdateLoadDates]
(
	@LastSuccessfulStartDate DATETIME, @LastSuccessfulEndDate DATETIME, @TableSchema VARCHAR(200), @TableName VARCHAR(200)
)
AS
BEGIN
	
	UPDATE Config.TableInformation SET LastSuccessfulStartDate = @LastSuccessfulStartDate, LastSuccessfulEndDate = @LastSuccessfulEndDate, IsCompleted = 1 WHERE TableSchema=@TableSchema AND TableName=@TableName

END


GO
