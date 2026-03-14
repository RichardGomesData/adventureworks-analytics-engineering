with products as (

    select *
    from {{ ref('stg_production_product') }}

),

subcategories as (

    select *
    from {{ ref('stg_production_productsubcategory') }}

),

categories as (

    select *
    from {{ ref('stg_production_productcategory') }}

),

joined as (

    select

        products.pk_product

        , products.nome_produto
        , products.numero_produto
        , products.cor

        , subcategories.pk_productsubcategory
        , subcategories.nome_subcategoria

        , categories.pk_productcategory
        , categories.nome_categoria

    from products

    left join subcategories
        on products.fk_productsubcategory = subcategories.pk_productsubcategory

    left join categories
        on subcategories.fk_productcategory = categories.pk_productcategory

)

select *
from joined