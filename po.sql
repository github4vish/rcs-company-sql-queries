USE inteva_po


go
create table po_transaction(
po_number varchar(100) not null default '-' , 
po_date datetime not null default '1900-01-01 '  , 
sequence_serial_no  varchar(100) not null default '-', 
asset_description varchar(100) not null default '-'  ,
io_number varchar(100) not null default '-' ,
currency_name varchar(100) not null default '-' , 
unit_price decimal(29,2) not null default '0.00', 
requester_id varchar(100) not null default '-' ,
cc_id int not null default '0', 
quantity int  not null default '0'
) 


go

update po_transaction  set sequence_serial_no= '000'+sequence_serial_no


select * from    po_transaction where
po_number='A000004798'

go

--update  B set   B.currency_name = A.currency_name  from
--(
--select   t1.*   from    po_transaction t1 , po_transaction t2 where
--t1.po_number=t2.po_number and  t1.sequence_serial_no = t2.sequence_serial_no
--and t1.asset_description!=t2.asset_description 
--and t1.currency_name ='-'
--)B,


--(
--select   t1.*  from    po_transaction t1 , po_transaction t2 where
--t1.po_number=t2.po_number and  t1.sequence_serial_no = t2.sequence_serial_no
--and t1.asset_description!=t2.asset_description 

--and t1.currency_name !='-'
--)
--A

--where
--A.po_number=B.po_number and  A.sequence_serial_no = B.sequence_serial_no
--and A.asset_description!=B.asset_description 



select  t1.* from    po_transaction t1 , po_transaction t2 where
t1.po_number=t2.po_number and  t1.sequence_serial_no = t2.sequence_serial_no
--and t1.asset_description!=t2.asset_description 
and t1.asset_description !='-'


go


select distinct t1.* from    po_transaction t1 , po_transaction t2 where
t1.po_number=t2.po_number and t1.asset_description ='-'

--sequence_serial_no
--000830
--currency_name
--asset_description
---

--currency_name
--USD
--po_number='A000004798'








