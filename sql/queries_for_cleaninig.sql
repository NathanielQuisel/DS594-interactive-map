--- This the query that does the cleaning job for the file "weekly_covid_19_vaccination_6_30_2022_race_ethnicity.csv":


SELECT 
    County,
    Town,
    Race_Ethnicity,
    Population,
    Proportion_of_town_population,
    CAST(NULLIF(REPLACE(TRIM(Individuals_with_at_least_one_dose), ',', ''), '*') AS INT64) AS Individuals_with_at_least_one_dose,
    CAST(REPLACE(REPLACE(NULLIF(TRIM(Individuals_with_at_least_one_dose_per_capita), '*'), '>95%', '95%'), '%', '') AS FLOAT64) / 100 AS Individuals_with_at_least_one_dose_per_capita,
    CAST(REPLACE(NULLIF(TRIM(Proportion_of_town_individuals_with_at_least_one_dose), '*'), '%', '') AS FLOAT64) / 100 AS Proportion_of_town_individuals_with_at_least_one_dose,
    CAST(NULLIF(REPLACE(TRIM(Fully_vaccinated_individuals), ',', ''), '*') AS INT64) AS Fully_vaccinated_individuals,
    CAST(REPLACE(REPLACE(NULLIF(TRIM(Fully_vaccinated_individuals_per_capita), '*'), '>95%', '95%'), '%', '') AS FLOAT64) / 100 AS Fully_vaccinated_individuals_per_capita,
    CAST(REPLACE(NULLIF(TRIM(Proportion_of_town_fully_vaccinated_individuals), '*'), '%', '') AS FLOAT64) / 100 AS Proportion_of_town_fully_vaccinated_individuals,
    CAST(NULLIF(REPLACE(TRIM(Partially_vaccinated_individuals), ',', ''), '*') AS INT64) AS Partially_vaccinated_individuals,
    CAST(REPLACE(NULLIF(TRIM(Partially_vaccinated_individuals_per_capita), '*'), '%', '') AS FLOAT64) / 100 AS Partially_vaccinated_individuals_per_capita,
    CAST(REPLACE(NULLIF(TRIM(Proportion_of_town_partially_vaccinated_individuals), '*'), '%', '') AS FLOAT64) / 100 AS Proportion_of_town_partially_vaccinated_individuals,
    CAST(NULLIF(REPLACE(TRIM(Individuals_with_booster_doses), ',', ''), '*') AS INT64) AS Individuals_with_booster_doses,
    CAST(REPLACE(REPLACE(NULLIF(TRIM(Individuals_with_booster_doses_per_capita), '*'), '>95%', '95%'), '%', '') AS FLOAT64) / 100 AS Individuals_with_booster_doses_per_capita,
    CAST(REPLACE(NULLIF(TRIM(Proportion_of_town_individuals_with_booster_doses), '*'), '%', '') AS FLOAT64) / 100 AS Proportion_of_town_individuals_with_booster_doses
FROM 
    `cds-ds-594.1_staging.bch_weekly_covid_19_vaccination_6_30_2022_race_ethnicity` bch
WHERE 
    Town IN ('Chelsea', 'Belmont', 'Swampscott', 'Lynn', 'Wellesley', 'Framingham');


--- It does the following:
--- •	All the * has been replaced by NULL
--- •	All ">95%" has been replaced by "95%"
--- •	For numbers that are not percent, they were changed to integers
--- •	For numbers with %, the sign was removed, converted to float, and divided by 100 to be displayed as decimal
--- •	The data was filtered to include only the rows where "Town" is equal to 'Chelsea', 'Belmont', 'Swampscott', 'Lynn', 'Wellesley', or 'Framingham'

--- *** 2024-11-01 ***
--- This is an updated query that does the same job but without filters. The query has been modified because just removing "WHERE" statement did not work.

