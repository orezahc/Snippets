- Select indexed [schema].[table] 
```
SELECT 
    IndexName = QUOTENAME(I.name), 
    TableName =
        QUOTENAME(SCHEMA_NAME(T.[schema_id])) + 
        N'.' + QUOTENAME(T.name), 
    IsPrimaryKey = I.is_primary_key
FROM sys.indexes AS I
INNER JOIN sys.tables AS T
    ON I.[object_id] = T.[object_id]
WHERE
    I.type_desc <> N'HEAP'
ORDER BY 
    TableName ASC, 
    IndexName ASC;
```
- Select [schema].[table] with identity
```
SELECT
    TableName =
        QUOTENAME(SCHEMA_NAME(T.[schema_id])) + 
        N'.' + QUOTENAME(T.name), 
    IdentityColumn = COALESCE(QUOTENAME(C.name), N'No identity column')
FROM sys.tables AS T
LEFT OUTER JOIN sys.columns AS C
    ON T.[object_id] = C.[object_id]
    AND C.is_identity = 1
where SCHEMA_NAME(T.[schema_id]) = 'schema'
ORDER BY
    TableName ASC
```
- Index a table
```
CREATE INDEX IDX_TABLENAME ON [schema].[table] (COL1, COL2, ...)
```

- Generate SQL statements for droping all tables from a specified schema.
```
DECLARE @SqlStatement NVARCHAR(MAX)
SELECT @SqlStatement = 
    COALESCE(@SqlStatement, N'') + N'DROP TABLE [DBO1].' + QUOTENAME(TABLE_NAME) + N';' + CHAR(13)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'raw'

PRINT @SqlStatement
```
- Select row count of all tables.
```
SELECT T.name AS [TABLE NAME], 
       I.rows AS [ROWCOUNT] 
FROM   sys.tables AS T 
       INNER JOIN sys.sysindexes AS I 
               ON T.object_id = I.id 
                  AND I.indid < 2 
ORDER  BY I.rows DESC
```

- datetime2 of last day
```
select dateadd(day, -1, convert(datetime2, '2018-02-06T17:24:06.8130000'));
```
