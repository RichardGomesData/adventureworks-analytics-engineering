with customers as (

    select *
    from {{ ref('stg_sales_customer') }}

),

persons as (

    select *
    from {{ ref('stg_person_person') }}

),

joined as (

    select

        customers.pk_customer

        , customers.fk_person
        , customers.fk_store
        , customers.fk_territory

        , concat_ws(
            ' ',
            persons.primeiro_nome,
            persons.nome_meio,
            persons.sobrenome
        ) as nome_completo

        , persons.tipo_pessoa

    from customers

    left join persons
        on customers.fk_person = persons.pk_person

)

select *
from joined
