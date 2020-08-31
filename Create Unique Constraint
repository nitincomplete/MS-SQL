USE [Database Name]
GO

IF EXISTS(SELECT * FROM SYS.INDEXES WHERE Name = 'UQ_Name_ID' and is_unique_constraint = 1)
BEGIN
      ALTER TABLE [Table Name] DROP CONSTRAINT UQ_Name_ID 
END
IF NOT EXISTS(SELECT * FROM SYS.INDEXES WHERE Name = 'UQ_Name_ID' and is_unique_constraint = 1)
BEGIN
      ALTER TABLE [Table Name] ADD CONSTRAINT UQ_Name_ID UNIQUE (ID)
END
GO
