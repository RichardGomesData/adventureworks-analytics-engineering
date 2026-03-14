with fonte_productsubcategory as (

    select *
    from {{ source('adventure_works', 'production_productsubcategory') }}

),

renomeado as (

    select
        cast(productsubcategoryid as int) as pk_productsubcategory
        , cast(productcategoryid as int) as fk_productcategory
        , name as nome_subcategoria
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao
    from fonte_productsubcategory

)

select *
from renomeado