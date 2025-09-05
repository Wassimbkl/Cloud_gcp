import json
import requests
import pandas as pd
import time

# 🔁 Charger les 100 codes depuis ton fichier JSON (extrait du jsonl que tu m’as fourni)
with open("openfood_products.json", "r", encoding="utf-8") as f:
    data = json.load(f)
    codes = [product["code"] for product in data["products"] if "code" in product]

print(f"📦 {len(codes)} codes-barres trouvés.")