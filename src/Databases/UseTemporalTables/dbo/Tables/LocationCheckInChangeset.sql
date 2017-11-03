CREATE TABLE [dbo].[LocationCheckInChangeset] (
    [LocationCheckinId] INT                NOT NULL,
    [LocationId]        INT                NOT NULL,
    [MemberId]          INT                NOT NULL,
    [CheckinCompleted]  DATETIMEOFFSET (7) NOT NULL,
    [Created]           DATETIMEOFFSET (7) NOT NULL,
    [LastUpdated]       DATETIMEOFFSET (7) NULL,
    [RowId]             UNIQUEIDENTIFIER   NOT NULL,
    [Watermark]         ROWVERSION         NOT NULL,
    [ValidFrom]         DATETIME2 (2)      NOT NULL,
    [ValidTo]           DATETIME2 (2)      NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_LocationCheckInChangeset]
    ON [dbo].[LocationCheckInChangeset]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

