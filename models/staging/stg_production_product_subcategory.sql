with fonte_product_subcategory as (

    select *
    from {{ source('adventure_works', 'production_productsubcategory') }}

),

renomeado as (

    select
        cast(productsubcategoryid as int) as pk_product_subcategory
        , cast(productcategoryid as int) as fk_product_category
        , name as nome_subcategoria
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao
    from fonte_product_subcategory

)

select *
from renomeado