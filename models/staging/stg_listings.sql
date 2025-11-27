{{ config(materialized='view') }}

select 
    id as id_logement,
    name as nom_annonce,
    host_id as id_hote,
    neighbourhood_group as quartier_macro,
    neighbourhood as quartier_micro,
    room_type as type_logement,
    price as prix_nuit,
    coalesce(minimum_nights, 1) as nuits_minimum
from {{ ref('listings') }}
