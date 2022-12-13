-- Raw master data

Select *
From AutoSalesEbayGermany..autos_random_50k_cleaned$
Order by F1 asc

-- To group how many ad created in each year (if there is any different year)

With CTE
as
(
Select year(date_crawled) as AdYearCreated
From AutoSalesEbayGermany..autos_random_50k_cleaned$
)
Select AdYearCreated, COUNT(AdYearCreated) as TotalAdCreated
From CTE
Group by AdYearCreated
Order by TotalAdCreated

-- To determine the group year registred

Select TOP(10) registration_year, COUNT(registration_year) as Total
From AutoSalesEbayGermany..autos_random_50k_cleaned$
Group by registration_year
Order by Total desc

-- Based on top 1- registered car, want to know the average price for each car

Select registration_year, AVG(price_EUR) as AveragePrice
From AutoSalesEbayGermany..autos_random_50k_cleaned$
Where registration_year in (2005, 2006, 2004, 2003, 1999, 2002, 2001, 2000, 2007, 2008)
Group by registration_year
Order by AveragePrice desc

-- To determine the vehicle type

Select vehicle_type, COUNT(vehicle_type) as Total
From AutoSalesEbayGermany..autos_random_50k_cleaned$
Where vehicle_type != 'Unknown'
Group by vehicle_type 
Order by Total desc


-- To determine the brand of the car

Select TOP(10) brand, COUNT(brand) as Total
From AutoSalesEbayGermany..autos_random_50k_cleaned$
Group by brand
Order by Total desc

-- To plot the postal code

Select postal_code, COUNT(postal_code) as Total
From AutoSalesEbayGermany..autos_random_50k_cleaned$
Group by postal_code

-- To convert the word to english and group the transmission

With CTE
as
(
Select REPLACE(REPLACE(transmission, 'manuell', 'manual'), 'automatik', 'automatic') as transmission
From AutoSalesEbayGermany..autos_random_50k_cleaned$
)
Select transmission, COUNT(transmission) as Total
From CTE
Where transmission != 'Unknown'
Group by transmission



