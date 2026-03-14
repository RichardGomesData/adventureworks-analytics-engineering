with fonte_businessentityaddress as (

    select *
    from {{ source('adventure_works', 'person_businessentityaddress') }}

),

renomeado as (

    select
        cast(businessentityid as int) as fk_businessentity
        , cast(addressid as int) as fk_address
        , cast(addresstypeid as int) as fk_addresstype
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao

    from fonte_businessentityaddress

)

select *
from renomeado