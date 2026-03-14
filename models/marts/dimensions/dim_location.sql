with locations as (

    select *
    from {{ ref('int_location') }}

)

select distinct

    pk_address as pk_location
    , cidade
    , nome_estado
    , nome_pais

from locations