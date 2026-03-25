with addresses as (

    select *
    from {{ ref('stg_person_address') }}

),

states as (

    select *
    from {{ ref('stg_person_state_province') }}

),

countries as (

    select *
    from {{ ref('stg_person_country_region') }}

),

joined as (

    select

        addresses.pk_address

        , addresses.cidade

        , states.pk_state_province
        , states.nome_estado

        , countries.pk_country_region
        , countries.nome_pais

    from addresses

    left join states
        on addresses.fk_state_province = states.pk_state_province

    left join countries
        on states.fk_country_region = countries.pk_country_region

)

select *
from joined