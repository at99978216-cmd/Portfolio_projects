/*
============================================================
Covid 19 Data Exploration Project
Database: MySQL
============================================================

Skills Demonstrated:
- Database & Table Creation
- CSV Data Import (LOAD DATA INFILE)
- Data Cleaning (NULLIF, TRIM, STR_TO_DATE)
- Filtering & Sorting
- Aggregations & GROUP BY
- Window Functions (OVER, PARTITION BY)
- Joins
- CTE (Common Table Expressions)
- Temporary Tables
- Views
============================================================
*/

CREATE DATABASE IF NOT EXISTS portfolio_project;
USE portfolio_project;

/* ============================
   TABLE CREATION
============================ */

CREATE TABLE CovidDeaths (
    iso_code VARCHAR(20),
    continent VARCHAR(50),
    location VARCHAR(100),
    date DATE,
	population BIGINT,	
    total_cases BIGINT,
    new_cases BIGINT,
    new_cases_smoothed DOUBLE,

    total_deaths BIGINT,
    new_deaths BIGINT,
    new_deaths_smoothed DOUBLE,

    total_cases_per_million DOUBLE,
    new_cases_per_million DOUBLE,
    new_cases_smoothed_per_million DOUBLE,

    total_deaths_per_million DOUBLE,
    new_deaths_per_million DOUBLE,
    new_deaths_smoothed_per_million DOUBLE,

    reproduction_rate DOUBLE,

    icu_patients DOUBLE,
    icu_patients_per_million DOUBLE,
    hosp_patients DOUBLE,
    hosp_patients_per_million DOUBLE,

    weekly_icu_admissions DOUBLE,
    weekly_icu_admissions_per_million DOUBLE,
    weekly_hosp_admissions DOUBLE,
    weekly_hosp_admissions_per_million DOUBLE

);


DROP TABLE IF EXISTS CovidVaccination;
CREATE TABLE CovidVaccination (
    iso_code VARCHAR(20),
    continent VARCHAR(50),
    location VARCHAR(100),
    date DATE,

    new_tests BIGINT,
    total_tests BIGINT,
    total_tests_per_thousand DOUBLE,
    new_tests_per_thousand DOUBLE,
    new_tests_smoothed DOUBLE,
    new_tests_smoothed_per_thousand DOUBLE,

    positive_rate DOUBLE,
    tests_per_case DOUBLE,
    tests_units VARCHAR(50),

    total_vaccinations BIGINT,
    people_vaccinated BIGINT,
    people_fully_vaccinated BIGINT,
    new_vaccinations BIGINT,
    new_vaccinations_smoothed DOUBLE,

    total_vaccinations_per_hundred DOUBLE,
    people_vaccinated_per_hundred DOUBLE,
    people_fully_vaccinated_per_hundred DOUBLE,
    new_vaccinations_smoothed_per_million DOUBLE,

    stringency_index DOUBLE,

    population_density DOUBLE,
    median_age DOUBLE,
    aged_65_older DOUBLE,
    aged_70_older DOUBLE,
    gdp_per_capita DOUBLE,
    extreme_poverty DOUBLE,
    cardiovasc_death_rate DOUBLE,
    diabetes_prevalence DOUBLE,
    female_smokers DOUBLE,
    male_smokers DOUBLE,
    handwashing_facilities DOUBLE,
    hospital_beds_per_thousand DOUBLE,
    life_expectancy DOUBLE,
    human_development_index DOUBLE
);

/* ============================
   DATA LOADING & CLEANING
============================ */

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidDeaths.csv'
INTO TABLE coviddeaths
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS

