with customers as (

    select *
    from {{ ref('int_customer') }}

)

select distinct

    pk_customer
    , nome_completo as nome_cliente
    , tipo_pessoa as tipo_cliente

from customers