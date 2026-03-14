with
    fonte_businessentityaddress as (
        select *
        from {{ source('adventure_works', 'person_businessentityaddress') }}

    )

    , renomeado as (
        select
            cast(businessentityid as int) as fk_entidade_negocio
            , cast(addressid as int) as fk_endereco
            , cast(addresstypeid as int) as fk_tipo_endereco
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_businessentityaddress
    )

select *
from renomeado