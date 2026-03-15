with customers as (

    select *
    from {{ ref('int_customer') }}

)

select

    pk_customer

    , nome_completo
    , tipo_pessoa

    , cidade
    , nome_estado
    , nome_pais

from customers