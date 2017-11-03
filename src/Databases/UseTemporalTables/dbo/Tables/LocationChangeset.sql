CREATE TABLE [dbo].[LocationChangeset] (
    [LocationId]   INT                NOT NULL,
    [LocationName] NVARCHAR (50)      NOT NULL,
    [Created]      DATETIMEOFFSET (7) NOT NULL,
    [LastUpdated]  DATETIMEOFFSET (7) NULL,
    [RowId]        UNIQUEIDENTIFIER   NOT NULL,
    [Watermark]    ROWVERSION         NOT NULL,
    [ValidFrom]    DATETIME2 (2)      NOT NULL,
    [ValidTo]      DATETIME2 (2)      NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_LocationChangeset]
    ON [dbo].[LocationChangeset]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