(
    iso_code,
    @continent,
    location,
    @date,
    @population,
    @total_cases,
    @new_cases,
    @new_cases_smoothed,
    @total_deaths,
    @new_deaths,
    @new_deaths_smoothed,
    @total_cases_per_million,
    @new_cases_per_million,
    @new_cases_smoothed_per_million,
    @total_deaths_per_million,
    @new_deaths_per_million,
    @new_deaths_smoothed_per_million,
    @reproduction_rate,
    @icu_patients,
    @icu_patients_per_million,
    @hosp_patients,
    @hosp_patients_per_million,
    @weekly_icu_admissions,
    @weekly_icu_admissions_per_million,
    @weekly_hosp_admissions,
    @weekly_hosp_admissions_per_million
)
SET
	continent = NULLIF(@continent, ''),
    date = STR_TO_DATE(@date, '%Y-%m-%d'),

    population = NULLIF(@population, ''),
    total_cases = NULLIF(@total_cases, ''),
    new_cases = NULLIF(@new_cases, ''),
    new_cases_smoothed = NULLIF(@new_cases_smoothed, ''),

    total_deaths = NULLIF(@total_deaths, ''),
    new_deaths = NULLIF(@new_deaths, ''),
    new_deaths_smoothed = NULLIF(@new_deaths_smoothed, ''),

    total_cases_per_million = NULLIF(@total_cases_per_million, ''),
    new_cases_per_million = NULLIF(@new_cases_per_million, ''),
    new_cases_smoothed_per_million = NULLIF(@new_cases_smoothed_per_million, ''),

    total_deaths_per_million = NULLIF(@total_deaths_per_million, ''),
    new_deaths_per_million = NULLIF(@new_deaths_per_million, ''),
    new_deaths_smoothed_per_million = NULLIF(@new_deaths_smoothed_per_million, ''),

    reproduction_rate = NULLIF(@reproduction_rate, ''),

    icu_patients = NULLIF(@icu_patients, ''),
    icu_patients_per_million = NULLIF(@icu_patients_per_million, ''),
    hosp_patients = NULLIF(@hosp_patients, ''),
    hosp_patients_per_million = NULLIF(@hosp_patients_per_million, ''),

    weekly_icu_admissions = NULLIF(@weekly_icu_admissions, ''),
    weekly_icu_admissions_per_million = NULLIF(@weekly_icu_admissions_per_million, ''),
    weekly_hosp_admissions = NULLIF(@weekly_hosp_admissions, ''),
    weekly_hosp_admissions_per_million = NULLIF(@weekly_hosp_admissions_per_million, '');
; 


LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/CovidVaccinations.csv'
INTO TABLE CovidVaccination
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
    iso_code,
    @continent,
    location,
    @date,

    @new_tests,
    @total_tests,
    @total_tests_per_thousand,
    @new_tests_per_thousand,
    @new_tests_smoothed,
    @new_tests_smoothed_per_thousand,

    @positive_rate,
    @tests_per_case,
    tests_units,

    @total_vaccinations,
    @people_vaccinated,
    @people_fully_vaccinated,
    @new_vaccinations,
    @new_vaccinations_smoothed,

    @total_vaccinations_per_hundred,
    @people_vaccinated_per_hundred,
    @people_fully_vaccinated_per_hundred,
    @new_vaccinations_smoothed_per_million,

    @stringency_index,

    @population_density,
    @median_age,
    @aged_65_older,
    @aged_70_older,
    @gdp_per_capita,
    @extreme_poverty,
    @cardiovasc_death_rate,
    @diabetes_prevalence,
    @female_smokers,
    @male_smokers,
    @handwashing_facilities,
    @hospital_beds_per_thousand,
    @life_expectancy,
    @human_development_index
)
SET
    continent = NULLIF(@continent, ''),
    date = STR_TO_DATE(@date, '%Y-%m-%d'),

    new_tests = NULLIF(TRIM(@new_tests), ''),
    total_tests = NULLIF(TRIM(@total_tests), ''),
    total_tests_per_thousand = NULLIF(TRIM(@total_tests_per_thousand), ''),
    new_tests_per_thousand = NULLIF(TRIM(@new_tests_per_thousand), ''),
    new_tests_smoothed = NULLIF(TRIM(@new_tests_smoothed), ''),
    new_tests_smoothed_per_thousand = NULLIF(TRIM(@new_tests_smoothed_per_thousand), ''),

    positive_rate = NULLIF(TRIM(@positive_rate), ''),
    tests_per_case = NULLIF(TRIM(@tests_per_case), ''),

    total_vaccinations = NULLIF(TRIM(@total_vaccinations), ''),
    people_vaccinated = NULLIF(TRIM(@people_vaccinated), ''),
    people_fully_vaccinated = NULLIF(TRIM(@people_fully_vaccinated), ''),
    new_vaccinations = NULLIF(TRIM(@new_vaccinations), ''),
    new_vaccinations_smoothed = NULLIF(TRIM(@new_vaccinations_smoothed), ''),

    total_vaccinations_per_hundred = NULLIF(TRIM(@total_vaccinations_per_hundred), ''),
    people_vaccinated_per_hundred = NULLIF(TRIM(@people_vaccinated_per_hundred), ''),
    people_fully_vaccinated_per_hundred = NULLIF(TRIM(@people_fully_vaccinated_per_hundred), ''),
    new_vaccinations_smoothed_per_million = NULLIF(TRIM(@new_vaccinations_smoothed_per_million), ''),

    stringency_index = NULLIF(TRIM(@stringency_index), ''),

    population_density = NULLIF(TRIM(@population_density), ''),
    median_age = NULLIF(TRIM(@median_age), ''),
    aged_65_older = NULLIF(TRIM(@aged_65_older), ''),
    aged_70_older = NULLIF(TRIM(@aged_70_older), ''),
    gdp_per_capita = NULLIF(TRIM(@gdp_per_capita), ''),
    extreme_poverty = NULLIF(TRIM(@extreme_poverty), ''),
    cardiovasc_death_rate = NULLIF(TRIM(@cardiovasc_death_rate), ''),
    diabetes_prevalence = NULLIF(TRIM(@diabetes_prevalence), ''),
    female_smokers = NULLIF(TRIM(@female_smokers), ''),
    male_smokers = NULLIF(TRIM(@male_smokers), ''),
    handwashing_facilities = NULLIF(TRIM(@handwashing_facilities), ''),
    hospital_beds_per_thousand = NULLIF(TRIM(@hospital_beds_per_thousand), ''),
    life_expectancy = NULLIF(TRIM(@life_expectancy), ''),
    human_development_index = NULLIF(TRIM(@human_development_index), '');
