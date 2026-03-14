with
    fonte_productsubcategory as (
        select *
        from {{ source('adventure_works', 'production_productsubcategory') }}

    )

    , renomeado as (
        select
            cast(productsubcategoryid as int) as pk_subcategoria_produto
            , cast(productcategoryid as int) as fk_categoria_produto
            , name as nome_subcategoria_produto
            , rowguid as guid_registro
            , cast(modifieddate as timestamp) as ts_modificacao
        from fonte_productsubcategory
    )

select *
from renomeado