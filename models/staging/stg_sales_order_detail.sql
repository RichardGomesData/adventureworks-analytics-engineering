with fonte_sales_orderdetail as (

    select *
    from {{ source('adventure_works', 'sales_salesorderdetail') }}

),

renomeado as (

    select

        cast(salesorderdetailid as int) as pk_item_pedido

        , cast(salesorderid as int) as fk_pedido
        , cast(productid as int) as fk_produto

        , cast(orderqty as int) as quantidade

        , cast(unitprice as decimal(18,2)) as preco_unitario
        , cast(unitpricediscount as decimal(18,2)) as desconto

        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao

    from fonte_sales_orderdetail

)

select *
from renomeado