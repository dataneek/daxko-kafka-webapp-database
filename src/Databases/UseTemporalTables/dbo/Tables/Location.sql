CREATE TABLE [dbo].[Location] (
    [LocationId]   INT                                         IDENTITY (200001, 1) NOT NULL,
    [LocationName] NVARCHAR (50)                               NOT NULL,
    [Created]      DATETIMEOFFSET (7)                          CONSTRAINT [DF_Location_Created] DEFAULT (sysdatetimeoffset()) NOT NULL,
    [LastUpdated]  DATETIMEOFFSET (7)                          NULL,
    [RowId]        UNIQUEIDENTIFIER                            CONSTRAINT [DF_Location_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]    ROWVERSION                                  NOT NULL,
    [ValidFrom]    DATETIME2 (2) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]      DATETIME2 (2) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED ([LocationId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[LocationChangeset], DATA_CONSISTENCY_CHECK=ON));











