with sales as (

    select *
    from {{ ref('int_sales_orders') }}

),

final as (

    select

        pk_item_pedido as pk_sales

        , fk_produto as fk_product
        , fk_cliente as fk_customer
        , fk_vendedor as fk_salesperson
        , fk_motivo_venda as fk_sales_reason

        , cast(dt_pedido as date) as fk_date

        , quantidade as quantity
        , preco_unitario as unit_price
        , desconto as discount

        , quantidade * preco_unitario as gross_amount

        , (quantidade * preco_unitario)
          - (quantidade * preco_unitario * desconto) as net_amount

    from sales

)

select *
from final