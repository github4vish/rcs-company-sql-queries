--SELECT ast_id, assetqty, invoicenumber, asset_cost, asset_accessory, asset_type,assetname,assetdesc,loc_id,  subloc_id, group_id,
--subgroup_id,facility_id   
--INTO #TEMP_HD
--FROM hardware_register
----------------------------------
UPDATE #TEMP_HD 
SET  asset_cost=Rate
from  #TEMP_HD
join fidility...consolidated$ a
on a.sno=ast_id


update  sublocation_master
set subloc_code=ISNULL  ([CODE],'NA')
FROM sublocation_master
join fidility...consolidated$ a
on subloc_name=a.[SITE]

SELECT COUNT (*) FROM sublocation_master


-------------------------------------
select sum ( asset_cost) from #TEMP_HD 
where assetqty=3

select * from hardware_register 
--truncate table hardware_register

select * into  #hd from hardware_register

--SELECT asset_table
--select *from #hd
--insert into hardware_register
--(invoicenumber, asset_cost, asset_accessory, asset_type,assetname,assetdesc,loc_id,  subloc_id, group_id,
--subgroup_id,facility_id  )
--select  invoicenumber, asset_cost, asset_accessory, asset_type,assetname,assetdesc,loc_id,  subloc_id, group_id,
--subgroup_id,facility_id   from  #hd --from hardware_register


select  assetqty, count(*)  as ct , assetqty*count(*) as atct from #temp_hd 
group by assetqty order by assetqty



select sum( asset_cost) from #temp_hd 

use fidility_new
select  assetqty, count(*)  as ct , assetqty*count(*) as atct from #temp_hd 
group by assetqty  order by assetqty


select sum (asset_cost) from hardware_register


select count(*) from hardware_register

--truncate table hardware_register

--DECLARE @j int = 0
--WHILE( @j < 1) 
--BEGIN

DECLARE @i int = 0
WHILE( @i <  95) 
BEGIN
    SET @i = @i + 1

    /* your code*/
insert into hardware_register(invoicenumber, asset_cost, asset_accessory, asset_type,assetname,assetdesc,loc_id,  subloc_id, group_id,
subgroup_id,facility_id  )
select  invoicenumber, asset_cost, asset_accessory, asset_type,assetname,assetdesc,loc_id,  subloc_id, group_id,
subgroup_id,facility_id   
from #temp_hd
where assetqty=95
END




--END








---------

