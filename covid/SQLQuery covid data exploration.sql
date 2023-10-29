select distinct (location)
from coviddeaths
where continent is not null
 
order by 1
select  
from covidvaccinations

--### select the data we will use
select  location,date, total_cases, new_cases,total_deaths,population

from coviddeaths
where continent is not null

order by 1,2

--- we will see the number of countries that we have 
select count( distinct(location)) as numberofcountries
from coviddeaths
where continent is not null


--- looking at total cases vs total deaths  by the way you can change the countrys between the%% to see a specific country  and also for specific year 
select  location,date, total_cases,total_deaths,(total_deathstotal_cases)100 as Death_percentage
from coviddeaths
where location like '%egypt%' and date like '%2020%'
and continent is not null

order by 1,2


--- looking at total cases vs the population 
select  location,date, total_cases,population,(total_casespopulation)100 as infection_percentage
from coviddeaths
where location like '%egypt%' and date like '%2020%'
and continent is not null

order by 1,2



--- which country has the highest infection rate from the 219 country among the all time period
select  location, population ,max(total_cases) as highestinfectioncount , max((total_casespopulation))100 as infection_percentage 


from coviddeaths
where continent is not null

group by location ,population
order by infection_percentage desc
--- which country has the lowest infection rate from the 219 country among the all time period

select  location, population ,min(total_cases) as lowestinfectioncount ,min((total_casespopulation))100 as infection_percentage 
from coviddeaths
where continent is not null

group by location ,population
order by infection_percentage asc

--- which country has the highest deaths 
select  location,max(cast (total_deaths as int)) as deathcount 
from coviddeaths
where continent is not null

group by location 
order by deathcount desc


--- which continent has the highest deaths 

select  continent,max(cast (total_deaths as int)) as deathcount 
from coviddeaths
where continent is not null

group by continent 
order by deathcount desc
   


---- showing global numbers
select date ,sum(new_cases) as total_cases,sum(cast(new_deaths as int)) as total_deaths, (sum(cast(new_deaths as int))sum(new_cases)) 100 as percentage_new_deaths

from coviddeaths
where continent is not null

group by date
order by 1,2
--- important sums
select  sum(new_cases) as total_cases,sum(cast(new_deaths as int)) as total_deaths, (sum(cast(new_deaths as int))sum(new_cases)) 100 as percentage_new_deaths

from coviddeaths
where continent is not null

------- looking at total population vs vaccinations 
select dea.continent,dea.date ,dea.location ,dea.population,vac.new_vaccinations,sum(cast ( vac.new_vaccinations as int))over(partition by dea.location order by dea.location ,dea.date ) as additive_vac
from coviddeaths dea
join covidvaccinations vac
on dea.location= vac.location
and dea.date= vac.date
where dea.continent is not null
order by 3,2

--use cte to calculate the additive people vac over the total the population 
 with popvsvac (continent,date ,location ,population,additive_vac,new_vaccinations)
 as
 (
 select dea.continent,dea.date ,dea.location ,dea.population,vac.new_vaccinations,sum(cast ( vac.new_vaccinations as int))over(partition by dea.location order by dea.location ,dea.date ) as additive_vac
from coviddeaths dea
join covidvaccinations vac
on dea.location= vac.location
and dea.date= vac.date
where dea.continent is not null
)
select *,(additive_vac/population)*100
from popvsvac


--- or we can create a  new table(temp table )
drop table if exists popvsvaci 
create table popvsvaci
(continent nvarchar(255)
,date datetime ,
location nvarchar(255),
population int ,
new_vaccinations int ,
additive_vac int )
 insert into popvsvaci
 select dea.continent,dea.date ,dea.location ,dea.population,vac.new_vaccinations,sum(cast ( vac.new_vaccinations as int))over(partition by dea.location order by dea.location ,dea.date ) as additive_vac
from coviddeaths dea
join covidvaccinations vac
on dea.location= vac.location
and dea.date= vac.date
where dea.continent is not null
select *,(additive_vac/population)*100
from popvsvaci
order by 3,2
--### create a view
create view  percentage_people_vacinated as
select dea.continent,dea.date ,dea.location ,dea.population,vac.new_vaccinations,sum(cast ( vac.new_vaccinations as int))over(partition by dea.location order by dea.location ,dea.date ) as additive_vac
from coviddeaths dea
join covidvaccinations vac
on dea.location= vac.location
and dea.date= vac.date
where dea.continent is not null