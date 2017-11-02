CREATE TABLE [dbo].[Member] (
    [MemberId]    INT                                         IDENTITY (300001, 1) NOT NULL,
    [LastName]    NVARCHAR (50)                               NOT NULL,
    [FirstName]   NVARCHAR (50)                               NOT NULL,
    [Email]       NVARCHAR (255)                              NOT NULL,
    [Phone]       NVARCHAR (50)                               NOT NULL,
    [Gender]      INT                                         NOT NULL,
    [Birthdate]   DATE                                        NOT NULL,
    [IsDeleted]   BIT                                         CONSTRAINT [DF_Member_IsDeleted] DEFAULT ((0)) NOT NULL,
    [Created]     DATETIMEOFFSET (7)                          CONSTRAINT [DF_Member_Created] DEFAULT (sysdatetimeoffset()) NOT NULL,
    [LastUpdated] DATETIMEOFFSET (7)                          NULL,
    [RowId]       UNIQUEIDENTIFIER                            CONSTRAINT [DF_Member_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]   ROWVERSION                                  NOT NULL,
    [ValidFrom]   DATETIME2 (2) GENERATED ALWAYS AS ROW START NOT NULL,
    [ValidTo]     DATETIME2 (2) GENERATED ALWAYS AS ROW END   NOT NULL,
    CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED ([MemberId] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[dbo].[MemberChangeset], DATA_CONSISTENCY_CHECK=ON));











