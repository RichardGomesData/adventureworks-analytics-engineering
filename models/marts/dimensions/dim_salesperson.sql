with salespersons as (

    select *
    from {{ ref('int_salesperson') }}

)

select distinct

    pk_salesperson
    , nome_completo as nome_salesperson
    , cargo
    , dt_contratacao

from salespersons