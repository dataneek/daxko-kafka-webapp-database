CREATE TABLE [dbo].[LocationChangeset] (
    [LocationChangesetId] INT                IDENTITY (600001, 1) NOT NULL,
    [LocationId]          UNIQUEIDENTIFIER   NOT NULL,
    [Changeset]           NVARCHAR (MAX)     NOT NULL,
    [ChangesetMode]       INT                NOT NULL,
    [Created]             DATETIME CONSTRAINT [DF_LocationChangeset_Created] DEFAULT (GETUTCDATE()) NOT NULL,
    [LastUpdated]         DATETIME DEFAULT (GETUTCDATE()) NOT NULL,
    [RowId]               UNIQUEIDENTIFIER   CONSTRAINT [DF_LocationChangeset_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]           ROWVERSION         NOT NULL,
    CONSTRAINT [PK_LocationChangeset] PRIMARY KEY CLUSTERED ([LocationChangesetId] ASC)
);



