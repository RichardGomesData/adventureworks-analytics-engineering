with products as (

    select *
    from {{ ref('int_product') }}

)

select distinct

    pk_product

    , nome_produto
    , numero_produto
    , cor

    , nome_subcategoria
    , nome_categoria

from products