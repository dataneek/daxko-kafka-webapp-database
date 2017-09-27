CREATE VIEW [dbo].[Member.Changed]
AS
SELECT
ISNULL(CAST(sys.fn_cdc_map_lsn_to_time(__$start_lsn) AS datetime), '') AS timestamp,
ISNULL(CAST(__$seqval AS bigint), 0) AS id,
CASE __$operation WHEN 1 THEN 'deleted' WHEN 2 THEN 'inserted' WHEN 4 THEN 'updated' END AS operation,
MemberId,
LastName,
FirstName,
Email,
Phone,
Gender,
Birthdate,
Created,
LastUpdated
FROM cdc.dbo_Member_CT
WHERE (__$operation <> 3)
