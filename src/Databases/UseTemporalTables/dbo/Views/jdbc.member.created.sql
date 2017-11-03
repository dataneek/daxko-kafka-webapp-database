
CREATE VIEW [dbo].[jdbc.member.created]
AS

SELECT
	M1.[MemberId]	AS [Id]
,	M1.[RowId]		AS [MemberKey]
,	M1.[LastName]
,	M1.[FirstName]
,	M1.[Email]
,	M1.[Phone]
,	M1.[Gender]
,	M1.[Birthdate]
,	CAST( M1.[Created] AS datetime ) AS [Created]
,	CAST( ISNULL( M1.[LastUpdated], M1.[Created] ) AS datetime ) [LastUpdated]

FROM
	[dbo].[Member] M1 WITH (NOLOCK)