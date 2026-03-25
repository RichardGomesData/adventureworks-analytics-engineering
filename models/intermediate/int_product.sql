with products as (

    select *
    from {{ ref('stg_production_product') }}

),

subcategories as (

    select *
    from {{ ref('stg_production_product_subcategory') }}

),

categories as (

    select *
    from {{ ref('stg_production_product_category') }}

),

joined as (

    select

        products.pk_product

        , products.nome_produto
        , products.numero_produto
        , products.cor

        , subcategories.pk_product_subcategory
        , subcategories.nome_subcategoria

        , categories.pk_product_category
        , categories.nome_categoria

    from products

    left join subcategories
        on products.fk_product_subcategory = subcategories.pk_product_subcategory

    left join categories
        on subcategories.fk_product_category = categories.pk_product_category

)

select *
from joined