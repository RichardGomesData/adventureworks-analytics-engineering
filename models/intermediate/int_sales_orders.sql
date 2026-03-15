with orders as (

    select *
    from {{ ref('stg_sales_salesorderheader') }}

),

order_details as (

    select *
    from {{ ref('stg_sales_salesorderdetail') }}

),

sales_reason as (

    select
        fk_salesorder,
        min(fk_salesreason) as fk_salesreason
    from {{ ref('stg_sales_salesorderheadersalesreason') }}
    group by fk_salesorder

),

joined as (

    select

        order_details.pk_item_pedido
        , orders.pk_pedido as fk_pedido

        , orders.fk_cliente
        , orders.fk_vendedor
        , orders.fk_cartao_credito

        , sales_reason.fk_salesreason as fk_motivo_venda

        , orders.dt_pedido
        , orders.status_pedido

        , order_details.fk_produto

        , order_details.quantidade
        , order_details.preco_unitario
        , order_details.desconto

    from order_details

    inner join orders
        on order_details.fk_pedido = orders.pk_pedido

    left join sales_reason
        on orders.pk_pedido = sales_reason.fk_salesorder

)

select *
from joined