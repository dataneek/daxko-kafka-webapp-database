CREATE TABLE [dbo].[LocationCheckIn] (
    [LocationCheckinId] INT                IDENTITY (100001, 1) NOT NULL,
    [LocationId]        INT                NOT NULL,
    [MemberId]          INT                NOT NULL,
    [CheckinCompleted]  DATETIME NOT NULL,
    [IsDeleted]         BIT                CONSTRAINT [DF_LocationCheckIn_IsDeleted] DEFAULT ((0)) NOT NULL,
    [Created]           DATETIME CONSTRAINT [DF_LocationCheckin_Created] DEFAULT (GETUTCDATE()) NOT NULL,
    [LastUpdated]       DATETIME DEFAULT (GETUTCDATE()) NOT NULL,
    [RowId]             UNIQUEIDENTIFIER   CONSTRAINT [DF_LocationCheckin_RowId] DEFAULT (newid()) NOT NULL,
    [Watermark]         ROWVERSION         NOT NULL,
    CONSTRAINT [PK_LocationCheckin] PRIMARY KEY CLUSTERED ([LocationCheckinId] ASC),
    CONSTRAINT [FK_LocationCheckin_Location] FOREIGN KEY ([LocationId]) REFERENCES [dbo].[Location] ([LocationId]),
    CONSTRAINT [FK_LocationCheckin_Member] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([MemberId])
);









