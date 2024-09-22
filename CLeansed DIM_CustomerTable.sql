--CLeansed DIM_CustomerTable--
SELECT
     c.CustomerKey AS CustomerKey
     -- ,[GeographyKey]
     -- ,[CustomerAlternateKey]
     -- ,[Title]
     ,c.FirstName AS FirstName
     -- ,[MiddleName]
     ,c.LastName AS LastName
	 ,c.FirstName + ' ' + LastName AS FullName
     -- ,[NameStyle]
     -- ,[BirthDate]
     -- ,[MaritalStatus]
     -- ,[Suffix]
     ,CASE c.Gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender --if there is M in the Gender column then it will replace it with Male and if F then with Female
     -- ,[EmailAddress]
     -- ,[YearlyIncome]
     -- ,[TotalChildren]
     -- ,[NumberChildrenAtHome]
     -- ,[EnglishEducation]
     -- ,[SpanishEducation]
     -- ,[FrenchEducation]
     -- ,[EnglishOccupation]
     -- ,[SpanishOccupation]
     -- ,[FrenchOccupation]
     -- ,[HouseOwnerFlag]
     -- ,[NumberCarsOwned]
     -- ,[AddressLine1]
     -- ,[AddressLine2]
     -- ,[Phone]
     ,c.DateFirstPurchase AS DateFirstPurchase
	 --,[CommuteDistance]
	 ,g.City AS CustomerCity
  FROM [AdventureWorksDW2019].[dbo].[DimCustomer] AS c
  LEFT JOIN dbo.DimGeography AS g ON g.GeographyKey = c.GeographyKey
  ORDER BY
  CustomerKey ASC
