--ALTER DATABASE nexgen_traxx SET COMPATIBILITY_LEVEL = 130

select * from hardware_register where ast_id >=5724

--select * from data_porting_master

SELECT
 distinct
 1, serialnumber,  t.assetqty, 
value, 
assetname,assetdesc
  FROM [dbo].data_porting_master t 
CROSS APPLY (
             SELECT 1
             FROM master..spt_values v 
             WHERE v.type = 'P' AND v.number < t.assetqty-1 AND t.assetqty!=1 --and t.assetqty=24
             )o(assetqty)

	cross apply string_split(t.serialnumber,',')
where t.serialnumber is not null
	order by t.serialnumber



	select * from hardware_register
	 

--where A.rno  =2

--update data_porting_master set serialnumber= ltrim(rtrim(serialnumber))
