
use v9New

select invoicedate,instl_date,assetqty,* from hardware_register

select * from temp_hd




update hardware_register
set 
invoicedate= t.invoicedate,
instl_date=t.instl_date,
assetqty=t.assetqty
from hardware_register h
join  temp_hd t
on t.sno=h.ast_id


update hardware_register
set assignedto =1






-- truncate table hardware_register


-- truncate table temp_hardware_register_old
--select * from temp_hardware_register_old

-- exec [AutoMapTables_Id_data]

