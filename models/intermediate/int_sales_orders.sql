with orders as (

    select *
    from {{ ref('stg_sales_salesorderheader') }}

),

order_details as (

    select *
    from {{ ref('stg_sales_salesorderdetail') }}

),

joined as (

    select

        order_details.pk_item_pedido as pk_item_pedido
        , orders.pk_pedido as fk_pedido

        , orders.fk_cliente
        , orders.fk_vendedor
        , orders.fk_cartao_credito

        , orders.dt_pedido
        , orders.status_pedido

        , order_details.fk_produto

        , order_details.quantidade
        , order_details.preco_unitario
        , order_details.desconto

    from order_details

    left join orders
        on order_details.fk_pedido = orders.pk_pedido

)

select *
from joined