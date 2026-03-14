with addresses as (

    select *
    from {{ ref('stg_person_address') }}

),

states as (

    select *
    from {{ ref('stg_person_stateprovince') }}

),

countries as (

    select *
    from {{ ref('stg_person_countryregion') }}

),

joined as (

    select

        addresses.pk_address

        , addresses.cidade

        , states.pk_stateprovince
        , states.nome_estado

        , countries.pk_countryregion
        , countries.nome_pais

    from addresses

    left join states
        on addresses.fk_stateprovince = states.pk_stateprovince

    left join countries
        on states.fk_countryregion = countries.pk_countryregion

)

select *
from joined