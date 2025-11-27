{{ config(materialized='view') }}

-- On interroge maintenant notre seed interne
select count(*) as total 
from {{ ref('listings') }}