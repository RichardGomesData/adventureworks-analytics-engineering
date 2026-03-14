with fonte_salesreason as (

    select *
    from {{ source('adventure_works', 'sales_salesreason') }}

),

renomeado as (

    select
        cast(salesreasonid as int) as pk_salesreason
        , name as nome_motivo_venda
        , reasontype as tipo_motivo_venda
        , cast(modifieddate as timestamp) as ts_modificacao

    from fonte_salesreason

)

select *
from renomeado