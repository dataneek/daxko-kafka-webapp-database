CREATE TABLE [dbo].[MemberChangeset] (
    [MemberChangesetId] INT                IDENTITY (600001, 1) NOT NULL,
    [MemberId]          INT                NOT NULL,
    [Changeset]         NVARCHAR (MAX)     NOT NULL,
    [ChangesetMode]     INT                NOT NULL,
    [Created]           DATETIMEOFFSET (7) CONSTRAINT [DF_MemberChangeset_Created] DEFAULT (sysdatetimeoffset()) NOT NULL,
    [LastUpdated]       DATETIMEOFFSET (7) NULL,
    [RowId]             UNIQUEIDENTIFIER   CONSTRAINT [DF_MemberChangeset_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]         ROWVERSION         NOT NULL,
    CONSTRAINT [PK_MemberChangeset] PRIMARY KEY CLUSTERED ([MemberChangesetId] ASC),
    CONSTRAINT [FK_MemberChangeset_Member] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([MemberId])
);



