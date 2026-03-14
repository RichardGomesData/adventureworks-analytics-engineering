with
    fonte_salesorderheadersalesreason as (
        select *
        from {{ source('adventure_works', 'sales_salesorderheadersalesreason') }}

    )

    , renomeado as (
        select
            cast(salesorderid as int) as fk_pedido
            , cast(salesreasonid as int) as fk_motivo_venda
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_salesorderheadersalesreason
    )

select *
from renomeado