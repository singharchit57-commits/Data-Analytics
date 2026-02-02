USE WORLD;
--  Count how many cities are there in each country : 

SELECT CountryCode, Count(*) AS TotalCity
FROM City
GROUP By CountryCode;

-- Display all the continent having more than 30 countries --

SELECT Continent, COUNT(*) AS Cont
FROM Country
group by continent
having COUNT(*) > 30;

 -- List regions whose total population exceeds 200 million..
 
 SELECT Region,SUM(Population) as TP
 from Country
 GROUP BY Region
 having sum(population) > 200000000;
 
 -- Find the top 5 continents by average GNP per country.
 SELECT Continent, avg(GNP) as AVGGNP
 from Country
 Group by continent
 order by AVGGNP DESC
 limit 5;
 
 -- Find the total number of official languages spoken in each continent.
 SELECT Country.Continent,COUNT( Countrylanguage.Language) AS offi_lan
 From Country
 JOIN CountryLanguage
 ON Country.Code = countrylanguage.CountryCode 
 GROUP BY country.Continent;
 
 -- Find the maximum and minimum GNP for each continent
 SELECT Continent, MAX(GNP) as MAXGNP, MIN(GNP) as MINGNP
 from Country 
 Group by continent; 
 
 -- List continents where the average city population is greater than 200,000.
 SELECT Continent, Avg(City.Population) AS CTY_Population
 from Country
 JOIN City
 ON Country.code = City.Countrycode
 GROUP BY Country.Continent 
 having CTY_Population > 200000;
 
 -- Find the total population and average life expectancy for each continent, ordered by average life
 -- expectancy descending.
 
 SELECT Continent, SUM(Population) AS Sum_pp , avg(LifeExpectancy) AS Life_exp
 from Country
 GROUP BY Continent
 order by Life_exp DESC;
 
 -- Find the top 3 continents with the highest average life expectancy, but only include those where 
 -- the total population is over 200 milliom
 
    SELECT Continent,
    AVG(LifeExpectancy) AS AvgLife,
    SUM(Population) AS TotalPopulatio
    FROM Country
     GROUP BY Continent
    HAVING SUM(Population) > 200000000
    ORDER BY AvgLife DESC
      LIMIT 3;
 
 -- Find the country with the highest average city population.
 
 SELECT  Country.Name, avg(City. Population) AS CTY_pp
 from Country
  join 
 City
 ON Country. Code = City.CountryCode 
 group by Country.Name
 order by  CTY_pp DESC
 LIMIT 1 ;
 SHOW TABLES;
 
 
 
 
 
 
 
 
 