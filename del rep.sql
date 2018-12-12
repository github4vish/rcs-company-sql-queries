--select distinct emp_code from employee_master 
--select  * from location_master 
--go

WITH TempEmp
AS
(
SELECT *,ROW_NUMBER() OVER(PARTITION by loc_name  ORDER BY loc_name)
AS duplicateRecCount
FROM dbo.location_master
)
DELETE FROM TempEmp
WHERE duplicateRecCount > 1 


SELECT * into  location_master_bak from location_master 


select * from location_master


select asset_i  serialno,* from hardware_register

