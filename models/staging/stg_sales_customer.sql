with
    fonte_customer as (
        select *
        from {{ source('adventure_works', 'sales_customer') }}

    )

    , renomeado as (
        select
            cast(customerid as int) as pk_cliente
            , cast(personid as int) as fk_pessoa
            , cast(storeid as int) as fk_loja
            , cast(territoryid as int) as fk_territorio
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_customer
    )

select *
from renomeado