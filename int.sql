select * from hd order by ast_id

delete from hd where ast_id=1


SELECT 
 [Current LSN],    
 [Transaction ID],
     Operation,
     Context,
     AllocUnitName
    
FROM 
    fn_dblog(NULL, NULL) 
WHERE 
    Operation = 'LOP_DELETE_ROWS'

--------------------------

	SELECT
 [Current LSN],    
 Operation,
     [Transaction ID],
     [Begin Time],
     [Transaction Name],
     [Transaction SID]
FROM
    fn_dblog(NULL, NULL)
WHERE
    [Transaction ID] = '0000:00001739'
AND
    [Operation] = 'LOP_BEGIN_XACT'



