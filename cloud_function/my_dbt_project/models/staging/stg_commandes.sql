{{ config(materialized='view') }}

select
    cast(id as string) as commande_id,
    cast(client_id as string) as client_id,
    date_commande,
    montant_total
from {{ source('raw_data', 'commandes') }}
