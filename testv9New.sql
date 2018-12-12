--use [testv9New]
--use v9New
--insert into [service_line_master] (comp_code,sl_code,sl_name) 
--SELECT comp_code,sl_code,sl_name FROM [v9New].[dbo].[service_line_master]

--go

--CREATE PROCEDURE dbo.uspTryCatchTest
--AS
--BEGIN TRY
--    SELECT 1/0
--END TRY
--BEGIN CATCH
--    SELECT ERROR_NUMBER() AS ErrorNumber
--     ,ERROR_SEVERITY() AS ErrorSeverity
--     ,ERROR_STATE() AS ErrorState
--     ,ERROR_PROCEDURE() AS ErrorProcedure
--     ,ERROR_LINE() AS ErrorLine
--     ,ERROR_MESSAGE() AS ErrorMessage;
--END CATCH
--go



--select * from INFORMATION_SCHEMA.COLUMNS
--where TABLE_NAME='t_product_config'
--and column_default is null and IS_NULLABLE ='no'


INSERT INTO  dbo.temp_hardware_register_old
select * from [HD]...[temp_hardware_register$]

--exec [dbo].[AutoMapTables_Id_data]

--exec [dbo].[AutoMapTables_Id_data_v1]

select * from temp_hardware_register_old 


select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='employee_master' and IS_NULLABLE ='no'
and COLUMN_DEFAULT is null

select * from employee_master
select * from division_master
select * from costcenter_master
select * from department_master


select * from hardware_register 
order by ast_id desc

	--delete from hardware_register where ast_id >= 1093
	--dbcc checkident(hardware_register ,reseed,1093)
select * from employee_master order by emp_id desc
select * from location_master 
select * from sublocation_master order by subloc_id desc
select * from group_master
select * from subgroup_master order by subgroup_id desc
select * from vendor_master
select * from country_master
select * from division_master
select * from department_master
select * from costcenter_master
select * from facility_master
select * from cubicle_master
select * from workarea_master
select * from uom_master
select * from t_product_config order by product_id desc


--truncate table temp_hardware_register_old
--truncate table hardware_register
--truncate table group_master
--truncate table subgroup_master
--truncate table location_master
--truncate table sublocation_master
--truncate table facility_master
--truncate table cubicle_master
--truncate table workarea_master
--truncate table employee_master
--truncate table vendor_master
--truncate table COUNTRY_master
--truncate table costcenter_master
--truncate table department_master
--truncate table division_master
--truncate table user_manager
--truncate table uom_master
--truncate table uom_master
--truncate table t_product_config

select * from vendor_master order by vendor_id desc
select * from hardware_register order by ast_id desc






