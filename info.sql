use valvoline

select * from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME ='hardware_register'
and COLUMN_NAME like '%installed%'

--and COLUMN_DEFAULT is null
and IS_NULLABLE ='no'


--truncate table location_master


--truncate table employee_master


