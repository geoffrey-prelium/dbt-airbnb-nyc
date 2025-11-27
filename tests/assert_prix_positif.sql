-- Ce test échoue s'il trouve des lignes avec un prix <= 0
select
    id_logement,
    prix_nuit
from {{ ref('stg_listings') }}
where prix_nuit <= 0