;

/* ============================
   DATA EXPLORATION & ANALYSIS
============================ */

-- Making sure that all the data is imported correctly.

Select *
From coviddeaths 
where continent is not null
order by 3,4 ;

Select *
From covidvaccination
Where continent is not null 
order by 3,4 ;

-- Select Data that we are going to be starting with

Select Location, date, total_cases, new_cases, total_deaths, population
From CovidDeaths
Where continent is not null 
order by 1,2 ;

-- Total Cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country

Select distinct location
from coviddeaths
where location like '%India%' ;

Select Location, date, total_cases,total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From CovidDeaths
Where location = 'India'
and continent is not null 
order by 1,2;

-- Total Cases vs Population
-- Shows what percentage of population infected with Covid

Select 
	Location, date, Population, total_cases, 
	round((total_cases/population)*100,2) as PercentPopulationInfected
From CovidDeaths
Where continent is not null 
order by 1,2;

-- Countries with Highest Infection Rate compared to Population

Select 
	Location, Population, MAX(total_cases) as HighestInfectionCount,
	Round(Max((total_cases/population))*100,2) as PercentPopulationInfected
From CovidDeaths
Where continent is not null 
Group by Location, Population
order by PercentPopulationInfected desc;

-- Countries with Highest Death Count per Population

Select Location, MAX(Total_deaths) as TotalDeathCount
From CovidDeaths
Where continent is not null 
Group by Location
order by TotalDeathCount desc;

-- BREAKING THINGS DOWN BY CONTINENT

-- Showing contintents with the highest death count per population

Select continent, MAX(Total_deaths) as TotalDeathCount
From CovidDeaths
Where continent is not null 
Group by continent
order by TotalDeathCount desc;

-- GLOBAL NUMBERS

Select 
	SUM(new_cases) as total_cases, SUM(new_deaths) as total_deaths,
    SUM(new_deaths)/SUM(New_Cases)*100 as DeathPercentage
From CovidDeaths
where continent is not null 
order by 1,2;

-- Total Population vs Vaccinations
-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
	SUM(vac.new_vaccinations) OVER (Partition by dea.location Order by dea.location, dea.date)
		as RollingPeopleVaccinated
From CovidDeaths dea
Join CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3;

-- Using CTE to perform Calculation on Partition By in previous query

With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations)OVER (Partition by dea.Location Order by dea.location, dea.Date) 
as RollingPeopleVaccinated
From CovidDeaths dea
Join CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
)
Select *, (RollingPeopleVaccinated/Population)*100 as percentange_people_vaccinated
From PopvsVac
;

-- Using Temp Table to perform Calculation on Partition By in previous query

DROP Table if exists PercentPopulationVaccinated;
Create Temporary Table PercentPopulationVaccinated
(
Continent varchar(255),
Location varchar(255),
Date date,
Population bigint,
New_vaccinations bigint,
RollingPeopleVaccinated bigint
);

Insert into PercentPopulationVaccinated
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date) 
as RollingPeopleVaccinated
From CovidDeaths dea
Join CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
    ;

Select *, (RollingPeopleVaccinated/Population)*100 as percentange_people_vaccinated
From PercentPopulationVaccinated ;

-- Creating View to store data for later visualizations

Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(vac.new_vaccinations) OVER (Partition by dea.Location Order by dea.location, dea.Date)
 as RollingPeopleVaccinated
From CovidDeaths dea
Join CovidVaccination vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null ;
