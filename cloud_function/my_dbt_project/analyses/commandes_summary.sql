-- KPIs globaux sur les commandes
select
    count(distinct commande_id) as nb_commandes,
    count(distinct client_id) as nb_clients,
    round(avg(montant_total), 2) as montant_moyen,
    max(montant_total) as commande_max
from {{ ref('int_commandes_clients') }}
