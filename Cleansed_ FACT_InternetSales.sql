-- Cleansed FACT_InternetSales Table --
SELECT 
  [ProductKey]
  ,[OrderDateKey] 
  ,[DueDateKey]
  ,[ShipDateKey]
  ,[CustomerKey]
  --,[PromotionKey]
  --,[CurrencyKey]
  --,[SalesTerritoryKey]
  ,[SalesOrderNumber]
  --  [SalesOrderLineNumber], 
  --  ,[RevisionNumber]
  --  ,[OrderQuantity], 
  --  ,[UnitPrice], 
  --  ,[ExtendedAmount]
  --  ,[UnitPriceDiscountPct]
  --  ,[DiscountAmount] 
  --  ,[ProductStandardCost]
  --  ,[TotalProductCost] 
  , [SalesAmount] 
  --,[TaxAmt]
  --,[Freight]
  --,[CarrierTrackingNumber] 
  --,[CustomerPONumber] 
  --,[OrderDate] 
  --,[DueDate] 
  --,[ShipDate] 
FROM 
  [AdventureWorksDW2019].[dbo].[FactInternetSales]
WHERE 
  LEFT (OrderDateKey, 4) >= YEAR(GETDATE()) -2 -- Ensures we always only bring two years of date from extraction. 
  -- GETDATE() gives the date when this query is executing and Year() gives the year of that date so  YEAR(GETDATE()) - 2 gives if YEAR(GETDATE()) is 2024 so 2024 - 2 = 2022.
  -- (OrderDateKey, 4) means it will return the first 4 numbers of OrderDateKey so if OrderDateKey is 20220101, (OrderDateKey, 4) will return 2022 
  -- and if (OrderDateKey, 4) is greater or equal to YEAR(GETDATE()) -2, in this case 2022 is greater or equal to 2022 then we will get value from that year to the next years. 
  -- We won't receive the values of the years which are before 2022. That way we always bring two years of date from extraction.
ORDER BY
  OrderDateKey ASC
