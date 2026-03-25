with customers as (

    select *
    from {{ ref('stg_sales_customer') }}

),

persons as (

    select *
    from {{ ref('stg_person') }}

),

customer_address as (

    select *
    from {{ ref('int_customer_address') }}

),

joined as (

    select

        customers.pk_customer

        , customers.fk_person
        , customers.fk_store
        , customers.fk_territory

        , coalesce(
            persons.nome_completo,
            'Cliente Loja'
        ) as nome_completo

        , persons.tipo_pessoa

        , customer_address.cidade
        , customer_address.nome_estado
        , customer_address.nome_pais

        , row_number() over (
            partition by customers.pk_customer
            order by customer_address.pk_address
        ) as rn

    from customers

    left join persons
        on customers.fk_person = persons.pk_person

    left join customer_address
        on customers.pk_customer = customer_address.pk_customer

)

select

    pk_customer
    , fk_person
    , fk_store
    , fk_territory
    , nome_completo
    , tipo_pessoa
    , cidade
    , nome_estado
    , nome_pais

from joined
where rn = 1