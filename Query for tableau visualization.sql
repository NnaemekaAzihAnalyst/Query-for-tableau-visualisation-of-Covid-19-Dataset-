/* 
 
Queries used for tableauprojct 
 
*/

--1:
--Overall all across the world
select sum(new_cases) as total_cases, 
	   sum(cast(new_deaths as int)) as total_deaths, 
	   sum(cast(new_deaths as int))/sum(new_cases)*100 as DeathPercentage
from ShemtovPortfolioProject..CovidDeaths
--where location like '%STATE%'
where continent is not null
--group by date                                                                                                                                                                                 
order by 1,2

--JUST A DOUBLE CHECK BASED OFF THE DATA PROVIDED 
--numbers are extremely close so we will them

--2:
-- we take these out as they are not included in the above queries and we want to stay consistent
-- european uniion is part of europe

select location, sum(cast(new_deaths as int)) as TotalDeathCount
from ShemtovPortfolioProject..CovidDeaths
--where location like '%STATE%'
where continent is null 
and location not in ('world','european union','international')
group by location
order by TotalDeathCount desc


--3:

select location, population, max(total_cases) as HighestInfectionCount, max(total_cases/population)*100 as CasesByPopulapercentage
from ShemtovPortfolioProject..CovidDeaths
--where location like '%STATE%'
group by location, population
order by CasesByPopulapercentage desc


--4:

select location, population, date, max(total_cases) as HighestInfectionCount, max(total_cases/population)*100 as CasesByPopulapercentage
from ShemtovPortfolioProject..CovidDeaths
--where location like '%STATE%'
group by location, population, date
order by CasesByPopulapercentage desc

