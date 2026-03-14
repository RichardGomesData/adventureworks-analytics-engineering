with
    fonte_salesorderdetail as (
        select *
        from {{ source('adventure_works', 'sales_salesorderdetail') }}

    )

    , renomeado as (
        select
            cast(salesorderdetailid as int) as pk_pedido_detalhe
            , cast(salesorderid as int) as fk_pedido
            , carriertrackingnumber as numero_rastreamento
            , cast(orderqty as int) as quantidade_produto
            , cast(productid as int) as fk_produto
            , cast(specialofferid as int) as fk_oferta_especial
            , cast(unitprice as double) as vl_preco_unitario
            , cast(unitpricediscount as double) as vl_desconto_unitario
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_salesorderdetail
    )

select *
from renomeado