SELECT
    County,
    Town,
    Race_Ethnicity,
    Population,
    Proportion_of_town_population,
    CAST(NULLIF(REPLACE(TRIM(Individuals_with_at_least_one_dose), ',', ''), '*') AS INT64) AS Individuals_with_at_least_one_dose,
    CAST(REPLACE(REPLACE(NULLIF(TRIM(Individuals_with_at_least_one_dose_per_capita), '*'), '>95%', '95%'), '%', '') AS FLOAT64) / 100 AS Individuals_with_at_least_one_dose_per_capita,
    CAST(REPLACE(NULLIF(TRIM(Proportion_of_town_individuals_with_at_least_one_dose), '*'), '%', '') AS FLOAT64) / 100 AS Proportion_of_town_individuals_with_at_least_one_dose,
    CAST(NULLIF(REPLACE(TRIM(Fully_vaccinated_individuals), ',', ''), '*') AS INT64) AS Fully_vaccinated_individuals,
    CAST(REPLACE(REPLACE(NULLIF(TRIM(Fully_vaccinated_individuals_per_capita), '*'), '>95%', '95%'), '%', '') AS FLOAT64) / 100 AS Fully_vaccinated_individuals_per_capita,
    CAST(REPLACE(NULLIF(TRIM(Proportion_of_town_fully_vaccinated_individuals), '*'), '%', '') AS FLOAT64) / 100 AS Proportion_of_town_fully_vaccinated_individuals,
    SAFE_CAST(NULLIF(REPLACE(TRIM(Partially_vaccinated_individuals), ',', ''), '*') AS INT64) AS Partially_vaccinated_individuals,
     CAST(REPLACE(REPLACE(NULLIF(TRIM(Partially_vaccinated_individuals_per_capita), '*'), '>95%', '95%'), '%', '') AS FLOAT64) / 100 AS Partially_vaccinated_individuals_per_capita,
    CAST(REPLACE(NULLIF(TRIM(Proportion_of_town_partially_vaccinated_individuals), '*'), '%', '') AS FLOAT64) / 100 AS Proportion_of_town_partially_vaccinated_individuals,
    SAFE_CAST(NULLIF(REPLACE(TRIM(Individuals_with_booster_doses), ',', ''), '*') AS INT64) AS Individuals_with_booster_doses,
    CAST(REPLACE(REPLACE(NULLIF(TRIM(Individuals_with_booster_doses_per_capita), '*'), '>95%', '95%'), '%', '') AS FLOAT64) / 100 AS Individuals_with_booster_doses_per_capita,
    CAST(REPLACE(NULLIF(TRIM(Proportion_of_town_individuals_with_booster_doses), '*'), '%', '') AS FLOAT64) / 100 AS Proportion_of_town_individuals_with_booster_doses
FROM
    `cds-ds-594.1_staging.bch_weekly_covid_19_vaccination_6_30_2022_race_ethnicity` bch


--- It does the following:
--- •	All the * has been replaced by NULL
--- •	All ">95%" has been replaced by "95%"
--- •	For numbers that are not percent, they were changed to integers
--- •	For numbers with %, the sign was removed, converted to float, and divided by 100 to be displayed as decimal

--- *** 2024-11-19 ***
--- This is a new query that cleans the data that was uploaded to stage. This query does the same job as the previous query, just applied to a new file.

SELECT
  County,
  Town,
  Category_Type,
  Category,
  Population,
  SAFE_CAST(Proportion_of_town_population AS FLOAT64) AS Proportion_of_town_population,
  
  -- Replace "*" with NULL for the specified columns
  SAFE_CAST(NULLIF(Individuals_with_at_least_one_dose, '*') AS INT64) AS Individuals_with_at_least_one_dose,
  SAFE_CAST(NULLIF(Fully_vaccinated_individuals, '*') AS INT64) AS Fully_vaccinated_individuals,
  SAFE_CAST(NULLIF(Partially_vaccinated_individuals, '*') AS INT64) AS Partially_vaccinated_individuals,
  SAFE_CAST(NULLIF(Individuals_with_booster_doses, '*') AS INT64) AS Individuals_with_booster_doses,

  -- Handle percentage columns with CASE and NULLIF for "*"
  CASE
    WHEN NULLIF(Individuals_with_at_least_one_dose_per_capita, '*') = '>95%' THEN 0.95
    ELSE CAST(REPLACE(NULLIF(Individuals_with_at_least_one_dose_per_capita, '*'), '%', '') AS FLOAT64) / 100
  END AS Individuals_with_at_least_one_dose_per_capita,

  CASE
    WHEN NULLIF(Fully_vaccinated_individuals_per_capita, '*') = '>95%' THEN 0.95
    ELSE CAST(REPLACE(NULLIF(Fully_vaccinated_individuals_per_capita, '*'), '%', '') AS FLOAT64) / 100
  END AS Fully_vaccinated_individuals_per_capita,

  CASE
    WHEN NULLIF(Partially_vaccinated_individuals_per_capita, '*') = '>95%' THEN 0.95
    ELSE CAST(REPLACE(NULLIF(Partially_vaccinated_individuals_per_capita, '*'), '%', '') AS FLOAT64) / 100
  END AS Partially_vaccinated_individuals_per_capita,

  CASE
    WHEN NULLIF(Individuals_with_booster_doses_per_capita, '*') = '>95%' THEN 0.95
    ELSE CAST(REPLACE(NULLIF(Individuals_with_booster_doses_per_capita, '*'), '%', '') AS FLOAT64) / 100
  END AS Individuals_with_booster_doses_per_capita,

  -- Handle percentage columns with CASE and NULLIF for "*" for proportions

  CASE
    WHEN SAFE_CAST(Proportion_of_town_population AS STRING) = '*' THEN NULL
    WHEN SAFE_CAST(Proportion_of_town_population AS STRING) = '>95%' THEN 0.95
    ELSE CAST(REPLACE(SAFE_CAST(Proportion_of_town_population AS STRING), '%', '') AS FLOAT64)
  END AS Proportion_of_town_population,

  CASE
    WHEN SAFE_CAST(Proportion_of_town_individuals_with_at_least_one_dose AS STRING) = '*' THEN NULL
    WHEN SAFE_CAST(Proportion_of_town_individuals_with_at_least_one_dose AS STRING) = '>95%' THEN 0.95
    ELSE CAST(REPLACE(SAFE_CAST(Proportion_of_town_individuals_with_at_least_one_dose AS STRING), '%', '') AS FLOAT64)
  END AS Proportion_of_town_individuals_with_at_least_one_dose,

  CASE
    WHEN SAFE_CAST(Proportion_of_town_fully_vaccinated_individuals AS STRING) = '*' THEN NULL
    WHEN SAFE_CAST(Proportion_of_town_fully_vaccinated_individuals AS STRING) = '>95%' THEN 0.95
    ELSE CAST(REPLACE(SAFE_CAST(Proportion_of_town_fully_vaccinated_individuals AS STRING), '%', '') AS FLOAT64)
  END AS Proportion_of_town_fully_vaccinated_individuals,

  CASE
    WHEN SAFE_CAST(Proportion_of_town_partially_vaccinated_individuals AS STRING) = '*' THEN NULL
    WHEN SAFE_CAST(Proportion_of_town_partially_vaccinated_individuals AS STRING) = '>95%' THEN 0.95
    ELSE CAST(REPLACE(SAFE_CAST(Proportion_of_town_partially_vaccinated_individuals AS STRING), '%', '') AS FLOAT64)
  END AS Proportion_of_town_partially_vaccinated_individuals,

  CASE
    WHEN SAFE_CAST(Proportion_of_town_individuals_with_booster_doses AS STRING) = '*' THEN NULL
    WHEN SAFE_CAST(Proportion_of_town_individuals_with_booster_doses AS STRING) = '>95%' THEN 0.95
    ELSE CAST(REPLACE(SAFE_CAST(Proportion_of_town_individuals_with_booster_doses AS STRING), '%', '') AS FLOAT64)
  END AS Proportion_of_town_individuals_with_booster_doses
  
