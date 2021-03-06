USE [testv9New]
GO
/****** Object:  StoredProcedure [dbo].[AutoMapTables_Id_data]    Script Date: 11/16/2017 12:05:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[AutoMapTables_Id_data_v1] 
   
   
AS 

BEGIN
	SET NOCOUNT ON;
 
 	
 -- INSERTING VALUES INTO GROUP , uom PRODUCT , LOCATION MASTERS, DIVISION ,FACILITY, VENDOR ,EMPLOYEE MASTERS
 
 BEGIN

-- INLECT GROUP master
 insert into group_master   (group_name,group_code) 
 select  distinct [group], '-' 
 from temp_hardware_register_old as  hd 
 left join group_master   
 on [group]= group_name
 where group_name is null and group_name !='NA'

-- INSELECT uom master
 insert  into uom_master (unit_name,unit_code)
 select distinct uom ,'-' 
 from temp_hardware_register_old as  hd 
 left join   uom_master um
 ON hd.uom= um.unit_name
 where unit_name is null
 and uom is not null  AND uom !='NA'

-- INSELECT LOCATION master
insert into  	 location_master (loc_name,loc_code)
select distinct hd.[location] ,'-' 
from temp_hardware_register_old as  hd
left join location_master lt
ON hd.location= lt.loc_name
WHERE loc_name is null  AND [location] !='NA'
 
--  	INLECT  division_master 
insert  into division_master(div_name,div_code)
select distinct hd.division,hd.division_code
from temp_hardware_register_old as hd
left join  division_master
on hd.division=div_name
where division is not null 
and div_name is null  AND division !='NA'

--  	INLECT COUNTRY
insert   into   	 country_master(country_name,country_code)
select distinct hd.country,'-'
from temp_hardware_register_old hd
left join country_master ct
ON hd.country= ct.country_name
where  country_name is null and country !='NA'

--    	INLECT vendor_master
insert into vendor_master (vendor_name,vendor_add1,vendor_city,vendor_code,vendor_contact1,vendor_country,vendor_phone,vendor_phone1,vendor_state,procured_vendor,service_vendor,insurance_vendor)
select distinct hd.vendor,hd.vendor_add1,hd.vendor_city,hd.vendor_code,hd.vendor_contact1,hd.vendor_country,isnull(hd.vendor_phone,0)  as vendor_phone, '-',hd.vendor_state,0,0,0
from temp_hardware_register_old hd
left join vendor_master vt 
ON hd.vendor= vt.vendor_name
where  vendor_name is null AND vendor !='NA'

-- UPDATE ID
update vendor_master  
set 
procured_vendor=hd.p,
insurance_vendor=hd.i,
service_vendor=hd.s
from vendor_master vt
join
(select distinct vendor,isnull( v1.vendor_id,'0') as p,isnull( v2.vendor_id,'0') as s,isnull( v3.vendor_id,'0') as i
from temp_hardware_register_old h
left join vendor_master v1
on v1.vendor_name=h.procured_vendor
left join  vendor_master v2
on v2.vendor_name=h.service_vendor
left join  vendor_master v3
on v3.vendor_name=h.insurance_vendor
WHERE vendor !='NA'
) as hd
ON hd.vendor = vt.vendor_name



END
 --INSERTING VALUES INTO SUB GROUP , SUB LOCATION ,  FACILITY, CUBICLE, WORKAREA ,COSTCENTER, DEPARTMENT,PRODUCT
 

BEGIN

--  	INLECT SUB GROUP
insert  into subgroup_master  (subgroup_code ,group_id,subgroup_name,asset_prefix,accessory_prefix,asset_type) 
select distinct '-', group_master.group_id ,    subgroup, t.asset_prefix, t.accessory_prefix, t.asset_type 
from group_master
join temp_hardware_register_old  t
on group_name=t.[group]
left join subgroup_master st
ON  t.subgroup=st.subgroup_name
where  subgroup_name is null 
AND subgroup !='NA';

--  	INLECT PRODUCT
insert  into t_product_config (asset_accessory, startDate, endDate, product_name, description, product_code, manufacture, model, group_id ,subgroup_id)
select  distinct
case   hd.product_type 
when 'asset' then 0
when 'accessory' then 1 else 2 end as A,  
'1900-01-01', '1900-01-01' , hd.assetname,  hd.assetdesc, '-',  '-', '-' , t.group_id,  t.subgroup_id  
from temp_hardware_register_old hd
join subgroup_master t
on subgroup=t.subgroup_name
left join t_product_config pt
ON hd.assetname= pt.product_name and hd.assetdesc=pt.[description]
where product_name is null AND assetname !='NA';

--  	INLECT SUB LOCATION
insert sublocation_master  (loc_id,subloc_name,subloc_code)
select distinct t.loc_id, hd.sub_location,'-'
from temp_hardware_register_old hd
join location_master t 
on  hd.[location]= loc_name
left join sublocation_master lt
ON hd.sub_location= lt.subloc_name
where subloc_name is null AND sub_location !='NA';

--  	INLECT FACILITY MASTER
insert  into facility_master (  address1, address2, facility_code, facility_name, loc_id, pin, subloc_id, country_id  )
select distinct '-','-','-',   t.facility,  lt.loc_id,'0' ,st.subloc_id,ct.country_id
from temp_hardware_register_old t
join location_master lt
on loc_name= t.location
join sublocation_master st
on subloc_name = t.sub_location
join country_master ct
on country_name=t.country
left join facility_master ft 
on t.facility = ft.facility_name
where facility != 'NA' and facility is not null and  facility_name is  null;

--  	INLECT CUBICLE_MASTER
insert  into cubicle_master (  cubicle_bond, cubicle_code, cubicle_name, facility_id, loc_id, subloc_id, work_id, work_name  )
select distinct '-','-',hd.cubicle ,t.facility_id,t.loc_id,t.subloc_id,0,'-'
from facility_master t
join temp_hardware_register_old hd
on t.facility_name= hd.facility
left join cubicle_master ct
ON hd.cubicle= ct.cubicle_name
where cubicle_name is null and cubicle is not null and cubicle != 'NA';

--  	INLECT WORKAREA_MASTER
insert  into workarea_master (cubicle_id, facility_id, loc_id, subloc_id, workarea_code, workarea_name )
select  distinct  t.cubicle_id,t.facility_id,t.loc_id,t.subloc_id,'-',hd.workarea
from cubicle_master t
join temp_hardware_register_old hd
on t.cubicle_name=  hd.cubicle
left join workarea_master wt
on  hd.workarea= wt.workarea_name
where workarea_name is null and workarea is not null  and workarea !='NA' ;

--  	INLECT COSTCENTER_MASTER
insert  costcenter_master( costcenter_code,  costcenter_name,  div_id,  sl_id,  comp_code   )
select distinct hd.costcenter_code,hd.costcenter,t.div_id ,1,1  
from division_master t
join temp_hardware_register_old hd
on t.div_name=hd.division
left join costcenter_master ct
ON hd.costcenter= ct.costcenter_name
where costcenter_name IS NULL and  costcenter is not null and costcenter != 'NA';

--  	INLECT DEPARTMENT_MASTER
insert  into department_master (dep_code, dep_name, entity_id, costcenter_id, div_id  )
select distinct '-',hd.department,0,t.costcenter_id,t.div_id
from  costcenter_master t
join temp_hardware_register_old hd
on t.costcenter_name= hd.costcenter
left join department_master dt
ON hd.department= dt.dep_name
where dep_name is null and department is not null and department !='NA';

--  	INLECT EMPLOYEE_MASTER
insert into employee_master ( contact_no, costcenter_id, date_of_resign, div_id, email_id, emp_code, emp_name, extension, loc_id, subloc_id, working_status )
select distinct isnull( hd.Employee_contact_no,'0'), t.costcenter_id, '1900-01-01', t.div_id, hd.Employee_email_id, hd.Employee_code, hd.Employee_Name, '-', l.loc_id, sl.subloc_id, 1  
from  costcenter_master t
join temp_hardware_register_old hd
on t.costcenter_name=hd.costcenter 
join  sublocation_master  sl
on  sl.subloc_name=hd.sub_location
join  location_master l
on  l.loc_name= hd.[location] 
left join employee_master et
ON hd.employee_code= et.emp_code
where employee_code is not null AND employee_code !='NA'
and emp_code is  null ;

--  	INLECT USER_MANAGER
insert  into user_manager (emp_id,emp_name,login_name,[password],user_type,email_id,[status])
select distinct em.emp_id,em.emp_name,em.emp_name,'1234','employee',em.email_id,'1'
from employee_master em
left join user_manager um
ON em.emp_id= um.emp_id
where um.emp_id is null ;

 END
 
  -- AUTO CODE GENERATION BASED ON ID 'S

 BEGIN
 update group_master
set group_code=  'GRP-'+RIGHT('0000' + convert(varchar(4), group_id),3)


 update subgroup_master
set subgroup_code= 'SGRP-'+RIGHT('0000' + convert(varchar(4), subgroup_id),3)

 update t_product_config
set product_code= 'PDT-'+RIGHT('0000' + convert(varchar(4), product_id),3)

 update location_master
set loc_code= 'CIT-'+ RIGHT('0000' + convert(varchar(4), loc_id),3)

 update sublocation_master
set subloc_code= 'SIT-'+ RIGHT('0000' + convert(varchar(4), subloc_id),3)

 update facility_master
set facility_code= 'BLD-'+ RIGHT('0000' + convert(varchar(4), facility_id),3)

 update cubicle_master
set cubicle_code= 'FLR-'+ RIGHT('0000' + convert(varchar(4), cubicle_id),3)

 update workarea_master
set workarea_code= 'WRK-'+  RIGHT('0000' + convert(varchar(4), workarea_id),3)

 update department_master
set dep_code= 'DEPT-'+  RIGHT('0000' + convert(varchar(4), dep_id),3)


 update country_master
set country_code= 'CNT-'+  RIGHT('0000' + convert(varchar(4), country_id),3)

update uom_master
set uom_code= 'UoM-'+  RIGHT('0000' + convert(varchar(4), unit_id),3)


END

-- MAPPING VALUES FROM   GROUP ,  LOCATION , FACILITY, CUBICLE, WORKAREA MASTERS TO   HARDWARE REGISTER

BEGIN

MERGE hardware_register hd
USING ( 

select
ISNULL (serialnumber,'-') AS serialnumber,
ISNULL(po_number,'-') AS po_number,
ISNULL(invoice_number,'-') AS invoice_number,
--convert ( varchar,invoice_date,105) as invoicedate,
convert (decimal(10,2),amount) as asset_cost,    
temp_hardware_register_old.product_type,
assetname,  
assetdesc,
isnull (subgroup_id,0) as subgroup_id,
isnull (group_id ,0)as group_id,
isnull (sublocation_master.subloc_id,0) as subloc_id,
isnull (location_master.loc_id ,0)as loc_id,

isnull (vendor_master.procured_vendor,0) as procured_vendor,
isnull (vendor_master.service_vendor, 0)as service_vendor,

isnull (department_master.dep_id,0) dep_id,
isnull (costcenter_master.costcenter_id,0) costcenter_id,
isnull (emp_id,0) emp_id,

isnull ( f.facility_id,0) facility_id, 
isnull (c.cubicle_id,0) cubicle_id,
isnull (w.workarea_id,0) workarea_id

from temp_hardware_register_old
left join subgroup_master
on subgroup_name=subgroup
left join location_master
on loc_name=[location]
left join sublocation_master
on subloc_name=sub_location
left join vendor_master
on vendor_name= vendor
left join department_master
on dep_name=department
left join costcenter_master
on costcenter=costcenter_name
left join employee_master
on Employee_Name=emp_name

left join(select facility_id, facility_name , loc_name,subloc_name from facility_master
          join location_master
          on facility_master.loc_id= location_master.loc_id
          join sublocation_master
          on   facility_master.subloc_id =sublocation_master.subloc_id)f
on facility=f.facility_name and  temp_hardware_register_old.[location]=f.loc_name and sub_location=f.subloc_name

left join(select cubicle_id, cubicle_name,  facility_name , loc_name,subloc_name from cubicle_master
          join   facility_master
          on facility_master.facility_id=cubicle_master.facility_id
          join location_master
          on facility_master.loc_id= location_master.loc_id
          join sublocation_master
          on facility_master.subloc_id =sublocation_master.subloc_id )c
on cubicle=c.cubicle_name and  facility=c.facility_name and  temp_hardware_register_old.[location]=c.loc_name and sub_location=c.subloc_name

left join(select workarea_id, workarea_name, cubicle_name,  facility_name , loc_name,subloc_name from  workarea_master  
          join    cubicle_master
          on workarea_master.cubicle_id=cubicle_master.cubicle_id
          join  facility_master
          on facility_master.facility_id=cubicle_master.facility_id
          join location_master
          on facility_master.loc_id= location_master.loc_id
          join sublocation_master
          on   facility_master.subloc_id =sublocation_master.subloc_id)w
on workarea=w.workarea_name and  cubicle=w.cubicle_name and  facility=w.facility_name and  temp_hardware_register_old.[location]=w.loc_name and sub_location=w.subloc_name
)td 

ON 1=2
WHEN  NOT MATCHED THEN
INSERT (serialno,ponumber,invoicenumber,asset_cost,asset_accessory,assetname,assetdesc,loc_id,  subloc_id, group_id,subgroup_id,procured_vendor_id,service_vendor_id,costcenter_id,
dep_id,assignedto,facility_id,cubicle_id,workarea_id  ) 
values( td.serialnumber,td.po_number,td.invoice_number, td.asset_cost,    
case   td.product_type when 'asset' then 0 else 1 end  ,
td.assetname,td.assetdesc,td.loc_id,  td.subloc_id, td.group_id,td.subgroup_id,td.procured_vendor,td.service_vendor,td.costcenter_id,
td.dep_id,td.emp_id,td.facility_id,td.cubicle_id,td.workarea_id  );

UPDATE hardware_register
set assetid=   rtrim(t.asset_prefix) +'-'+ RIGHT('0000' + convert(varchar(4), t.slno),3)
from hardware_register hd
join (SELECT ast_id,asset_prefix, ROW_NUMBER() over ( partition by asset_prefix order by asset_prefix) as slno
      FROM hardware_register h
      join subgroup_master s
      on h.subgroup_id=s.subgroup_id )t
on hd.ast_id =t.ast_id

UPDATE hardware_register
set assetid=   'OTH-'+ RIGHT('0000' + convert(varchar(4), t.rno),3)
from hardware_register hd
join(SELECT ast_id, ROW_NUMBER() over ( order by ast_id) as rno
      FROM hardware_register h
      where assetid='')t
on  hd.ast_id =t.ast_id

END

truncate table temp_hardware_register_old  

END
