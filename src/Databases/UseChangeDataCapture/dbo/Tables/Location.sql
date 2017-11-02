CREATE TABLE [dbo].[Location] (
    [LocationId]   INT                IDENTITY (200001, 1) NOT NULL,
    [LocationName] NVARCHAR (50)      NOT NULL,
    [IsDeleted]    BIT                CONSTRAINT [DF_Location_IsDeleted] DEFAULT ((0)) NOT NULL,
    [Created]      DATETIMEOFFSET (7) CONSTRAINT [DF_Location_Created] DEFAULT (sysdatetimeoffset()) NOT NULL,
    [LastUpdated]  DATETIMEOFFSET (7) NULL,
    [RowId]        UNIQUEIDENTIFIER   CONSTRAINT [DF_Location_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]    ROWVERSION         NOT NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([LocationId] ASC)
);









