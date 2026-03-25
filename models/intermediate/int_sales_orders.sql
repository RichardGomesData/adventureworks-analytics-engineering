with orders as (

    select *
    from {{ ref('stg_sales_order_header') }}

),

order_details as (

    select *
    from {{ ref('stg_sales_order_detail') }}

),

sales_reason as (

    select
        fk_sales_order,
        min(fk_sales_reason) as fk_sales_reason
    from {{ ref('stg_sales_order_header_sales_reason') }}
    group by fk_sales_order

),

joined as (

    select

        order_details.pk_item_pedido,

        orders.pk_pedido as fk_pedido,
        orders.fk_cliente,
        orders.fk_vendedor,
        orders.fk_cartao_credito,
        sales_reason.fk_sales_reason as fk_motivo_venda,
        order_details.fk_produto,

        cast(orders.dt_pedido as date) as dt_pedido,

        orders.status_pedido,
        case
            when orders.status_pedido = 1 then 'In Process'
            when orders.status_pedido = 2 then 'Approved'
            when orders.status_pedido = 3 then 'Backordered'
            when orders.status_pedido = 4 then 'Rejected'
            when orders.status_pedido = 5 then 'Shipped'
            when orders.status_pedido = 6 then 'Cancelled'
        end as status_pedido_desc,

        order_details.quantidade,
        order_details.preco_unitario,
        order_details.desconto,

        (order_details.quantidade * order_details.preco_unitario) as valor_bruto,

        (order_details.quantidade * order_details.preco_unitario)
            - (order_details.quantidade * order_details.preco_unitario * order_details.desconto) as valor_liquido

    from order_details

    inner join orders
        on order_details.fk_pedido = orders.pk_pedido

    left join sales_reason
        on orders.pk_pedido = sales_reason.fk_sales_order

)

select *
from joined