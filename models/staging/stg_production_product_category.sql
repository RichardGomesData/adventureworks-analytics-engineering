with fonte_product_category as (

    select *
    from {{ source('adventure_works', 'production_productcategory') }}

),

renomeado as (

    select
        cast(productcategoryid as int) as pk_product_category
        , name as nome_categoria
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao
    from fonte_product_category

)

select *
from renomeado