
SELECT * FROM hardware_register


UPDATE hardware_register
set assetid=   'OTH'+RIGHT('0000' + convert(varchar(4),t.RNO ),3)
from hardware_register hd
 join
 (
  SELECT ast_id,ROW_NUMBER() over ( order by ast_id )AS RNO
from hardware_register
WHERE assetid =''

)t

  on 
 hd.ast_id =t.ast_id






SELECT * FROM hardware_register
WHERE assetid like '%oth%'



