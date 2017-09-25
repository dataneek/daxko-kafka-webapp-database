CREATE TABLE [dbo].[LocationChangeset] (
    [LocationChangesetId] INT                IDENTITY (600001, 1) NOT NULL,
    [LocationId]          INT                NOT NULL,
    [Changeset]           NVARCHAR (MAX)     NOT NULL,
    [ChangesetMode]       INT                NOT NULL,
    [Created]             DATETIMEOFFSET (7) CONSTRAINT [DF_LocationChangeset_Created] DEFAULT (sysdatetimeoffset()) NOT NULL,
    [LastUpdated]         DATETIMEOFFSET (7) NULL,
    [RowId]               UNIQUEIDENTIFIER   CONSTRAINT [DF_LocationChangeset_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]           ROWVERSION         NOT NULL,
    CONSTRAINT [PK_LocationChangeset] PRIMARY KEY CLUSTERED ([LocationChangesetId] ASC),
    CONSTRAINT [FK_LocationChangeset_Location] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId])
);



