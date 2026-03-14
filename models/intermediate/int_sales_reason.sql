with order_reasons as (

    select *
    from {{ ref('stg_sales_salesorderheadersalesreason') }}

),

reasons as (

    select *
    from {{ ref('stg_sales_salesreason') }}

),

joined as (

    select

        order_reasons.fk_salesorder
        , reasons.pk_salesreason
        , reasons.nome_motivo_venda
        , reasons.tipo_motivo_venda

    from order_reasons

    left join reasons
        on order_reasons.fk_salesreason = reasons.pk_salesreason

)

select *
from joined