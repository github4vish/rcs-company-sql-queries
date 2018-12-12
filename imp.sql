SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME ='user_manager'
and column_default  is null
and is_nullable ='no'



insert into employee_master
(

emp_code,
emp_name,
email_id,
contact_no,
costcenter_id,
loc_id,
div_id,
working_status,
date_of_resign,
extension,
subloc_id
)

values('EMP-01','bantushah','bantu@rcssoft.com','0','0','0','0','1','1900-01-01','0','0' )


select * from employee_master
select * from user_manager

insert into user_manager
(
emp_id,
emp_name,
login_name,
[password],
[user_type],
email_id,
[status]
)

values('1','bantushah','bantushah','1','super','bantu@rcssoft.com',1)
