select sum (value)   from master

select distinct[location]  from master



select  *  from master

alter table master add  asstid int identity(1,1) 


alter table master add  asst_id varchar (100) 


select distinct[emp code]  from master

UPDATE master
set asst_id=   'LAP-'+ RIGHT('0000000' + convert(varchar(4), asstid),6)


-------------hardware_register-----------------






