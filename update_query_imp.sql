use ig_traxx_new

select * from data_porting_master

USE [ig_traxx_new]
GO



--update employee_master 
--set contact_no= isnull( hd.Employee_contact_no,'0'),
--costcenter_id=  ISNULL( t.costcenter_id,0) ,
--div_id= ISNULL ( t.div_id,0) ,
--email_id= isnull( hd.Employee_email_id,'-') ,
--emp_code= hd.Employee_code ,
-- emp_name= ISNULL (hd.Employee_Name,'-') ,
-- loc_id= ISNULL ( l.loc_id,0) ,
-- subloc_id=   ISNULL ( sl.subloc_id,0) 
 
--from  data_porting_master hd 
-- left join costcenter_master t
--on t.costcenter_name=hd.Employee_costcenter 
-- left join  sublocation_master  sl
--on  sl.subloc_name=hd.Employee_sublocation
-- left join  location_master l
--on  l.loc_name= hd.[Employee_location] 
--left join employee_master et
--ON hd.employee_code= et.emp_code



 select * from data_porting_master where Employee_code='IGS/05675'



-- update  employee_master set report_man= isnull ( cast ( A.emp_id as varchar(5)),'-')
--from employee_master p  join
--(
--select   hd.Employee_code ,   e.emp_id 
-- from data_porting_master hd  
-- left join employee_master e
-- on e.emp_name=hd.report_man
-- )A
--on p.emp_code=A.Employee_code


 select * from employee_master where emp_name='Amardeep Sing Bhatia'

 select * from data_porting_master where Employee_code='IGS/00861'

 select  count(*) from data_porting_master where report_man is not null


 --update employee_master
 --set report_man= isnull ( cast ( e.emp_id as varchar(5)),'-')
 --from employee_master e
 --join data_porting_master hd
 --on e.emp_name=hd.report_man

 
GO


--insert into employee_master ( contact_no, costcenter_id, date_of_resign, div_id, email_id, emp_code, emp_name, extension, loc_id, subloc_id, working_status,report_man )
GO


