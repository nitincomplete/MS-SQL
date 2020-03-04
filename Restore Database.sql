	--Check Headers of backup file
  USE MASTER
	GO
	restore headeronly from disk = 'C:\Temp\SP2010_LoanOps_Archive1-Copy.bak'
	GO

  --Check MDF and LDF files of DB backup
	USE MASTER
	GO
	restore filelistonly from disk = 'C:\Temp\SP2010_LoanOps_Archive1-Copy.bak' 
	GO

  --Restore Database, Make sure to change/correct paths of MDF and LDF files
	RESTORE DATABASE [New Database Name-Copy] FROM DISK= 'C:\Temp\SP2010_LoanOps_Archive1-Copy.bak'
	WITH REPLACE,
	MOVE 'SP2010_LoanOps_Archive1' TO 'C:\Installed\MSSQL13.MSSQLSERVER\MSSQL\DATA\LoanOps_Archieve1-Copy.mdf',
	MOVE 'SP2010_LoanOps_Archive1_log' TO 'C:\Installed\MSSQL13.MSSQLSERVER\MSSQL\DATA\LoanOps_Archieve1-Copy_log.ldf';
	GO
