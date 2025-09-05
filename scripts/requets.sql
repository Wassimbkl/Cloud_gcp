--#//Voir toutes les colonnes
#SELECT * FROM `friendly-legacy-468413-j9.api_data_openfood.openfood_products` LIMIT 10

--# Voir seulement certaines colonnes
SELECT product_name, brands, nutriscore_grade 
FROM `friendly-legacy-468413-j9.api_data_openfood.openfood_products` 
LIMIT 5

--Moyenne nutritionnelle des produits
SELECT
  ROUND(AVG(energy_100g), 2) AS avg_energy,
  ROUND(AVG(fat_100g), 2) AS avg_fat,
  ROUND(AVG(sugars_100g), 2) AS avg_sugars,
  ROUND(AVG(salt_100g), 2) AS avg_salt
FROM `friendly-legacy-468413-j9.api_data_openfood.openfood_products`


--#Classement des produits par Nutriscore

SELECT
  nutriscore_grade,
  COUNT(*) AS count_products
FROM `friendly-legacy-468413-j9.api_data_openfood.openfood_products`
GROUP BY nutriscore_grade
ORDER BY nutriscore_grade

--#les plus salés

SELECT
  product_name,
  brands,
  salt_100g,
  nutriscore_grade
FROM `friendly-legacy-468413-j9.api_data_openfood.openfood_products`
WHERE salt_100g IS NOT NULL
ORDER BY salt_100g DESC
LIMIT 10

--#Les produits sucrés

SELECT
  product_name,
  brands,
  sugars_100g,
  nutriscore_grade
FROM `friendly-legacy-468413-j9.api_data_openfood.openfood_products`
WHERE sugars_100g > 20
ORDER BY sugars_100g DESC


