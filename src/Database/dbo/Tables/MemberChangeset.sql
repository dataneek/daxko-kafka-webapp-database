CREATE TABLE [dbo].[MemberChangeset] (
    [MemberChangesetId] INT                IDENTITY (600001, 1) NOT NULL,
    [MemberId]          INT                NOT NULL,
    [Changeset]         NVARCHAR (MAX)     NOT NULL,
    [ChangesetMode]     INT                NOT NULL,
    [Created]           DATETIME CONSTRAINT [DF_MemberChangeset_Created] DEFAULT (GETUTCDATE()) NOT NULL,
    [LastUpdated]       DATETIME DEFAULT (GETUTCDATE()) NOT NULL,
    [RowId]             UNIQUEIDENTIFIER   CONSTRAINT [DF_MemberChangeset_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]         ROWVERSION         NOT NULL,
    CONSTRAINT [PK_MemberChangeset] PRIMARY KEY CLUSTERED ([MemberChangesetId] ASC),
    CONSTRAINT [FK_MemberChangeset_Member] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([MemberId])
);



