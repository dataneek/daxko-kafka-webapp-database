
CREATE VIEW [dbo].[jdbc.location.created]
AS

SELECT
	L1.[LocationId]	AS [Id]
,	L1.[RowId] AS [LocationKey]
,	L1.[LocationName]
,	CAST( L1.[Created] AS datetime ) AS [Created]
,	CAST( ISNULL(L1.[LastUpdated], L1.[Created] ) AS datetime ) [LastUpdated]

FROM
	[dbo].[Location] L1 WITH (NOLOCK)