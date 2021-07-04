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


--Cities with poor restaurant rating
select distinct(City),AVG(Rating) as Average_rating
from Zomato
group by City
having AVG(Rating)<3
order by Average_rating

--Restaurants in Kolkata which provides Online delivery
select RestaurantName,Rating
from Zomato
where City='Kolkata' and Has_Online_delivery='Yes'

--Pizza restaurants in New delhi with average rating 3+
select RestaurantName
from Zomato
where City='New Delhi' and Cuisines='Pizza' and Rating>3

select distinct(country)
from [dbo].[CountryTable] 
 
 select * from Zomato
 --Most affordable and High rated restaunrant in city

 select RestaurantName,Average_Cost_for_two
 from Zomato
 

 --restaurants with poor offline service

 select Avg(Rating) as Avg_Rate,RestaurantName,City
 from Zomato
 where Has_Online_delivery='No' and Rating<3
 group by City,RestaurantName
 order by Avg_Rate desc

 --cities with atleast 3 restaurants with rating >=4.5 and in case there are two cities with same count,sort them alphabetically
 select City,count(RestaurantName) as RestCount,AVG(Rating) as avg_rate
 from Zomato
 where Rating>=4.5
 group by City
 having COUNT(RestaurantName)>3
 order by City asc


 --Average cost of 2 across all zomato linked restaurants
 
 select avg(Average_Cost_for_two)
 from Zomato

 select * from Zomato
--Top 5 restaurants with highest rating
select top 5 RestaurantName,count(RestaurantName) as Count_Res,max(Rating) as Avg_Rate
from Zomato
group by RestaurantName
order by Avg_Rate desc

-- top 5 restaurants with max votes
select top 5 RestaurantName,count(RestaurantName),MAX(Votes) as maximum_Votes
from Zomato
group by RestaurantName
order by maximum_Votes desc

--Group restaurants basis on cost for two - Luxurious Expensive,Very Expensive,Expensive,High,Medium High,Average
--Find number of restaurants for in each category
