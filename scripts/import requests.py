import requests
import pandas as pd

# Liste de produits (codes-barres EAN-13)
codes = [
    "5449000000996",  # Coca-Cola
    "3017620422003",  # Nutella
    "3178530401272",  # Orangina
    "3068320055003",  # Evian
    "5000159484695"   # Mars
]

results = []

for code in codes:
    url = f"https://world.openfoodfacts.org/api/v0/product/{code}.json"
    r = requests.get(url).json()
    if r.get("status") == 1:
        p = r["product"]
        results.append({
            "code": code,
            "name": p.get("product_name"),
            "brand": p.get("brands"),
            "energy_kcal": p.get("nutriments", {}).get("energy-kcal_100g"),
            "sugars": p.get("nutriments", {}).get("sugars_100g"),
            "fat": p.get("nutriments", {}).get("fat_100g"),
            "salt": p.get("nutriments", {}).get("salt_100g"),
        })

# Transformer en tableau
df = pd.DataFrame(results)
print(df)
