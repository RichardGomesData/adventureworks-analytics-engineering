with fonte_productcategory as (

    select *
    from {{ source('adventure_works', 'production_productcategory') }}

),

renomeado as (

    select
        cast(productcategoryid as int) as pk_productcategory
        , name as nome_categoria
        , rowguid as guid_registro
        , cast(modifieddate as timestamp) as ts_modificacao
    from fonte_productcategory

)

select *
from renomeado