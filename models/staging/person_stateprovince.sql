with
    fonte_stateprovince as (
        select *
        from {{ source('adventure_works', 'person_stateprovince') }}

    )

    , renomeado as (
        select
            cast(stateprovinceid as int) as pk_estado_provincia
            , stateprovincecode as codigo_estado_provincia
            , countryregioncode as fk_pais
            , isonlystateprovinceflag as flg_unico_estado_provincia
            , name as nome_estado_provincia
            , cast(territoryid as int) as fk_territorio
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_stateprovince
    )

select *
from renomeado