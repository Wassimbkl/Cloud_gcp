import requests
import pandas as pd

import json
import requests
import pandas as pd
import time

# 🔁 Charger les 100 codes depuis ton fichier JSON (extrait du jsonl que tu m’as fourni)
with open("food.json", "r", encoding="utf-8") as f:
    data = json.load(f)
    codes = [product["code"] for product in data["products"] if "code" in product]

print(f"📦 {len(codes)} codes-barres trouvés.")
produits = []

for code in codes:
    url = f"https://world.openfoodfacts.org/api/v0/product/{code}.json"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        if data.get("status") == 1:
            prod = data["product"]
            produits.append({
                "code": code,
                "product_name": prod.get("product_name", ""),
                "brands": prod.get("brands", ""),
                "nutriscore_grade": prod.get("nutriscore_grade", ""),
                "energy_100g": prod.get("nutriments", {}).get("energy_100g", None),
                "fat_100g": prod.get("nutriments", {}).get("fat_100g", None),
                "sugars_100g": prod.get("nutriments", {}).get("sugars_100g", None),
                "salt_100g": prod.get("nutriments", {}).get("salt_100g", None),
            })

df = pd.DataFrame(produits) 
df.to_csv("openfoodfacts_sample.csv", index=False) 

print("✅ CSV exporté avec succès !")