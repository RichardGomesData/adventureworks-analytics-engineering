with customers as (

    select *
    from {{ ref('stg_sales_customer') }}

),

business_addresses as (

    select *
    from {{ ref('stg_person_businessentityaddress') }}

),

addresses as (

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

        customers.pk_customer

        , addresses.pk_address

        , addresses.cidade

        , states.pk_stateprovince
        , states.nome_estado

        , countries.pk_countryregion
        , countries.nome_pais

    from customers

    left join business_addresses
        on customers.fk_person = business_addresses.fk_businessentity

    left join addresses
        on business_addresses.fk_address = addresses.pk_address

    left join states
        on addresses.fk_stateprovince = states.pk_stateprovince

    left join countries
        on states.fk_countryregion = countries.pk_countryregion

)

select *
from joined