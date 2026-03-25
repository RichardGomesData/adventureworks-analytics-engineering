with order_reason as (

    select *
    from {{ ref('stg_sales_order_header_sales_reason') }}

),

reason as (

    select *
    from {{ ref('stg_sales_reason') }}

),

joined as (

    select

        order_reason.fk_sales_order,
        order_reason.fk_sales_reason as pk_sales_reason,
        reason.nome_motivo_venda,
        reason.tipo_motivo_venda

    from order_reason

    left join reason
        on order_reason.fk_sales_reason = reason.pk_sales_reason

)

select *
from joined