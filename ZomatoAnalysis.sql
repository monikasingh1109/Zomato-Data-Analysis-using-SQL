select * from Zomato

--top 5 pickup zones in terms of pickup

select * from [dbo].[CountryTable]


--Distinct country codes
select distinct(CountryCode)
from Zomato
order by CountryCode 

--distinct country names served by zomato

select distinct(c.country)
from Zomato z
join [dbo].[CountryTable] c
on z.CountryCode=c.CountryCode
group by c.Country


--total number of countries
select COUNT(country) from [dbo].[CountryTable]

--distinct count of countries and cities
select distinct z.City,c.Country
from Zomato z
join countrytable c
on z.CountryCode= c.countrycode
group by z.City,c.Country

--How many restaurants in each country and sort by no.of restaurants

select c.country,count(c.country) as Total_restaurant
from Zomato z
join [dbo].[CountryTable] c
on z.CountryCode=c.CountryCode
group by c.country
order by Total_restaurant desc

--Total number of restaurant in each city and country

select distinct z.City,c.Country, count(c.country) as Total_Res
from Zomato z
join countrytable c
on z.CountryCode= c.countrycode
group by z.City,c.Country
order by Total_Res desc

--Top 5 countries with zomato listed restaurants

select top 5 ct.Country,count(ct.Country) as TopN
from Zomato z
join CountryTable ct
on z.CountryCode=ct.CountryCode
group by ct.Country
order by TopN desc

--List of cities with average rating of more than 4.5
select  distinct  City
from Zomato
where rating>4.5



--list of cities and countries with more tha 4.5 rating
select distinct z.City,ct.Country,avg(z.Rating) as Rate
from Zomato z
inner join CountryTable ct
on z.CountryCode=ct.CountryCode
where z.Rating>4.5
group by z.City,ct.Country




--Top 2 countries with average rating of more than 4.5

select top 2 ct.Country,AVG(Rating) as Avg_Rate
from Zomato z
join CountryTable ct
on z.CountryCode=ct.CountryCode
where z.Rating > 4.5
group by ct.Country
order by Avg_Rate desc







select * from Zomato


select distinct(country)
from [dbo].[CountryTable] 
 

 --