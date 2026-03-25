with sales as (

    select *
    from {{ ref('int_sales_orders') }}

),

final as (

    select

        pk_item_pedido as pk_sales

        , fk_produto as fk_product
        , fk_cliente as fk_customer
        , fk_vendedor as fk_sales_person
        , fk_motivo_venda as fk_sales_reason
        , fk_cartao_credito as fk_credit_card

        , cast(dt_pedido as date) as fk_date

        , quantidade as quantity
        , preco_unitario as unit_price
        , desconto as discount

        , valor_bruto as gross_amount
        , valor_liquido as net_amount

    from sales

)

select *
from final