FROM 
  `cds-ds-594.1_staging.bch_combined_vaccination_data`


--- *** 2024-12-05 ***
--- This query cleans the `cds-ds-594.1_staging.bch_combined_vaccination_data`.
--- Grouped by County and Town, the distinct values of Category_Type has been used for headers for new columns. Population is the value for these new columns. 


SELECT
  County,
  Town,
  MAX(CASE WHEN Category_Type = 'Male' THEN Population END) AS Male,
  MAX(CASE WHEN Category_Type = 'Female' THEN Population END) AS Female,
  MAX(CASE WHEN Category_Type = 'Asian' THEN Population END) AS Asian,
  MAX(CASE WHEN Category_Type = 'Black' THEN Population END) AS Black,
  MAX(CASE WHEN Category_Type = 'White' THEN Population END) AS White,
  MAX(CASE WHEN Category_Type = 'Hispanic' THEN Population END) AS Hispanic,
  MAX(CASE WHEN Category_Type = 'AI/AN' THEN Population END) AS AI_AN,
  MAX(CASE WHEN Category_Type = 'NH/PI' THEN Population END) AS NH_PI,
  MAX(CASE WHEN Category_Type = 'Multi' THEN Population END) AS Multi,
  MAX(CASE WHEN Category_Type = 'Other' THEN Population END) AS Other,
  MAX(CASE WHEN Category_Type = 'Total' THEN Population END) AS Total,
  MAX(CASE WHEN Category_Type = '0-4 Years' THEN Population END) AS Years_0_4,
  MAX(CASE WHEN Category_Type = '75+ Years' THEN Population END) AS Years_75_Plus,
  MAX(CASE WHEN Category_Type = '5-11 Years' THEN Population END) AS Years_5_11,
  MAX(CASE WHEN Category_Type = '12-15 Years' THEN Population END) AS Years_12_15,
  MAX(CASE WHEN Category_Type = '16-19 Years' THEN Population END) AS Years_16_19,
  MAX(CASE WHEN Category_Type = '20-29 Years' THEN Population END) AS Years_20_29,
  MAX(CASE WHEN Category_Type = '30-49 Years' THEN Population END) AS Years_30_49,
  MAX(CASE WHEN Category_Type = '50-64 Years' THEN Population END) AS Years_50_64,
  MAX(CASE WHEN Category_Type = '65-74 Years' THEN Population END) AS Years_65_74,
  MAX(CASE WHEN Category_Type = 'Other/Unknown' THEN Population END) AS Other_Unknown
FROM
  `cds-ds-594.1_staging.bch_combined_vaccination_data`
GROUP BY
  County, Town
ORDER BY
  County, Town;

