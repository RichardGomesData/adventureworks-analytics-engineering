with fonte_stateprovince as (

    select *
    from {{ source('adventure_works', 'person_stateprovince') }}

),

renomeado as (

    select
        cast(stateprovinceid as int) as pk_stateprovince
        , stateprovincecode as codigo_stateprovince
        , countryregioncode as fk_countryregion
        , isonlystateprovinceflag as flg_unico_stateprovince
        , name as nome_estado
        , cast(territoryid as int) as fk_territory
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao

    from fonte_stateprovince

)

select *
from renomeado