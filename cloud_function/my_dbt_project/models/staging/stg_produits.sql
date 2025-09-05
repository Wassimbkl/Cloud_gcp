{{ config(materialized='view') }}

select
    cast(id as string) as produit_id,
    nom_produit,
    categorie,
    prix
from {{ source('raw_data', 'produits') }}
