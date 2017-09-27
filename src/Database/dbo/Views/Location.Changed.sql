CREATE VIEW [dbo].[Location.Changed]
AS
SELECT
ISNULL(CAST(sys.fn_cdc_map_lsn_to_time(__$start_lsn) AS datetime), '') AS timestamp,
ISNULL(CAST(__$seqval AS bigint), 0) AS id, 
CASE __$operation WHEN 1 THEN 'deleted' WHEN 2 THEN 'inserted' WHEN 4 THEN 'updated' END AS operation,
LocationId,
LocationName,
Created,
LastUpdated
FROM cdc.dbo_Location_CT
WHERE (__$operation <> 3)
