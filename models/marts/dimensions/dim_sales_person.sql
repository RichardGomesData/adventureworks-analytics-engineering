with sales_persons as (

    select *
    from {{ ref('int_sales_person') }}

)

select distinct

    pk_sales_person
    , nome_completo as nome_salesperson
    , cargo
    , dt_contratacao

from sales_persons