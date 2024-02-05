create database wine_data;
use wine_data;
desc wine_data;
select * from wine_data;

-- Assuming a table named 'wine_data' with the given column headers

-- Display the first few rows of the dataset
SELECT *
FROM wine_data
LIMIT 5;

-- Basic statistics
SELECT
  MIN(fixed_acidity) AS min_fixed_acidity,
  MAX(fixed_acidity) AS max_fixed_acidity,
  AVG(fixed_acidity) AS avg_fixed_acidity,
  MIN(volatile_acidity) AS min_volatile_acidity,
  MAX(volatile_acidity) AS max_volatile_acidity,
  AVG(volatile_acidity) AS avg_volatile_acidity,
  MIN(citric_acid) AS min_citric_acid,
  MAX(citric_acid) AS max_citric_acid,
  AVG(citric_acid) AS avg_citric_acid,
  MIN(residual_sugar) AS min_residual_sugar,
  MAX(residual_sugar) AS max_residual_sugar,
  AVG(residual_sugar) AS avg_residual_sugar,
  MIN(chlorides) AS min_chlorides,
  MAX(chlorides) AS max_chlorides,
  AVG(chlorides) AS avg_chlorides,
  MIN(free_sulfur_dioxide) AS min_free_sulfur_dioxide,
  MAX(free_sulfur_dioxide) AS max_free_sulfur_dioxide,
  AVG(free_sulfur_dioxide) AS avg_free_sulfur_dioxide,
  MIN(total_sulfur_dioxide) AS min_total_sulfur_dioxide,
  MAX(total_sulfur_dioxide) AS max_total_sulfur_dioxide,
  AVG(total_sulfur_dioxide) AS avg_total_sulfur_dioxide,
  MIN(density) AS min_density,
  MAX(density) AS max_density,
  AVG(density) AS avg_density,
  MIN(pH) AS min_pH,
  MAX(pH) AS max_pH,
  AVG(pH) AS avg_pH,
  MIN(sulphates) AS min_sulphates,
  MAX(sulphates) AS max_sulphates,
  AVG(sulphates) AS avg_sulphates,
  MIN(alcohol) AS min_alcohol,
  MAX(alcohol) AS max_alcohol,
  AVG(alcohol) AS avg_alcohol,
  MIN(quality) AS min_quality,
  MAX(quality) AS max_quality,
  AVG(quality) AS avg_quality
FROM wine_data;



-- Check for missing values
SELECT
  SUM(CASE WHEN fixed_acidity IS NULL THEN 1 ELSE 0 END) AS missing_fixed_acidity,
  SUM(CASE WHEN volatile_acidity IS NULL THEN 1 ELSE 0 END) AS missing_volatile_acidity,
  SUM(CASE WHEN citric_acid IS NULL THEN 1 ELSE 0 END) AS missing_citric_acid,
  SUM(CASE WHEN residual_sugar IS NULL THEN 1 ELSE 0 END) AS missing_residual_sugar,
  SUM(CASE WHEN chlorides IS NULL THEN 1 ELSE 0 END) AS missing_chlorides,
  SUM(CASE WHEN free_sulfur_dioxide IS NULL THEN 1 ELSE 0 END) AS missing_free_sulfur_dioxide,
  SUM(CASE WHEN total_sulfur_dioxide IS NULL THEN 1 ELSE 0 END) AS missing_total_sulfur_dioxide,
  SUM(CASE WHEN density IS NULL THEN 1 ELSE 0 END) AS missing_density,
  SUM(CASE WHEN pH IS NULL THEN 1 ELSE 0 END) AS missing_pH,
  SUM(CASE WHEN sulphates IS NULL THEN 1 ELSE 0 END) AS missing_sulphates,
  SUM(CASE WHEN alcohol IS NULL THEN 1 ELSE 0 END) AS missing_alcohol,
  SUM(CASE WHEN quality IS NULL THEN 1 ELSE 0 END) AS missing_quality
FROM wine_data;



-- Class distribution of quality
SELECT
  quality,
  COUNT(*) AS count
FROM wine_data
GROUP BY quality;

-- 1.Average alcohol content by wine quality
SELECT
  quality,
  AVG(alcohol) AS avg_alcohol
FROM wine_data
GROUP BY quality
ORDER BY quality;

-- 2.Top 5 wines with the highest fixed acidity
SELECT
  *
FROM wine_data
ORDER BY fixed_acidity DESC
LIMIT 5;

-- 3.Distribution of chlorides by wine quality
SELECT
  quality,
  MIN(chlorides) AS min_chlorides,
  MAX(chlorides) AS max_chlorides,
  AVG(chlorides) AS avg_chlorides
FROM wine_data
GROUP BY quality
ORDER BY quality;

-- 4.Count of wines with pH less than 3.5
SELECT
  COUNT(*) AS count_low_pH
FROM wine_data
WHERE pH < 3.5;

-- 5.Sulfur dioxide ratio (Free vs. Total)
SELECT
  AVG(free_sulfur_dioxide / total_sulfur_dioxide) AS avg_sulfur_dioxide_ratio
FROM wine_data;

-- 6.Average residual sugar for each wine quality
SELECT
  quality,
  AVG(residual_sugar) AS avg_residual_sugar
FROM wine_data
GROUP BY quality
ORDER BY quality;

-- 7.Wines with high alcohol and high quality
SELECT *
FROM wine_data
WHERE alcohol > 12 AND quality >= 7;

-- 8.Count of wines with sulphates above 0.6
SELECT
  COUNT(*) AS count_high_sulphates
FROM wine_data
WHERE sulphates > 0.6;