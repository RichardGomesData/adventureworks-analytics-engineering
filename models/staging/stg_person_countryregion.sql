with
    fonte_countryregion as (
        select *
        from {{ source('adventure_works', 'person_countryregion') }}

    )

    , renomeado as (
        select
            countryregioncode as pk_pais
            , name as nome_pais
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_countryregion
    )

select *
from renomeado