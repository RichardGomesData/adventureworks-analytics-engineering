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

        order_details.pk_pedido_detalhe
        , orders.pk_pedido as fk_pedido

        , orders.fk_cliente
        , orders.fk_vendedor
        , orders.fk_cartao_credito

        , orders.dt_pedido
        , orders.status_pedido

        , order_details.fk_produto

        , order_details.quantidade_produto

        , order_details.vl_preco_unitario
        , order_details.vl_desconto_unitario


        -- valor bruto

        , cast(
            order_details.quantidade_produto
            * order_details.vl_preco_unitario
        as decimal(18,2)) as vl_bruto


        -- valor desconto

        , cast(
            (
                order_details.quantidade_produto
                * order_details.vl_preco_unitario
            )
            * order_details.vl_desconto_unitario
        as decimal(18,2)) as vl_desconto


        -- valor liquido

        , cast(
            (
                order_details.quantidade_produto
                * order_details.vl_preco_unitario
            )
            -
            (
                (
                    order_details.quantidade_produto
                    * order_details.vl_preco_unitario
                )
                * order_details.vl_desconto_unitario
            )
        as decimal(18,2)) as vl_liquido


    from order_details

    left join orders
        on order_details.fk_pedido = orders.pk_pedido

)

select *
from joined