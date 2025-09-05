import json
import pandas as pd
import time

produits = []

# Ta variable codes contient déjà la liste de produits
codes = {"count":4005438,"page":1,"page_count":100,"page_size":100,"products":[ ... ]}  # raccourci ici

# Chemin vers ton fichier JSON local
file_path = r"C:\Users\imadb\OneDrive\Bureau\Mydigitalschool\cloud\scripts\food.json"

# Ouvrir le JSON local
with open(file_path, "r", encoding="utf-8") as f:
    data = json.load(f)

# Boucle sur les produits pour créer le DataFrame
for prod in data["products"]:
    produits.append({
        "code": prod.get("code", ""),
        "product_name": prod.get("product_name", ""),
        # Pour les champs nutritionnels, vérifie s'ils existent
        "brands": prod.get("brands", ""),
        "nutriscore_grade": prod.get("nutriscore_grade", ""),
        "energy_100g": prod.get("nutriments", {}).get("energy_100g"),
        "fat_100g": prod.get("nutriments", {}).get("fat_100g"),
        "sugars_100g": prod.get("nutriments", {}).get("sugars_100g"),
        "salt_100g": prod.get("nutriments", {}).get("salt_100g"),
    })
    time.sleep(0.01)  # petite pause pour simuler le rythme API si nécessaire

# Export CSV
df = pd.DataFrame(produits)
df.to_csv("openfoodfacts_enriched.csv", index=False)
print(f"✅ Exporté {len(df)} produits enrichis.")
