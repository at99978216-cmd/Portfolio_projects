# 🦠 Covid-19 Data Exploration using MySQL

## 📌 Project Overview

This project performs end-to-end Covid-19 data analysis using MySQL.

It includes:

- Database & table creation
- CSV data import
- Data cleaning & transformation
- Advanced SQL analysis
- Window functions & rolling calculations
- Views and temporary tables for reporting

The dataset contains global information on:
- Covid cases & deaths
- Vaccinations
- Testing data
- Demographic indicators

---

## 🛠 Skills Demonstrated

- Database Design (`CREATE DATABASE`, `CREATE TABLE`)
- CSV Import (`LOAD DATA INFILE`)
- Data Cleaning (`NULLIF()`, `TRIM()`)
- Date Formatting (`STR_TO_DATE()`)
- Filtering (`WHERE`, `IS NOT NULL`, `LIKE`)
- Sorting (`ORDER BY`)
- Aggregations (`SUM`, `MAX`, `ROUND`)
- `GROUP BY` Analysis
- Window Functions (`OVER`, `PARTITION BY`)
- Joins (`INNER JOIN`)
- CTE (Common Table Expressions)
- Temporary Tables
- Views Creation

---

## 🗂 Database Structure

Two main tables were created:

### 1️⃣ CovidDeaths
Contains:
- Case counts
- Death counts
- ICU & hospital data
- Reproduction rate
- Per-million metrics

### 2️⃣ CovidVaccination
Contains:
- Vaccination data
- Testing data
- Demographic data
- Socioeconomic indicators

Data cleaning was performed during import to:
- Convert blank values to NULL
- Remove extra spaces
- Properly format date columns
- Maintain numeric data integrity

---

## 📊 Key Analysis Performed

- Death percentage by country
- Infection rate vs population
- Countries with highest infection rates
- Countries with highest death counts
- Continent-level death analysis
- Global case & death summary
- Rolling vaccination totals using window functions
- Percentage of population vaccinated

---

## 📁 Dataset

The dataset is included in the `data/` folder:

- `data/CovidDeaths.csv`
- `data/CovidVaccinations.csv`

Source: Our World in Data (COVID-19 Dataset)

---

## ⚠️ IMPORTANT NOTE (File Path Required)

> 🔴 **You must update the file path inside `LOAD DATA INFILE` before running the script.**
>
> Example:
>
> ```sql
> LOAD DATA LOCAL INFILE 'path_to_project/data/CovidDeaths.csv'
> ```
>
> If you receive an error, enable local file import:
>
> ```sql
> SET GLOBAL local_infile = 1;
> ```

---

## 🚀 How to Run

1. Create a MySQL database.
2. Open `Covid19_SQL_Project.sql`.
3. Update the CSV file paths.
4. Run the entire script.

---

## 🧰 Tools Used

- MySQL
- MySQL Workbench
- Git
- GitHub

---

## 📌 Project Type

SQL Data Exploration Portfolio Project  
Designed to demonstrate intermediate-to-advanced SQL skills.
