with fonte_customer as (

    select *
    from {{ source('adventure_works', 'sales_customer') }}

),

renomeado as (

    select
        cast(customerid as int) as pk_customer
        , cast(personid as int) as fk_person
        , cast(storeid as int) as fk_store
        , cast(territoryid as int) as fk_territory
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao

    from fonte_customer

)

select *
from renomeado