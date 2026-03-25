with fonte_sales_order_header_sales_reason as (

    select *
    from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}

),

renomeado as (

    select
        cast(salesorderid as int) as fk_sales_order
        , cast(salesreasonid as int) as fk_sales_reason
        , cast(modifieddate as timestamp) as ts_modificacao

    from fonte_sales_order_header_sales_reason 

)

select *
from renomeado