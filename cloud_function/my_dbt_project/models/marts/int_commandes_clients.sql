{{ config(materialized='table') }}

with commandes as (
    select * from {{ ref('stg_commandes') }}
),

clients as (
    select * from {{ ref('stg_clients') }}
)

select
    commandes.commande_id,
    commandes.client_id,
    clients.nom,
    clients.prenom,
    commandes.date_commande,
    commandes.montant_total
from commandes
left join clients on commandes.client_id = clients.client_id
