--select count (*) from m_table
--select sum(QUANTITY) FROM m_table 

--select  quantity, count(*)  as ct ,
-- quantity*count(*) as atct from m_table 
--group by quantity  order by quantity


--begin transaction t1
--declare @rowcount int
--set @rowcount = 1


--while @rowcount > 0
--begin
--    insert into m_table
--    select * from m_table where QUANTITY > 0

--    update m_table    set QUANTITY = QUANTITY - 1 where QUANTITY > 1
--	select @rowcount = @@rowcount
--end

--commit transaction t1
--rollback tran t1


select * INTO m_table1  from [ALL]...Sheet1$
 




select top  0 * into t_table1 from m_table1

insert into t_table1
SELECT t.* 
 FROM [dbo].[m_table1] t 
CROSS APPLY (
             SELECT 1
             FROM master..spt_values v
             WHERE v.type = 'P' AND v.number < t.Quantity
             )o(Quantity)

update t_table1 set QUANTITY =1


select SUM (QUANTITY) from t_table1

select * from m_table

BULK INSERT 'D:\Desktop\all_cc_extract.txt' 
FROM 
WITH
(
FIRSTROW = 2,
FIELDTERMINATOR= '|',
ROWTERMINATOR = '\n'
)

