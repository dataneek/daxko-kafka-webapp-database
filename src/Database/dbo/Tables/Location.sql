CREATE TABLE [dbo].[Location] (
    [LocationId]   INT                IDENTITY (200001, 1) NOT NULL,
    [LocationName] NVARCHAR (50)      NOT NULL,
    [IsDeleted]    BIT                CONSTRAINT [DF_Location_IsDeleted] DEFAULT ((0)) NOT NULL,
    [Created]      DATETIME CONSTRAINT [DF_Location_Created] DEFAULT (GETUTCDATE()) NOT NULL,
    [LastUpdated]  DATETIME DEFAULT (GETUTCDATE()) NOT NULL,
    [RowId]        UNIQUEIDENTIFIER   CONSTRAINT [DF_Location_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]    ROWVERSION         NOT NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([LocationId] ASC)
);

EXEC sys.sp_cdc_enable_table  
@source_schema = N'dbo',  
@source_name   = N'Location',  
@role_name     = NULL,  
@supports_net_changes = 1  
GO  







