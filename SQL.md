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
