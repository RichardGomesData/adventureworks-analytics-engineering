with
    fonte_address as (
        select *
        from {{ source('adventure_works', 'person_address') }}

    )

    , renomeado as (
        select
            cast(addressid as int) as pk_endereco
            , addressline1 as endereco_linha1
            , addressline2 as endereco_linha2
            , city as cidade
            , cast(stateprovinceid as int) as fk_estado_provincia
            , postalcode as cep
            , spatiallocation as localizacao_espacial
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_address
    )

select *
from renomeado