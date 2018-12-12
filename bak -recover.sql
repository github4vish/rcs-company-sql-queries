use master
go

select * into hd from  hardware_register


select * from hardware_register order by ast_id

delete from hardware_register where ast_id =1

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

--	0000:00001945


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
    [Transaction ID] = '0000:00001945'
AND
    [Operation] = 'LOP_BEGIN_XACT'



	--


RESTORE DATABASE CapitalBankv9New
    FROM DISK = 'C:\ReadingDBLog_FULL_15JAN2014.bak'
WITH
    MOVE 'ReadingDBlog' TO 'C:\ReadingDBLog.mdf',
    MOVE 'ReadingDBlog_log' TO 'C:\ReadingDBLog_log.ldf',
    REPLACE, NORECOVERY;
    
    GO

--Restore Log backup with STOPBEFOREMARK option to recover exact LSN.

   RESTORE LOG ReadingDBLog_COPY
FROM
    DISK = N'C:\ReadingDBlog_tlogbackup_15thJan610.trn'
WITH
    STOPBEFOREMARK = 'lsn:22000000042100001'
 



