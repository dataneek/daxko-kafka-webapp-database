CREATE TABLE [dbo].[MemberChangeset] (
    [MemberId]    INT                NOT NULL,
    [LastName]    NVARCHAR (50)      NOT NULL,
    [FirstName]   NVARCHAR (50)      NOT NULL,
    [Email]       NVARCHAR (255)     NOT NULL,
    [Phone]       NVARCHAR (50)      NOT NULL,
    [Gender]      INT                NOT NULL,
    [Birthdate]   DATE               NOT NULL,
    [IsDeleted]   BIT                NOT NULL,
    [Created]     DATETIMEOFFSET (7) NOT NULL,
    [LastUpdated] DATETIMEOFFSET (7) NULL,
    [RowId]       UNIQUEIDENTIFIER   NOT NULL,
    [Watermark]   ROWVERSION         NOT NULL,
    [ValidFrom]   DATETIME2 (2)      NOT NULL,
    [ValidTo]     DATETIME2 (2)      NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_MemberChangeset]
    ON [dbo].[MemberChangeset]([ValidTo] ASC, [ValidFrom] ASC) WITH (DATA_COMPRESSION = PAGE);

