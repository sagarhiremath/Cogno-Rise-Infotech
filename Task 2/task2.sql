create database task2;
use task2;
select * from cereal;
desc cereal;

-- 1.Basic statistics
SELECT
  MIN(calories) AS min_calories,
  MAX(calories) AS max_calories,
  AVG(calories) AS avg_calories,
  
  MIN(protein) AS min_protein,
  MAX(protein) AS max_protein,
  AVG(protein) AS avg_protein,
  
  MIN(fat) AS min_fat,
  MAX(fat) AS max_fat,
  AVG(fat) AS avg_fat,
  
  MIN(sodium) AS min_sodium,
  MAX(sodium) AS max_sodium,
  AVG(sodium) AS avg_sodium,
  
  MIN(fiber) AS min_fiber,
  MAX(fiber) AS max_fiber,
  AVG(fiber) AS avg_fiber,
  
  MIN(carbo) AS min_carbo,
  MAX(carbo) AS max_carbo,
  AVG(carbo) AS avg_carbo,
  
  MIN(sugars) AS min_sugars,
  MAX(sugars) AS max_sugars,
  AVG(sugars) AS avg_sugars,
  
  MIN(potass) AS min_potass,
  MAX(potass) AS max_potass,
  AVG(potass) AS avg_potass,
  
  MIN(vitamins) AS min_vitamins,
  MAX(vitamins) AS max_vitamins,
  AVG(vitamins) AS avg_vitamins,
  
  MIN(shelf) AS min_shel,
  MAX(shelf) AS max_shel,
  AVG(shelf) AS avg_shel,
  
  MIN(weight) AS min_weight,
  MAX(weight) AS max_weight,
  AVG(weight) AS avg_weight,
  
  MIN(cups) AS min_cups,
  MAX(cups) AS max_cups,
  AVG(cups) AS avg_cups,
  
  MIN(rating) AS min_rating,
  MAX(rating) AS max_rating,
  AVG(rating) AS avg_rating
FROM cereal;


-- 2.Check for missing values
 select
 SUM(CASE WHEN calories IS NULL THEN 1 ELSE 0 END) AS missing_calories,
  SUM(CASE WHEN protein IS NULL THEN 1 ELSE 0 END) AS missing_protein,
  SUM(CASE WHEN fat IS NULL THEN 1 ELSE 0 END) AS missing_fat,
  SUM(CASE WHEN sodium IS NULL THEN 1 ELSE 0 END) AS missing_sodium,
  SUM(CASE WHEN fiber IS NULL THEN 1 ELSE 0 END) AS missing_fiber,
  SUM(CASE WHEN carbo IS NULL THEN 1 ELSE 0 END) AS missing_carbo,
  SUM(CASE WHEN sugars IS NULL THEN 1 ELSE 0 END) AS missing_sugars,
  SUM(CASE WHEN potass IS NULL THEN 1 ELSE 0 END) AS missing_potass,
  SUM(CASE WHEN vitamins IS NULL THEN 1 ELSE 0 END) AS missing_vitamins,
  SUM(CASE WHEN shelf IS NULL THEN 1 ELSE 0 END) AS missing_shel,
  SUM(CASE WHEN weight IS NULL THEN 1 ELSE 0 END) AS missing_weight,
  SUM(CASE WHEN cups IS NULL THEN 1 ELSE 0 END) AS missing_cups,
  SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS missing_rating
FROM cereal;


-- 3.Sugar content distribution by cereal type
SELECT
  type,
  MIN(sugars) AS min_sugars,
  MAX(sugars) AS max_sugars,
  AVG(sugars) AS avg_sugars
FROM cereal
GROUP BY type;


-- 4.Sugar content by cereal brand
SELECT
name,sugars
FROM cereal
ORDER BY sugars DESC
LIMIT 10;


-- 5.Comparative analysis of fiber and protein content
SELECT
  name,
  fiber,
  protein
FROM cereal
ORDER BY fiber DESC, protein DESC
LIMIT 30;


-- 6.Categorical analysis of cereal types
SELECT
  type,
  COUNT(*) AS count
FROM cereal
GROUP BY type;

-- 7.Brand-wise ratings
SELECT
  mfr,
  AVG(rating) AS avg_rating
FROM cereal
GROUP BY mfr
ORDER BY avg_rating DESC;

-- 8.Distribution of consumer ages
SELECT
  weight,
  COUNT(*) AS count
FROM cereal
GROUP BY weight
ORDER BY weight;

-- 9.Analysis of shelf location and weight
SELECT
  shelf,
  AVG(weight) AS avg_weight
FROM cereal
GROUP BY shelf;


-- 10.Top 5 cereals with the highest ratings
SELECT
  name,
  rating
FROM cereal
ORDER BY rating DESC
LIMIT 5;





