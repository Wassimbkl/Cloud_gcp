import requests
import pandas as pd

codes = [
    "5449000000996",  # Coca-Cola
    "3017620422003",  # Nutella
    "5000159484695"   # Mars
]

produits = []

for code in codes:
    url = f"https://world.openfoodfacts.org/api/v0/product/{code}.json"
    r = requests.get(url).json()
    if r.get("status") == 1:
        p = r["product"]
        produits.append({
            "code": code,
            "product_name": p.get("product_name"),
            "brands": p.get("brands"),
            "nutriscore_grade": p.get("nutriscore_grade"),
            "energy_100g": p.get("nutriments", {}).get("energy-kcal_100g"),
            "fat_100g": p.get("nutriments", {}).get("fat_100g"),
            "sugars_100g": p.get("nutriments", {}).get("sugars_100g"),
            "salt_100g": p.get("nutriments", {}).get("salt_100g"),
        })

df = pd.DataFrame(produits)
df.to_csv("openfoodfacts_sample.csv", index=False)
print(df)
print("✅ CSV exporté avec succès !")
