{{ config(materialized='table') }}

with aggregation_quartier as (

    select 
        quartier_macro, -- On groupe par arrondissement (Borough)
        
        -- On arrondit à 2 chiffres après la virgule pour faire propre
        ROUND(avg(prix_nuit), 2) as prix_moyen, 
        
        min(prix_nuit) as prix_minimum,
        max(prix_nuit) as prix_maximum,
        
        -- On utilise le bon nom de colonne défini dans le staging
        count(id_logement) as nombre_annonces
        
    from {{ ref('stg_listings') }}
    
    group by quartier_macro
)

select * from aggregation_quartier
order by prix_moyen desc -- Le plus rentable en premier
-- PAS DE POINT VIRGULE !