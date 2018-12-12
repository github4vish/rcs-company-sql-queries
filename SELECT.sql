--update A set A.serialno='CDBMXJ2'
--from (select ROW_NUMBER()  over ( order by ast_id )  rno , serialno from hardware_register where invoicenumber='INV # T098932' and ponumber='NXT/PO/CAP/019/2017-18' and asset_cost=1845486)A where A.rno  =1




  



--(n/a)


select * from hardware_register where serialno='C93NXJ2'  and ast_id> 5727














