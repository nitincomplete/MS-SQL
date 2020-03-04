SELECT * FROM sys.indexes where is_unique_constraint = 1

OR

SELECT sh.name AS schema_name,
   i.name AS constraint_name,
   t.name AS table_name,
   c.name AS column_name,
   ic.key_ordinal AS column_position,
   ic.is_descending_key AS is_desc,
   i.is_unique_constraint
FROM sys.indexes i
   INNER JOIN sys.index_columns ic
      ON i.index_id = ic.index_id AND i.object_id = ic.object_id
   INNER JOIN sys.tables AS t 
      ON t.object_id = i.object_id
   INNER JOIN sys.columns c
      ON t.object_id = c.object_id AND ic.column_id = c.column_id
   INNER JOIN sys.objects AS syso 
      ON syso.object_id = t.object_id AND syso.is_ms_shipped = 0 
   INNER JOIN sys.schemas AS sh
      ON sh.schema_id = t.schema_id 
   INNER JOIN information_schema.schemata sch
      ON sch.schema_name = sh.name
WHERE i.is_unique_constraint = 1
   -- AND sch.catalog_name = 'EmployeesQX'
   -- AND sh.name = 'dbo'
ORDER BY sh.name, i.name, ic.key_ordinal;
