/*
IMPORT CSV FILE TO SQL TABLE

Reference: https://docs.microsoft.com/en-us/sql/t-sql/statements/bulk-insert-transact-sql?view=sql-server-2017#arguments
Author: David Gulli
*/

BULK INSERT dbo.Social_FacebookPageInsights
FROM 'KCCInsights.csv'
WITH (FIRSTROW=2);