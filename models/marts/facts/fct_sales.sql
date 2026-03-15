with sales as (

    select *
    from {{ ref('int_sales_orders') }}

)

select

    pk_pedido_detalhe as pk_sales

    , fk_produto as fk_product
    , fk_cliente as fk_customer
    , fk_vendedor as fk_salesperson

    , dt_pedido as fk_date

    , quantidade_produto as quantidade
    , vl_preco_unitario as preco_unitario
    , vl_desconto as valor_desconto
    , vl_bruto as valor_bruto
    , vl_liquido as valor_liquido

from sales