select
    cast(id as string) as client_id,
    nom,
    prenom,
    email
from {{ source('raw_data', 'clients') }}
