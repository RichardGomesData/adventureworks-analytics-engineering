with fonte_state_province as (

    select *
    from {{ source('adventure_works', 'person_stateprovince') }}

),

renomeado as (

    select
        cast(stateprovinceid as int) as pk_state_province
        , stateprovincecode as codigo_state_province
        , countryregioncode as fk_country_region
        , isonlystateprovinceflag as flg_unico_state_province
        , name as nome_estado
        , cast(territoryid as int) as fk_territory
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao

    from fonte_state_province

)

select *
from renomeado