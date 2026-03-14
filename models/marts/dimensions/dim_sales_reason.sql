with sales_reasons as (

    select *
    from {{ ref('int_sales_reason') }}

)

select distinct

    pk_salesreason as pk_sales_reason
    , nome_motivo_venda
    , tipo_motivo_venda

from sales_reasons